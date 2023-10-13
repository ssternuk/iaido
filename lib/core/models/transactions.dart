import 'package:enum_to_string/enum_to_string.dart';
import 'package:iaido/core/models/transaction_type.dart';

class TransactionModel {
  final TransactionType transactionType;
  final double amount;
  final DateTime createdDate;
  final String name;
  final String userId;
  TransactionModel(
    this.transactionType,
    this.amount,
    this.createdDate,
    this.name,
    this.userId,
  );

  factory TransactionModel.fromJson(Map<String, dynamic> transaction) {
    return TransactionModel(
        EnumToString.fromString(
            TransactionType.values, transaction['transactionType'].toString())!,
        transaction['amount'],
        DateTime.parse(transaction['createdDate']), 
        transaction['name'],
        transaction['userId']);
  }

  Map<String, dynamic> toJson() {
    return {
      'transactionType': transactionType.name,
      'amount': amount,
      'createdDate': createdDate.toIso8601String(),
      'name': name,
      'userId': userId
    };
  }  
}
