import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tix_tales/services/auth/auth_exceptions.dart';
import 'package:tix_tales/services/auth/bloc/auth_bloc.dart';
import 'package:tix_tales/services/auth/bloc/auth_event.dart';
import 'package:tix_tales/services/auth/bloc/auth_state.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String? errorText;
  bool obscureText = true;
  bool showSendEmailVerfification = false;

  //Text controllers
  late TextEditingController emailTextEditingContoller;
  late TextEditingController passwordEditingController;
  late TextEditingController repeatPasswordEditingController;
  late TextEditingController fullNameEditingController;

  @override
  void initState() {
    emailTextEditingContoller = TextEditingController();
    passwordEditingController = TextEditingController();
    repeatPasswordEditingController = TextEditingController();
    fullNameEditingController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    emailTextEditingContoller.dispose();
    passwordEditingController.dispose();
    repeatPasswordEditingController.dispose();
    fullNameEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialize());
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is AuthStateUninitialized) {
            Fluttertoast.showToast(
              msg: "The state is Uninitialized",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: AppResources.appColors.typographyGrey,
              textColor: AppResources.appColors.globalDark,
              fontSize: 16.0,
            );
          }
          if (state is AuthStateRegistering) {
            Fluttertoast.showToast(
              msg: "The state is Registering",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: AppResources.appColors.typographyGrey,
              textColor: AppResources.appColors.globalDark,
              fontSize: 16.0,
            );
          }
          if (state is AuthStateNeedVerirfication) {
            setState(() {
              showSendEmailVerfification = true;
            });
            Fluttertoast.showToast(
              msg: "The state needs Verification",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: AppResources.appColors.typographyGrey,
              textColor: AppResources.appColors.globalDark,
              fontSize: 16.0,
            );
          }
          if (state is AuthStateLoggedIn) {
            Fluttertoast.showToast(
              msg: "The state is logged in",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: AppResources.appColors.typographyGrey,
              textColor: AppResources.appColors.globalDark,
              fontSize: 16.0,
            );
          }
          if (state is AuthStateLoggedOut) {
            if (state.exception is GenericException) {
              Fluttertoast.showToast(
                msg: "This is an alert (Generic exception)",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.SNACKBAR,
                timeInSecForIosWeb: 1,
                backgroundColor: AppResources.appColors.typographyGrey,
                textColor: AppResources.appColors.globalDark,
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
                    'Create new account',
                    style: AppResources.appStyles.textStyles.headineH4.copyWith(
                      color: AppResources.appColors.globalDark,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  Text(
                    'Full Name',
                    style: AppResources.appStyles.textStyles.bodyDefaultBold
                        .copyWith(
                      color: AppResources.appColors.typographyGrey,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.006,
                  ),
                  TextFormField(
                    controller: fullNameEditingController,
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Enter your name',
                        hintStyle: AppResources
                            .appStyles.textStyles.bodyTextInput
                            .copyWith(
                          color: AppResources.appColors.typographyTextInputGrey,
                        )),
                    style: AppResources.appStyles.textStyles.bodyTextInput
                        .copyWith(
                      color: AppResources.appColors.typographyGrey,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.034,
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
                  TextFormField(
                    controller: emailTextEditingContoller,
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'name@example.com',
                        hintStyle: AppResources
                            .appStyles.textStyles.bodyTextInput
                            .copyWith(
                          color: AppResources.appColors.typographyTextInputGrey,
                        )),
                    style: AppResources.appStyles.textStyles.bodyTextInput
                        .copyWith(
                      color: AppResources.appColors.typographyGrey,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.034,
                  ),
                  Text(
                    'Create Password',
                    style: AppResources.appStyles.textStyles.bodyDefaultBold
                        .copyWith(
                      color: AppResources.appColors.typographyGrey,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.006,
                  ),
                  TextFormField(
                    controller: passwordEditingController,
                    obscureText: obscureText,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                        errorText: errorText,
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        ),
                        hintText: 'Enter your Password',
                        hintStyle: AppResources
                            .appStyles.textStyles.bodyTextInput
                            .copyWith(
                          color: AppResources.appColors.typographyTextInputGrey,
                        )),
                    style: AppResources.appStyles.textStyles.bodyTextInput
                        .copyWith(
                      color: AppResources.appColors.typographyGrey,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.034,
                  ),
                  Text(
                    'Repeat Password',
                    style: AppResources.appStyles.textStyles.bodyDefaultBold
                        .copyWith(
                      color: AppResources.appColors.typographyGrey,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.006,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.always,
                    validator: (val) => errorText =
                        MatchValidator(errorText: 'Passwords Do Not Match')
                            .validateMatch(repeatPasswordEditingController.text,
                                passwordEditingController.text),
                    controller: repeatPasswordEditingController,
                    obscureText: obscureText,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                        errorText: errorText,
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        ),
                        hintText: 'Repeat new passoword',
                        hintStyle: AppResources
                            .appStyles.textStyles.bodyTextInput
                            .copyWith(
                          color: AppResources.appColors.typographyTextInputGrey,
                        )),
                    style: AppResources.appStyles.textStyles.bodyTextInput
                        .copyWith(
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
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              AuthEventRegister(emailTextEditingContoller.text,
                                  passwordEditingController.text),
                            );
                      },
                      style: AppResources.buttonStyles.buttonStyle(
                        backgroundColor: AppResources.appColors.globalPrimary,
                      ),
                      child: Text(
                        'Sign up',
                        style: AppResources
                            .appStyles.textStyles.componentsButtonDefault
                            .copyWith(
                          color: AppResources.appColors.typographyGlobalLight,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Visibility(
                      visible: showSendEmailVerfification,
                      child: TextButton(
                        onPressed: () {
                          context
                              .read<AuthBloc>()
                              .add(const AuthEventSendEmailVerification());
                        },
                        child: const Text('Send email verification'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
