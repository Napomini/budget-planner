import 'package:flutter/material.dart';

import '../../../constants/models/transaction_data.dart';
import '../../../constants/models/transction.dart';
import '../../../widgets/transaction_widget.dart';
import 'all_transctions_title.dart';

class AllTransctions extends StatelessWidget {
  const AllTransctions({super.key});

  TransactionData getData() {
    MicroTransction mt1 = MicroTransction(
      transctionType: TransctionType.saving,
      reason: 'movie',
      tansctionAmount: 8000.00,
    );
    Transaction t1 = Transaction(
      dateTime: DateTime(2024, 2, 25),
      transctions: [mt1],
    );
    MicroTransction mt2 = MicroTransction(
      transctionType: TransctionType.saving,
      reason: 'movie',
      tansctionAmount: 8000.00,
    );
    Transaction t2 = Transaction(
      dateTime: DateTime(2024, 2, 20),
      transctions: [mt2],
    );
    MicroTransction mt3 = MicroTransction(
      transctionType: TransctionType.transportation,
      reason: 'Transportation',
      tansctionAmount: 4000.00,
    );
    MicroTransction mt4 = MicroTransction(
      transctionType: TransctionType.lending,
      reason: 'Ali',
      tansctionAmount: 100.00,
    );
    MicroTransction mt5 = MicroTransction(
      transctionType: TransctionType.borrowing,
      reason: 'Steave',
      tansctionAmount: 200.00,
    );
    MicroTransction mt6 = MicroTransction(
      transctionType: TransctionType.fee,
      reason: 'Transportation',
      tansctionAmount: 100.00,
    );
    MicroTransction mt7 = MicroTransction(
      transctionType: TransctionType.bill,
      reason: 'Transportation',
      tansctionAmount: 1000.00,
    );
    Transaction t3 = Transaction(
      dateTime: DateTime(2024, 2, 18),
      transctions: [mt3, mt4, mt5, mt6, mt7],
    );
    return TransactionData(transactionHistory: [t1, t2, t3]);
  }

  @override
  Widget build(BuildContext context) {
    final t = getData();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AllTransctionsTitle(),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: t.transactionHistory.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TransctionWidget(
                  transaction: t.transactionHistory[index],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
