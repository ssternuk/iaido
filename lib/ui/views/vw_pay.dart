// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iaido/core/controllers/amount_controller.dart';
import 'package:iaido/ui/components/input_currency_amount.dart';
import 'package:iaido/ui/components/nav_button.dart';
import 'package:iaido/ui/views/vw_app_bar.dart';
import 'package:iaido/ui/views/vw_num_pad.dart';

class VwPay extends StatelessWidget {
  const VwPay({super.key});

  @override
  Widget build(BuildContext context) {
    var amountController = Get.put(AmountController());
    amountController.amount = "0";
    return VwAppBar(Column(
      children: [
        Text('How Much?', style: TextStyle(fontSize: 30)),
        InputCurrencyAmount(),
        VwNumPad(),
        NavButton('Next', () => {Get.toNamed('/vw_to_who')})
      ],
    ));
  }
}
