import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toastification/toastification.dart';
import 'package:travel_link/src/common_widgets/boxed_content.dart';
import 'package:travel_link/src/features/account/presentation/account_controller.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/trip_overview/data/user_repository.dart';
import 'package:travel_link/src/utils/helpers/localization.dart';
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
    final auth = ref.read(firebaseAuthProvider);
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

    Future.delayed(Duration.zero, () {
      toastification.show(
        context: context,
        type: ToastificationType.success,
        style: ToastificationStyle.flat,
        title: Text(context.loc.accountNotificationAccountSaved),
        alignment: Alignment.topCenter,
        showProgressBar: false,
        autoCloseDuration: const Duration(seconds: 2),
        closeButtonShowType: CloseButtonShowType.none,
      );
    });

    ref.invalidate(fetchUserProvider(auth.currentUser!.uid));

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
      data: (userAccount) => userAccount?.displayName ?? '',
      loading: () => '',
      error: (_, __) => '',
    );
    emailController.text = userData.when(
      data: (userAccount) =>
          auth.currentUser!.email ?? context.loc.accountLabelUnknown,
      loading: () => '',
      error: (_, __) => '',
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.accountInformation),
      ),
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        onPressed: () {
          setState(saveProfileToDatabase);
        },
        label: Text(context.loc.accountLabelSave),
        icon: const Icon(Icons.save),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            BoxedContent(
              boxDecoration: boxDecoration,
              content: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.loc.accountInformationAccountDetails,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: context.loc.accountInformationUsername,
                        hintText:
                            context.loc.accountInformationUsernamePlaceholder,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: context.loc.accountInformationPassword,
                        hintText:
                            context.loc.accountInformationPasswordPlaceholder,
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
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: context.loc.accountInformationEmail,
                        hintText:
                            context.loc.accountInformationEmailPlaceholder,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
