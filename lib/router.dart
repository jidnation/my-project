import 'package:flutter/material.dart';
import 'package:my_project/Routes/admin_page.dart';
import 'package:my_project/Routes/contacts.dart';
import 'package:my_project/Routes/home_page.dart';
import 'package:my_project/Routes/report_full_detail.dart';
import 'package:my_project/Routes/report_list.dart';
import 'package:my_project/Routes/report_page.dart';
import 'package:my_project/Routes/reporting_done.dart';
import 'package:my_project/Routes/sign_in.dart';
import 'package:my_project/Routes/sing_up_done.dart';
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
      case adminSuccessPage:
        {
          return MaterialPageRoute(builder: (_) => const AdminSuccessPage());
        }

      case adminPage:
        {
          var argument = settings.arguments.toString();
          return MaterialPageRoute(
              builder: (_) => AdminPage(userName: argument));
        }

      case reportFullDetails:
        {
          var argument = settings.arguments;
          return MaterialPageRoute(
              builder: (_) => ReportFullDetails(details: argument));
        }

      case oReportFullDetails:
        {
          var argument = settings.arguments;
          return MaterialPageRoute(
              builder: (_) => OReportFullDetails(details: argument));
        }

      case reportListPage:
        {
          return MaterialPageRoute(builder: (_) => const ReportListPage());
        }
      case successPage:
        {
          return MaterialPageRoute(builder: (_) => const SuccessPage());
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
