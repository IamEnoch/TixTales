import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tix_tales/services/auth/auth_exceptions.dart';
import 'package:tix_tales/services/auth/bloc/auth_bloc.dart';
import 'package:tix_tales/services/auth/bloc/auth_event.dart';
import 'package:tix_tales/services/auth/bloc/auth_state.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';
import 'package:tix_tales/src/Constants/routes.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool obscureText = true;
  bool isBusy = false;
  late TextEditingController emailTextEditingController;
  late TextEditingController passwordTextEditingController;

  @override
  void initState() {
    emailTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateLoggedIn) {
          Navigator.pushNamedAndRemoveUntil(
              context, homePageRoute, (route) => false);
        }
        if (state is AuthStateLoggedOut) {
          state.isLoading ? isBusy = true : isBusy = false;

          if (state.exception is InvalidEmailException) {
            Fluttertoast.showToast(
              msg: "invalid email",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: AppResources.appColors.typographyGrey,
              textColor: AppResources.appColors.globalDark,
              fontSize: 16.0,
            );
          } else if (state.exception is WrongPasswordException) {
            Fluttertoast.showToast(
              msg: "Wrong password",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          } else if (state.exception is UserNotFoundException) {
            Fluttertoast.showToast(
              msg: "User not found",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          } else if (state.exception is GenericException) {
            Fluttertoast.showToast(
              msg: "Generic exception",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(36.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.centerLeft,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppResources.appColors.globalDark,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
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
                  'Email address',
                  style: AppResources.appStyles.textStyles.bodyDefaultBold
                      .copyWith(
                    color: AppResources.appColors.typographyGrey,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.006,
                ),
                TextField(
                  controller: emailTextEditingController,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'name@example.com',
                      hintStyle: AppResources.appStyles.textStyles.bodyTextInput
                          .copyWith(
                        color: AppResources.appColors.typographyTextInputGrey,
                      )),
                  style:
                      AppResources.appStyles.textStyles.bodyTextInput.copyWith(
                    color: AppResources.appColors.typographyGrey,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.034,
                ),
                Text(
                  'Password',
                  style: AppResources.appStyles.textStyles.bodyDefaultBold
                      .copyWith(
                    color: AppResources.appColors.typographyGrey,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.006,
                ),
                TextField(
                  controller: passwordTextEditingController,
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
                      hintStyle: AppResources.appStyles.textStyles.bodyTextInput
                          .copyWith(
                        color: AppResources.appColors.typographyTextInputGrey,
                      )),
                  style:
                      AppResources.appStyles.textStyles.bodyTextInput.copyWith(
                    color: AppResources.appColors.typographyGrey,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 60.0,
                  child: OutlinedButton(
                    onPressed: isBusy
                        ? null
                        : () {
                            context.read<AuthBloc>().add(
                                  AuthEventLogin(
                                    emailTextEditingController.text,
                                    passwordTextEditingController.text,
                                  ),
                                );
                          },
                    style: AppResources.buttonStyles.buttonStyle(
                      backgroundColor: AppResources.appColors.globalPrimary,
                    ),
                    child: Visibility(
                      visible: !isBusy,
                      replacement: CircularProgressIndicator(
                        value: 10.0,
                        color: AppResources.appColors.typographyGlobalLight,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
