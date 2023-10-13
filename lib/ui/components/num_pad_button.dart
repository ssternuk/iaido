import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iaido/core/controllers/amount_controller.dart';

class NumPadButton extends StatelessWidget {
  const NumPadButton({
    Key? key,
    required this.buttonValue,
  }) : super(key: key);

  final String buttonValue;

  @override
  Widget build(BuildContext context) {
    final AmountController controller = Get.find();

    return SizedBox(
        child: TextButton(
            onPressed: () => {controller.onKeyPressed(buttonValue)},
            child: Text(
              style: const TextStyle(color: Colors.white),
              buttonValue,
              textAlign: TextAlign.center,
            )));
  }
}
