import 'package:Demoz/Models/Employee.dart';
import 'package:Demoz/Repository/employee_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepository employeeRepository;

  EmployeeBloc({required this.employeeRepository}) : super(EmployeeInitial()) {
    on<AddEmployeeEvent>(_onAddEmployee);
    on<RemoveEmployeeEvent>(_onRemoveEmployee);
    on<GetEmployeesEvent>(_onGetEmployees);
    on<DeleteAllEmployeesEvent>(_onDeleteAllEmployees);

  }

  Future<void> _onDeleteAllEmployees(DeleteAllEmployeesEvent event, Emitter<EmployeeState> emit) async {
    try {
      employeeRepository.deleteAllEmployees();
      emit(EmployeesLoaded(employees: []));
    } catch (e) {
      emit(EmployeeError(message: 'Failed to delete all employees: ${e.toString()}'));
    }
  }

  Future<void> _onAddEmployee(AddEmployeeEvent event, Emitter<EmployeeState> emit) async {
    try {
      employeeRepository.addEmployee(event.employee);
      emit(EmployeeAdded(employee: event.employee));
      add(GetEmployeesEvent()); 
    } catch (e) {
      emit(EmployeeError(message: 'Failed to add employee: ${e.toString()}'));
    }
  }

  Future<void> _onRemoveEmployee(RemoveEmployeeEvent event, Emitter<EmployeeState> emit) async {
    try {
      bool removed = employeeRepository.deleteEmployee(event.tin);
      if (removed) {
        emit(EmployeeRemoved(tin: event.tin));
        add(GetEmployeesEvent()); 
      } else {
        emit(EmployeeError(message: 'Employee with TIN ${event.tin} not found.'));
      }
    } catch (e) {
      emit(EmployeeError(message: 'Failed to remove employee: ${e.toString()}'));
    }
  }

  void _onGetEmployees(GetEmployeesEvent event, Emitter<EmployeeState> emit) {
    final employees = employeeRepository.getAllEmployees();
    emit(EmployeesLoaded(employees: employees));
  }
}
