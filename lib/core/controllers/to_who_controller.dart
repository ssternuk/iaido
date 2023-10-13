import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iaido/core/controllers/amount_controller.dart';
import 'package:iaido/core/models/transaction_type.dart';
import 'package:iaido/core/models/transactions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class ToWhoController extends GetxController {
  final nameController = TextEditingController();

  Future<void> save(TransactionType transactionType) async {
    AmountController amountController = Get.find();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference transactions = firestore.collection('transactions');
    var sharedPreferences = await SharedPreferences.getInstance();

    final transactionModel = TransactionModel(
        transactionType,
        double.parse(amountController.amount),
        DateTime.now(),
        transactionType == TransactionType.topup
            ? 'Top Up'
            : nameController.value.text,
        sharedPreferences.getString("deviceId") ?? "");

    transactions.doc(Uuid().v4()).set(transactionModel.toJson());
  }
}
