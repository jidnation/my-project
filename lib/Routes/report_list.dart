// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_project/Models/database_controller.dart';
import 'package:my_project/Models/json_formatter.dart';
import 'package:my_project/Routes/contacts.dart';

class ReportListPage extends StatefulWidget {
  const ReportListPage({Key? key}) : super(key: key);

  @override
  State<ReportListPage> createState() => _ReportListPageState();
}

// final _data = Datas();
final _numbers = NotificationDB();
final _selfDatabase = SelfDatabase();

class _ReportListPageState extends State<ReportListPage> {
  Future<List<SelfReport>> settings() async {
    var values;

    // await _data.getter();
    await _selfDatabase.selfReportTableGen();
    values = await _selfDatabase.selfReport();

    return values;
  }

  var result;

  int _startingIndex = 0;
  int _unread = 0;
  int _read = 0;

  int get startingIndex => _startingIndex;
  int get unread => _unread;
  int get read => _read;

  fetcher() async {
    await _numbers.notificationTable();
    _unread =
        await _numbers.currentValues().then((value) => value[0].unread as int);
    _read =
        await _numbers.currentValues().then((value) => value[0].read as int);
    setState(() {
      _startingIndex = _unread - _read;
    });

    // print('unread: $_unread, read: $_read, starting: $_startingIndex');
  }

  @override
  void initState() {
    super.initState();
    fetcher();
    // print('I am in initState');
  }

  @override
  void dispose() {
    super.dispose();
    // fetcher();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
              child: Center(
                  child: FaIcon(FontAwesomeIcons.chevronLeft,
                      color: Colors.grey.shade700, size: 35)),
              onTap: () => Navigator.of(context)..pop()),
          backgroundColor: Colors.grey.shade200,
          elevation: 0,
          title: Center(
              child: Text(
            'CASE REPORTs',
            style: TextStyle(
                color: Colors.grey.shade700,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w800,
                letterSpacing: 1),
          ))),
      body: FutureBuilder(
        future: settings(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, startingIndex) {
                    return GestureDetector(
                        child: ReportView(data: snapshot, index: startingIndex),
                        onTap: () {
                          Navigator.pushNamed(
                              context, reportFullDetails, arguments: snapshot.data[startingIndex]);
                        });
                  }),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ReportView extends StatelessWidget {
  const ReportView({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  final AsyncSnapshot data;
  final int index;

  @override
  Widget build(BuildContext context) {
    var collector = data.data;
    return Stack(children: [
      Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        width: MediaQuery.of(context).size.width,
        height: 120,
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300, offset: const Offset(1, 1)),
              BoxShadow(
                  color: Colors.grey.shade400, offset: const Offset(0, 1)),
              BoxShadow(
                  color: Colors.grey.shade400, offset: const Offset(1, 0)),
              BoxShadow(
                  color: Colors.grey.shade400, offset: const Offset(-1, 0))
            ]),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  '${collector[index].surname} ${collector[index].others}'
                      .toUpperCase(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
              const SizedBox(height: 5),
              Text('${collector[index].address}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  )),
              const SizedBox(height: 5),
              Text('0${collector[index].number}'),
              const SizedBox(height: 5),
              Text('${collector[index].symptoms.split(',')}',
                  style: const TextStyle(fontWeight: FontWeight.w200)),
            ]),
      ),
      Positioned(
        top: 13,
        right: 20,
        child: Container(
          width: 70,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.red.shade500,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text('SelfReporting',
                style: TextStyle(
                    color: Colors.grey.shade200,
                    fontSize: 12,
                    shadows: const [
                      Shadow(color: Colors.white, offset: Offset(0, 0.5)),
                      Shadow(color: Colors.grey, offset: Offset(0.1, 0.6)),
                    ])),
          ),
        ),
      ),
    ]);
  }
}
