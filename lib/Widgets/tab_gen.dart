import 'package:flutter/material.dart';
import 'package:my_project/Models/configurations.dart';
import 'package:my_project/Routes/contacts.dart';
import 'package:my_project/Widgets/form_gen.dart';

class SelfWidget extends StatefulWidget {
  const SelfWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SelfWidget> createState() => _SelfWidgetState();
}

class _SelfWidgetState extends State<SelfWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
                SizedBox(
                height: 20,
              ),
              SectionHeading(
                title: 'SYMPTOMS :',
              ),
              SizedBox(
                height: 10,
              ),
              SymptomsWidget(),
              SectionHeading(
                  title: 'Since when have you be having this feelings?.'),
              RegForm(
                keyboardName: TextInputType.text,
                labelValue: 'Days',
              ),
              SizedBox(height: 20),
              SectionHeading(
                  title: 'Do you somehow knows the name of the disease?.'),
              RegForm(
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
              RegForm(
                labelValue: 'Commet',
                keyboardName: TextInputType.text,
                lineNumber: 4,
              )
            ]),
      ),
      const Spacer(),
       GestureDetector(
                    child: const Button(length: 150, text: 'SUBMIT'),
                    onTap: () {
                      Navigator.pushNamed(context, successPage);
                    },
                  ),
                  const Spacer(flex: 2,),
    ]);
  }
}

class OthersWidget extends StatefulWidget {
  const OthersWidget({Key? key}) : super(key: key);

  @override
  _OthersWidgetState createState() => _OthersWidgetState();
}

class _OthersWidgetState extends State<OthersWidget>
    with SingleTickerProviderStateMixin {
  String? _sex;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SectionHeading(
                title:
                    'Please provide the details of the person you are reporting for'),
            const SizedBox(
              height: 10,
            ),
            const RegForm(
                labelValue: 'FullName', keyboardName: TextInputType.text),
            const RegForm(
                labelValue: 'Address', keyboardName: TextInputType.text),
            SexRow(sex: _sex),
            Row(children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.15,
                child: const RegForm(
                    labelValue: 'Phone Number',
                    keyboardName: TextInputType.number),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.9,
                child: const RegForm(
                    labelValue: ' Age', keyboardName: TextInputType.number),
              )
            ]),
            const SizedBox(
              height: 10,
            ),
            const SectionHeading(title: 'Who are you to the person?'),
            const RegForm(
              labelValue: '',
              keyboardName: TextInputType.text,
            ),
            const SizedBox(
              height: 10,
            ),
             const SizedBox(
                height: 20,
              ),
              const SectionHeading(
                title: 'SYMPTOMS :',
              ),
            const SymptomsWidget(),
            const SectionHeading(
                title: 'Since when have he/she be having this feelings?.'),
            const RegForm(
              keyboardName: TextInputType.text,
              labelValue: 'Days',
            ),
            const SizedBox(height: 10),
            const SectionHeading(
                title:
                    'Did the person/you somehow knows the name of the disease?.'),
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
        'Please ask the person you repoting for maybe he/she had any health challenges before, such as diabetes, asthma, and so on.',
        style: noticeTextStyle(),
      ),
    ),
     Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SectionHeading(title: 'If Yes, Specify'),
            RegForm(
              keyboardName: TextInputType.text,
              labelValue: 'Specify illness',
            ),
            SizedBox(height: 10),
            SectionHeading(title: 'Do you have anything to say?'),
            RegForm(
              labelValue: 'Commet',
              keyboardName: TextInputType.text,
              lineNumber: 4,
            )
          ]),
    ),
 GestureDetector(
                  child: const Button(length: 150, text: 'SUBMIT'),
                  onTap: () {
                    Navigator.pushNamed(context, successPage);
                  },
                ),
      ]),
    );
  }
}
