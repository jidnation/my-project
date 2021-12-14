import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_project/Routes/contacts.dart';

class LowerPart extends StatelessWidget {
  const LowerPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.35,
        decoration: const BoxDecoration(
          backgroundBlendMode: BlendMode.luminosity,
          color: Colors.white,
          // gradient: const RadialGradient(
          //   radius: 1,
          //   colors: [
          //     Color(0xff5a189a),
          //     Color(0xff7b2cbf),
          //     Color(0xff9d4edd),
          //     Color(0xffc77dff),
          //     Color(0xffe0aaff),
          //   ],
          // ),
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.1,
        left: MediaQuery.of(context).size.width * 0.28,
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade700,
              width: 2,
            ),
            // boxShadow: [
            //   BoxShadow(
            //     spreadRadius: 0.2,
            //     color: const Color(0xff9d4edd).withOpacity(0.3),
            //     blurRadius: 2,
            //     offset: const Offset(0.5, 0.5),
            //   ),
            // ],
          ),
          child: TextButton.icon(
            style: TextButton.styleFrom(
                // elevation: 1
                ),
            icon: FaIcon(
              FontAwesomeIcons.exclamationTriangle,
              color: Colors.grey.shade800,
              size: 15,
            ),
            label: Text(
              'Report Incident',
              style: TextStyle(
                  fontFamily: 'Courgette',
                  // letterSpacing: 1,
                  color: Colors.grey.shade800,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                  shadows: [
                    Shadow(
                      blurRadius: 0.4,
                      color: Colors.grey.shade800,
                      offset: const Offset(0.2, 0.2),
                    )
                  ]),
            ),
            onPressed: () {
              Navigator.pushNamed(
                context,
                reportingPage,
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
          icon: Icon(
            Icons.door_front_door,
            size: 22,
            color: Colors.grey.shade800,
          ),
          label: Text(
            'Sign In/Sign Up',
            style: TextStyle(
              fontFamily: 'Dancing',
              color: Colors.grey.shade800,
              fontSize: 16,
              letterSpacing: 1.3,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ]);
  }
}
