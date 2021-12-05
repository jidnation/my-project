import 'package:flutter/material.dart';
import 'package:my_project/Routes/contacts.dart';
import 'package:my_project/Widgets/form_gen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _signInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double wid = MediaQuery.of(context).size.width;
    final double hei = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                          RegForm(
                              controller: userNameController,
                              keyboardName: TextInputType.text,
                              labelValue: 'Username'),
                          const SizedBox(
                            height: 20,
                          ),
                          RegForm(
                            controller: passwordController,
                            keyboardName: TextInputType.visiblePassword,
                            labelValue: 'Password',
                            lineNumber: 1,
                          ),
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
                                  var snackBar = SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    margin: EdgeInsets.only(bottom: hei * 0.87),
                                    backgroundColor: Colors.red.shade400,
                                    duration: const Duration(seconds: 2),
                                    padding: const EdgeInsets.all(20),
                                    content: const Text(
                                        'Invalid UserName or Password',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Poppins',
                                            letterSpacing: 1)),
                                  );
                                  if (_signInKey.currentState!.validate()) {
                                    Map<String, String> userInput = {
                                      'userName': userNameController.text,
                                      'password': passwordController.text
                                    };
                                    // if (_registerUsers.userName ==
                                    //         userInput['userName'] &&
                                    //     _registerUsers.password ==
                                    //         userInput['password']) {
                                    //   Navigator.pushNamed(context, adminPage,
                                    //       arguments: userInput['userName']);
                                    // } else {
                                    //   ScaffoldMessenger.of(context)
                                    //       .showSnackBar(snackBar);
                                    // }
                                  }
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
      ),
    );
  }

  // context.read<FileController>().writeUser();

}
