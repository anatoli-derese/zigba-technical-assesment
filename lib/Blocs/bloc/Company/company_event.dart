part of 'company_bloc.dart';

@immutable
sealed class CompanyEvent {}

final class RegisterCompanyEvent extends CompanyEvent {
  final String name;
  final String address;
  final String phone;
  final String tin;
  final int numberOfEmployees;
  final String bank;
  final String bankAccount;

  RegisterCompanyEvent({
    required this.name,
    required this.address,
    required this.phone,
    required this.tin,
    required this.numberOfEmployees,
    required this.bank,
    required this.bankAccount,
  });
}

final class UpdateCompanyProfileEvent extends CompanyEvent{
   final String name;
  final String address;
  final String phone;
  final String tin;
  final int numberOfEmployees;
  final String bank;
  final String bankAccount;

  UpdateCompanyProfileEvent({
    required this.name,
    required this.address,
    required this.phone,
    required this.tin,
    required this.numberOfEmployees,
    required this.bank,
    required this.bankAccount,
  });

}
