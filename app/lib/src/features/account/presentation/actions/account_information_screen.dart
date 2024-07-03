import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:toastification/toastification.dart';
import 'package:travel_link/src/common_widgets/boxed_content.dart';
import 'package:travel_link/src/features/account/presentation/account_controller.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/trip_overview/data/user_repository.dart';
import 'package:travel_link/src/utils/theme/widget_themes/boxDecoration_theme.dart';

class AccountAccountInformationScreen extends ConsumerStatefulWidget {
  const AccountAccountInformationScreen({super.key});

  @override
  ConsumerState<AccountAccountInformationScreen> createState() =>
      _AccountAccountInformationScreenState();
}

class _AccountAccountInformationScreenState
    extends ConsumerState<AccountAccountInformationScreen> {
  var _passwordVisible = false;

  void saveProfileToDatabase() {
    final accountController = ref.read(accountControllerProvider.notifier);
    final username = usernameController.text;
    final email = emailController.text;
    final password = passwordController.text;

    if (username.isNotEmpty) {
      accountController.updateDisplayName(displayName: username);
    }
    if (email.isNotEmpty) {
      accountController.updateEmail(email: email);
    }
    if (password.isNotEmpty) {
      accountController.updatePassword(password: password);
    }

    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      title: const Text("Profile updated"),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 3),
      closeButtonShowType: CloseButtonShowType.none,
    );

    setState(() {
      usernameController.clear();
      emailController.clear();
      passwordController.clear();
    });

    Navigator.of(context).pop();
  }

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(firebaseAuthProvider);
    final userData = ref.watch(fetchUserProvider(auth.currentUser!.uid));

    usernameController.text = userData.when(
      data: (userAccount) => userAccount?.publicName ?? '',
      loading: () => '',
      error: (_, __) => '',
    );
    emailController.text = userData.when(
      data: (userAccount) => auth.currentUser!.email ?? 'Unknown',
      loading: () => '',
      error: (_, __) => '',
    );
    return Scaffold(
        appBar: AppBar(
          title: Text('Account Information'),
        ),
        floatingActionButton: FloatingActionButton.extended(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          onPressed: () {
            setState(saveProfileToDatabase);
          },
          label: const Text('Save'),
          icon: const Icon(Icons.save),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              BoxedContent(
                boxDecoration: boxDecoration,
                content: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Account Details',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          hintText: 'Please enter your username',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Please enter your password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                        obscureText: !_passwordVisible,
                        enableSuggestions: false,
                        autocorrect: false,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Please enter your email',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
