import 'package:Demoz/Repository/employee_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:hive/hive.dart';
import 'package:Demoz/Models/Employee.dart';

import 'employee_repository_test.mocks.dart';

@GenerateMocks(
  [Box],
  customMocks: [MockSpec<Box<Employee>>(as: #MockEmployeeBox)],
)
void main() {
  late EmployeeRepository employeeRepository;
  late MockEmployeeBox mockEmployeeBox;

  setUp(() {
    mockEmployeeBox = MockEmployeeBox();
    employeeRepository = EmployeeRepository(mockEmployeeBox);
  });

  group('addEmployee', () {
    test('adds an employee to the box', () {
      final employee = Employee(
        tin: 123, 
        name: 'John Doe',
         phone: '',
         email: '',
         paymentType: '',
         grossSalary: 0,
         taxableEarning: 0,
         startDate: DateTime.now(),
        );

      when(mockEmployeeBox.put(employee.tin, employee)).thenAnswer((_) async => null);

      employeeRepository.addEmployee(employee);

      verify(mockEmployeeBox.put(employee.tin, employee)).called(1);
    });
  });

  group('deleteEmployee', () {
    test('deletes an employee if it exists in the box', () {
      const tin = 123;

      when(mockEmployeeBox.containsKey(tin)).thenReturn(true);
      when(mockEmployeeBox.delete(tin)).thenAnswer((_) async => null);

      final result = employeeRepository.deleteEmployee(tin);

      expect(result, true);
      verify(mockEmployeeBox.delete(tin)).called(1);
    });

    test('does not delete an employee if it does not exist in the box', () {
      const tin = 123;

      when(mockEmployeeBox.containsKey(tin)).thenReturn(false);

      final result = employeeRepository.deleteEmployee(tin);

      expect(result, false);
      verifyNever(mockEmployeeBox.delete(tin));
    });
  });

  group('getAllEmployees', () {
    test('returns all employees in the box', () {
      final employees = [
       Employee(
        tin: 123, 
        name: 'John Doe',
         phone: '',
         email: '',
         paymentType: '',
         grossSalary: 0,
         taxableEarning: 0,
         startDate: DateTime.now(),
        ),
        Employee(
        tin: 123, 
        name: 'Jane Smith',
         phone: '',
         email: '',
         paymentType: '',
         grossSalary: 0,
         taxableEarning: 0,
         startDate: DateTime.now(),
        )
      ];

      when(mockEmployeeBox.values).thenReturn(employees);

      final result = employeeRepository.getAllEmployees();

      expect(result, employees);
    });
  });

}
