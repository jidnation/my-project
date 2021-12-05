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

  static var result;

  String? inputChecker(String? value, TextInputType? type) {
    if (value != null || value!.isNotEmpty) {
      if (type == TextInputType.text) {
        if (value.isEmpty) {
          return 'Invalid input';
        }
        return null;
      } else if (type == TextInputType.number) {
        List validStarter = ['080', '070', '090', '081', '091'];
        if (value.length >= 3) {
          String? value1 = value[0];
          String? value2 = value[1];
          String? value3 = value[2];
          String? starters = value1 + value2 + value3;
          if (validStarter.contains(starters)) {
          return null;
          }
            return 'Invalid Input';
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

  static getter() {
    return result;
  }

  
}

void validateAdmin(String userName, String password) {

  
}
