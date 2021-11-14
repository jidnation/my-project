import 'package:flutter/material.dart';
import 'package:my_project/Widgets/carousel_page.dart';
import 'package:my_project/Widgets/lower_home_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe0aaff),
      body: ListView(
        children: const [
          CarouselView(),
          LowerPart(),
        ],
      ),
    );
  }
}
