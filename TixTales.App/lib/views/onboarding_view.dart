import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tix_tales/services/auth/bloc/auth_bloc.dart';
import 'package:tix_tales/services/auth/bloc/auth_event.dart';
import 'package:tix_tales/src/Constants/all_constant_imports.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';
import 'package:tix_tales/src/Constants/routes.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialize());
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(36.5),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(
                'Welcome!',
                style: AppResources.appStyles.textStyles.headineH2.copyWith(
                  color: AppResources.appColors.globalDark,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                'Sign in or create a new Account',
                style: AppResources.appStyles.textStyles.bodyDefault
                    .copyWith(color: AppResources.appColors.typographyGrey),
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
                width: MediaQuery.of(context).size.width,
                child: OutlinedButton(
                  onPressed: () async {
                    await Navigator.pushNamed(context, signInRoute);
                  },
                  style: AppResources.buttonStyles.buttonStyle(
                    backgroundColor: AppResources.appColors.globalPrimary,
                  ),
                  child: Text(
                    'Sign In',
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
                width: MediaQuery.of(context).size.width,
                child: OutlinedButton(
                  onPressed: () async {
                    await Navigator.pushNamed(context, signUpRoute);
                  },
                  style: AppResources.buttonStyles.buttonStyle(
                    backgroundColor:
                        AppResources.appColors.typographyGlobalLight,
                  ),
                  child: Text(
                    'No Account yet? Sign Up',
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
      ),
    );
  }
}
