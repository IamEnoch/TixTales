import 'dart:ffi';

//"Interface" for auth provider
abstract class AuthProvider {
  Future<Void> login({
    required email,
    required password,
  });

  Future<Void> createUser({
    required email,
    required password,
  });
  Future<Void> logout();

  Future<Void> sendEmailVerification();
}
