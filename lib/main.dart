import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_project/Models/database_controller.dart';
import 'package:my_project/Routes/contacts.dart';
import 'package:my_project/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Open DataBase and store the reference.
  DataBase().databaseControlRoom();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = "My Undergraduate Project";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // User admin2 = User(id: 2, userName: 'Adeola', password: 'password');
    // DataBase.databaseControlRoom.insertUser(admin2);
    // print(databaseControlRoom().users());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: const Color(0xff3c096c),
          ),
        ),
      ),
      initialRoute: homePage,
      onGenerateRoute: Routing.generateRoute,
    );
  }
}
