import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_auth_repository.g.dart';

//similar to https://github.com/bizz84/starter_architecture_flutter_firebase/blob/master/lib/src/features/authentication/data/firebase_auth_repository.dart

class AuthRepository {
  AuthRepository(this._auth);
  final FirebaseAuth _auth;
  bool onboardingCompleted = false;

  bool toogleOnboardingCompleted() {
    if(!onboardingCompleted) {
      onboardingCompleted = true;
      return false;
    }
    return true;
  }

  Stream<User?> authStateChanges() => _auth.authStateChanges();
  User? get currentUser => _auth.currentUser;
}

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(ref.watch(firebaseAuthProvider));
}

@riverpod
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  return ref.watch(authRepositoryProvider).authStateChanges();
}

@riverpod
bool onboardingCompleted(OnboardingCompletedRef ref) {
  return ref.watch(authRepositoryProvider).toogleOnboardingCompleted();
}
