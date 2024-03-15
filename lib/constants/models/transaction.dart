enum TransactionType {
  saving,
  expense,
  bill,
  fee,
  transportation,
  lending,
  borrowing,
}

class Transaction {
  DateTime dateTime;
  double totalTransactionAmount;
  List<MicroTransaction> transactions;

  Transaction({
    required this.dateTime,
    this.totalTransactionAmount = 0.00,
    this.transactions = const <MicroTransaction>[],
  });
}

class MicroTransaction {
  TransactionType transactionType;
  String reason;
  double tansctionAmount;

  MicroTransaction({
    required this.transactionType,
    required this.reason,
    required this.tansctionAmount,
  });
}
