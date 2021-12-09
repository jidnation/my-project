import 'package:flutter/material.dart';

class ReportFullDetails extends StatefulWidget {
  final details;
  const ReportFullDetails({ Key? key, required this.details }) : super(key: key);

  @override
  _ReportFullDetailsState createState() => _ReportFullDetailsState();
}

class _ReportFullDetailsState extends State<ReportFullDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('${widget.details.surname}')
    );
  }
}