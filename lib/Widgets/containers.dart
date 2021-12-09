import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_project/Models/database_controller.dart';
import 'package:my_project/Models/json_formatter.dart';
import 'package:my_project/Routes/contacts.dart';

class ContainerBuilder extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color colorName;
  const ContainerBuilder(
      {Key? key,
      required this.icon,
      required this.label,
      required this.colorName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey.shade200,
              width: 1,
            ),
            color: colorName.withOpacity(0.2)),
        child: Center(
          child: FaIcon(
            icon,
            color: Colors.grey.shade700,
            size: 40,
          ),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        label,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w800,
          color: Colors.grey.shade900,
        ),
      ),
    ]);
  }
}

// ignore: must_be_immutable
class IconContainerBuilder extends StatelessWidget {
  final String icon;
  final String label;
  final Color colorName;
  int? size;
  int? notify;

  IconContainerBuilder(
      {Key? key,
      this.notify,
      required this.icon,
      required this.label,
      required this.colorName,
      this.size})
      : super(key: key);

  ////
  Widget notification() {
    if (notify != null) {
      return Positioned(
        top: 0,
        right: 0,
        child: Container(
          padding: const EdgeInsets.all(2),
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: Colors.red.shade700,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text('$notify',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'Lobster',
                    fontWeight: FontWeight.bold)),
          ),
        ),
      );
    }
    return Container();
  }

  final _selfDatabase = SelfDatabase();

  @override
  Widget build(BuildContext context) {
    // bool newMessage = false;
    return InkWell(
        child: Column(children: [
          Stack(children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey.shade200,
                    width: 1,
                  ),
                  color: colorName.withOpacity(0.2)),
              child: Center(
                child: SvgPicture.asset(icon,
                    width: 50, color: Colors.grey.shade800, fit: BoxFit.cover),
              ),
            ),
            notification(),
          ]),
          const SizedBox(
            height: 5,
          ),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w800,
              color: Colors.grey.shade900,
            ),
          ),
        ]),
        onTap: () async {
          Navigator.pushNamed(context, reportListPage);
        });
  }
}

class NotificationHeader extends StatelessWidget {
  final String name;
  const NotificationHeader({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              color: const Color(0xff5a289a),
              borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: InkWell(
              onTap: () => Navigator.pushReplacementNamed(context, homePage),
              child: const FaIcon(
                FontAwesomeIcons.hospitalUser,
                color: Colors.white,
                size: 22,
              ),
            ),
          )),
      Text('Welcome $name!',
          style: TextStyle(
              color: Colors.grey.shade800,
              fontFamily: 'Courgette',
              fontSize: 16,
              letterSpacing: 1,
              fontWeight: FontWeight.w600)),
      InkWell(
        onTap: () => Navigator.pushReplacementNamed(context, signInPage),
        child: const FaIcon(FontAwesomeIcons.powerOff,
            size: 32, color: Colors.red),
      )
    ]);
  }
}

class InformationDisplay extends StatelessWidget {
  const InformationDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
