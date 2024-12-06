part of 'employee_bloc.dart';

@immutable
sealed class EmployeeEvent {}

final class AddEmployeeEvent extends EmployeeEvent {
  final Employee employee;
  AddEmployeeEvent({required this.employee});
}

final class RemoveEmployeeEvent extends EmployeeEvent {
  final int tin;
  RemoveEmployeeEvent({required this.tin});
}

final class DeleteAllEmployeesEvent extends EmployeeEvent {}

final class GetEmployeesEvent extends EmployeeEvent {}
