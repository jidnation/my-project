import 'package:flutter/material.dart';
import 'package:my_project/Models/configurations.dart';
import 'package:my_project/Models/database_controller.dart';
import 'package:my_project/Models/json_formatter.dart';
import 'package:my_project/Routes/contacts.dart';
import 'package:my_project/Routes/report_page.dart';
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
  late Database _database;

  void dbIniti() async {
    _database = Database();
    await _database.selfReportTableGen();
  }

  @override
  void initState() {
    super.initState();
    dbIniti();
  }

  @override
  void dispose() {
    dbIniti();
    // SelfWidget.commentController.dispose();
    // SelfWidget.healthIssuesController.dispose();
    // SelfWidget.nameGuessingController.dispose();
    // SymptomsWidget.otherSymptomsController.dispose();  //It is cursing problem in otherWidget in report page
    // SelfWidget.illnessHistoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double hei = MediaQuery.of(context).size.height;

    var snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: hei * 0.87),
      backgroundColor: Colors.red.shade400,
      duration: const Duration(seconds: 2),
      padding: const EdgeInsets.all(20),
      content: const Text('Symptoms is required!',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
              letterSpacing: 1)),
    );

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
          onTap: () async {
            List<String?> _symptoms = SymptomsCheckBox.symptoms;
            if (SymptomsCheckBox.symptoms.isNotEmpty) {
              if (widget.keyValue.currentState!.validate()) {
                var reportNum = await _database.selfReport();
                await _database.insertSelfReport(SelfReport(
                  id: reportNum.length + 1,
                  symptoms: _symptoms.join(','),
                  sex: RadioButton.sexValue,
                  surname: ReportingPage.surnameController.text,
                  others: ReportingPage.othersController.text,
                  address: ReportingPage.addressController.text,
                  city: ReportingPage.cityController.text,
                  state: ReportingPage.stateController.text,
                  age: int.parse(ReportingPage.ageController.text) ,
                  otherSymptoms: SymptomsWidget.otherSymptomsController.text,
                  number: int.parse(ReportingPage.numberController.text),
                  commet: SelfWidget.commentController.text,
                  healthIssue: SelfWidget.healthIssuesController.text,
                  haveIdea: SelfWidget.nameGuessingController.text,
                  illnessHistory: SelfWidget.illnessHistoryController.text,
                ));
                Navigator.pushReplacementNamed(context, successPage);
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              // return Container();
            }
          }),
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
  late Database _database;

  void dbIniti() async {
    _database = Database();
    await _database.otherReportTableGen();
  }

  @override
  void initState() {
    super.initState();
    dbIniti();
  }

  @override
  void dispose() {
    dbIniti();
    // OthersWidget.pCommetController.dispose();
    // OthersWidget.pSpecifyIllnessController.dispose();
    // OthersWidget.rRelationController.dispose();
    // OthersWidget.pAgeController.dispose();
    // OthersWidget.pNumberController.dispose();
    // OthersWidget.pAddressController.dispose();
    // OthersWidget.pFullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double hei = MediaQuery.of(context).size.height;

    var snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: hei * 0.87),
      backgroundColor: Colors.red.shade400,
      duration: const Duration(seconds: 2),
      padding: const EdgeInsets.all(20),
      content: const Text('Symptoms is required!',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
              letterSpacing: 1)),
    );

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
            // SexRow(sex: _sex),
            // RegForm(
            //     controller: OthersWidget.pNumberController,
            //     labelValue: 'Phone Number',
            //     keyboardName: TextInputType.number),
            // Row(children: [
            //   SizedBox(
            //     child: ,
            //     width: MediaQuery.of(context).size.width / 2.15,
            //   ),
            //   const SizedBox(
            //     width: 15,
            //   ),
            //   SizedBox(
            //     width: MediaQuery.of(context).size.width / 2.9,
            //     child: RegForm(
            //         controller: OthersWidget.pAgeController,
            //         labelValue: ' Age',
            //         keyboardName: TextInputType.text),
            //   )
            // ]),
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
            onTap: () async {
              List<String?> _symptoms = SymptomsCheckBox.symptoms;
              if (SymptomsCheckBox.symptoms.isNotEmpty) {
                if (widget.keyValue.currentState!.validate()) {
                  var reportNum = await _database.otherReportList();
                  await _database.insertOtherReport(OtherReport(
                    symptoms: _symptoms.join(','),
                    id: reportNum.length + 1,
                    surname: ReportingPage.surnameController.text,
                    others: ReportingPage.othersController.text,
                    address: ReportingPage.addressController.text,
                    city: ReportingPage.cityController.text,
                    sex: RadioButton.sexValue,
                    state: ReportingPage.stateController.text,
                    age: ReportingPage.ageController.text as int,
                    number: ReportingPage.numberController.text as int,
                    otherSymptoms: SymptomsWidget.otherSymptomsController.text,
                    pCommet: OthersWidget.pCommetController.text,
                    pSpecifyIllness:
                        OthersWidget.pSpecifyIllnessController.text,
                    rRelation: OthersWidget.rRelationController.text,
                    pAddress: OthersWidget.pAddressController.text,
                    pFullName: OthersWidget.pFullNameController.text,
                  ));
                  Navigator.pushReplacementNamed(context, successPage);
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                // return null;
              }
            }),
      ]),
    );
  }
}
