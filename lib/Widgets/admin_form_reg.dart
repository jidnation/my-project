import 'package:flutter/material.dart';
import 'package:my_project/Models/database_controller.dart';
import 'package:my_project/Models/json_formatter.dart';
import 'package:my_project/Routes/contacts.dart';
import 'package:my_project/Widgets/form_gen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminFormReg extends StatefulWidget {
  const AdminFormReg({Key? key}) : super(key: key);

  @override
  _AdminFormRegState createState() => _AdminFormRegState();

  static TextEditingController aFirstnameController = TextEditingController();
  static TextEditingController ahospitalNameController = TextEditingController();
  static TextEditingController aMNameController = TextEditingController();
  static TextEditingController aLNameController = TextEditingController();
  static TextEditingController aStreetAddressController = TextEditingController();
  static TextEditingController aCityController = TextEditingController();
  static TextEditingController aStateController = TextEditingController();
  static TextEditingController aEmailController = TextEditingController();
  static TextEditingController aNumber1Controller = TextEditingController();
  static TextEditingController aNumber2Controller = TextEditingController();
  static TextEditingController aSpecialController = TextEditingController();
  static TextEditingController aDOBController = TextEditingController();
  static TextEditingController aReligiouController = TextEditingController();
  static TextEditingController aUserNameController = TextEditingController();
  static TextEditingController aPasswordController = TextEditingController();
  static TextEditingController aDescriptionController = TextEditingController();
}

final _adminDatabase = AdminDatabase();

class _AdminFormRegState extends State<AdminFormReg> {
  final adminFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                  RegForm(
                    controller: AdminFormReg.ahospitalNameController,
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
                  RegForm(
                    keyboardName: TextInputType.text,
                    controller: AdminFormReg.aFirstnameController,
                    labelValue: 'First Name',
                  ),
                  RegForm(
                    controller: AdminFormReg.aMNameController,
                    keyboardName: TextInputType.text,
                    labelValue: 'Middle Name',
                  ),
                  RegForm(
                    controller: AdminFormReg.aLNameController,
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
                  RegForm(
                    controller: AdminFormReg.aStreetAddressController,
                    keyboardName: TextInputType.text,
                    labelValue: 'Street Address ',
                  ),
                  RegForm(
                    controller: AdminFormReg.aCityController,
                    keyboardName: TextInputType.text,
                    labelValue: 'City',
                  ),
                  RegForm(
                    controller: AdminFormReg.aStateController,
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
                  RegForm(
                    controller: AdminFormReg.aEmailController,
                    keyboardName: TextInputType.emailAddress,
                    labelValue: 'Email ',
                  ),
                  RegForm(
                    controller: AdminFormReg.aNumber1Controller,
                    keyboardName: TextInputType.number,
                    labelValue: 'Phone Number 1',
                  ),
                  RegForm(
                    controller: AdminFormReg.aNumber2Controller,
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
          RegForm(
            controller: AdminFormReg.aSpecialController,
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
                  child: RegForm(
                    controller: AdminFormReg.aDOBController,
                    keyboardName: TextInputType.datetime,
                    labelValue: 'DOB: DD/MM/YYYY',
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.4,
                  child: RegForm(
                    controller: AdminFormReg.aReligiouController,
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
          RegForm(
            controller: AdminFormReg.aUserNameController,
            keyboardName: TextInputType.text,
            labelValue: 'UserName ',
          ),
          const SizedBox(
            height: 10,
          ),
          RegForm(
              controller: AdminFormReg.aPasswordController,
              keyboardName: TextInputType.visiblePassword,
              labelValue: 'Password',
              lineNumber: 1),

          ///Description
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              SectionHeading(title: 'Description about yourself'),
            ],
          ),
          RegForm(
            controller: AdminFormReg.aDescriptionController,
            keyboardName: TextInputType.text,
            labelValue: 'Description',
            lineNumber: 3,
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
              onPressed: () async {
                await _adminDatabase.adminRegTableGen();
                  int _adminId = await _adminDatabase.adminList().then((value) => value.length);
                if (adminFormKey.currentState!.validate()) {
                  await _adminDatabase.insertAdmin(AdminSignUp(
                      id: _adminId++,
                      aFirstname: AdminFormReg.aFirstnameController.text,
                      aCity: AdminFormReg.aCityController.text,
                      ahospitalName: AdminFormReg.ahospitalNameController.text,
                      aMName: AdminFormReg.aMNameController.text,
                      aLName: AdminFormReg.aLNameController.text,
                      aSpecial: AdminFormReg.aSpecialController.text,
                      aState: AdminFormReg.aStateController.text,
                      aStreetAddress: AdminFormReg.aStreetAddressController.text,
                      aDOB: AdminFormReg.aDOBController.text,
                      aNumber1: int.parse(AdminFormReg.aNumber1Controller.text),
                      aNumber2: int.parse(AdminFormReg.aNumber2Controller.text),
                      aReligiou: AdminFormReg.aReligiouController.text,
                      aUserName: AdminFormReg.aUserNameController.text,
                      aPassword: AdminFormReg.aPasswordController.text,
                      aDescription: AdminFormReg.aDescriptionController.text,
                      aEmail: AdminFormReg.aEmailController.text,
                      sex : RadioButton.sexValue as String,
                  ));
                  Navigator.pushReplacementNamed(context, adminSuccessPage);
                }
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
