import 'package:flutter/material.dart';

import '../constants/helper.dart';
import '../constants/models/transction.dart';
import '../constants/theme.dart';
import 'triple_rail.dart';

class ExpenseTransactionWidget extends StatelessWidget {
  const ExpenseTransactionWidget({
    required this.transaction,
    required this.distance,
    super.key,
  });

  final MicroTransction transaction;
  final double distance;

  @override
  Widget build(BuildContext context) {
    return TripleRail(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // CircleAvatar(
          //   radius: 27,
          //   child: Image.asset(
          //     'assets/components/saving_icon.png',
          //     height: 25,
          //   ),
          // ),
          _BuildIcon(transctionType: transaction.transctionType),
          SizedBox(width: distance),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                capitalize(transaction.transctionType.name),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          )
        ],
      ),
      trailing: Text(
        'Tk ${transaction.tansctionAmount}',
        style: TextStyle(color: CTheme.expense),
      ),
    );
  }
}

class _BuildIcon extends StatelessWidget {
  final TransctionType transctionType;
  const _BuildIcon({required this.transctionType});

  @override
  Widget build(BuildContext context) {
    if (transctionType == TransctionType.transportation) {
      return CircleAvatar(
        radius: 27,
        child: Image.asset(
          'assets/components/icon_transportation.png',
          height: 25,
        ),
      );
    }
    if (transctionType == TransctionType.fee) {
      return CircleAvatar(
        radius: 27,
        child: Image.asset(
          'assets/components/icon_fee.png',
          height: 25,
        ),
      );
    }
    if (transctionType == TransctionType.bill) {
      return CircleAvatar(
        radius: 27,
        child: Image.asset(
          'assets/components/icon_bill.png',
          height: 25,
        ),
      );
    }
    return CircleAvatar(
      radius: 27,
      child: Text(transctionType.name.substring(0, 1)),
    );
  }
}
