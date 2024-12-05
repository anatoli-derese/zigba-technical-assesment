
import 'package:hive_flutter/hive_flutter.dart';

part 'Company.g.dart';

@HiveType(typeId: 2)
class Company {
  @HiveField( 0)
  final String name;
  @HiveField( 1)
  final String address;
  @HiveField( 2)
  final String phone;
  @HiveField( 3)
  final String tin;
  @HiveField( 4)
  final int numberOfEmployees;
  @HiveField( 5)
  final String bank;
  @HiveField( 6)
  final String bankAccount;

  Company({
    required this.name,
    required this.address,
    required this.phone,
    required this.tin,
    required this.numberOfEmployees,
    required this.bank,
    required this.bankAccount,
  });

  factory Company.register({
    required String name,
    required String address,
    required String phone,
    required String tin,
    required int numberOfEmployees,
    required String bank,
    required String bankAccount,
  }) {
    return Company(
      name: name,
      address: address,
      phone: phone,
      tin: tin,
      numberOfEmployees: numberOfEmployees,
      bank: bank,
      bankAccount: bankAccount,
    );
  }
}
