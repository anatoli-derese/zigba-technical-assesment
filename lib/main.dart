
import 'package:Demoz/Blocs/bloc/Auth/bloc/auth_bloc.dart';
import 'package:Demoz/Blocs/bloc/Company/company_bloc.dart';
import 'package:Demoz/Blocs/bloc/Employees/employee_bloc.dart';
import 'package:Demoz/Models/Employee.dart';
import 'package:Demoz/Pages/bottom_navigation.dart';
import 'package:Demoz/Pages/landing_page.dart';
import 'package:Demoz/Repository/auth_repository.dart';
import 'package:Demoz/Repository/employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(EmployeeAdapter());
  final employeeBox = await Hive.openBox<Employee>('employee');
  final authBox = await Hive.openBox('authBox');
  final authRepository = AuthRepository(authBox);
  final employeeRepository = EmployeeRepository(employeeBox);
  runApp(
    Phoenix(
      child: MyApp(
        authRepository: authRepository,
        employeeRepository: employeeRepository,
      ),
    )
    );
}


class MyApp extends StatelessWidget {
  final AuthRepository authRepository;  
  final EmployeeRepository employeeRepository;
  MyApp({required this.authRepository, required this.employeeRepository, super.key});

  

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(authRepository: authRepository)..add(CheckLoggedInEvent()), 
        ),
        BlocProvider<EmployeeBloc>(
          create: (_) => EmployeeBloc(employeeRepository: employeeRepository)..add(GetEmployeesEvent()),
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
