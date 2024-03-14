import 'package:budgetplanner/widgets/triple_rail.dart';
import 'package:flutter/material.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  int _currentIndex = 1;

  void ontapTranactionType(int newVal) {
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
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 310,
                  child: TripleRail(
                    leading: BuildTransactionType(
                      title: 'Expense',
                      activeInd: _currentIndex,
                      ownInd: 0,
                      ontap: () => activeFirst(),
                    ),
                    middle: BuildTransactionType(
                      title: 'Income',
                      activeInd: _currentIndex,
                      ownInd: 1,
                      ontap: () => activeSecond(),
                    ),
                    trailing: BuildTransactionType(
                      title: 'Debt',
                      activeInd: _currentIndex,
                      ownInd: 2,
                      ontap: () => activeThird(),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BuildTransactionType extends StatelessWidget {
  final String title;
  final int activeInd;
  final int ownInd;
  final Function() ontap;
  const BuildTransactionType({
    super.key,
    required this.title,
    required this.activeInd,
    required this.ownInd,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    bool isActive = ownInd == activeInd;
    // rgb(71, 71, 73)
    // rgb(47, 47, 49)
    return InkWell(
      onTap: () => ontap(),
      child: Container(
        decoration: BoxDecoration(
          color: isActive
              ? const Color.fromARGB(255, 47, 47, 49)
              : const Color.fromARGB(255, 71, 71, 73),
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
