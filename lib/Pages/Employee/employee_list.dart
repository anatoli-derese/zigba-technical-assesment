import 'package:Demoz/Blocs/bloc/Employees/employee_bloc.dart';
import 'package:Demoz/Pages/Employee/add_employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeePage extends StatelessWidget {
  const EmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Column(
          children: [
            const SizedBox(height: 10,),
            const Text("Managment"),
            
            ElevatedButton.icon(
            icon: const Icon(Icons.upload_file),
            label: const Text('Upload CSV'),
            onPressed: () {
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white
            ),
          ),
          ],
        ),
        
        actions: [
         ElevatedButton.icon(
            icon: const Icon(Icons.add_circle),
            label: const Text('Add Employee'),
            onPressed: () {
              Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const AddEmployeePage())
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      DataTable(
                        headingRowColor: WidgetStateProperty.all(Colors.green[100]),
                        dataRowColor: WidgetStateProperty.all(Colors.green[50]),
                        columns: const [
                          DataColumn(label: Text('Employees')),
                          DataColumn(label: Text('Net\nSalary')),
                          DataColumn(label: Text('Taxable\nEarning')),
                          DataColumn(label: Text('Income\nTax')),
                          DataColumn(label: Text('Pension\nTax')),
                          DataColumn(label: Text('Gross\nPay')),
                          DataColumn(label: Text('Actions')),
                        ],
                         columnSpacing: 8,  
                        horizontalMargin: 8, 
                        rows: state.employees.map((employee) {
                          return DataRow(cells: [
                            DataCell(Text(employee.name)),
                            DataCell(Text(employee.grossSalary.toString())),
                            DataCell(Text(employee.grossSalary.toString())),
                            DataCell(Text(employee.grossSalary.toString())),
                            DataCell(Text(employee.grossSalary.toString())),
                            DataCell(Text(employee.taxableEarning.toString())),
                            DataCell(
                              // green color
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 90,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                     borderRadius: BorderRadius.all(Radius.circular(8)),
                                   ),),
                                     onPressed: () {
                                      final employeeBloc = BlocProvider.of<EmployeeBloc>(context);
                                      employeeBloc.add(RemoveEmployeeEvent(tin: employee.tin));
                                     },
                                     child: const Text('Pay'),
                                    ),
                              ),
                    )
                            ),
                          ]);
                        }).toList(),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                           foregroundColor: Colors.white,
                           shape: const RoundedRectangleBorder(
                             borderRadius: BorderRadius.all(Radius.circular(8)),
                           ),
                                       ),
                                       onPressed: () {
                                        final employeeBloc = BlocProvider.of<EmployeeBloc>(context);
                                        employeeBloc.add(DeleteAllEmployeesEvent());
                                       },
                                       child: const Text('Bulk Pay'),
                                      ),
                      ),
                    )
                  
                    ],
                  ),
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