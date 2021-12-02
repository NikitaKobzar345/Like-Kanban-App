import 'package:kanban/auth/form_states.dart';

class LoginState {
  final String username;
  bool get isValidUsername => username.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final FormSubmissionStatus formStatus;

  LoginState({
    this.username = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  LoginState copyWith({
    required String username,
    required String password,
    required FormSubmissionStatus formStatus,
  }) {
    return LoginState(
      username: username,
      password: password,
      formStatus: formStatus,
    );
  }
}
