// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CurrencyAmount extends StatelessWidget {
  const CurrencyAmount(this.amount, {super.key});
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              '£',
            ),
            Text(amount, style: TextStyle(fontSize: 50))
          ],
        ),
      ),
    );
  }
}
