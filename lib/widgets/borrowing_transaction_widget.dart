import 'package:flutter/material.dart';

import '../constants/models/transaction.dart';
import '../constants/theme.dart';
import 'triple_rail.dart';

class BorrowingTransactionWidget extends StatelessWidget {
  const BorrowingTransactionWidget({
    required this.transaction,
    required this.distance,
    super.key,
  });

  final MicroTransaction transaction;
  final double distance;

  @override
  Widget build(BuildContext context) {
    return TripleRail(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(radius: 27, child: Text('Us')),
          SizedBox(width: distance * 2),
          const Center(child: Icon(Icons.arrow_back)),
          SizedBox(width: distance * 2),
          CircleAvatar(
            radius: 27,
            child: Text(
              transaction.otherPerson.substring(0, 2).toUpperCase(),
            ),
          ),
        ],
      ),
      trailing: Text(
        'Tk ${transaction.amount}',
        style: TextStyle(color: CTheme.expense),
      ),
    );
  }
}
