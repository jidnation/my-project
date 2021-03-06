// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_project/Models/database_controller.dart';
import 'package:my_project/Routes/contacts.dart';

class ReportListPage extends StatefulWidget {
  const ReportListPage({Key? key}) : super(key: key);

  @override
  State<ReportListPage> createState() => _ReportListPageState();
}

final _numbers = NotificationDB();
final _generalDatabase = GeneralDB();
final _fetchers = Fetchers();

class Fetchers {
  var result;

  int _startingIndex = 0;
  int _unread = 0;
  int _read = 0;
  var generalList = [];

  int get startingIndex => _startingIndex;
  int get unread => _unread;
  int get read => _read;

  // GETTING OF THE CURRENT VALUES
  unitSetter() async {
    await _numbers.notificationTable();
    await _numbers.currentValues().then((value) {
      _unread = value[0].unread as int;
      _read = value[0].read as int;
    });
  }

  // COLLECTING TO THE DATABASE WE ARE WORKING WITH
  dataFetcher() async {
    await _fetchers.unitSetter();
    await _generalDatabase.generalTableGen();
    generalList = await _generalDatabase.generalReport();
    _startingIndex = await _generalDatabase
        .generalReport()
        .then((value) => value.length - unread);

    return generalList;
  }
}

class _ReportListPageState extends State<ReportListPage> {
  @override
  void initState() {
    super.initState();
    _fetchers;
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
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.only(top: 15, bottom: 16),
          padding: const EdgeInsets.all(5),
          child: Column(children: [
            FutureBuilder(
                future: _fetchers.dataFetcher(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data;
                    int startingIndex = data.length - _fetchers._unread;

                    return Container(
                      height: (_fetchers._unread).toDouble() * 160,
                      margin: const EdgeInsets.only(bottom: 15, top: 10),
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          // shrinkWrap: true,
                          itemCount: _fetchers._unread,
                          clipBehavior: Clip.none,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                child: Stack(children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    width: MediaQuery.of(context).size.width,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade300,
                                              offset: const Offset(1, 1)),
                                          BoxShadow(
                                              color: Colors.grey.shade400,
                                              offset: const Offset(0, 1)),
                                          BoxShadow(
                                              color: Colors.grey.shade400,
                                              offset: const Offset(1, 0)),
                                          BoxShadow(
                                              color: Colors.grey.shade400,
                                              offset: const Offset(-1, 0))
                                        ]),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              '${snapshot.data[index + startingIndex].surname} ${snapshot.data[index + startingIndex].others}'
                                                  .toUpperCase(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700)),
                                          const SizedBox(height: 5),
                                          Text(
                                              '${snapshot.data[index + startingIndex].address}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                              )),
                                          const SizedBox(height: 5),
                                          Text(
                                              '0${snapshot.data[index + startingIndex].number}'),
                                          const SizedBox(height: 5),
                                          Text(
                                              '${snapshot.data[index + startingIndex].symptoms.split(',')}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w200)),
                                        ]),
                                  ),
                                  Positioned(
                                    top: 13,
                                    right: 15,
                                    child: Row(children: [
                                      Container(
                                        width: 70,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: (data[index + startingIndex]
                                                      .type ==
                                                  'self')
                                              ? Colors.red.shade300
                                              : Colors.purple.shade300,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                          child: Text(
                                              (data[index + startingIndex]
                                                          .type ==
                                                      'self')
                                                  ? 'SelfReporting'
                                                  : 'Other-Report',
                                              style: TextStyle(
                                                  color: Colors.grey.shade200,
                                                  fontSize: 12,
                                                  shadows: const [
                                                    Shadow(
                                                        color: Colors.white,
                                                        offset: Offset(0, 0.5)),
                                                    Shadow(
                                                        color: Colors.grey,
                                                        offset:
                                                            Offset(0.1, 0.6)),
                                                  ])),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: (data[index + startingIndex]
                                                        .isRead ==
                                                    'unread')
                                                ? Colors.red.shade300
                                                : Colors.green.shade300,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                    ]),
                                  ),
                                ]),
                                onTap: () {
                                  ('${snapshot.data[index + startingIndex].type}' ==
                                          'self')
                                      ? Navigator.pushNamed(
                                          context, reportFullDetails,
                                          arguments: snapshot
                                              .data[(index + startingIndex)])
                                      : Navigator.pushNamed(
                                          context, oReportFullDetails,
                                          arguments: snapshot
                                              .data[(index + startingIndex)]);
                                });
                          }),
                    );
                  } else {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.green,
                      strokeWidth: 6,
                    ));
                  }
                })
          ]),
        )));
  }
}
