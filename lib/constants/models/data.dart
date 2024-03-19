import 'package:budgetplanner/constants/models/transaction.dart';
import 'package:flutter/material.dart';

class Data {
  final String userName;
  final String userEmail;
  final String userPhone;
  int totalAmount;
  // List<DailyTransaction> transactions;
  List<DailyTransaction> transactions = [];

  Data({
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    this.totalAmount = 0,
    this.transactions = const <DailyTransaction>[],
  });

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userEmail': userEmail,
      'userPhone': userPhone,
      'totalAmount': totalAmount,
      'transactions': transactions.map((t) => t.toJson()).toList(),
    };
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    // debugPrint('## transactions ${json['transactions'].runtimeType}');
    return Data(
      userName: json['userName'],
      userEmail: json['userEmail'],
      userPhone: json['userPhone'],
      totalAmount: json['totalAmount'] ?? 0,
      // transactions: [],
      transactions: json['transactions'] != null
          ? (json['transactions'] as List)
              .map((item) => DailyTransaction.fromJson(item))
              .toList()
          : const <DailyTransaction>[],
    );
  }

  @override
  String toString() {
    return 'Data(userName: $userName, userEmail: $userEmail, userPhone: $userPhone, totalAmount: $totalAmount)';
  }

  // List<Transaction> transactionFromJson(dynamic jsonData) {
  //   if(jsonData.isEmpty)
  //   return [];
  // }
}


 // factory Data.fromJson(Map<String, dynamic> data) {
  //   return Data(
  //     userName: data['userName'],
  //     userEmail: data['userEmail'],
  //     userPhone: data['userPhone'],
  //     totalAmount: data['totalAmount'] ?? 0,
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'userName': userName,
  //     'userEmail': userEmail,
  //     'userPhone': userPhone,
  //     'totalAmount': totalAmount,
  //   };
  // }