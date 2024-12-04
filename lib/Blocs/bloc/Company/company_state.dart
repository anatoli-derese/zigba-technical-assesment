part of 'company_bloc.dart';

@immutable
sealed class CompanyState {}

final class CompanyInitial extends CompanyState {}

final class CompanyLoading extends CompanyState {}

final class CompanyRegistered extends CompanyState {
  final Company company;
  CompanyRegistered({required this.company});
}

final class CompanyNotRegistered extends CompanyState {}

final class CompanyError extends CompanyState {
  final String message;
  CompanyError(this.message);
}
