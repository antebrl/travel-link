import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:travel_link/src/features/account/presentation/edit_profile_screen.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/trip_overview/data/user_repository.dart';
import 'package:travel_link/src/routing/app_router.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';
import 'package:travel_link/src/utils/helpers/localization.dart';
import 'package:travel_link/src/utils/theme/widget_themes/boxDecoration_theme.dart';

class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({super.key});

  @override
  ConsumerState<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends ConsumerState<AccountScreen> {
  final double borderRadius = 10;

  final String defaultName = 'User Name';
  final String defaultDescription = 'Shine bright like a diamond💎';

  Future<void> showQRCodeDialog({required String qrCodeData}) async {
    final ByteData? qrCodeBytes = await QrPainter(
      data: qrCodeData,
      version: QrVersions.auto,
    ).toImageData(200);
    showDialog<AlertDialog>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title:
              Text(context.loc.accountShowQrCode, textAlign: TextAlign.center),
          content: qrCodeBytes != null
              ? Image.memory(qrCodeBytes.buffer.asUint8List())
              : const CircularProgressIndicator(),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(context.loc.accountShowQrCodeClose),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showLogoutConfirmation({required FirebaseAuth auth}) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign Out'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Would you like to sign out from your account?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child:
                  Text('Cancel', style: Theme.of(context).textTheme.bodyMedium),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Sign Out',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                context.goNamed(TopLevelDestinations.trips.name);
                auth.signOut();
              },
            ),
          ],
        );
      },
    );
  }

  Future<String?> _showEditPopup({
    required String label,
    String intialValue = '',
  }) async {
    final TextEditingController controller =
        TextEditingController(text: intialValue);
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit $label'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(labelText: 'Enter new $label'),
          onChanged: (value) {
            // Handle text changes
          },
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(controller.text);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'label': context.loc.accountInformation,
        'icon': Icons.person,
        'color': CustomColors.buttonPrimary,
        'option': AccountRoutes.accountInformation.name,
      },
      {
        'label': context.loc.accountSettings,
        'icon': Icons.settings,
        'color': CustomColors.buttonPrimary,
        'option': AccountRoutes.settings.name,
      },
      {
        'label': context.loc.accountHelp,
        'icon': Icons.help,
        'color': CustomColors.buttonPrimary,
        'option': AccountRoutes.help.name,
      },
      {
        'label': context.loc.accountAbout,
        'icon': Icons.info,
        'color': CustomColors.buttonPrimary,
        'option': AccountRoutes.about.name,
      },
    ];
    final auth = ref.watch(firebaseAuthProvider);

    final userData = ref.watch(fetchUserProvider(auth.currentUser!.uid));

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(context.loc.accountHeading),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  final uid = auth.currentUser!.uid;
                  context.pushNamed(
                    TopLevelDestinations.profile.name,
                    pathParameters: {
                      'uid': uid,
                    },
                  );
                },
                child: Ink(
                  decoration: boxDecoration,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: userData.when(
                              data: (userAccount) => CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                  userAccount?.pictureUrl ??
                                      CustomImages.defaultProfilePictureUrl,
                                ),
                              ),
                              loading: () => const CircularProgressIndicator(),
                              error: (_, __) =>
                                  Text(context.loc.accountLabelError),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userData.when(
                                    data: (userAccount) =>
                                        userAccount?.displayName ?? defaultName,
                                    loading: () =>
                                        context.loc.accountLabelLoading,
                                    error: (_, __) =>
                                        context.loc.accountLabelError,
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  auth.currentUser!.email ??
                                      context.loc.accountLabelUnknown,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                          ),
                          userData.when(
                            data: (userAccount) => IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => EditProfileScreen(
                                      userAccount: userAccount!,
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: CustomColors.buttonPrimary,
                              ),
                            ),
                            loading: () => const CircularProgressIndicator(),
                            error: (_, __) =>
                                Text(context.loc.accountLabelError),
                          ),
                          const VerticalDivider(
                            color: CustomColors.grey,
                            thickness: 1,
                            endIndent: 25,
                            indent: 25,
                            width: 1,
                          ),
                          IconButton(
                            onPressed: () {
                              showQRCodeDialog(
                                qrCodeData: auth.currentUser!.uid,
                              );
                            },
                            icon: const Icon(
                              Icons.qr_code,
                              color: CustomColors.buttonPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Ink(
                decoration: boxDecoration,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: menuItems.map((item) {
                    return InkWell(
                      onTap: () => context.pushNamed(item['option'] as String),
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              item['label'] as String,
                              style: textTheme.bodySmall?.copyWith(
                                color: CustomColors.black,
                              ),
                            ),
                            leading: Icon(
                              item['icon'] as IconData?,
                              color: item['color'] as Color?,
                            ),
                          ),
                          if (item != menuItems.last)
                            const Divider(
                              endIndent: 10,
                              indent: 10,
                              thickness: 1,
                              height: 1,
                            ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 5),
              ListTile(
                title: Text(
                  context.loc.accountLogout,
                  style: textTheme.bodyMedium?.copyWith(color: Colors.red),
                ),
                leading: const Icon(Icons.logout, color: Colors.red),
                onTap: () {
                  //auth.signOut();
                  _showLogoutConfirmation(auth: auth);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
