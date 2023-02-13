import 'dart:ffi';

import 'auth_user.dart';

//"Interface" for auth provider
abstract class AuthProvider {
  //Initialize you service
  Future<void> initialize();

  //get current user
  AuthUser get getCurrentUser;

  Future<Void> login({
    required email,
    required password,
  });

  //create user
  Future<Void> createUser({
    required email,
    required password,
  });

  //logout user
  Future<Void> logout();

  //send email verification
  Future<Void> sendEmailVerification();
}
