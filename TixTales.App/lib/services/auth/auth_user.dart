import 'package:firebase_auth/firebase_auth.dart';

class AuthUser {
  final String id;
  final String? email;
  final bool isVerified;

  AuthUser({
    required this.id,
    required this.email,
    required this.isVerified,
  });

  //factory constructor to generate auth user from firebase
  factory AuthUser.fromFirebase(User user) {
    return AuthUser(
      id: user.uid,
      email: user.email,
      isVerified: user.emailVerified,
    );
  }
}
