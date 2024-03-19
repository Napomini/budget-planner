import 'package:budgetplanner/constants/models/transaction.dart';
import 'package:flutter/material.dart';

import '../../../constants/helper.dart';
import '../../../constants/models/data.dart';
import '../../../constants/theme.dart';
import '../../../widgets/triple_rail.dart';

class CurrentMonthSummary extends StatefulWidget {
  final Data data;
  const CurrentMonthSummary({super.key, required this.data});

  @override
  State<CurrentMonthSummary> createState() => _CurrentMonthSummaryState();
}

class _CurrentMonthSummaryState extends State<CurrentMonthSummary> {
  double income = 0;
  double expense = 0;
  double total = 0;

  @override
  void initState() {
    super.initState();
    final DateTime today = DateTime.now();
    final int year = today.year;
    final int month = today.month;
    List<DailyTransaction> dailyTrnList = [];
    List<DailyTransaction> targetDailyTrnList = [];
    dailyTrnList = widget.data.transactions;
    for (int i = 0; i < dailyTrnList.length; i++) {
      DailyTransaction dailyTrn = dailyTrnList[i];
      if (dailyTrn.dateTime.month == month) {
        if (dailyTrn.dateTime.year == year) {
          targetDailyTrnList.add(dailyTrn);
        }
      }
    }
    if (targetDailyTrnList.isNotEmpty) {
      for (DailyTransaction dt in targetDailyTrnList) {
        for (MicroTransaction mt in dt.transactions) {
          int constant = getConstant(mt.type, mt.subType);
          // double value = mt.amount * constant.toDouble();
          if (constant < 0) {
            expense = expense - mt.amount;
          }
          if (constant > 0) {
            income = income + mt.amount;
          }
        }
      }
    }
    total = income + expense;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45, bottom: 8),
            child: TripleRail(
              leading: Icon(
                Icons.arrow_back_ios,
                color: CTheme.primaryColor,
                size: 16,
              ),
              middle: Text(
                'This Month',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: CTheme.primaryColor,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: CTheme.primaryColor,
                size: 16,
              ),
            ),
          ),
          Card(
            elevation: 1,
            color: Colors.white,
            // clipBehavior: Clip.hardEdge,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TripleRail(
                    leading: const Text('Income'),
                    trailing: Text(
                      'Tk $income',
                      style: TextStyle(
                        color: CTheme.primaryColor,
                      ),
                    ),
                  ),
                  TripleRail(
                    leading: const Text('Expense'),
                    trailing: Text(
                      'TK $expense',
                      style: TextStyle(
                        color: CTheme.expense,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black12,
                    thickness: 0.7,
                  ),
                  TripleRail(
                    leading: const Text('Total'),
                    trailing: Text(
                      'TK $total',
                      // style: TextStyle(
                      //   color: CTheme.primaryColor,
                      // ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
