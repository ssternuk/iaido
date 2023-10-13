import 'package:get/get.dart';

class AmountController extends GetxController {
  String amount = '0';

  void onKeyPressed(String buttonValue) {
    if (buttonValue == '<') {
      if (amount.isNotEmpty) {
        amount = amount.substring(0, amount.length - 1);
      }
    } else if (amount == '0') {
      amount = buttonValue;
    } else {
      amount += buttonValue;
    }
    update();
  }
}
