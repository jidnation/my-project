import 'package:flutter/material.dart';
import 'package:my_project/Models/configurations.dart';
import 'package:my_project/Models/data_controller.dart';
import 'package:my_project/Routes/contacts.dart';
import 'package:my_project/Widgets/form_gen.dart';

class SelfWidget extends StatefulWidget {
  final GlobalKey<FormState> keyValue;
  const SelfWidget({Key? key, required this.keyValue}) : super(key: key);

  @override
  State<SelfWidget> createState() => _SelfWidgetState();

  static TextEditingController commentController = TextEditingController();
  static TextEditingController healthIssuesController = TextEditingController();
  static TextEditingController nameGuessingController = TextEditingController();
  static TextEditingController illnessHistoryController =
      TextEditingController();
}

class _SelfWidgetState extends State<SelfWidget> {
  List<dynamic> valueList = [];
  @override
  void dispose() {
    // SelfWidget.commentController.dispose();
    // SelfWidget.healthIssuesController.dispose();
    // SelfWidget.nameGuessingController.dispose();
    // SymptomsWidget.otherSymptomsController.dispose();  //It is cursing problem in otherWidget in report page
    // SelfWidget.illnessHistoryController.dispose();
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
          const SymptomsWidget(),
          const SizedBox(
            height: 20,
          ),
          const SectionHeading(
              title: 'Since when have you be having this feelings?.'),
          RegForm(
            controller: SelfWidget.illnessHistoryController,
            keyboardName: TextInputType.text,
            labelValue: 'Days',
          ),
          const SizedBox(height: 20),
          const SectionHeading(
              title: 'Do you somehow knows the name of the disease?.'),
          RegForm(
            controller: SelfWidget.nameGuessingController,
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
            controller: SelfWidget.healthIssuesController,
            keyboardName: TextInputType.text,
            labelValue: 'Specify illness',
          ),
          const SizedBox(height: 40),
          const SectionHeading(title: 'Do you have anything to say?'),
          RegForm(
            controller: SelfWidget.commentController,
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
            ReportData().saveReportData();
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

  const OthersWidget({
    Key? key,
    required this.keyValue,
  }) : super(key: key);

  @override
  _OthersWidgetState createState() => _OthersWidgetState();

  static TextEditingController pCommetController = TextEditingController();
  static TextEditingController pSpecifyIllnessController =
      TextEditingController();
  static TextEditingController rRelationController = TextEditingController();
  static TextEditingController pAgeController = TextEditingController();
  static TextEditingController pNumberController = TextEditingController();
  static TextEditingController pAddressController = TextEditingController();
  static TextEditingController pFullNameController = TextEditingController();
}

class _OthersWidgetState extends State<OthersWidget>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    // OthersWidget.pCommetController.dispose();
    // OthersWidget.pSpecifyIllnessController.dispose();
    // OthersWidget.rRelationController.dispose();
    // OthersWidget.pAgeController.dispose();
    // OthersWidget.pNumberController.dispose();
    // OthersWidget.pAddressController.dispose();
    // OthersWidget.pFullNameController.dispose();
    super.dispose();
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
                controller: OthersWidget.pFullNameController,
                labelValue: 'FullName',
                keyboardName: TextInputType.text),
            RegForm(
                controller: OthersWidget.pAddressController,
                labelValue: 'Address',
                keyboardName: TextInputType.text),
            SexRow(sex: _sex),
            Row(children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.15,
                child: RegForm(
                    controller: OthersWidget.pNumberController,
                    labelValue: 'Phone Number',
                    keyboardName: TextInputType.number),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.9,
                child: RegForm(
                    controller: OthersWidget.pAgeController,
                    labelValue: ' Age',
                    keyboardName: TextInputType.number),
              )
            ]),
            const SizedBox(
              height: 10,
            ),
            const SectionHeading(title: 'Who are you to the person?'),
            RegForm(
              controller: OthersWidget.rRelationController,
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
              controller: OthersWidget.pSpecifyIllnessController,
              keyboardName: TextInputType.text,
              labelValue: 'Specify illness',
            ),
            const SizedBox(height: 10),
            const SectionHeading(title: 'Do you have anything to say?'),
            RegForm(
              controller: OthersWidget.pCommetController,
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
            ReportData().saveReportData2();
          },
        ),
      ]),
    );
  }
}
