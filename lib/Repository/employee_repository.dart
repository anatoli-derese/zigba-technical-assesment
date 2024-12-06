import 'package:Demoz/Models/Employee.dart';
import 'package:hive/hive.dart';

class EmployeeRepository {
  final Box<Employee> _employeeBox;

  EmployeeRepository(this._employeeBox);

  void addEmployee(Employee employee) {
    _employeeBox.put(employee.tin, employee);    
  }

  bool deleteEmployee(int tin) {
    if (_employeeBox.containsKey(tin)) {
      _employeeBox.delete(tin);
      return true;
    }
    return false;
  }

  List<Employee> getAllEmployees() {
    return _employeeBox.values.toList();
  }
  void deleteAllEmployees() {
    _employeeBox.clear();
  }
}
