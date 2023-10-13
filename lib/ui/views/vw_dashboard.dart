import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iaido/core/controllers/transaction_controller.dart';
import 'package:iaido/ui/components/currency_amount.dart';
import 'package:iaido/ui/views/vw_app_bar.dart';
import 'package:iaido/ui/views/vw_payment_buttons.dart';
import 'package:iaido/ui/views/vw_transaction.dart';

class VwDashboard extends StatefulWidget {
  const VwDashboard({super.key});

  @override
  State<VwDashboard> createState() => _VwDashboardState();
}

class _VwDashboardState extends State<VwDashboard> {
  TransactionController transactionController =
      Get.put(TransactionController());

  @override
  void initState() {
    super.initState();
    transactionController.getTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return VwAppBar(
      Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 230,
                child: GetBuilder<TransactionController>(
                    builder: (tController) => CurrencyAmount(
                        transactionController.transactionTotal.toStringAsFixed(2))),
              ),
              const VwTransactions()
            ],
          ),
          const VwPaymentButtons(),
        ],
      ),
    );
  }
}
