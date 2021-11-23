import 'package:flutter/material.dart';
import 'package:my_project/Models/configurations.dart';
import 'package:my_project/Widgets/form_gen.dart';

class SelfWidget extends StatefulWidget {
  const SelfWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SelfWidget> createState() => _SelfWidgetState();
}

class _SelfWidgetState extends State<SelfWidget> {
  bool? feverVal = false;
  bool soreVal = false;
  bool coughVal = false;
  bool noseVal = false;
  bool breathVal = false;
  bool eyeVal = false;
  bool spotVal = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SectionHeading(
            title: 'SYMPTOMS :',
          ),
          const SizedBox(
            height: 2,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SymptomsCheckBox(
              valueName: feverVal,
              text: 'Fever',
            ),
            SymptomsCheckBox(
              valueName: soreVal,
              text: 'Sore Throat',
            ),
            SymptomsCheckBox(
              valueName: coughVal,
              text: 'Cough',
            ),
          ]),
          const SizedBox(
            height: 2,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SymptomsCheckBox(
              valueName: noseVal,
              text: 'Nose-Bleeding',
            ),
            SymptomsCheckBox(
              valueName: breathVal,
              text: 'Short Breath',
            ),
          ]),
          const SizedBox(
            height: 2,
          ),
          Row(children: [
            SymptomsCheckBox(
              valueName: eyeVal,
              text: 'Red Eye',
            ),
            const SizedBox(width: 10),
            SymptomsCheckBox(
              valueName: spotVal,
              text: 'Body spot',
            ),
          ]),
          const SizedBox(
            height: 10,
          ),
          const SectionHeading(
            title: 'Others Specify.',
          ),
          const RegForm(
              labelValue: 'Other Sympthoms', keyboardName: TextInputType.text),

              const SizedBox(height: 20),
               const SectionHeading(title: 'Since when have you be having this feelings?.'),
              const RegForm(
                keyboardName: TextInputType.text,
                labelValue: 'Days',
              ),

              const SizedBox(height: 20),
               const SectionHeading(title: 'Do you somehow knows the name of the disease?.'),
              const RegForm(
                keyboardName: TextInputType.text,
                labelValue: 'If Yes, Specify.',
              ),
        ]),
      ),
      Divider(
        height: 10,
        thickness: 2,
        color: Colors.grey.shade400,
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: Colors.white,
        child: Text(
          'Do you have any health challenges before, such as diabetes, asthma, and so on.',
          style: noticeTextStyle(),
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SectionHeading(title: 'If Yes, Specify'),
              RegForm(
                keyboardName: TextInputType.text,
                labelValue: 'Specify illness',
              ),
              SizedBox(height: 20),
              SectionHeading(title: 'Do you have anything to say?'),
              RegForm(labelValue: 'Commet', keyboardName: TextInputType.text, lineNumber: 4,)
            ]),
      )
    ]);
  }
}
