import 'package:flutter/material.dart';
import 'package:iaido/ui/constants/themes.dart';

class VwAppBar extends StatelessWidget {
  VwAppBar(this.child, {super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: AppBar(
              automaticallyImplyLeading: false,
              title: const SizedBox(
                height: 30,
                child: Center(
                    child: Text(
                  'MoneyApp',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                )),
              ),
              backgroundColor: clrPrimary,
            )),
        body: SafeArea(child: child));
  }
}
