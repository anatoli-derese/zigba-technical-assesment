import 'package:zigba/Models/Employee.dart';

class EmployeeRepository {
  List<Employee> _employees = []; 

  void addEmployee(Employee employee) {
    _employees.add(employee);
  }

  bool deleteEmployee(int tin) {
    List<Employee> new_emloyees = [];
    bool flag = false;
    for (Employee employee in _employees) {
      if (employee.tin != tin) {
        new_emloyees.add(employee);
      }
      else{
        flag = true;
      }
    }
    _employees = new_emloyees;
    return flag;

  }

  List<Employee> getAllEmployees() {
    return _employees;
  }
}