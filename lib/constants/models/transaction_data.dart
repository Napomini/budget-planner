import 'package:budgetplanner/constants/models/transaction.dart';

class TransactionData {
  List<Transaction> transactionHistory;
// Here, transactionHistory is an instance variable of type List<Transaction>.
//It's used to store a list of Transaction objects.
  TransactionData({this.transactionHistory = const <Transaction>[]});
}
