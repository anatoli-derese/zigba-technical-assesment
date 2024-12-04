part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class LoggedIn extends AuthState {}

final class NotLoggedIn extends AuthState {}

final class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
