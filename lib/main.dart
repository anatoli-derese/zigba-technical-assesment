
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:zigba/Blocs/bloc/Auth/bloc/auth_bloc.dart';
import 'package:zigba/Blocs/bloc/Company/company_bloc.dart';
import 'package:zigba/Blocs/bloc/Employees/employee_bloc.dart';
import 'package:zigba/Pages/bottom_navigation.dart';
import 'package:zigba/Pages/landing_page.dart';
import 'package:zigba/Repository/auth_repository.dart';
import 'package:zigba/Repository/employee_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final authBox = await Hive.openBox('authBox');
  final authRepository = AuthRepository(authBox);
  runApp(
    Phoenix(
      child: MyApp(authRepository: authRepository
      ),
    )
    );
}


class MyApp extends StatelessWidget {
  final AuthRepository authRepository;  
  MyApp({required this.authRepository, super.key});
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
);}
}
