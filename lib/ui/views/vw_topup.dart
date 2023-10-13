// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iaido/core/controllers/amount_controller.dart';
import 'package:iaido/core/controllers/to_who_controller.dart';
import 'package:iaido/core/models/transaction_type.dart';
import 'package:iaido/ui/components/input_currency_amount.dart';
import 'package:iaido/ui/components/nav_button.dart';
import 'package:iaido/ui/views/vw_app_bar.dart';
import 'package:iaido/ui/views/vw_num_pad.dart';

class VwTopup extends StatelessWidget {
  const VwTopup({super.key});

  @override
  Widget build(BuildContext context) {
    ToWhoController toWhoController = Get.put(ToWhoController());
    Get.put(AmountController());

    return VwAppBar(Column(
      children: [
        Text('How Much?', style: TextStyle(fontSize: 30)),
        InputCurrencyAmount(),
        VwNumPad(),
        NavButton('Next', () async {
          await toWhoController.save(TransactionType.topup);
          Get.toNamed('/vw_dashboard');
        })
      ],
    ));
  }
}
