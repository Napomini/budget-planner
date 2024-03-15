enum TransctionType {
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
  double totalTransctionAmount;
  List<MicroTransction> transctions;

  Transaction({
    required this.dateTime,
    this.totalTransctionAmount = 0.00,
    this.transctions = const <MicroTransction>[],
  });
}

class MicroTransction {
  TransctionType transctionType;
  String reason;
  double tansctionAmount;

  MicroTransction({
    required this.transctionType,
    required this.reason,
    required this.tansctionAmount,
  });
}
