import 'package:flutter/material.dart';
import 'package:my_project/Widgets/form_gen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter/services.dart';

class AdminFormReg extends StatefulWidget {
  const AdminFormReg({Key? key}) : super(key: key);

  @override
  _AdminFormRegState createState() => _AdminFormRegState();
}

class _AdminFormRegState extends State<AdminFormReg> {
  final adminFormKey = GlobalKey<FormState>();

  String? sex;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: adminFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ///Hospital Name
                  Row(children: const [
                    SectionHeading(
                      title: 'Hospital Name',
                    ),
                  ]),
                  const RegForm(
                    keyboardName: TextInputType.text,
                    labelValue: 'Medical center',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(children: const [
                    SectionHeading(
                      title: 'Doctor Name',
                    ),
                  ]),

                  ///Doctor Name
                  const RegForm(
                    keyboardName: TextInputType.text,
                    labelValue: 'First Name',
                  ),
                  const RegForm(
                    keyboardName: TextInputType.text,
                    labelValue: 'Middle Name',
                  ),
                  const RegForm(
                    keyboardName: TextInputType.text,
                    labelValue: 'Last Name',
                  ),

                  ///Address
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      SectionHeading(title: 'Address'),
                    ],
                  ),
                  const RegForm(
                    keyboardName: TextInputType.text,
                    labelValue: 'Street Address ',
                  ),
                  const RegForm(
                    keyboardName: TextInputType.text,
                    labelValue: 'City',
                  ),
                  const RegForm(
                    keyboardName: TextInputType.text,
                    labelValue: 'State / Province',
                  ),

                  ///Contact
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      SectionHeading(title: 'Contacts'),
                    ],
                  ),
                  const RegForm(
                    keyboardName: TextInputType.emailAddress,
                    labelValue: 'Email ',
                  ),
                  const RegForm(
                    keyboardName: TextInputType.number,
                    labelValue: 'Phone Number 1',
                  ),
                  const RegForm(
                    keyboardName: TextInputType.number,
                    labelValue: 'Phone Number 2',
                  ),
                ],
              )),

          ///Area of Specialization
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              SectionHeading(title: 'Area of Specialization'),
            ],
          ),
          const RegForm(
            keyboardName: TextInputType.text,
            labelValue: 'Specialization',
          ),

          ///Sex and Date of Birth
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: const RegForm(
                    keyboardName: TextInputType.datetime,
                    labelValue: 'DOB: DD/MM/YYYY',
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.4,
                  child: const RegForm(
                    keyboardName: TextInputType.text,
                    labelValue: 'Religion',
                  ),
                )
              ],
            ),
          ),

          ///Sex
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              SectionHeading(title: 'Sex'),
            ],
          ),
          RadioButton(
            value: sex,
          ),

          ///Login Details
          const SizedBox(
            height: 20,
          ),
          const RegForm(
            keyboardName: TextInputType.text,
            labelValue: 'UserName ',
          ),
          const SizedBox(
            height: 10,
          ),
          const RegForm(
            keyboardName: TextInputType.visiblePassword,
            labelValue: 'Password',
          ),

          ///Description
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              SectionHeading(title: 'Description about yourself'),
            ],
          ),
          const RegForm(
            keyboardName: TextInputType.text,
            labelValue: 'Description',
          ),

          const SizedBox(
            height: 50,
          ),
          Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              color: const Color(0xff9d4edd),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 0.4, color: const Color(0xff9d4edd)),
            ),
            child: TextButton.icon(
              onPressed: () {
                if (adminFormKey.currentState!.validate()) {}
              },
              icon: const FaIcon(
                FontAwesomeIcons.solidHandPointRight,
                color: Color(0xfffefbff),
              ),
              label: const Text(
                'Register',
                style: TextStyle(
                  color: Color(0xFFFEFBFF),
                  fontSize: 17,
                  fontFamily: 'Courgette',
                  // fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  shadows: [
                    Shadow(
                      color: Color(0xffc77dff),
                      blurRadius: 0.1,
                      offset: Offset(0.2, 0.5),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
