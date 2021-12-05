import 'package:flutter/material.dart';

TextStyle noticeTextStyle() {
  return TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      color: Colors.red.shade600,
      fontSize: 12.5,
      letterSpacing: 0.5);
}

class SymptomsCheckBox extends StatefulWidget {
  bool? valueName;
  final String text;
  SymptomsCheckBox({Key? key, required this.valueName, required this.text})
      : super(key: key);

  @override
  State<SymptomsCheckBox> createState() => _SymptomsCheckBoxState();

  static List<String?> symptoms = [];
}

class _SymptomsCheckBoxState extends State<SymptomsCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 22,
          height: 32,
          child: Checkbox(
              activeColor: Colors.green,
              value: widget.valueName,
              onChanged: (bool? value) {
                setState(() {
                  widget.valueName = value;
                  (value!)
                      ? SymptomsCheckBox.symptoms.add(widget.text)
                      : SymptomsCheckBox.symptoms.remove(widget.text);
                });
              }),
        ),
        Text(
          widget.text,
          style: TextStyle(
              color: (widget.valueName!)
                  ? Colors.grey.shade900
                  : Colors.grey.shade500,
              fontSize: 18,
              fontWeight:
                  (widget.valueName!) ? FontWeight.bold : FontWeight.w500,
              fontFamily: 'Poppins',
              letterSpacing: 1),
        )
      ],
    );
  }
}
