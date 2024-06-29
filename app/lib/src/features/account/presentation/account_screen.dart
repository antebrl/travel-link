import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_link/src/features/account/presentation/account_controller.dart';
import 'package:travel_link/src/features/account/presentation/edit_profile_screen.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/trip_overview/data/user_repository.dart';
import 'package:travel_link/src/routing/app_router.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';
import 'package:travel_link/src/utils/theme/widget_themes/boxDecoration_theme.dart';

var menuItems = <Map<String, dynamic>>[
  {
    'label': 'Account information',
    'icon': Icons.account_circle,
    'color': CustomColors.primary
  },
  {
    'label': 'Notifications',
    'icon': Icons.notifications,
    'color': CustomColors.primary
  },
  //{'label': 'Privacy', 'icon': Icons.privacy_tip, 'color': Colors.blue},
  {
    'option': AccountRoutes.security,
    'label': 'Security',
    'icon': Icons.security,
    'color': CustomColors.primary
  },
  {
    'option': AccountRoutes.settings,
    'label': 'Settings',
    'icon': Icons.settings,
    'color': CustomColors.primary
  },
  {
    'option': AccountRoutes.help,
    'label': 'Help',
    'icon': Icons.help,
    'color': CustomColors.primary
  },
  {
    'option': AccountRoutes.about,
    'label': 'About',
    'icon': Icons.info,
    'color': CustomColors.primary
  },
];

class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({super.key});

  @override
  ConsumerState<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends ConsumerState<AccountScreen> {
  final double borderRadius = 10;

  final String defaultName = 'User Name';
  final String defaultDescription = 'Shine bright like a diamond💎';

  Future<void> _showLogoutConfirmation({required FirebaseAuth auth}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
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

  Future<String?> _showEditPopup(
      {required String label, String intialValue = ''}) async {
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
    final auth = ref.watch(firebaseAuthProvider);

    final accountController = ref.watch(accountControllerProvider.notifier);
    var userData = ref.watch(fetchUserProvider(auth.currentUser!.uid));

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Account'),
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
                          GestureDetector(
                            onTap: () async {
                              final ImagePicker picker = ImagePicker();
                              final XFile? image = await picker.pickImage(
                                source: ImageSource.gallery,
                                imageQuality: 80,
                              );
                              if (image == null) return;
                              final Uint8List bytes = await image.readAsBytes();
                              await accountController.updateProfilePicture(
                                  picture: bytes);

                              userData = ref.refresh(
                                fetchUserProvider(
                                  auth.currentUser!.uid,
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: userData.when(
                                data: (userAccount) => CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(
                                    userAccount?.pictureUrl ??
                                        CustomImages.defaultProfilePictureUrl,
                                  ),
                                ),
                                loading: () =>
                                    const CircularProgressIndicator(),
                                error: (_, __) => const Text('Error'),
                              ),
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
                                    loading: () => 'Loading...',
                                    error: (_, __) => 'Error',
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  userData.when(
                                    data: (userAccount) =>
                                        userAccount?.description ??
                                        defaultDescription,
                                    loading: () => 'Loading...',
                                    error: (_, __) => 'Error',
                                  ),
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
                            error: (_, __) => const Text('Error'),
                          ),
                          const VerticalDivider(
                            color: CustomColors.grey,
                            thickness: 1,
                            endIndent: 25,
                            indent: 25,
                            width: 1,
                          ),
                          IconButton(
                            onPressed: () {},
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
                  children: [
                    for (var i = 0; i < menuItems.length; i++) ...[
                      InkWell(
                        onTap: () =>
                            context.goNamed(AccountRoutes.settings.name),
                        borderRadius: BorderRadius.circular(10),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                menuItems[i]['label'] as String,
                                style: textTheme.bodySmall?.copyWith(
                                  color: CustomColors.black,
                                ),
                              ),
                              leading: Icon(
                                menuItems[i]['icon'] as IconData?,
                                color: menuItems[i]['color'] as Color?,
                              ),
                            ),
                            if (i != menuItems.length - 1)
                              const Divider(
                                endIndent: 10,
                                indent: 10,
                                thickness: 1,
                                height: 1,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 5),
              ListTile(
                title: Text(
                  'Logout',
                  style: textTheme.bodyMedium?.copyWith(color: Colors.red),
                ),
                leading: const Icon(Icons.logout, color: Colors.red),
                onTap: () {
                  print('Logout pressed');
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
