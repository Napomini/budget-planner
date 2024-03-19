import 'package:budgetplanner/constants/models/transaction.dart';

class TransactionData {
  List<DailyTransaction> transactionHistory;
  TransactionData({this.transactionHistory = const <DailyTransaction>[]});
}

// use case gula ki ki.
// 1. monthly income add korba
// 2. add expense (book, pen)
// 

// automatic transaction.
// bill to be paid.
// debt to be paid.
