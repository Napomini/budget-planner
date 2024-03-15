import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'all_transactions/all_transaction.dart';
import 'app_bar/appbar.dart';
import 'current_month_summary/current_month_summary.dart';

class HomePage extends StatelessWidget {
  final User user;
  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, 150),
        child: const CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const CurrentMonthSummary(),
            const SizedBox(height: 10),
            const AllTransactions(),
            const SizedBox(height: 100),
            OutlinedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              child: const Text(' Log out '),
            ),
          ],
        ),
      ),
    );
  }
}
