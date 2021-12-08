import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_project/Widgets/admin_form_reg.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff9d4edd),
          centerTitle: true,
          leading: const Center(
            child: FaIcon(FontAwesomeIcons.userMd, color: Color(0xFFFEFBFF)),
          ),
          title: const Text(
            'Officer Registration',
            style: TextStyle(
                color: Color(0xFFEEE2F1),
                fontFamily: 'Courgette',
                letterSpacing: 1,
                shadows: [
                  Shadow(color: Color(0xffc77dff), offset: Offset(0.6, 1))
                ]),
          ),
        ),
        backgroundColor: Colors.grey.shade200,
        body: ListView(
          children: [
            Container(
                // height: MediaQuery.of(context).size.height,
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'New Admin Registration',
                      style: TextStyle(
                          color: Color(0xFF10002b),
                          fontFamily: 'Lobster',
                          fontSize: 22,
                          letterSpacing: 1,
                          shadows: [
                            Shadow(
                                color: Color(0xff240046),
                                offset: Offset(0.5, 0.5))
                          ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'please fill in the form below',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Courgette',
                          letterSpacing: 0.1,
                          shadows: [
                            Shadow(
                                color: Color(0xff5a189a),
                                offset: Offset(0.4, 0.2))
                          ]),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Divider(
                      thickness: 0.5,
                      color: Color(0xFFc77dff),
                      height: 10,
                    ),
                    Divider(
                      thickness: 0.5,
                      color: Color(0xFFc77dff),
                      height: 0,
                    ),
                    AdminFormReg(),
                    SizedBox(
                      height: 30,
                    ),
                    Divider(
                      thickness: 0.5,
                      color: Color(0xFF9d4edd),
                      height: 10,
                    ),
                    Divider(
                      thickness: 0.5,
                      color: Color(0xFF9d4edd),
                      height: 0,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
