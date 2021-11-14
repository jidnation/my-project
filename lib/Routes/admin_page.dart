import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_project/Widgets/containers.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.white,
            child: Column(
              children: [
                const NotificationHeader(),
                const SizedBox(
                  height: 10,
                ),
                const InformationDisplay(),
                const SizedBox(height: 15),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      ContainerBuilder(),
                      ContainerBuilder(),
                      ContainerBuilder(),
                    ]),
                const SizedBox(height: 20),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      ContainerBuilder(),
                      ContainerBuilder(),
                      ContainerBuilder(),
                    ]),
                const SizedBox(height: 20),

                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      ContainerBuilder(),
                      ContainerBuilder(),
                      ContainerBuilder(),
                    ]),
                const SizedBox(height: 20),

                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      ContainerBuilder(),
                      ContainerBuilder(),
                      ContainerBuilder(),
                    ]),
                    const SizedBox(height: 20,),
                    const InformationDisplay(),
              ],
            ),
          )
        ],
      ),
    );
  }
}




