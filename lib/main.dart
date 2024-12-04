
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zigba/Blocs/bloc/Auth/bloc/auth_bloc.dart';
import 'package:zigba/Blocs/bloc/Company/company_bloc.dart';
import 'package:zigba/Blocs/bloc/Employees/employee_bloc.dart';
import 'package:zigba/Pages/bottom_navigation.dart';
import 'package:zigba/Pages/landing_page.dart';
import 'package:zigba/Repository/auth_repository.dart';
import 'package:zigba/Repository/employee_repository.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AuthRepository authRepository = AuthRepository();
  final EmployeeRepository employeeRepository = EmployeeRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(authRepository: authRepository)..add(CheckLoggedInEvent()), 
        ),
        BlocProvider<EmployeeBloc>(
          create: (_) => EmployeeBloc(employeeRepository: employeeRepository),
        ),
        BlocProvider<CompanyBloc>(
          create: (_) => CompanyBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AppNavigator(),
      ),
    );
  }
}

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {

        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LoggedIn) {
          return const Pages();
        } else if (state is NotLoggedIn || state is AuthInitial) {
          return const LandingPage();
        } else if (state is AuthError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${state.message}'),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
