import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:zigba/Blocs/bloc/Employees/employee_bloc.dart';
import 'package:zigba/Pages/add_employee.dart';

class EmployeePage extends StatelessWidget {
  const EmployeePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Managment'),
        backgroundColor: Colors.green,
        actions: [
          ElevatedButton.icon(
            icon: const Icon(Icons.upload_file),
            label: const Text('Upload CSV'),
            onPressed: () {
              // TODO: Implement CSV upload functionality
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.green[700],
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text('Add Employee'),
            onPressed: () {
              Navigator.push(context, 
                MaterialPageRoute(builder: (context) => AddEmployeePage())
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.green[700],
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: BlocBuilder<EmployeeBloc, EmployeeState>(
        builder: (context, state) {
          if (state is EmployeeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is EmployeesLoaded) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTable(
                  headingRowColor: MaterialStateProperty.all(Colors.green[100]),
                  dataRowColor: MaterialStateProperty.all(Colors.green[50]),
                  columns: const [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Email')),
                    DataColumn(label: Text('Phone')),
                    DataColumn(label: Text('TIN')),
                    DataColumn(label: Text('Gross Salary')),
                    DataColumn(label: Text('Taxable Earning')),
                    DataColumn(label: Text('Start Date')),
                    DataColumn(label: Text('Payment Type')),
                  ],
                  rows: state.employees.map((employee) {
                    return DataRow(cells: [
                      DataCell(Text(employee.name)),
                      DataCell(Text(employee.email)),
                      DataCell(Text(employee.phone)),
                      DataCell(Text(employee.tin.toString())),
                      DataCell(Text(employee.grossSalary.toString())),
                      DataCell(Text(employee.taxableEarning.toString())),
                      DataCell(Text(DateFormat('yyyy-MM-dd').format(employee.startDate))),
                      DataCell(Text(employee.paymentType)),
                    ]);
                  }).toList(),
                ),
              ),
            );
          } else if (state is EmployeeError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('No employees found.'));
          }
        },
      ),
    );
  }
}