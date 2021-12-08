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

class Reporting {
  bool isRead = false;

  final _database = Database();
  Map<String, dynamic> data = {};

  reportGetter(SelfReport report) async {
    data = report.toMap();
    await _database.notificationTable();
    await _database.currentValues().then( (value) => _database.notiInsert(
        Values(id: 1, read: value[0].read, unread: (value[0].unread as int )+ 1)));
  }
}

class _AdminPageState extends State<AdminPage> {
  int unread = 0;
  int read = 0;
  int notice = 0;
  final _database = Database();

  void initializer() async {
    await _database.notificationTable();
    List<Values> values = await _database.currentValues();
    setState(() {
      notice = (values[0].unread as int) - (values[0].read as int);
    });
  }

  @override
  void initState() {
    super.initState();
    initializer();
  }

  @override
  Widget build(BuildContext context) {
    // final updater = Provider.of<Database>(context);
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
