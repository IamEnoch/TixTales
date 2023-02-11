import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tix_tales/src/Constants/all_constant_imports.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppResources.appColors.typographyGlobalLight,
      body: Padding(
        padding: const EdgeInsets.all(36.5),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Center(
              child: Text(
                'Welcome!',
                style: AppResources.appStyles.textStyles.headineH2.copyWith(
                  color: AppResources.appColors.globalDark,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Center(
              child: Text(
                'Sing in or create a new account',
                style: AppResources.appStyles.textStyles.bodyDefault
                    .copyWith(color: AppResources.appColors.typographyGrey),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            Container(
              height: 248,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(AppAssets.loginImage),
              )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
            ),
            SizedBox(
              height: 60.0,
              child: OutlinedButton(
                onPressed: () {},
                style: AppResources.buttonStyles.buttonStyle(
                  backgroundColor: AppResources.appColors.globalPrimary,
                ),
                child: Text(
                  'Sign in',
                  style: AppResources
                      .appStyles.textStyles.componentsButtonDefault
                      .copyWith(
                    color: AppResources.appColors.typographyGlobalLight,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: 60.0,
              child: OutlinedButton(
                onPressed: () {},
                style: AppResources.buttonStyles.buttonStyle(
                  backgroundColor: AppResources.appColors.typographyGlobalLight,
                ),
                child: Text(
                  'No account yet? Sign up',
                  style: AppResources
                      .appStyles.textStyles.componentsButtonDefault
                      .copyWith(
                    color: AppResources.appColors.typographyGrey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
