import 'package:flutter/material.dart';

import '../constants/models/transaction.dart';
import '../constants/theme.dart';
import 'triple_rail.dart';

class LendingTransactionWidget extends StatelessWidget {
  const LendingTransactionWidget({
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
          const Center(child: Icon(Icons.arrow_forward)),
          SizedBox(width: distance * 2),
          CircleAvatar(
            radius: 27,
            child: Text(
              transaction.reason.substring(0, 2).toUpperCase(),
            ),
          ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       capitalize(transaction.transactionType.name),
          //       style: const TextStyle(
          //         fontWeight: FontWeight.w600,
          //         fontSize: 14,
          //       ),
          //     ),
          //   ],
          // )
        ],
      ),
      trailing: Text(
        'Tk ${transaction.tansctionAmount}',
        style: TextStyle(color: CTheme.expense),
      ),
    );
  }
}
