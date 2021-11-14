// import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class ValidateInput extends StatelessWidget {
  // final String? value;
  const ValidateInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  String? inputChecker(value, type) {
    if (value != null || value.isNotEmpty) {
      if (type == TextInputType.text) {
        if (value == null || value.isEmpty) {
          return 'Invalid input';
        }
        return null;
      } else if (type == TextInputType.number) {
        if (value.length >= 3) {
          String? starter = value[0] + value[1] + value[2];
          if (starter != '080' ||
              starter != '081' ||
              starter != '090' ||
              starter != '091' ||
              starter != '070') {
            return 'Invalid format';
          }
          return null;
        }
      } else if (type == TextInputType.visiblePassword) {
        if (value.length < 8) {
          return 'It must be at least 8 character';
        }
        return null;
      } else if (type == TextInputType.emailAddress) {
        bool emailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@+[a-zA-Z0-9]+\.[a-zA-Z]")
            .hasMatch(value.toString());
        return (!emailValid) ? "Invalid Email" : null;
      } else if (type == TextInputType.datetime) {}
      // return null;
    }
  }
}
