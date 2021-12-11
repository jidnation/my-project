import 'package:flutter/material.dart';
import 'package:my_project/Models/database_controller.dart';
import 'package:my_project/Models/json_formatter.dart';
import 'package:my_project/Widgets/containers.dart';

class AdminPage extends StatefulWidget {
  final String userName;
  const AdminPage({Key? key, required this.userName}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

NotificationDB _notiDatabase = NotificationDB();

class Reporter {
  // List<SelfReport> currentSelfValue = [];
  // List<Values> values = [];
  bool isRead = false;
  int unread = 0;
  int read = 0;

  selfSetter() async {
    await _notiDatabase.notificationTable();
    await _notiDatabase
        .currentValues()
        .then((value) => _notiDatabase.notiInsert(Values(
              id: 1,
              read: (value[0].read == null) ? 0 : value[0].read,
              oUnread: value[0].oUnread,
              total: (value[0].total == null) ? 0 : value[0].total,
              unread: (value[0].unread as int) + 1,
            )));
  }

  selfGetter() async {
    await _notiDatabase.notificationTable();
    await _notiDatabase.currentValues().then((value) {
      unread = (value[0].unread as int);
      read = (value[0].read as int);
      // notice = (value[0].unread as int) + (value[0].oUnread as int);

      return value;
    }).then((value) => _notiDatabase.notiInsert(Values(
        id: 1,
        read: value[0].read,
        oRead: value[0].oRead,
        oUnread: value[0].oUnread,
        total: (value[0].unread as int) + (value[0].oUnread as int),
        unread: value[0].unread)));
  }

  otherSetter() async {
    await _notiDatabase.notificationTable();
    await _notiDatabase.currentValues().then((value) =>
        _notiDatabase.notiInsert(Values(
            id: 1,
            oRead: (value[0].oRead == null) ? 0 : value[0].oRead,
            read: value[0].read,
            unread: value[0].unread,
            total: (value[0].total == null) ? 0 : value[0].total,
            oUnread: (value[0].oUnread as int) + 1)));

    print(await _notiDatabase.currentValues());
  }

  otherGetter() async {
    await _notiDatabase.notificationTable();
    await _notiDatabase.currentValues().then((value) {
      unread = (value[0].oUnread as int);
      read = (value[0].oRead as int);
      // notice = (value[0].unread as int) + (value[0].oUnread as int);

      return value;
    }).then((value) => _notiDatabase.notiInsert(Values(
        id: 1,
        read: value[0].read,
        oRead: value[0].oRead,
        oUnread: value[0].oUnread,
        total: (value[0].unread as int) + (value[0].oUnread as int),
        unread: value[0].unread)));
  }
}

class _AdminPageState extends State<AdminPage> {
  // void initializer() async {
  //   setState(() {
  //     notice = (values[0].unread as int) - (values[0].read as int);
  //   });
  // await _selfDatabase.selfReportTableGen();
  // currentSelfValue = await _selfDatabase.selfReport();
  // print('from adminPage: $currentSelfValue');
  // }

  int notice = 0;
  void noticeBoard() async {
    await _notiDatabase.notificationTable();
    await _notiDatabase.currentValues().then((value) {
      _notiDatabase.notiInsert(Values(
          id: 1,
          read: value[0].read,
          oRead: value[0].oRead,
          oUnread: value[0].oUnread,
          total: (value[0].unread as int) + (value[0].oUnread as int),
          unread: value[0].unread));
      setState(() {
        notice = (value[0].unread as int) + (value[0].oUnread as int);
      });
    });
    print(notice);
  }

  @override
  void initState() {
    super.initState();
    noticeBoard();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _reporting = Reporter();

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              color: Colors.white,
              child: Column(
                children: [
                  NotificationHeader(name: widget.userName),
                  const SizedBox(
                    height: 10,
                  ),
                  const InformationDisplay(),
                  const SizedBox(height: 30),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconContainerBuilder(
                            notify: (notice > 0) ? notice : null,
                            label: ' Case-Report',
                            icon: 'icons/clip.svg',
                            colorName: Colors.red),
                        // IconContainerBuilder(
                        //     label: ' Pharmacy',
                        //     icon: 'icons/pharmacy.svg',
                        //     colorName: Colors.green),
                        // IconContainerBuilder(
                        //     label: ' Report',
                        //     icon: 'icons/report.svg',
                        //     colorName: Colors.blue),
                        // IconContainerBuilder(
                        //     label: ' Patient',
                        //     icon: 'icons/patient.svg',
                        //     colorName: Colors.purple),
                      ]),
                  const SizedBox(height: 40),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       IconContainerBuilder(
                  //           label: ' Lab-Results',
                  //           icon: 'icons/lab_result.svg',
                  //           colorName: Colors.yellow),
                  //       IconContainerBuilder(
                  //           label: 'Dealth-Report',
                  //           icon: 'icons/death.svg',
                  //           colorName: Colors.black),
                  //       IconContainerBuilder(
                  //           label: 'Doctor',
                  //           icon: 'icons/doctor.svg',
                  //           colorName: Colors.cyan),
                  //       IconContainerBuilder(
                  //           label: 'Medicine',
                  //           icon: 'icons/medicine.svg',
                  //           colorName: Colors.white),
                  // ]),
                  const SizedBox(height: 20),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        // ContainerBuilder(),
                        // ContainerBuilder(),
                        // ContainerBuilder(),
                      ]),
                  const SizedBox(height: 20),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        // ContainerBuilder(),
                        // ContainerBuilder(),
                        // ContainerBuilder(),
                      ]),
                  const SizedBox(
                    height: 20,
                  ),
                  const InformationDisplay(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
