import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_link/src/features/authentication/presentation/auth_providers.dart';
import 'package:travel_link/src/utils/constants/colors.dart';

class CustomSignInScreen extends ConsumerWidget {
  const CustomSignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProviders = ref.watch(authProvidersProvider);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sign in'),
        ),
        body: SignInScreen(
          providers: authProviders,
          
        ),
      ),
    );
  }
}
