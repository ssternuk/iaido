import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:iaido/core/models/transaction_type.dart';
import 'package:iaido/core/models/transactions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionController extends GetxController {
  Map<DateTime, List<TransactionModel>> transactionsByDate = {};
  double transactionTotal = 150.25;

  void getTransactions() async {
    /* For getting from firestore
     FirebaseFirestore firestore = FirebaseFirestore.instance;
     CollectionReference transactions = firestore.collection('transactions');
     await transactions.get().then((value) {
     for (var doc in value.docs) {
      */
    var sharedPreferences = await SharedPreferences.getInstance();
    var deviceId = sharedPreferences.getString("deviceId");
    // transactionsByDate = {};

    for (var transactionModel in await getDummyTransactions()) {
      /* For parsing from firestore
      // var transactionData = doc.data() as Map<String, dynamic>;
      // var transactionModel = TransactionModel.fromJson(transactionData);
      */
      final createdDate = transactionModel.createdDate;

      if (transactionModel.userId == deviceId) {
        if (!transactionsByDate.containsKey(createdDate)) {
          transactionsByDate[createdDate] = [];
        }
        transactionsByDate[createdDate]!.add(transactionModel);

        if (transactionModel.transactionType == TransactionType.payment) {
          transactionTotal -= transactionModel.amount;
        } else if (transactionModel.transactionType == TransactionType.topup) {
          transactionTotal += transactionModel.amount;
        }
      }
    }
    update();
  }

  Future<List<TransactionModel>> getDummyTransactions() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    var deviceId = sharedPreferences.getString("deviceId");
    final List<TransactionModel> dummyTransactions = [];

    for (int i = 0; i < 10; i++) {
      final transactionType =
          i.isEven ? TransactionType.payment : TransactionType.topup;
      final amount = Random().nextDouble() * 1000.0;
      var createdDate =
          DateTime.now().subtract(Duration(days: Random().nextInt(30)));
      if (i == 2) {
        createdDate = DateTime.now();
      }
      if (i == 6 || i == 8) {
        createdDate = DateTime.now().subtract(Duration(days: 1));
      }
      final name = "Transaction $i";
      final userId = deviceId!;

      final transaction = TransactionModel(
        transactionType,
        amount,
        createdDate,
        name,
        userId,
      );
      dummyTransactions.add(transaction);  
    }
    dummyTransactions.sort((a, b) => b.createdDate.compareTo(a.createdDate));

    return dummyTransactions;
  }
}
