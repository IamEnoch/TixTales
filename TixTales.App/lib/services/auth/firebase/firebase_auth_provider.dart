import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tix_tales/firebase_options.dart';
import 'package:tix_tales/services/auth/auth_exceptions.dart';
import 'package:tix_tales/services/auth/auth_provider.dart';
import 'package:tix_tales/services/auth/auth_user.dart';

class FirebaseAuthProvider extends AuthProvider {
  @override
  Future<AuthUser> createUser({required email, required password}) async {
    //Attempt sign up
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //Get current user
      final user = currentUser;

      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInException();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw WrongPasswordException;
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailException;
      } else if (e.code == 'weak-password') {
        throw UserNotFoundException;
      } else {
        throw GenericException;
      }
    }
  }

  @override
  AuthUser? get currentUser {
    final user = FirebaseAuth.instance.currentUser;

    //return current user and if not existing return null
    if (user != null) {
      return AuthUser.fromFirebase(user);
    } else {
      return null;
    }
  }

  @override
  Future<void> initialize() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  @override
  Future<AuthUser> login({
    required String email,
    required String password,
  }) async {
    //Attempt login
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      //Get current user
      final user = currentUser;

      if (user != null) {
        return user;
      } else {
        print("user not logged in exceptio thrown");
        throw UserNotLoggedInException();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        throw WrongPasswordException;
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailException;
      } else if (e.code == 'user-not-found') {
        throw UserNotFoundException();
      } else {
        print("The error is ${e.code}");
        throw GenericException();
      }
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await user.sendEmailVerification();
    } else {
      throw UserNotLoggedInException();
    }
  }

  @override
  Future<void> logOut() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await FirebaseAuth.instance.signOut();
    } else {
      throw UserNotLoggedInException();
    }
  }
}
