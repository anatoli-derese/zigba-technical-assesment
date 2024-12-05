import 'package:Demoz/Models/Company.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'company_event.dart';
part 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  CompanyBloc() : super(CompanyInitial()) {
    on<RegisterCompanyEvent>(_onRegisterCompany);
    on<UpdateCompanyProfileEvent>(_onUpdateCompanyProfile);
  }

  Future<void> _onRegisterCompany(
      RegisterCompanyEvent event, Emitter<CompanyState> emit) async {
    emit(CompanyLoading());
    try {
      // Validate company details
      _validateCompanyDetails(
        name: event.name,
        address: event.address,
        phone: event.phone,
        tin: event.tin,
        numberOfEmployees: event.numberOfEmployees,
        bank: event.bank,
        bankAccount: event.bankAccount,
      );

      // Register the company using the provided details
      final company = Company.register(
        name: event.name,
        address: event.address,
        phone: event.phone,
        tin: event.tin,
        numberOfEmployees: event.numberOfEmployees,
        bank: event.bank,
        bankAccount: event.bankAccount,
      );

      emit(CompanyRegistered(company: company));
    } catch (e) {
      emit(CompanyError('Failed to register company: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateCompanyProfile(
      UpdateCompanyProfileEvent event, Emitter<CompanyState> emit) async {
    emit(CompanyLoading());
    try {
      // Validate company details
      _validateCompanyDetails(
        name: event.name,
        address: event.address,
        phone: event.phone,
        tin: event.tin,
        numberOfEmployees: event.numberOfEmployees,
        bank: event.bank,
        bankAccount: event.bankAccount,
      );

      final companyState = state;
      if (companyState is CompanyRegistered) {
        final updatedCompany = Company.register(
          name: event.name,
          address: event.address,
          phone: event.phone,
          tin: event.tin,
          numberOfEmployees: event.numberOfEmployees,
          bank: event.bank,
          bankAccount: event.bankAccount,
        );

        emit(CompanyRegistered(company: updatedCompany)); // Emit the updated state
      } else {
        throw Exception("Invalid state: Cannot update company profile.");
      }
    } catch (e) {
      emit(CompanyError('Failed to update company profile: ${e.toString()}'));
    }
  }

  // Validator function to check company details
  void _validateCompanyDetails({
    required String name,
    required String address,
    required String phone,
    required String tin,
    required int numberOfEmployees,
    required String bank,
    required String bankAccount,
  }) {
    if (name.isEmpty || name.runtimeType != String) {
      throw Exception('Company name must be a non-empty string.');
    }
    if (address.isEmpty) {
      throw Exception('Address must be a non-empty string.');
    }
    if (!RegExp(r'^\d{10}$').hasMatch(phone)) {
      throw Exception('Phone must be a 10-digit number.');
    }
    if (!RegExp(r'^\d{10}$').hasMatch(tin)) {
      throw Exception('TIN must be a 10-digit number.');
    }
    if (numberOfEmployees < 1 || numberOfEmployees > 1000) {
      throw Exception('Number of employees must be between 1 and 1000.');
    }
    if (bank.isEmpty) {
      throw Exception('Bank name must be a non-empty string.');
    }
    if (!RegExp(r'^\d{13}$').hasMatch(bankAccount)) {
      throw Exception('Bank account number must be a 13-digit number.');
    }
  }
}
