<<<<<<< HEAD
import 'package:budgetplanner/constants/models/transaction.dart';

class TransactionData {
  List<Transaction> transactionHistory;
// Here, transactionHistory is an instance variable of type List<Transaction>.
//It's used to store a list of Transaction objects.
  TransactionData({this.transactionHistory = const <Transaction>[]});
}
=======
import 'package:budgetplanner/constants/models/transction.dart';

class TransactionData {
  // current amount.
  // income.
  // debt.
  //
  List<Transaction> transactionHistory;
  TransactionData({this.transactionHistory = const <Transaction>[]});
}

// use case gula ki ki.
// 1. monthly income add korba
// 2. add expense (book, pen)
// 

// automatic transaction.
// bill to be paid.
// debt to be paid.
>>>>>>> d73e265d611e097fde1d7d630c4005eb357912c3
