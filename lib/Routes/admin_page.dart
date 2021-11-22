import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_project/Widgets/containers.dart';

class AdminPage extends StatefulWidget {
  final String userName;
  const AdminPage({Key? key,  required this.userName}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  @override
  Widget build(BuildContext context) {
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
                      children: const [
                        ContainerBuilder(
                          icon: FontAwesomeIcons.clipboard,
                          label: 'Report',
                          colorName: Colors.red,
                        ),
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
                      children: const [
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
