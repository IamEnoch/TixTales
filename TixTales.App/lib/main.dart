import 'package:flutter/material.dart';
import 'package:tix_tales/views/login_view.dart';
import 'package:tix_tales/views/onboarding_view.dart';
import 'package:tix_tales/views/signIn_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const LoginView(),
    );
  }
}
