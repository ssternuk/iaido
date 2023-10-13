import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iaido/core/controllers/transaction_controller.dart';
import 'package:iaido/ui/components/transaction.dart';
import 'package:iaido/ui/constants/themes.dart';
import 'package:intl/intl.dart';

class VwTransactions extends StatelessWidget {
  const VwTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionController transactionController =
        Get.put(TransactionController());
    var transactionsByDate = transactionController.transactionsByDate;

    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top:60),
        color: clrTertiary,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Recent Activity',
                      style: const TextStyle(color: clrBlack),
                      textAlign: TextAlign.left,
                    )),
              ),
              GetBuilder<TransactionController>(
                  builder: (_) => ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            transactionController.transactionsByDate.length,
                        itemBuilder: (context, index) {
                          final date = transactionsByDate.keys.elementAt(index);
                          final transactions = transactionsByDate[date];
                          return Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  getFormattedDate(
                                    transactionsByDate.keys.elementAt(index),
                                  ),
                                  style: TextStyle(color: clrMediumGrey),
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: transactions?.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      Transaction(transactions![index])
                                    ],
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      )),
            ],
          ),
        ),
      ),
    );
  }

  bool isDateToday(DateTime date) {
    DateTime now = DateTime.now();
    return isDateEqual(date, now);
  }

  bool isDateEqual(DateTime date, DateTime compareDate) {
    return date.year == compareDate.year &&
        date.month == compareDate.month &&
        date.day == compareDate.day;
  }

  bool isDateYesterday(DateTime date) {
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(Duration(days: 1));

    return isDateEqual(date, yesterday);
  }

  String getFormattedDate(DateTime date) {
    if (isDateToday(date)) {
      return 'TODAY';
    } else if (isDateYesterday(date)) {
      return 'YESTERDAY';
    }
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
