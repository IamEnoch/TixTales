import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tix_tales/services/auth/bloc/auth_bloc.dart';
import 'package:tix_tales/services/auth/bloc/auth_event.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text(
                'We have send the email verification. if not sure click the link down below'),
            TextButton(
              onPressed: () {
                context
                    .read<AuthBloc>()
                    .add(const AuthEventSendEmailVerification());
                Navigator.pop(context);
              },
              child: const Text('Send email verification'),
            ),
          ],
        ),
      ),
    );
  }
}
