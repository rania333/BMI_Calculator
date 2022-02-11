// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  CustomButton({required this.click, required this.icon});
  final Function click;
  final Widget icon;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: widget.icon,
      onPressed: () => widget.click,
      elevation: 10,
      constraints: const BoxConstraints.tightFor(width: 40, height: 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      fillColor: const Color.fromARGB(136, 248, 206, 255),
    );
  }
}
