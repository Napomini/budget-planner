import 'package:flutter/material.dart';

import '../../constants/models/data.dart';
import 'all_transactions/all_transaction.dart';
import 'app_bar/appbar.dart';
import 'current_month_summary/current_month_summary.dart';

class HomePage extends StatelessWidget {
  final Data data;
  const HomePage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, 150),
        child: CustomAppBar(
          userName: data.userName,
          totalAmount: data.totalAmount,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            CurrentMonthSummary(data: data),
            const SizedBox(height: 10),
            AllTransactions(data: data),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
