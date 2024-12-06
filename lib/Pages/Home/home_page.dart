import 'package:flutter/material.dart';
part 'buildDataRange.dart';
part 'buildHeader.dart';
part 'buildMetricCard.dart';
part 'buildTabs.dart';
part 'buildTaxInfo.dart';
part 'buildBottomRow.dart';
part 'tabs_wrapper.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 20),
              _buildMetricCards(),
              const SizedBox(height: 20),
              const TabsWrapper(), // Use the wrapper here
              const SizedBox(height: 20),
              _buildDateRange(),
              const SizedBox(height: 20),
              _buildTaxInfo(),
              const SizedBox(height: 20),
              SingleChildScrollView(
                child: Row(
                  children: [
                    _buildEmployeeComposition(),
                    _buildTaxSummary(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




