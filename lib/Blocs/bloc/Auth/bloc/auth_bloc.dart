// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zigba/Repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
    on<CheckLoggedInEvent>(_onCheckLoggedIn);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authRepository.login(event.email, event.password);
      emit(LoggedIn());
    } catch (e) {
      emit(AuthError('Login failed: ${e.toString()}'));
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    try {
      await authRepository.logout();
      emit(NotLoggedIn());
      print(state);
    } catch (e) {
      emit(AuthError('Logout failed: ${e.toString()}'));
    }
    
  }

  void _onCheckLoggedIn(CheckLoggedInEvent event, Emitter<AuthState> emit) {
    print("checking ");
    final isLoggedIn = authRepository.isLoggedIn();
    print(isLoggedIn);
    if (isLoggedIn) {
      emit(LoggedIn());
    } else {
      emit(NotLoggedIn());
    }
  }

}
