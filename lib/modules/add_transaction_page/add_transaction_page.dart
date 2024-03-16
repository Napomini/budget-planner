import 'package:budgetplanner/widgets/triple_rail.dart';
import 'package:flutter/material.dart';

import 'add_debt_subtype.dart';
import 'add_expense_subtype.dart';
import 'add_income_subtype.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  int _currentIndex = 0;

  void ontapTransactionType(int newVal) {
    setState(() {
      debugPrint('Ontaped at $newVal');
      _currentIndex == newVal;
    });
  }

  void activeFirst() {
    setState(() {
      _currentIndex = 0;
    });
  }

  void activeSecond() {
    setState(() {
      _currentIndex = 1;
    });
  }

  void activeThird() {
    setState(() {
      _currentIndex = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 0, 0, 0)
                        .withOpacity(.3), // Shadow color
                    spreadRadius: 1, // Spread radius
                    blurRadius: 3, // Blur radius
                    offset: const Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 320,
                  child: TripleRail(
                    leading: BuildTransactionTypeButton(
                      title: 'Expense',
                      activeInd: _currentIndex,
                      ownInd: 0,
                      ontap: () => activeFirst(),
                    ),
                    middle: BuildTransactionTypeButton(
                      title: 'Income',
                      activeInd: _currentIndex,
                      ownInd: 1,
                      ontap: () => activeSecond(),
                    ),
                    trailing: BuildTransactionTypeButton(
                      title: 'Debt',
                      activeInd: _currentIndex,
                      ownInd: 2,
                      ontap: () => activeThird(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          if (_currentIndex == 0) const BuildExpenseEditor(),
          if (_currentIndex == 1) const BuildIncomeEditor(),
          if (_currentIndex == 2) const BuildDebtSubtype(),
        ],
      ),
    );
  }
}

// 7532
// BuildIncomeEditor

class BuildTransactionTypeButton extends StatelessWidget {
  final String title;
  final int activeInd;
  final int ownInd;
  final Function() ontap;
  const BuildTransactionTypeButton({
    super.key,
    required this.title,
    required this.activeInd,
    required this.ownInd,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    bool isActive = ownInd == activeInd;
    return InkWell(
      onTap: () => ontap(),
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Color.fromARGB(255, 0, 0, 0),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        height: 35,
        width: 100,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
