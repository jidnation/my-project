import 'package:flutter/material.dart';
import 'package:my_project/Models/configurations.dart';
import 'package:my_project/Routes/contacts.dart';
import 'package:my_project/Widgets/form_gen.dart';

class SelfWidget extends StatefulWidget {
  final GlobalKey<FormState> keyValue;
  const SelfWidget({Key? key, required this.keyValue}) : super(key: key);

  @override
  State<SelfWidget> createState() => _SelfWidgetState();
}

class _SelfWidgetState extends State<SelfWidget> {
  List selfStorage = [];
  late String _days = '';
  List symptoms = [];
  String? otherSymptoms;
  String? haveIdea;
  String? healthIssue;
  String? commet;

  TextEditingController commentController = TextEditingController();
  TextEditingController specifyIllnessController = TextEditingController();
  TextEditingController otherDiseaseController = TextEditingController();
  TextEditingController daysController = TextEditingController();

  @override
  void dispose() {
    commentController;
    specifyIllnessController;
    otherDiseaseController;
    daysController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 20,
          ),
          const SectionHeading(
            title: 'SYMPTOMS :',
          ),
          const SizedBox(
            height: 10,
          ),
          SymptomsWidget(otherSymptoms: otherSymptoms, symptoms: symptoms),
          const SizedBox(
            height: 20,
          ),
          const SectionHeading(
              title: 'Since when have you be having this feelings?.'),
          RegForm(
            controller: daysController,
            keyboardName: TextInputType.text,
            labelValue: 'Days',
          ),
          const SizedBox(height: 20),
          const SectionHeading(
              title: 'Do you somehow knows the name of the disease?.'),
          RegForm(
            controller: otherDiseaseController,
            keyboardName: TextInputType.text,
            labelValue: 'If Yes, Specify.',
          ),
        ]),
      ),
      const Spacer(),
      Divider(
        height: 10,
        thickness: 2,
        color: Colors.grey.shade400,
      ),
      const Spacer(),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: Colors.white,
        child: Text(
          'Do you have any health challenges before, such as diabetes, asthma, and so on.\n If NO ENTER NIL.',
          style: noticeTextStyle(),
        ),
      ),
      const Spacer(),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SectionHeading(title: 'If Yes, Specify'),
          RegForm(
            controller: specifyIllnessController,
            keyboardName: TextInputType.text,
            labelValue: 'Specify illness',
          ),
          const SizedBox(height: 40),
          const SectionHeading(title: 'Do you have anything to say?'),
          RegForm(
            controller: commentController,
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
          if (widget.keyValue.currentState!.validate()) {
            Navigator.pushNamed(context, successPage);
          }
          print(
            'Done $_days',
          );
          print("fail!");
        },
      ),
      const Spacer(
        flex: 2,
      ),
    ]);
  }
}

class OthersWidget extends StatefulWidget {
  final GlobalKey<FormState> keyValue;

  OthersWidget({
    Key? key,
    required this.keyValue,
  }) : super(key: key);

  @override
  _OthersWidgetState createState() => _OthersWidgetState();
}

class _OthersWidgetState extends State<OthersWidget>
    with SingleTickerProviderStateMixin {
  List symptoms = [];
  String? otherSymptoms;
  String? fullName;
  String? pNumber;
  String? age;
  String? relation;
  String? pAddress;

  TextEditingController pCommetController = TextEditingController();
  TextEditingController pSpecifyIllnessController = TextEditingController();
  TextEditingController rRelationController = TextEditingController();
  TextEditingController pAgeController = TextEditingController();
  TextEditingController pNumberController = TextEditingController();
  TextEditingController pAddressController = TextEditingController();
  TextEditingController pFullNameController = TextEditingController();

  @override
  void dispose() {
    pCommetController;
    pSpecifyIllnessController;
    rRelationController;
    pAgeController;
    pNumberController;
    pAddressController;
    pFullNameController;
    super.dispose;
  }

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
            RegForm(
                controller: pFullNameController,
                labelValue: 'FullName',
                keyboardName: TextInputType.text),
            RegForm(
                controller: pAddressController,
                labelValue: 'Address',
                keyboardName: TextInputType.text),
            SexRow(sex: _sex),
            Row(children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.15,
                child: RegForm(
                    controller: pNumberController,
                    labelValue: 'Phone Number',
                    keyboardName: TextInputType.number),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.9,
                child: RegForm(
                    controller: pAgeController,
                    labelValue: ' Age',
                    keyboardName: TextInputType.number),
              )
            ]),
            const SizedBox(
              height: 10,
            ),
            const SectionHeading(title: 'Who are you to the person?'),
            RegForm(
              controller: rRelationController,
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
            SymptomsWidget(symptoms: symptoms, otherSymptoms: otherSymptoms),
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
            'If possible, can you ask the person you repoting for maybe he/she had any health challenges before, such as diabetes, asthma, and so on.',
            style: noticeTextStyle(),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SectionHeading(title: 'If Yes, Specify'),
            RegForm(
              controller: pSpecifyIllnessController,
              keyboardName: TextInputType.text,
              labelValue: 'Specify illness',
            ),
            const SizedBox(height: 10),
            const SectionHeading(title: 'Do you have anything to say?'),
            RegForm(
              controller: pCommetController,
              labelValue: 'Commet',
              keyboardName: TextInputType.text,
              lineNumber: 4,
            )
          ]),
        ),
        GestureDetector(
          child: const Button(length: 150, text: 'SUBMIT'),
          onTap: () {
            if (widget.keyValue.currentState!.validate()) {
              print('Done2');
              Navigator.pushNamed(context, successPage);
            }
            print('fail2');
          },
        ),
      ]),
    );
  }
}
