import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_project/Widgets/form_gen.dart';

class ReportingPage extends StatefulWidget {
  const ReportingPage({Key? key}) : super(key: key);

  @override
  _ReportingPageState createState() => _ReportingPageState();
}

class _ReportingPageState extends State<ReportingPage> {
  final GlobalKey _reportKey = GlobalKey<FormState>();
  String? sex;

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
        backgroundColor: const Color(0xffc77dff),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            decoration: const BoxDecoration(color: Colors.white),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                'Please Note that the information you are to provide must be as accurate as possible, in order to prevent any form of misunderstanding.',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    color: Colors.red.shade600,
                    fontSize: 12.5,
                    letterSpacing: 0.5),
              ),
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  border: Border.all(width: 1, color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Form(
                  key: _reportKey,
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
                        labelValue: ' Others', keyboardName: TextInputType.text),
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
                    Row(children: [
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
                        value: sex,
                      ),
                    ]),
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
              ),
            ]),
          ),
        ));
  }
}
