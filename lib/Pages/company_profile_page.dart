import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zigba/Blocs/bloc/Company/company_bloc.dart';

class CompanyProfilePage extends StatefulWidget {
  const CompanyProfilePage({super.key});

  @override
  _CompanyProfilePageState createState() => _CompanyProfilePageState();
}

class _CompanyProfilePageState extends State<CompanyProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _tinController = TextEditingController();
  final TextEditingController _employeesController = TextEditingController();
  final TextEditingController _bankController = TextEditingController();
  final TextEditingController _bankAccountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Populate the fields with initial values from the bloc state
    final companyState = context.read<CompanyBloc>().state;
    if (companyState is CompanyRegistered) {
      final company = companyState.company;
      _nameController.text = company.name;
      _addressController.text = company.address;
      _phoneController.text = company.phone;
      _tinController.text = company.tin;
      _employeesController.text = company.numberOfEmployees.toString();
      _bankController.text = company.bank;
      _bankAccountController.text = company.bankAccount;
    }
  }

  Future<void> _pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        // Handle the picked image, e.g., upload to server or update bloc
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  void _saveProfile() {
    final numberOfEmployees = int.tryParse(_employeesController.text) ?? 0;
    context.read<CompanyBloc>().add(
          UpdateCompanyProfileEvent(
            name: _nameController.text,
            address: _addressController.text,
            phone: _phoneController.text,
            tin: _tinController.text,
            numberOfEmployees: numberOfEmployees,
            bank: _bankController.text,
            bankAccount: _bankAccountController.text,
          ),
        );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CompanyBloc, CompanyState>(
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Company\nProfile',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.settings_outlined),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Profile Image and Company Info
                  Center(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3,
                                ),
                              ),
                              child: const Icon(
                                Icons.business,
                                size: 60,
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: GestureDetector(
                                onTap: () => _pickImage(context),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Editable Fields
                  _buildLabel('Company Name'),
                  _buildTextField(_nameController),
                  const SizedBox(height: 16),
                  _buildLabel('Address'),
                  _buildTextField(_addressController),
                  const SizedBox(height: 16),
                  _buildLabel('Phone Number'),
                  _buildTextField(_phoneController),
                  const SizedBox(height: 16),
                  _buildLabel('TIN Number'),
                  _buildTextField(_tinController),
                  const SizedBox(height: 16),
                  _buildLabel('Number of Employees'),
                  _buildTextField(_employeesController, keyboardType: TextInputType.number),
                  const SizedBox(height: 16),
                  _buildLabel('Bank Name'),
                  _buildTextField(_bankController),
                  const SizedBox(height: 16),
                  _buildLabel('Bank Account Number'),
                  _buildTextField(_bankAccountController),

                  const SizedBox(height: 32),

                  // Save Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _saveProfile,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Save Profile',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}