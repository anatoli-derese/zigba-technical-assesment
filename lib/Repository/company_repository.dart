import 'package:Demoz/Models/Company.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CompanyRepository {
  final Box<Company> _companyBox;

  CompanyRepository(this._companyBox);

  bool registerCompany(Company company) {
    if (_companyBox.isNotEmpty) {
      return false;
    }
    _companyBox.put('company', company);
    return true;
  }

  bool hasCompany() {
    return _companyBox.containsKey('company');
  }

  Company? getCompany() {
    return _companyBox.get('company');
  }

  bool editCompany(Company updatedCompany) {
    if (!_companyBox.containsKey('company')) {
      return false;
    }
    _companyBox.put('company', updatedCompany);
    return true;
  }
}
