import 'package:Demoz/Blocs/bloc/Employees/employee_bloc.dart';
import 'package:Demoz/Models/Employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
part  'build_header.dart';
part 'build_text_field.dart';

class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({super.key});

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _tinController = TextEditingController();
  final _grossSalaryController = TextEditingController();
  final _taxableEarningsController = TextEditingController();
  final _startDateController = TextEditingController();
  PaymentType _paymentType = PaymentType.none;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _tinController.dispose();
    _grossSalaryController.dispose();
    _taxableEarningsController.dispose();
    _startDateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _startDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmployeeBloc, EmployeeState>(
      listener: (context, state) {
        if (state is EmployeeAdded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Employee added: ${state.employee.name}')),
          );
          Navigator.pop(context); // Return to the previous page.
        } else if (state is EmployeeError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('Add Employee'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  _buildFormFields(),
                  _buildPaymentTypeSelector(),
                  const SizedBox(height: 24),
                  _buildSubmitButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  

  Widget _buildFormFields() {
    return Column(
      children: [
        _buildTextField(controller: _nameController, label: 'Employee name'),
        _buildTextField(controller: _emailController, label: 'Email address', keyboardType: TextInputType.emailAddress),
        _buildTextField(controller: _phoneController, label: 'Phone number', keyboardType: TextInputType.phone),
        _buildTextField(controller: _tinController, label: 'TIN number', keyboardType: TextInputType.number),
        _buildTextField(controller: _grossSalaryController, label: 'Gross salary', keyboardType: TextInputType.number),
        _buildTextField(controller: _taxableEarningsController, label: 'Taxable earnings', keyboardType: TextInputType.number),
        _buildTextField(
          controller: _startDateController,
          label: 'Starting date of salary',
          readOnly: true,
          onTap: () => _selectDate(context),
        ),
      ],
    );
  }

 Widget _buildPaymentTypeSelector() {
    return Row(
      children: [
        _buildPaymentTypeButton(title: 'Per Month', type: PaymentType.monthly),
        const SizedBox(width: 12),
        _buildPaymentTypeButton(title: 'Per Contract', type: PaymentType.contract),
      ],
    );
  }

  Widget _buildPaymentTypeButton({
    required String title,
    required PaymentType type,
  }) {
    final isSelected = _paymentType == type;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _paymentType = type;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? const Color.fromARGB(255, 85, 162, 225) : const Color.fromARGB(147, 184, 198, 255),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.blue[700] : Colors.grey[600],
              ),
            ),
          ),
        ),
      ),
    );
  }



  Widget _buildSubmitButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isFormValid
            ? () {
                if (_formKey.currentState!.validate()) {
                  final employee = Employee(
                    name: _nameController.text,
                    email: _emailController.text,
                    phone: _phoneController.text,
                    tin: int.parse(_tinController.text),
                    grossSalary: int.parse(_grossSalaryController.text),
                    taxableEarning: int.parse(_taxableEarningsController.text),
                    startDate: DateFormat('yyyy-MM-dd').parse(_startDateController.text),
                    paymentType: _paymentType.name,
                  );
                  context.read<EmployeeBloc>().add(AddEmployeeEvent(employee: employee));
                }
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: _isFormValid ? Colors.blue : Colors.grey[200],
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text('Add Employee'),
      ),
    );
  }

  bool get _isFormValid {
    return _nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _tinController.text.isNotEmpty &&
        _grossSalaryController.text.isNotEmpty &&
        _taxableEarningsController.text.isNotEmpty &&
        _startDateController.text.isNotEmpty &&
        _paymentType != PaymentType.none;
  }
}



enum PaymentType {
  none,
  monthly,
  contract,
}