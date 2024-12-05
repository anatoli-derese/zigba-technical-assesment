import 'package:Demoz/Models/Company.dart';
import 'package:Demoz/Repository/company_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'company_event.dart';
part 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final CompanyRepository companyRepository;

  CompanyBloc(this.companyRepository) : super(CompanyInitial()) {
    on<RegisterCompanyEvent>(_onRegisterCompany);
    on<UpdateCompanyProfileEvent>(_onUpdateCompanyProfile);
    on<CheckCompanyRegistered>(_onCheckCompanyRegistered);
  }

  Future<void>_onCheckCompanyRegistered (
    CheckCompanyRegistered event, Emitter<CompanyState> emit) async {
      final company = companyRepository.getCompany();
      if (company != null) {
        emit(CompanyRegistered(company: company));
      } else {
        emit(CompanyNotRegistered());
      }
    }
  

  Future<void> _onRegisterCompany(
      RegisterCompanyEvent event, Emitter<CompanyState> emit) async {
    emit(CompanyLoading());
    try {
      _validateCompanyDetails(
        name: event.name,
        address: event.address,
        phone: event.phone,
        tin: event.tin,
        numberOfEmployees: event.numberOfEmployees,
        bank: event.bank,
        bankAccount: event.bankAccount,
      );

      final company = Company.register(
        name: event.name,
        address: event.address,
        phone: event.phone,
        tin: event.tin,
        numberOfEmployees: event.numberOfEmployees,
        bank: event.bank,
        bankAccount: event.bankAccount,
      );

      final success = companyRepository.registerCompany(company);
      if (success) {
        emit(CompanyRegistered(company: company));
      } else {
        emit(CompanyError('Company is already registered.'));
      }
    } catch (e) {
      emit(CompanyError('Failed to register company: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateCompanyProfile(
      UpdateCompanyProfileEvent event, Emitter<CompanyState> emit) async {
    emit(CompanyLoading());
    try {
      _validateCompanyDetails(
        name: event.name,
        address: event.address,
        phone: event.phone,
        tin: event.tin,
        numberOfEmployees: event.numberOfEmployees,
        bank: event.bank,
        bankAccount: event.bankAccount,
      );

      final currentCompany = companyRepository.getCompany();
      if (currentCompany == null) {
        throw Exception('No company is registered.');
      }
      final updatedCompany = Company.register(
        name: event.name,
        address: event.address,
        phone: event.phone,
        tin: event.tin,
        numberOfEmployees: event.numberOfEmployees,
        bank: event.bank,
        bankAccount: event.bankAccount,
      );
      final success = companyRepository.editCompany(updatedCompany);
      if (success) {
        emit(CompanyRegistered(company: updatedCompany));
      } else {
        throw Exception('Failed to update company profile.');
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
    if (name.isEmpty) {
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
