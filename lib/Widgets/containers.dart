import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContainerBuilder extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color colorName;
  const ContainerBuilder({Key? key, required this.icon, required this.label, required this.colorName})
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

class IconContainerBuilder extends StatelessWidget {
  final String icon;
  final String label;
  final Color colorName;

  const IconContainerBuilder(
      {Key? key, required this.icon, required this.label, required this.colorName})
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
          child: SvgPicture.asset(icon,
              width: 50, color: Colors.grey.shade800, fit: BoxFit.cover),
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

class NotificationHeader extends StatelessWidget {
  final String name;
  const NotificationHeader({
    Key? key, required this.name,
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
          child: const Center(
            child: FaIcon(
              FontAwesomeIcons.hospitalUser,
              color: Colors.white,
              size: 22,
            ),
          )),
           Text('Welcome $name!', 
           style: TextStyle(
             color: Colors.grey.shade800,
             fontFamily: 'Courgette',
             fontSize: 16,
             letterSpacing: 1,
             fontWeight: FontWeight.w600
           )
           ),
      Stack(children: [
        const FaIcon(
          FontAwesomeIcons.bell,
          size: 32,
        ),
        Positioned(
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
            child: const Center(
              child: Text('10',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Lobster',
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ])
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
