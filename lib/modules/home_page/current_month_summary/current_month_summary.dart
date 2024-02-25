import 'package:budgetplanner/constants/theme.dart';
import 'package:budgetplanner/widgets/triple_rail.dart';
import 'package:flutter/material.dart';

class CurrentMonthSummary extends StatelessWidget {
  const CurrentMonthSummary({super.key});

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
                      'TK 5, 000',
                      style: TextStyle(
                        color: CTheme.primaryColor,
                      ),
                    ),
                  ),
                  TripleRail(
                    leading: const Text('Expense'),
                    trailing: Text(
                      'TK - 2, 000',
                      style: TextStyle(
                        color: CTheme.expense,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black12,
                    thickness: 0.7,
                  ),
                  const TripleRail(
                    leading: Text('Total'),
                    trailing: Text(
                      'TK 5, 000',
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
