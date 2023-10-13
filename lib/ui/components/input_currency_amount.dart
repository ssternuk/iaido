// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iaido/core/controllers/amount_controller.dart';
import 'package:iaido/ui/components/currency_amount.dart';

class InputCurrencyAmount extends StatelessWidget {
  const InputCurrencyAmount({super.key});

  @override
  Widget build(BuildContext context) {
    final AmountController controller = Get.find();
    return GetBuilder<AmountController>(
        builder: (_) => CurrencyAmount(controller.amount));
  }
}
