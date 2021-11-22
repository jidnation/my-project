import 'package:flutter/material.dart';
import 'package:my_project/Models/validator.dart';
import 'package:my_project/Routes/contacts.dart';
import 'package:my_project/Widgets/form_gen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late String  _name = '';
  final _signInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double wid = MediaQuery.of(context).size.width;
    final double hei = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            width: wid,
            height: hei,
            decoration: const BoxDecoration(color: Colors.white),
            child: Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              width: wid,
              height: hei,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: Border.all(
                  width: 3,
                  color: Colors.grey.shade300,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'welcome',
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontFamily: 'Weather',
                      fontSize: 44,
                    ),
                  ),
                  Text(
                    'Sign in to continue',
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontFamily: 'Dancing',
                        letterSpacing: 1,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Form(
                    key: _signInKey,
                    child: Column(
                      children: [
                        const RegForm(
                            keyboardName: TextInputType.text,
                            labelValue: 'Username'),
                        const SizedBox(
                          height: 20,
                        ),
                        const RegForm(
                            keyboardName: TextInputType.visiblePassword,
                            labelValue: 'Password'),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xff3c096c),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 0.4, color: const Color(0xff9d4edd)),
                          ),
                          child: TextButton.icon(
                            onPressed: () {
                              if (_signInKey.currentState!.validate()) {
                                _name = ValidateInput.getter();
                                Navigator.pushNamed(
                                  context,
                                  adminPage,
                                  arguments: _name,
                                );
                              }
                            },
                            icon: Icon(
                              Icons.login,
                              color: Colors.grey.shade400,
                            ),
                            label: Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontFamily: 'Dancing',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                shadows: [
                                  Shadow(
                                    color: Colors.grey.shade800,
                                    blurRadius: 0.1,
                                    offset: const Offset(0.2, 0.5),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                signUpPage,
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationThickness: 2.5,
                                color: Colors.grey.shade800,
                                fontFamily: 'Courgette',
                                fontSize: 16,
                                letterSpacing: 2,
                                shadows: [
                                  Shadow(
                                    color: Colors.grey.shade900,
                                    blurRadius: 0.1,
                                    offset: const Offset(0.2, 0.5),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
