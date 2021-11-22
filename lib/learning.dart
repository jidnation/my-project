import 'package:flutter/material.dart';

class Learing extends StatefulWidget {
  final String name;
  const Learing({Key? key, required this.name}) : super(key: key);

  @override
  State<Learing> createState() => _LearingState();
}

class _LearingState extends State<Learing> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.name);
  }
}
