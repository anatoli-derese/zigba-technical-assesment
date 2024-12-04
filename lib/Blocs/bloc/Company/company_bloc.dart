import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zigba/Models/Company.dart';


part 'company_event.dart';
part 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  CompanyBloc() : super(CompanyInitial()) {
    on<RegisterCompanyEvent>(_onRegisterCompany);
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
