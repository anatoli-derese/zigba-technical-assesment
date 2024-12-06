import 'package:Demoz/Repository/company_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:hive/hive.dart';
import 'package:Demoz/Models/Company.dart';

import 'company_repository_test.mocks.dart';

@GenerateMocks(
  [Box],
  customMocks: [MockSpec<Box<Company>>(as: #MockCompanyBox)],
)
void main() {
  late CompanyRepository companyRepository;
  late MockCompanyBox mockCompanyBox;

  setUp(() {
    mockCompanyBox = MockCompanyBox();
    companyRepository = CompanyRepository(mockCompanyBox);
  });

  group('registerCompany', () {
    test('registers a company when the box is empty', () {
      final company = Company(
        name: 'Demo Company',
        address: "",
        phone: "",
        tin: "",
        numberOfEmployees:0,
        bank: "",
        bankAccount: "",
        );

      when(mockCompanyBox.isNotEmpty).thenReturn(false);
      when(mockCompanyBox.put('company', company)).thenAnswer((_) async => null);

      final result = companyRepository.registerCompany(company);

      expect(result, true);
      verify(mockCompanyBox.put('company', company)).called(1);
    });

    test('does not register a company if the box is not empty', () {
      final company = Company(
        name: 'Demo Company',
        address: "",
        phone: "",
        tin: "",
        numberOfEmployees:0,
        bank: "",
        bankAccount: "",
        );

      when(mockCompanyBox.isNotEmpty).thenReturn(true);

      final result = companyRepository.registerCompany(company);

      expect(result, false);
      verifyNever(mockCompanyBox.put('company', company));
    });
  });

  group('hasCompany', () {
    test('returns true if the company exists in the box', () {
      when(mockCompanyBox.containsKey('company')).thenReturn(true);

      final result = companyRepository.hasCompany();

      expect(result, true);
    });

    test('returns false if the company does not exist in the box', () {
      when(mockCompanyBox.containsKey('company')).thenReturn(false);

      final result = companyRepository.hasCompany();

      expect(result, false);
    });
  });

  group('getCompany', () {
    test('returns the company if it exists in the box', () {
      final company = Company(
        name: 'Demo Company',
        address: "",
        phone: "",
        tin: "",
        numberOfEmployees:0,
        bank: "",
        bankAccount: "",
        );

      when(mockCompanyBox.get('company')).thenReturn(company);

      final result = companyRepository.getCompany();

      expect(result, company);
    });

    test('returns null if the company does not exist in the box', () {
      when(mockCompanyBox.get('company')).thenReturn(null);

      final result = companyRepository.getCompany();

      expect(result, null);
    });
  });

  group('editCompany', () {
    test('edits the company if it exists in the box', () {
      final updatedCompany = Company(
        name: 'Demo Company',
        address: "",
        phone: "",
        tin: "",
        numberOfEmployees:0,
        bank: "",
        bankAccount: "",
        );

      when(mockCompanyBox.containsKey('company')).thenReturn(true);
      when(mockCompanyBox.put('company', updatedCompany)).thenAnswer((_) async => null);

      final result = companyRepository.editCompany(updatedCompany);

      expect(result, true);
      verify(mockCompanyBox.put('company', updatedCompany)).called(1);
    });

    test('does not edit the company if it does not exist in the box', () {
      final updatedCompany =Company(
        name: 'Upd Company',
        address: "",
        phone: "",
        tin: "",
        numberOfEmployees:0,
        bank: "",
        bankAccount: "",
        );

      when(mockCompanyBox.containsKey('company')).thenReturn(false);

      final result = companyRepository.editCompany(updatedCompany);

      expect(result, false);
      verifyNever(mockCompanyBox.put('company', updatedCompany));
    });
  });
}
