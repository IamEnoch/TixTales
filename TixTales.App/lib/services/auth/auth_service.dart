import 'dart:ffi';

import 'package:tix_tales/services/auth/auth_provider.dart';
import 'package:tix_tales/services/auth/auth_user.dart';
import 'package:tix_tales/services/auth/firebase/firebase_auth_provider.dart';

class AuthService extends AuthProvider {
  final AuthProvider provider;

  AuthService(this.provider);

  //create auth provider based on firebase auth provider
  factory AuthService.firebase() => AuthService(FirebaseAuthProvider());

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) =>
      provider.createUser(email: email, password: password);

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<void> initialize() => provider.initialize();

  @override
  Future<void> logOut() => provider.logOut();

  @override
  Future<AuthUser> login({
    required String email,
    required String password,
  }) =>
      provider.login(
        email: email,
        password: password,
      );

  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();
}
