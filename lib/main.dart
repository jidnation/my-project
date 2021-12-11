import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_project/Models/database_controller.dart';
// import 'package:my_project/Models/database_controller.dart';
// import 'package:my_project/Models/database_controller.dart';
// import 'package:my_project/Models/json_formatter.dart';
import 'package:my_project/Routes/contacts.dart';
import 'package:my_project/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // var path = join(await getDatabasesPath(), 'Self_Reports.db');
  // await deleteDatabase(path);
  runApp(
    const MyApp(),
  );
}

// final _notify = NotificationDB();
final _general = GeneralDB();
// final _fetcher = Fetchers();
// final _selfDatabase = SelfDatabase();
// final _otherDatabase = OtherDatabase();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // getter() async {
  // await _selfDatabase.selfReportTableGen();
  // print(await _selfDatabase.selfReport());
  // await _otherDatabase.otherReportTableGen();
  // print(await _otherDatabase.otherReportList());
  // await _general.generalTableGen();
  // print(await _general.generalReport());
  // print(await _general.generalReport().then((value) => value.length));
  // await _general.insertGeneral(GeneralData(
  //     type: 'self',
  //     id: 4,
  //     surname: 'Ayodeji',
  //     healthIssue: 'NIL',
  //     others: 'Damilola',
  //     address: ' 43 Ijoka Street',
  //     age: 26,
  //     number: 8033956132,
  //     city: 'Akure North',
  //     sex: 'Female',
  //     state: 'Ondo',
  //     illnessHistory: '9 days ago',
  //     haveIdea: 'nothing for now',
  //     commet: 'Noting to say',
  //     otherSymptoms: 'Nothing to say',
  //     symptoms: 'Fever(iba)'));
  // await _notify.notificationTable();
  // print(await _notify.currentValues());
  // }

  static const String _title = "My Undergraduate Project";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // _fetcher.unitSetter();
    // _notify.notificationTable();
    // getter();
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
