import 'package:flutter/material.dart';
import 'package:iaido/ui/constants/themes.dart';

class NavButton extends StatelessWidget {
  NavButton(this.text,this.onPressed, {super.key});

  late String text;
  late Function onPressed;
  
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.resolveWith<Size>(
              (Set<MaterialState> states) => const Size(200, 30)),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) => clrSecondary,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ))),
      onPressed: () => onPressed(),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      )
       
    );
  }
}
