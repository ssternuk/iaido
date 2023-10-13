import 'package:flutter/material.dart';
import 'package:iaido/core/models/transaction_type.dart';
import 'package:iaido/core/models/transactions.dart';
import 'package:iaido/ui/constants/themes.dart';

class Transaction extends StatelessWidget {
  const Transaction(this.transactionModel, {super.key});

  final TransactionModel transactionModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(5),
        color: Colors.white,
        child: Row(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: clrPrimary,
            ),
            height: 20,
            width: 20,
            child: Icon(
              transactionModel.transactionType == TransactionType.payment
                  ? Icons.shopping_bag
                  : Icons.add_circle,
              color: Colors.white,
              size: 15,
            ),
          ),
          Text(
            transactionModel.name,
            style: const TextStyle(color: clrBlack),
          ),
          Expanded(
            child: Align(
                alignment: Alignment.centerRight,
                
                child:
                
                 transactionModel.transactionType == TransactionType.payment
                    ? Text(transactionModel.amount.toStringAsFixed(2),
                        style: const TextStyle(color: clrBlack))
                    : Text('+${transactionModel.amount.toStringAsFixed(2)}',
                        style: const TextStyle(color: clrPrimary))),
          )
        ]),
      ),
    );
  }
}
