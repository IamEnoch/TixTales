import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tix_tales/services/auth/bloc/auth_bloc.dart';
import 'package:tix_tales/services/auth/bloc/auth_state.dart';
import 'package:tix_tales/services/auth/firebase/firebase_auth_provider.dart';
import 'package:tix_tales/src/Constants/routes.dart';
import 'package:tix_tales/views/singleEvent/buy_ticket_page.dart';
import 'package:tix_tales/views/home_page.dart';
import 'package:tix_tales/views/auth/onboarding_view.dart';
import 'package:tix_tales/views/auth/login_view.dart';
import 'package:tix_tales/views/auth/signUp_view.dart';
import 'package:tix_tales/views/singleEvent/single_event_view.dart';
import 'package:tix_tales/views/tab_page.dart';
import 'package:tix_tales/views/tickets/tickets_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(FirebaseAuthProvider()),
        ),
      ],
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final Widget startPage;
          if (state is AuthStateLoggedIn) {
            startPage = const TabPage();
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
            debugShowCheckedModeBanner: false,
            home: startPage,
            routes: {
              onboardingRoute: (context) => const OnboardingView(),
              signInRoute: (context) => const LoginView(),
              signUpRoute: (context) => const SignUpView(),
              homePageRoute: (context) => const HomePage(),
              tabPageRoute: (context) => const TabPage(),
              singleEventPage: (context) => const SingleEventPage(),
              buyTicketPage: (context) => const BuyTicketPage(),
              ticketsPage: (context) => const TicketsPage(),
            },
          );
        },
      ),
    );
  }
}
