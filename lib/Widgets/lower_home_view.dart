import 'package:flutter/material.dart';
import 'package:my_project/Routes/contacts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LowerPart extends StatelessWidget {
  const LowerPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.35,
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.luminosity,
          color: Colors.orange.shade300.withOpacity(0.4),
          gradient: const RadialGradient(
            radius: 1,
            colors: [
              Color(0xff5a189a),
              Color(0xff7b2cbf),
              Color(0xff9d4edd),
              Color(0xffc77dff),
              Color(0xffe0aaff),
            ],
          ),
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.1,
        left: MediaQuery.of(context).size.width * 0.28,
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
            color: const Color(0xff3c096c),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xff240046).withOpacity(0.2),
              width: 0.2,
            ),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0.2,
                color: const Color(0xff9d4edd).withOpacity(0.3),
                blurRadius: 2,
                offset: const Offset(0.5, 0.5),
              ),
            ],
          ),
          child: TextButton.icon(
            style: TextButton.styleFrom(
                // elevation: 1
                ),
            icon: const FaIcon(
              FontAwesomeIcons.exclamationTriangle,
              color: Color(0xffe0aaff),
              size: 15,
            ),
            label: const Text(
              'Report Incident',
              style: TextStyle(
                  fontFamily: 'Courgette',
                  // letterSpacing: 1,
                  color: Color(0xffe0aaff),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(
                      blurRadius: 0.4,
                      color: Color(0xffc77dff),
                      offset: Offset(0.2, 0.2),
                    )
                  ]),
            ),
            onPressed: () {
              Navigator.pushNamed(
                context, reportingPage,
               );
            },
          ),
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.174,
        left: MediaQuery.of(context).size.width * 0.30,
        child: TextButton.icon(
          onPressed: () {
                Navigator.pushNamed(
              context,
              signInPage,
            );
          },
          icon: const Icon(
            Icons.door_front_door,
            size: 22,
          ),
          label: const Text(
            'Sign In/Sign Up',
            style: TextStyle(
              fontFamily: 'Dancing',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ]);
  }
}
