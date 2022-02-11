// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  CustomButton({required this.onPressed, required this.icon});
  final VoidCallback onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: icon,
      onPressed: onPressed,
      elevation: 10,
      constraints: const BoxConstraints.tightFor(width: 40, height: 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      fillColor: const Color.fromARGB(136, 248, 206, 255),
    );
  }
}
