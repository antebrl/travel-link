import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_link/src/features/authentication/presentation/auth_providers.dart';
import 'package:travel_link/src/routing/app_router.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProviders = ref.watch(authProvidersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
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
                footerBuilder: (context, action) =>
                    const SignInAnonymouslyFooter(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignInAnonymouslyFooter extends ConsumerWidget {
  const SignInAnonymouslyFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(height: 8),
        const Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('or'),
            ),
            Expanded(child: Divider()),
          ],
        ),
        TextButton(
          onPressed: () => context.goNamed(TopLevelDestinations.trips.name),
          child: const Text('Try anonymously'),
        ),
      ],
    );
  }
}
