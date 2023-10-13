import 'package:flutter/material.dart';
import 'package:iaido/ui/components/payment_button.dart';

class VwPaymentButtons extends StatelessWidget {
  const VwPaymentButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 190.0,
        left: 20.0,
        right: 20.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          height: 90,
          child:
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            DashboardIcon('lib/ui/assets/pay.png', 'Pay', 'vw_pay'),
            DashboardIcon('lib/ui/assets/topup.png', 'Top up', 'vw_topup')
          ]),
        ));
  }
}
