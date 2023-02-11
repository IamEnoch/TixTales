import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(36.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text(
              'Welcome Back!',
              style: AppResources.appStyles.textStyles.headineH4.copyWith(
                color: AppResources.appColors.globalDark,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Text(
              'Email adress',
              style: AppResources.appStyles.textStyles.bodyDefaultBold.copyWith(
                color: AppResources.appColors.typographyGrey,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.006,
            ),
            TextField(
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'name@example.com',
                  hintStyle:
                      AppResources.appStyles.textStyles.bodyTextInput.copyWith(
                    color: AppResources.appColors.typographyTextInputGrey,
                  )),
              style: AppResources.appStyles.textStyles.bodyTextInput.copyWith(
                color: AppResources.appColors.typographyGrey,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.034,
            ),
            Text(
              'Password',
              style: AppResources.appStyles.textStyles.bodyDefaultBold.copyWith(
                color: AppResources.appColors.typographyGrey,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.006,
            ),
            TextField(
              obscureText: obscureText,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                  hintText: 'Enter your password',
                  hintStyle:
                      AppResources.appStyles.textStyles.bodyTextInput.copyWith(
                    color: AppResources.appColors.typographyTextInputGrey,
                  )),
              style: AppResources.appStyles.textStyles.bodyTextInput.copyWith(
                color: AppResources.appColors.typographyGrey,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.31,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
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
          ],
        ),
      ),
    );
  }
}
