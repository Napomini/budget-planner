import 'package:budgetplanner/constants/models/data.dart';
import 'package:budgetplanner/constants/models/transaction.dart';
import 'package:flutter/material.dart';

String capitalize(String val) {
  return "${val[0].toUpperCase()}${val.substring(1).toLowerCase()}";
}

// Data calculateAmounts(Data oldD) {
//   double totalAmount = 0;
//   double dailyAmount = 0;
//   for (int i = 0; i < oldD.transactions.length; i++) {
//     dailyAmount = 0;
//     DailyTransaction dt = oldD.transactions[i];
//     for (int j = 0; j < dt.transactions.length; j++) {
//       MicroTransaction mt = dt.transactions[j];
//     }
//   }
//   return oldD;
// }

Data adjustAmount(
  Data oldD,
  double amount,
  String tType,
  String tSubType,
  int dailyTIndex,
) {
  int constant = getConstant(tType, tSubType);
  double na = amount * constant.toDouble();
  debugPrint('## na : $na');

  debugPrint('## old_dm ${oldD.transactions[dailyTIndex].totalAmount}');
  double dm = na + oldD.transactions[dailyTIndex].totalAmount;
  debugPrint('## new_dm $dm');
  oldD.transactions[dailyTIndex].totalAmount = dm;

  /// update total Amount.
  int oldTotalAmount = oldD.totalAmount;
  int addedTotalAmount = amount.toInt() * constant;
  oldD.totalAmount = oldTotalAmount + addedTotalAmount;
  debugPrint(
    '## total_amount : old $oldTotalAmount, added $addedTotalAmount, result ${oldD.totalAmount}',
  );

  return oldD;
}

int getConstant(String tType, String tSubType) {
  if (tType == 'Expense') {
    return -1;
  } else if (tSubType == 'Lend') {
    return -1;
  } else if (tSubType == 'Repayment') {
    return -1;
  } else if (tSubType == 'Debt Collection') {
    return -1;
  }
  return 1;
}
