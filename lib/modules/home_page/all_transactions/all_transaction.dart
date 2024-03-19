import 'package:flutter/material.dart';

import '../../../constants/models/data.dart';
import '../../../widgets/transaction_widget.dart';
import 'all_transaction_title.dart';

class AllTransactions extends StatelessWidget {
  final Data data;
  const AllTransactions({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    data.transactions.sort((a, b) => b.dateTime.compareTo(a.dateTime));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AllTransactionsTitle(),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.transactions.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TransactionWidget(
                  transaction: data.transactions[index],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

// TransactionData getData() {
//   // MicroTransaction mt1 = MicroTransaction(
//   //   transactionType: TransactionType.saving,
//   //   reason: 'movie',
//   //   tansctionAmount: 8000.00,
//   // );
//   // Transaction t1 = Transaction(
//   //   dateTime: DateTime(2024, 2, 25),
//   //   transactions: [mt1],
//   // );
//   // MicroTransaction mt2 = MicroTransaction(
//   //   transactionType: TransactionType.saving,
//   //   reason: 'movie',
//   //   tansctionAmount: 8000.00,
//   // );
//   // Transaction t2 = Transaction(
//   //   dateTime: DateTime(2024, 2, 20),
//   //   transactions: [mt2],
//   // );
//   // MicroTransaction mt3 = MicroTransaction(
//   //   transactionType: TransactionType.transportation,
//   //   reason: 'Transportation',
//   //   tansctionAmount: 4000.00,
//   // );
//   // MicroTransaction mt4 = MicroTransaction(
//   //   transactionType: TransactionType.lending,
//   //   reason: 'Ali',
//   //   tansctionAmount: 100.00,
//   // );
//   // MicroTransaction mt5 = MicroTransaction(
//   //   transactionType: TransactionType.borrowing,
//   //   reason: 'Steave',
//   //   tansctionAmount: 200.00,
//   // );
//   // MicroTransaction mt6 = MicroTransaction(
//   //   transactionType: TransactionType.fee,
//   //   reason: 'Transportation',
//   //   tansctionAmount: 100.00,
//   // );
//   // MicroTransaction mt7 = MicroTransaction(
//   //   transactionType: TransactionType.bill,
//   //   reason: 'Transportation',
//   //   tansctionAmount: 1000.00,
//   // );
//   // Transaction t3 = Transaction(
//   //   dateTime: DateTime(2024, 2, 18),
//   //   transactions: [mt3, mt4, mt5, mt6, mt7],
//   // );
//   //  return TransactionData(transactionHistory: [t1, t2, t3]);
//   return TransactionData(transactionHistory: []);
// }
