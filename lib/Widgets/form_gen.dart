import 'package:flutter/material.dart';
import 'package:my_project/Models/validator.dart';

class SectionHeading extends StatelessWidget {
  final String title;

  const SectionHeading({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: Color(0xff10002b),
          fontFamily: 'Poppins',
          letterSpacing: 0.5,
          shadows: [
            Shadow(color: Color(0xff240046), offset: Offset(0.5, 0.5))
          ]),
    );
  }
}

mixin Settings {
  static dynamic textField() {}
}

class RegForm extends StatelessWidget {
  final String labelValue;
  final TextInputType keyboardName;
  final String? value;

  const RegForm(
      {Key? key,
      required this.labelValue,
      required this.keyboardName,
      this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      // padding: const EdgeInsets.only(left: 8, top: 0, bottom: 2),
      child: TextFormField(
        maxLength: (keyboardName == TextInputType.number) ? 11 : null,
        style: const TextStyle(color: Color(0xff10002b)),
        keyboardType: keyboardName,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText:
            (keyboardName == TextInputType.visiblePassword) ? true : false,
        scrollPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
        cursorHeight: 18,
        cursorColor: const Color(0xff10002b),
        decoration: InputDecoration(
            labelText: labelValue,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
              color: Color(0xff10002b),
              letterSpacing: 1,
              fontSize: 12,
            ),
            floatingLabelStyle: const TextStyle(
              fontFamily: 'Lobster',
              letterSpacing: 1.3,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black,
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            contentPadding:
                const EdgeInsets.only(top: 10, left: 10, bottom: 10),
            isDense: true,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.grey.shade500,
            ))),
        validator: (String? value) {
          // return ValidateInput.dataValue(value, keyboardName);
          return const ValidateInput().inputChecker(value, keyboardName);
        },
      ),
    );
  }

}

class RadioButton extends StatefulWidget {
  final String? value;
  const RadioButton({Key? key, this.value}) : super(key: key);

  static String? sex;
  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  String? sex = RadioButton.sex;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Radio(
        value: 'Male',
        groupValue: sex,
        onChanged: (String? val) {
          setState(() {
            sex = val;
          });
        },
        activeColor: const Color(0xff3c096c),
      ),
      Text(
        'Male',
        style: TextStyle(
          color: Colors.grey.shade700,
        ),
      ),
      const SizedBox(
        width: 15,
      ),
      Radio(
        value: 'Female',
        groupValue: sex,
        onChanged: (String? val) {
          setState(() {
            sex = val;
          });
        },
        activeColor: const Color(0xff3c096c),
      ),
      Text('Female',
          style: TextStyle(
            color: Colors.grey.shade700,
          )),
    ]);
  }
}
