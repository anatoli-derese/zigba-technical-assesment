class Company {
  final String name;
  final String address;
  final String phone;
  final String tin;
  final int numberOfEmployees;
  final String bank;
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
