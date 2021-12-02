import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/auth/auth_event.dart';
import 'package:kanban/auth/auth_state.dart';
import 'package:kanban/packages/authentication_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;

  LoginBloc(
      {required this.authRepo,
      required AuthRepository authenticationRepository})
      : super(LoginState());
}
