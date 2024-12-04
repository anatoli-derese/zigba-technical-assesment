class Employee {
  final String name;
  final String email;
  final String phone;
  final int tin;
  final int grossSalary;
  final int taxableEarning;
  final DateTime startDate;
  final String paymentType;

  Employee({
    required this.name,
    required this.email,
    required this.phone,
    required this.tin,
    required this.grossSalary,
    required this.taxableEarning,
    required this.paymentType,
    DateTime? startDate, 
  }) : startDate = startDate ?? DateTime.now(); 
  
}
