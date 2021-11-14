import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContainerBuilder extends StatelessWidget {
  const ContainerBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey.shade600,
                width: 1,
              ),
              color: Colors.grey.shade500),
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.accusoft,
              color: Colors.grey.shade200,
              size: 40,
            ),
          ),
        ),
        const SizedBox(height: 5,),
      Text('data', 
      style: TextStyle(
        fontFamily: 'Poppins',
        color: Colors.grey.shade700
      )
      ),
      ]
    );
  }
}

class NotificationHeader extends StatelessWidget {
  const NotificationHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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