part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}

final class LogoutEvent extends AuthEvent {}

final class CheckLoggedInEvent extends AuthEvent {}
