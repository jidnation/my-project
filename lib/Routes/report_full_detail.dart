// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class ReportFullDetails extends StatefulWidget {
  var details;
  ReportFullDetails({Key? key, required this.details}) : super(key: key);

  @override
  _ReportFullDetailsState createState() => _ReportFullDetailsState();
}

class _ReportFullDetailsState extends State<ReportFullDetails> {
  @override
  Widget build(BuildContext context) {
    int count = widget.details.symptoms.split(',').length;
    var data = widget.details;
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('images/detailbg.png'),
                    fit: BoxFit.cover),
                color: Colors.white.withOpacity(0.8),
              ),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                      color: Colors.grey.shade300,
                                      image: DecorationImage(
                                          image: ('${data.sex}' == 'Female')
                                              ? const AssetImage(
                                                  'images/female.png')
                                              : const AssetImage(
                                                  'images/male.png')))),
                              const SizedBox(height: 5),
                              Text('${data.age} years',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300)),
                              const SizedBox(height: 12),
                              const Text('Self-Report',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text('${data.surname} ${data.others}'.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800)),
                      const SizedBox(height: 15),
                      Text(
                          '${data.address}, ${data.city}, ${data.state} State.',
                          style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 15),
                      Text('0${data.number}',
                          style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 15),
                      RichText(
                          text: TextSpan(
                              text: 'Health-Issues: ',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                              children: [
                            TextSpan(
                              text: '${data.healthIssue}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w300),
                            )
                          ])),
                      const SizedBox(height: 15),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: 90,
                                height: 30,
                                color: Colors.grey.shade200,
                                child: const Center(
                                    child: Text('Symptoms : ',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900)))),
                            const SizedBox(height: 5),
                            Align(
                              child: SizedBox(
                                  height: count * 25.5,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount:
                                          data.symptoms.split(',').length,
                                      itemBuilder: (context, index) {
                                        List<String> symptoms =
                                            data.symptoms.split(',');
                                        return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("${symptoms[index]},   ",
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              const SizedBox(height: 8),
                                            ]);
                                      })),
                            ),
                            const SizedBox(height: 30),
                            RichText(
                                text: TextSpan(
                                    text: 'Other Symptoms:  ',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800),
                                    children: [
                                  TextSpan(
                                    text: '${data.otherSymptoms}',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300),
                                  )
                                ])),
                            const SizedBox(height: 30),
                            RichText(
                                text: TextSpan(
                                    text:
                                        'Starting day of the illness from now: ',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800),
                                    children: [
                                  TextSpan(
                                    text: ' ${data.illnessHistory}',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300),
                                  )
                                ])),
                            const SizedBox(height: 30),
                            RichText(
                                text: TextSpan(
                                    text: 'Reporters idea about the illness: ',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800),
                                    children: [
                                  TextSpan(
                                    text: ' ${data.haveIdea}',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300),
                                  )
                                ])),
                            const SizedBox(height: 10),
                            RichText(
                                text: TextSpan(
                                    text: 'Commet: ',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800),
                                    children: [
                                  TextSpan(
                                    text: ' ${data.commet}',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300),
                                  )
                                ])),
                            const SizedBox(height: 10),
                          ])
                    ]),
              ),
            ),
          ),
        ));
  }
}
