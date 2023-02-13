import 'dart:ffi';

import 'auth_user.dart';

//"Interface" for auth provider
abstract class AuthProvider {
  //Initialize you service
  Future<void> initialize();

  //get current user
  AuthUser? get currentUser;

  Future<AuthUser> login({
    required String email,
    required String password,
  });

  //create user
  Future<AuthUser> createUser({
    required String email,
    required String password,
  });

  //logout user
  Future<Void> logOut();

  //send email verification
  Future<Void> sendEmailVerification();
}
