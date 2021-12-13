import 'package:flutter/material.dart';

class MappingPage extends StatefulWidget {
  const MappingPage({Key? key}) : super(key: key);

  @override
  _MappingPageState createState() => _MappingPageState();
}

class _MappingPageState extends State<MappingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.3),
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/map.jpg'),
                          fit: BoxFit.contain))),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.48,
                  left: MediaQuery.of(context).size.width * 0.35,
                  child: Column(children: [
                    Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(75),
                          border: Border.all(width: 2, color: Colors.red),
                        )),
                  ])),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.36,
                  left: MediaQuery.of(context).size.width * 0.14,
                  child: Column(
                    children: [
                      Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(150),
                            border:
                                Border.all(width: 2.2, color: Colors.yellow),
                          )),
                    ],
                  )),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.28,
                  left: MediaQuery.of(context).size.width * 0.000,
                  child: Column(
                    children: [
                      Container(
                          width: 400,
                          height: 400,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(200),
                            border: Border.all(width: 1, color: Colors.green),
                          )),
                    ],
                  ))
            ],
          )),
        ));
  }
}
