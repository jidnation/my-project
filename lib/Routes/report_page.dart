import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_project/Models/configurations.dart';
import 'package:my_project/Routes/contacts.dart';
import 'package:my_project/Widgets/form_gen.dart';
import 'package:my_project/Widgets/tab_gen.dart';

class ReportingPage extends StatefulWidget {
  const ReportingPage({Key? key}) : super(key: key);

  @override
  _ReportingPageState createState() => _ReportingPageState();
}

class _ReportingPageState extends State<ReportingPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey _reportKey = GlobalKey<FormState>();
  String? _sex;
  late TabController _reportTabController;

  @override
  void initState() {
    super.initState();
    _reportTabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _reportTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                key: _reportKey,
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
                      const RegForm(
                          labelValue: ' Surname',
                          keyboardName: TextInputType.text),
                      const RegForm(
                          labelValue: ' Others',
                          keyboardName: TextInputType.text),
                      const RegForm(
                          labelValue: ' Address',
                          keyboardName: TextInputType.text),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.9,
                            child: const RegForm(
                                labelValue: 'State',
                                keyboardName: TextInputType.text),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.15,
                            child: const RegForm(
                                labelValue: ' City',
                                keyboardName: TextInputType.text),
                          )
                        ],
                      ),
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
                      minHeight: 100,
                      maxHeight: 1140,
                    ),
                    child:
                        TabBarView(controller: _reportTabController, children: const [
                      SelfWidget(),
                      OthersWidget(),
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

