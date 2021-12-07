import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_project/Routes/contacts.dart';
import 'package:my_project/Widgets/form_gen.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/success_bg.png'),
                    fit: BoxFit.cover)),
            child: Container(
                color: Colors.white.withOpacity(0.6),
                child: Column(
                  children: [
                    const Spacer(),
                    Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.purple.shade400,
                          borderRadius: BorderRadius.circular(125),
                          border: Border.all(
                              width: 2, color: Colors.purple.shade300),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // cro
                          children: const [
                            FaIcon(
                              FontAwesomeIcons.check,
                              color: Colors.white,
                              size: 80,
                            ),
                            Text(
                              'Incident Reported',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 20,
                                  shadows: [
                                    Shadow(
                                        color: Colors.white,
                                        offset: Offset(0.6, 0.5))
                                  ]),
                            )
                          ],
                        )),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                          'Your Complians have successfully reported, \nWe will get back to you as soon as possible.',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14.5,
                            fontWeight: FontWeight.w800,
                            shadows: [
                              Shadow(
                                color: Colors.grey.shade500,
                                offset: const Offset(0.7, 0.6),
                              )
                            ],
                          )),
                    ),
                    const Spacer(),
                    GestureDetector(
                        child: Button(
                          length: 250,
                          text: 'HOME',
                          color: Colors.purple.shade400,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, homePage);
                        }),
                    const Spacer(),
                  ],
                ))),
      ),
    );
  }
}
