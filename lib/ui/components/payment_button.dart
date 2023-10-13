import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iaido/ui/constants/themes.dart';

class DashboardIcon extends StatelessWidget {
  const DashboardIcon(this.fileName, this.title, this.nav, {super.key});

  final String fileName;
  final String title;
  final String nav;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(nav);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(fileName),
            Text(
              title,
              style: const TextStyle(color: clrBlack),
            )
          ],
        ),
      ),
    );
  }
}
