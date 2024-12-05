

import 'package:hive_flutter/hive_flutter.dart';

part 'Employee.g.dart';

@HiveType(typeId: 0)
class Employee {
  @HiveField(0)
  final int tin;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String phone;

  @HiveField(3)
  final String email;

  @HiveField(4)
  final String paymentType;

  @HiveField(5)
  final DateTime startDate;

  @HiveField(6)
  final int grossSalary;

  @HiveField(7)
  final int taxableEarning;

  Employee({
    required this.tin,
    required this.name,
    required this.phone,
    required this.email,
    required this.paymentType,
    required this.startDate,
    required this.grossSalary,
    required this.taxableEarning,
  });
}
