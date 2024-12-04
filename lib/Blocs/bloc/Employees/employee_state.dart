part of 'employee_bloc.dart';

@immutable
sealed class EmployeeState {}

final class EmployeeInitial extends EmployeeState {}

final class EmployeeLoading extends EmployeeState {}

final class EmployeeAdded extends EmployeeState {
  final Employee employee;
  EmployeeAdded({required this.employee});
}

final class EmployeeRemoved extends EmployeeState {
  final int tin;
  EmployeeRemoved({required this.tin});
}

final class EmployeesLoaded extends EmployeeState {
  final List<Employee> employees;
  EmployeesLoaded({required this.employees});
}

final class EmployeeError extends EmployeeState {
  final String message;

  EmployeeError({required this.message});
}
