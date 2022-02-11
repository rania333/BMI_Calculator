// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final Color color;
  final Widget? cardChild;
  // ignore: invalid_required_positional_param, use_key_in_widget_constructors
  CustomCard({required this.color, this.cardChild});

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: widget.color),
      child: GestureDetector(
        child: widget.cardChild,
      ),
    );
  }
}
