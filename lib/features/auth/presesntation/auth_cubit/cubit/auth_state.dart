sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpLoadingState extends AuthState {}

final class SignUpSuccessState extends AuthState {}

final class SignUpErrorState extends AuthState {
  final String error;

  SignUpErrorState({required this.error});
}
final class SignInLoadingState extends AuthState {}

final class SignInSuccessState extends AuthState {}

final class SignInErrorState extends AuthState {
  final String error;

  SignInErrorState({required this.error});
}
final class ResetPasswordLoadingState extends AuthState {}

final class ResetPasswordSuccessState extends AuthState {}

final class ResetPasswordErrorState extends AuthState {
  final String error;

  ResetPasswordErrorState({required this.error});
}

 final class TermsAndConditionUpdateState extends AuthState {}