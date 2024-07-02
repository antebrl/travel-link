import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/authentication/presentation/auth_providers.dart';

class CustomSignInScreen extends ConsumerWidget {
  const CustomSignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProviders = ref.watch(authProvidersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/my-trips/travel.gif',
              fit: BoxFit.cover,
              height: 170,
            ),
            // Sign-in screen
            Expanded(
              child: SignInScreen(
                providers: authProviders,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
