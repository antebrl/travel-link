import 'package:firebase_auth/firebase_auth.dart'
    hide AuthProvider, EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
List<AuthProvider<AuthListener, AuthCredential>> authProviders(
  AuthProvidersRef ref,
) {
  return [
    //only Email SignIn at the moment
    EmailAuthProvider(),
  ];
}
