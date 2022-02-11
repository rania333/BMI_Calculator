import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class CustomChild extends StatefulWidget {
  CustomChild({required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  _CustomChildState createState() => _CustomChildState();
}

class _CustomChildState extends State<CustomChild> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          widget.icon,
          size: 60,
          color: const Color.fromARGB(109, 243, 176, 255),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(widget.label,
            style: const TextStyle(
                fontSize: 15, color: Color.fromARGB(255, 239, 197, 247)))
      ],
    );
  }
}
