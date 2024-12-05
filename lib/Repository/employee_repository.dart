import 'package:zigba/Models/Employee.dart';

class EmployeeRepository {
  List<Employee> _employees = []; 

  void addEmployee(Employee employee) {
    _employees.add(employee);
  }

  bool deleteEmployee(int tin) {
    List<Employee> newEmloyees = [];
    bool flag = false;
    for (Employee employee in _employees) {
      if (employee.tin != tin) {
        newEmloyees.add(employee);
      }
      else{
        flag = true;
      }
    }
    _employees = newEmloyees;
    return flag;

  }

  List<Employee> getAllEmployees() {
    return _employees;
  }
}