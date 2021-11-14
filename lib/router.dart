import 'package:flutter/material.dart';
import 'package:my_project/Routes/admin_page.dart';
import 'package:my_project/Routes/contacts.dart';
import 'package:my_project/Routes/home_page.dart';
import 'package:my_project/Routes/report_page.dart';
import 'package:my_project/Routes/sign_in.dart';
import 'package:my_project/Routes/sing_up_page.dart';

class Routing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        {
          return MaterialPageRoute(builder: (_) => const HomePage());
        }

      case signInPage:
        {
          return MaterialPageRoute(builder: (_) => const SignInPage());
        }

      case signUpPage:
        {
          return MaterialPageRoute(builder: (_) => const SignUpPage());
        }

        case reportingPage:
        {
          return MaterialPageRoute(builder: (_) => const ReportingPage());
        }

case adminPage:
        {
          return MaterialPageRoute(builder: (_) => const AdminPage());
        }
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
              body: Center(
            child: Text(
              'Page not found!',
              style: TextStyle(
                color: Colors.red.shade600,
                fontSize: 20,
              ),
            ),
          )),
        );
    }
  }
}
