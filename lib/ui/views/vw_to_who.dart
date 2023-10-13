// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iaido/core/controllers/to_who_controller.dart';
import 'package:iaido/core/models/transaction_type.dart';
import 'package:iaido/ui/components/nav_button.dart';
import 'package:iaido/ui/views/vw_app_bar.dart';

class VwToWho extends StatelessWidget {
  VwToWho({super.key});

  @override
  Widget build(BuildContext context) {
    ToWhoController toWhoController = Get.put(ToWhoController());
    
    return VwAppBar(Column(
      children: [
        Text('To Who?', style: TextStyle(color: Colors.white, fontSize: 30)),
        Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: TextFormField(
                  controller: toWhoController.nameController,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                ),
              ),
              NavButton('Pay', () async {
                await toWhoController.save(TransactionType.payment);
                Get.toNamed('/vw_dashboard');
              })
            ],
          ),
        )
      ],
    ));
  }
}
