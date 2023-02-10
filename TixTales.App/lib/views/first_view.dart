import 'package:flutter/material.dart';
import 'package:tix_tales/src/Constants/all_constant_imports.dart';
import 'package:tix_tales/src/Constants/app_colors.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';

import '../src/Constants/app_resources.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Welcome'),
            const Text('Sign in or create a new account'),
            Image.asset(AppAssets.loginImage),
            SizedBox(
              width: 317,
              height: 60,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors().globalPrimary,
                  textStyle:
                      AppResources.appStyles.textStyles.componentsButtonDefault,
                ),
                child: Text(
                  'Sign in',
                  style: TextStyle(
                      color: AppResources.appColors.typographyGlobalLight),
                ),
              ),
            ),
            SizedBox(
              width: 317,
              height: 60,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors().typographyGlobalLight,
                ),
                child: const Text('No account yet? Sign up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
