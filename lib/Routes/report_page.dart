import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_project/Models/configurations.dart';
import 'package:my_project/Widgets/form_gen.dart';
import 'package:my_project/Widgets/tab_gen.dart';

class ReportingPage extends StatefulWidget {
  const ReportingPage({Key? key}) : super(key: key);

  @override
  _ReportingPageState createState() => _ReportingPageState();
}

class _ReportingPageState extends State<ReportingPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey reportKey = GlobalKey<FormState>();
  String? _sex;
  late TabController _reportTabController;

  @override
  void initState() {
    super.initState();
    _reportTabController = TabController(length: 2, vsync: this);
  }

  TextEditingController surnameController = TextEditingController();
  TextEditingController othersController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  void dispose() {
    _reportTabController.dispose();
    surnameController;
    othersController;
    addressController;
    stateController;
    cityController;
    numberController;
    ageController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // String? surnameStorage;
    // String? othersStorage;
    // String? addressStorage;
    // String? cityStorage;
    // String? stateStorage;
    // String? sexStorage;
    // String? numberStorage;
    // String? fullNameStorage;
    // String? pNumberStorage;
    // String? ageStorage;
    // String? relationStorage;
    // String? pAddressStorage;

    // List symptomsStorage = [];
    // String? otherSymptomsStorage;
    // String? haveIdeaStorage;
    // String? healthIssueStorage;
    // String? commetStorage;

    // List data = [
    //   String surname;
    //   String others;
    //   String address;
    //   String street;
    //   String city;
    //   String sex;
    //   String number;
    //   String age;
    //   List symptoms;
    //   String othersymptoms;
    //   String illnessHistory;
    //   String haveIdea;
    //   String healthIssue;
    //   String commet;

    // ];

    // List dataList = [];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff3c096c),
        leading: const Center(
          child: FaIcon(
            FontAwesomeIcons.clinicMedical,
            size: 18,
            color: Color(0xffe0aaff),
          ),
        ),
        title: const Text(
          'Incidence Reporting',
          style: TextStyle(
              fontFamily: 'Lobster',
              color: Color(0xffe0aaff),
              letterSpacing: 1,
              fontSize: 20,
              shadows: [
                Shadow(
                    color: Color(0xff5a189a),
                    offset: Offset(1.2, 1),
                    blurRadius: 1)
              ]),
        ),
      ),
      backgroundColor: const Color(0xFFDEBFF5),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              'Please Note that the information you are to provide must be as accurate as possible, in order to prevent any form of misunderstanding.',
              style: noticeTextStyle(),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border: Border.all(width: 1, color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Form(
                key: reportKey,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(children: [
                      Row(
                        children: const [
                          SectionHeading(title: 'Bio-Data'),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      RegForm(
                          controller: surnameController,
                          labelValue: ' Surname',
                          keyboardName: TextInputType.text),
                      RegForm(
                          controller: othersController,
                          labelValue: ' Others',
                          keyboardName: TextInputType.text),
                      RegForm(
                          controller: addressController,
                          labelValue: ' Address',
                          keyboardName: TextInputType.text),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.9,
                            child: RegForm(
                                controller: stateController,
                                labelValue: 'State',
                                keyboardName: TextInputType.text),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.15,
                            child: RegForm(
                                controller: cityController,
                                labelValue: ' City',
                                keyboardName: TextInputType.text),
                          )
                        ],
                      ),
                      SexRow(sex: _sex),
                      Row(children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.15,
                          child: RegForm(
                              controller: numberController,
                              labelValue: 'Phone Number',
                              keyboardName: TextInputType.number),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.9,
                          child: RegForm(
                              controller: ageController,
                              labelValue: ' Age',
                              keyboardName: TextInputType.number),
                        )
                      ]),
                    ]),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Are you the person currently having a health issue, or you are reporting on someone\'s behave',
                            style: noticeTextStyle(),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'If you are making report for yourself click SELF. \nIf you are reporting on someone\'s behave click OTHERS.',
                            style: noticeTextStyle(),
                          ),
                        ]),
                  ),
                  TabBar(
                      controller: _reportTabController,
                      labelPadding: const EdgeInsets.symmetric(vertical: 0),
                      labelColor: Colors.grey.shade800,
                      unselectedLabelColor: Colors.grey.shade400,
                      labelStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                      indicator: BoxDecoration(
                        border:
                            Border.all(width: 2, color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tabs: const [
                        Tab(text: 'SELF'),
                        Tab(text: 'OTHERS'),
                      ]),
                  Container(
                    constraints: const BoxConstraints(
                      // minHeight: 100,
                      maxHeight: 1200,
                    ),
                    child:
                        TabBarView(controller: _reportTabController, children: [
                      SelfWidget(keyValue: reportKey as GlobalKey<FormState>),
                      OthersWidget(keyValue: reportKey as GlobalKey<FormState>),
                    ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
