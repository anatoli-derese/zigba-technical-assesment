import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zigba/Models/Company.dart';


part 'company_event.dart';
part 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  CompanyBloc() : super(CompanyInitial()) {
    on<RegisterCompanyEvent>(_onRegisterCompany);
    on <UpdateCompanyProfileEvent>(_onUpdateCompanyProfile);
  }


Future<void> _onUpdateCompanyProfile(
    UpdateCompanyProfileEvent event, Emitter<CompanyState> emit) async {
  emit(CompanyLoading());
  try {
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


  Future<void> _onRegisterCompany(
      RegisterCompanyEvent event, Emitter<CompanyState> emit) async {
    emit(CompanyLoading());
    try {
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

  

}
