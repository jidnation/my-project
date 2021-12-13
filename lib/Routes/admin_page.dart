import 'package:flutter/material.dart';
import 'package:my_project/Models/database_controller.dart';
import 'package:my_project/Widgets/containers.dart';

class AdminPage extends StatefulWidget {
  final String userName;
  const AdminPage({Key? key, required this.userName}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

NotificationDB _notiDatabase = NotificationDB();

class _AdminPageState extends State<AdminPage> {
  int notice = 0;
  void noticeBoard() async {
    await _notiDatabase.notificationTable();
    await _notiDatabase.currentValues().then((value) {
      setState(() {
        notice = (value[0].unread as int);
      });
    });
    // print(notice);
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
    noticeBoard();
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
                        IconContainerBuilder(
                            label: ' Pharmacy',
                            icon: 'icons/pharmacy.svg',
                            colorName: Colors.green),
                        IconContainerBuilder(
                            label: ' Report',
                            icon: 'icons/report.svg',
                            colorName: Colors.blue),
                        IconContainerBuilder(
                            label: ' Patient',
                            icon: 'icons/patient.svg',
                            colorName: Colors.purple),
                      ]),
                  const SizedBox(height: 40),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconContainerBuilder(
                            label: ' Lab-Results',
                            icon: 'icons/lab_result.svg',
                            colorName: Colors.yellow),
                        IconContainerBuilder(
                            label: 'Dealth-Report',
                            icon: 'icons/death.svg',
                            colorName: Colors.black),
                        IconContainerBuilder(
                            label: 'Doctor',
                            icon: 'icons/doctor.svg',
                            colorName: Colors.cyan),
                        IconContainerBuilder(
                            label: 'Medicine',
                            icon: 'icons/medicine.svg',
                            colorName: Colors.white),
                      ]),
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
