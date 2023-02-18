import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tix_tales/services/auth/bloc/auth_bloc.dart';
import 'package:tix_tales/services/auth/bloc/auth_state.dart';
import 'package:tix_tales/services/auth/firebase/firebase_auth_provider.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';
import 'package:tix_tales/src/Constants/routes.dart';
import 'package:tix_tales/views/home_page.dart';
import 'package:tix_tales/views/onboarding_view.dart';
import 'package:tix_tales/views/login_view.dart';
import 'package:tix_tales/views/signUp_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(FirebaseAuthProvider()),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final Widget startPage;
          if (state is AuthStateLoggedIn) {
            startPage = const HomePage();
          } else if (state is AuthStateLoggedOut) {
            startPage = const OnboardingView();
          } else if (state is AuthStateRegistering) {
            startPage = const OnboardingView();
          } else {
            startPage = const OnboardingView();
          }
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.teal,
              scaffoldBackgroundColor: Colors.white,
            ),
            home: startPage,
            routes: {
              onboardingRoute: (context) => const OnboardingView(),
              signInRoute: (context) => const LoginView(),
              signUpRoute: (context) => const SignUpView(),
              homePageRoute: (context) => const HomePage(),
            },
          );
        },
      ),
    );
  }
}
