import 'package:flutter/material.dart';
import 'package:my_project/Models/configurations.dart';
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

// mixin Settings {
//   static dynamic textField() {}
// }

class RegForm extends StatelessWidget {
  final String labelValue;
  final TextInputType keyboardName;
  final String? value;
  final int? lineNumber;
  final TextEditingController controller;

  const RegForm(
      {Key? key,
      required this.labelValue,
      required this.keyboardName,
      this.value,
      this.lineNumber,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: TextFormField(
        maxLines: (lineNumber != null) ? lineNumber : null,
        style: const TextStyle(color: Color(0xff10002b)),
        keyboardType: keyboardName,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText:
            (keyboardName == TextInputType.visiblePassword) ? true : false,
        scrollPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
        cursorHeight: 18,
        controller: controller,
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
          return const ValidateInput().inputChecker(value, keyboardName);
        },
      ),
    );
  }
}

class RadioButton extends StatefulWidget {
  final String? value;
  String? storage;
  RadioButton({Key? key, this.value, this.storage}) : super(key: key);

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
            (val) != null ? widget.storage = sex : widget.storage = null;
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

class Button extends StatelessWidget {
  final String text;
  final double length;
  final Color? color;
  const Button({
    Key? key,
    required this.text,
    required this.length,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 50,
        width: length,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: (color != null) ? color! : const Color(0xff3c096c)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Caveat',
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              shadows: [
                Shadow(
                  color: Colors.grey.shade500,
                  offset: const Offset(1, 1),
                )
              ],
            ),
          ),
        ));
  }
}

class SymptomsWidget extends StatefulWidget {
  List symptoms;
  String? otherSymptoms;

  SymptomsWidget({
    Key? key,
    required this.symptoms,
    this.otherSymptoms,
  }) : super(key: key);

  @override
  State<SymptomsWidget> createState() => _SymptomsWidgetState();
}

class _SymptomsWidgetState extends State<SymptomsWidget> {
  bool? feverVal = false;
  bool soreVal = false;
  bool coughVal = false;
  bool noseVal = false;
  bool breathVal = false;
  bool eyeVal = false;
  bool spotVal = false;

  String feverValStorage = '';
  String soreValStorage = '';
  String coughValStorage = '';
  String noseValStorage = '';
  String breathValStorage = '';
  String eyeValStorage = '';
  String spotValStorage = '';

  TextEditingController oTherSymptomsController = TextEditingController();

  @override
  void dispose() {
    oTherSymptomsController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      widget.symptoms.add(feverValStorage);
      widget.symptoms.add(soreValStorage);
      widget.symptoms.add(coughValStorage);
      widget.symptoms.add(noseValStorage);
      widget.symptoms.add(breathValStorage);
      widget.symptoms.add(eyeValStorage);
      widget.symptoms.add(spotValStorage);
    });

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SymptomsCheckBox(
        valueName: feverVal,
        storage: feverValStorage,
        text: 'Fever (ibà)',
      ),
      SymptomsCheckBox(
        valueName: soreVal,
        storage: soreValStorage,
        text: 'Sore Throat (Ọgbẹ ọfun)',
      ),
      SymptomsCheckBox(
        storage: coughValStorage,
        valueName: coughVal,
        text: 'Cough (Ikọ-aláìdúró)',
      ),
      const SizedBox(
        height: 2,
      ),
      SymptomsCheckBox(
        valueName: noseVal,
        text: 'Nose-Bleeding (Imu-Ẹjẹ)',
      ),
      SymptomsCheckBox(
        storage: breathValStorage,
        valueName: breathVal,
        text: 'Short Breath (Ẹmi Kukuru)',
      ),
      SymptomsCheckBox(
        storage: eyeValStorage,
        valueName: eyeVal,
        text: 'Red Eye (Oju pupa)',
      ),
      const SizedBox(width: 10),
      SymptomsCheckBox(
        valueName: spotVal,
        storage: spotValStorage,
        text: 'Body spot (Aami ara)',
      ),
      const SizedBox(
        height: 2,
      ),
      const SizedBox(
        height: 10,
      ),
      const SectionHeading(
        title: 'Others Specify. (Awọn miran Pato)',
      ),
      RegForm(
        controller: oTherSymptomsController,
        labelValue: 'Other Sympthoms (Awọn miran)',
        keyboardName: TextInputType.text,
        lineNumber: 2,
      ),
      const SizedBox(height: 20),
    ]);
  }
}

class SexRow extends StatelessWidget {
  SexRow({Key? key, required this.sex, this.sexValue}) : super(key: key);

  final String? sex;
  String? sexValue;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.only(left: 7.0),
        child: Text(
          'Sex : ',
          style: TextStyle(
              color: Colors.grey.shade800,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w800,
              fontSize: 17),
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      RadioButton(
        storage: sexValue,
        value: sex,
      ),
    ]);
  }
}
