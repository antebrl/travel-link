import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/routing/app_router.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
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
  {'option': AccountRoutes.security, 'label': 'Security', 'icon': Icons.security, 'color': CustomColors.primary},
  {'option': AccountRoutes.settings, 'label': 'Settings', 'icon': Icons.settings, 'color': CustomColors.primary},
  {'option': AccountRoutes.help, 'label': 'Help', 'icon': Icons.help, 'color': CustomColors.primary},
  {'option': AccountRoutes.about, 'label': 'About', 'icon': Icons.info, 'color': CustomColors.primary},
];

class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({super.key});

  @override
  ConsumerState<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends ConsumerState<AccountScreen> {
  final double borderRadius = 10;

  Future<void> _showLogoutConfirmation() async {

    final auth = ref.watch(firebaseAuthProvider);

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
              child: Text('Cancel', style: Theme.of(context).textTheme.bodyMedium),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Sign Out', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red),),
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

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 2.0),
              blurRadius: 4.0,
            )
          ]),
          child: AppBar(
            title: const Text('Profile'),
            backgroundColor: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Ink(
                  decoration: boxDecoration,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: FittedBox(
                              child: CachedNetworkImage(
                                imageUrl: "https://via.placeholder.com/500",
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error, color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Funnyuser0815',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                                overflow: TextOverflow.fade,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Shine bright like a diamond💎',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      width: 100,
                      //decoration: boxDecoration,
                      child: InkWell(
                        //customBorder: CircleBorder(),
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => print("rest"),
                        child: Ink(
                          decoration: boxDecoration,
                          child: Row(
                            children: [
                              // Profile Picture
                              Container(
                                  width: 40,
                                  padding: const EdgeInsets.only(left: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: FittedBox(
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://via.placeholder.com/300',
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error,
                                                color: Colors.red),
                                      ),
                                    ),
                                  )),
                              Container(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  'Edit Profile',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                child: const Icon(Icons.arrow_forward_ios),
                                padding: const EdgeInsets.only(right: 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Ink(
                decoration: boxDecoration,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (var i = 0; i < menuItems.length; i++) ...[
                        InkWell(
                          onTap: () => context.goNamed(AccountRoutes.settings.name),
                          borderRadius: BorderRadius.circular(10),
                          child: Ink(
                            decoration: boxDecoration,
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
                                      color: menuItems[i]['color'] as Color?),
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
                        ),
                      ],
                    ],
                  ),
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
                  _showLogoutConfirmation();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
