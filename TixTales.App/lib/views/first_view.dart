import 'package:flutter/material.dart';
import 'package:tix_tales/src/Constants/all_constant_imports.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                'Welcome!',
                style: AppResources.appStyles.textStyles.headineH2,
              ),
              Text(
                'Sign in or create a new account',
                style: AppResources.appStyles.textStyles.bodyDefault,
              ),
              Image.asset(AppAssets.loginImage),
              SizedBox(
                width: 317,
                height: 60,
                child: OutlinedButton(
                  onPressed: () {},
                  style: AppResources.buttonStyles.buttonStyle(
                    backgroundColor: AppResources.appColors.globalPrimary,
                  ),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      color: AppResources.appColors.typographyGlobalLight,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 317,
                height: 60,
                child: OutlinedButton(
                  onPressed: () {},
                  style: AppResources.buttonStyles.buttonStyle(
                    backgroundColor:
                        AppResources.appColors.typographyGlobalLight,
                  ),
                  child: const Text('No account yet? Sign up'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
