import 'package:flutter/material.dart';

class CompanyRegistrationPage extends StatefulWidget {
  const CompanyRegistrationPage({Key? key}) : super(key: key);

  @override
  _CompanyRegistrationPageState createState() => _CompanyRegistrationPageState();
}

class _CompanyRegistrationPageState extends State<CompanyRegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isFormValid = false;

  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _tinNumberController = TextEditingController();
  final TextEditingController _employeesController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();

  void _checkFormValidity() {
    setState(() {
      _isFormValid = _companyNameController.text.isNotEmpty &&
          _addressController.text.isNotEmpty &&
          _phoneController.text.isNotEmpty &&
          _tinNumberController.text.isNotEmpty &&
          _employeesController.text.isNotEmpty &&
          _bankNameController.text.isNotEmpty &&
          _accountNumberController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    // Add listeners to all controllers
    _companyNameController.addListener(_checkFormValidity);
    _addressController.addListener(_checkFormValidity);
    _phoneController.addListener(_checkFormValidity);
    _tinNumberController.addListener(_checkFormValidity);
    _employeesController.addListener(_checkFormValidity);
    _bankNameController.addListener(_checkFormValidity);
    _accountNumberController.addListener(_checkFormValidity);
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _tinNumberController.dispose();
    _employeesController.dispose();
    _bankNameController.dispose();
    _accountNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Register your company to ',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'Demoz Payroll',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[500],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Register your company to continue',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 24),
              _buildTextField(_companyNameController, 'Company name'),
              _buildTextField(_addressController, 'Address of the company'),
              _buildTextField(_phoneController, 'Phone Number'),
              _buildTextField(_tinNumberController, 'Tin Number'),
              _buildTextField(_employeesController, 'Number of employees'),
              _buildTextField(_bankNameController, 'Company bank'),
              _buildTextField(_accountNumberController, 'Bank account number'),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isFormValid
                      ? () {
                          // Handle form submission
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isFormValid ? Colors.blue : Colors.grey[200],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Submit for approval',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}