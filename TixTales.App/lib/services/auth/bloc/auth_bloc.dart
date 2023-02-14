import 'package:bloc/bloc.dart';
import 'package:tix_tales/services/auth/auth_provider.dart';
import 'package:tix_tales/services/auth/bloc/auth_event.dart';
import 'package:tix_tales/services/auth/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //It should have an initial state
  AuthBloc(AuthProvider provider) : super(const AuthStateUninitialized()) {
    //send email everification
    on<AuthEventSendEmailVerification>((event, emit) async {
      await provider.sendEmailVerification();
      emit(state);
    });

    //Event register
    on<AuthEventRegister>(
      (event, emit) async {
        final email = event.email;
        final password = event.password;
        try {
          await provider.createUser(
            email: email,
            password: password,
          );

          await provider.sendEmailVerification();
          emit(
            const AuthStateNeedVerirfication(),
          );
        } on Exception catch (e) {
          emit(AuthStateRegistering(e));
        }
      },
    );

    //Initialize auth/app
    on<AuthEventInitialize>(
      ((event, emit) async {
        await provider.initialize();
        final user = provider.currentUser;
        if (user == null) {
          emit(
            const AuthStateLoggedOut(
              exception: null,
              isLoading: false,
            ),
          );
        } else if (!user.isVerified) {
          emit(const AuthStateNeedVerirfication());
        } else {
          emit(AuthStateLoggedIn(user));
        }
      }),
    );

    //login event
    on<AuthEventLogin>(
      ((event, emit) async {
        emit(
          const AuthStateLoggedOut(
            exception: null,
            isLoading: true,
          ),
        );
        //await Future.delayed(const Duration(seconds: 5));
        final email = event.email;
        final password = event.password;
        try {
          final user = await provider.login(
            email: email,
            password: password,
          );
          //Disable loading screen if email is not verified
          if (!user.isVerified) {
            emit(
              const AuthStateLoggedOut(
                exception: null,
                isLoading: false,
              ),
            );
            emit(const AuthStateNeedVerirfication());
          } else {
            emit(
              const AuthStateLoggedOut(
                exception: null,
                isLoading: false,
              ),
            );
            emit(AuthStateLoggedIn(user));
          }
        } on Exception catch (e) {
          emit(
            AuthStateLoggedOut(exception: e, isLoading: false),
          );
        }
      }),
    );

    //Login event
    on<AuthEventLogout>(
      ((event, emit) async {
        try {
          await provider.logOut();
          emit(
            const AuthStateLoggedOut(
              exception: null,
              isLoading: false,
            ),
          );
        } on Exception catch (e) {
          emit(
            AuthStateLoggedOut(exception: e, isLoading: false),
          );
        }
      }),
    );
  }
}
