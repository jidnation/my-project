// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:my_project/Models/database_controller.dart';
import 'package:my_project/Models/json_formatter.dart';
import 'package:my_project/Routes/contacts.dart';

final _notify = NotificationDB();
final _generaldata = GeneralDB();

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
                                    text: 'Comment: ',
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

/*    OTHERS SESSIONS */
class OReportFullDetails extends StatefulWidget {
  OReportFullDetails({Key? key, required this.details}) : super(key: key);
  var details;

  @override
  _OReportFullDetailsState createState() => _OReportFullDetailsState();
}

class Reading {
  bool isRead = false;
  late String status;
}

class _OReportFullDetailsState extends State<OReportFullDetails> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count = widget.details.symptoms.split(',').length;
    var data = widget.details;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(children: [
                Stack(children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                                padding: const EdgeInsets.only(right: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 120,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            color: Colors.grey.shade300,
                                            image: DecorationImage(
                                                image: ('${data.sex}' ==
                                                        'Female')
                                                    ? const AssetImage(
                                                        'images/female.png')
                                                    : const AssetImage(
                                                        'images/male.png')))),
                                    const SizedBox(height: 5),
                                    Text('${data.age} years',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w300)),
                                    const SizedBox(height: 12),
                                    const Text('Other-Report',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14)),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Text('REPORTER DETAILS',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  decoration: TextDecoration.underline,
                                )),
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
                            const SizedBox(height: 30),
                            const Text('PATIENT DETAILS',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  decoration: TextDecoration.underline,
                                )),
                            const SizedBox(height: 10),
                            Text('${data.pFullName}',
                                style: const TextStyle(fontSize: 20)),
                            const SizedBox(height: 10),
                            Text('${data.pAddress}',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            const SizedBox(height: 30),
                            RichText(
                                text: TextSpan(
                                    text: 'Relationship Status: ',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800),
                                    children: [
                                  TextSpan(
                                    text: '${data.rRelation}',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300),
                                  )
                                ])),
                            const SizedBox(height: 10),
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
                                    text: 'Reporters idea about the illness: ',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800),
                                    children: [
                                  TextSpan(
                                    text: ' ${data.pSpecifyIllness}',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300),
                                  )
                                ])),
                            const SizedBox(height: 10),
                            RichText(
                                text: TextSpan(
                                    text: 'Comment: ',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800),
                                    children: [
                                  TextSpan(
                                    text: ' ${data.pCommet}',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300),
                                  )
                                ])),
                            const SizedBox(height: 10),
                          ]),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 20,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                              child: Container(
                                  width: 100,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: (data.isRead == 'unread')
                                          ? Colors.transparent
                                          : Colors.green,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          width: 2,
                                          color: Colors.grey.shade600)),
                                  child: Center(
                                      child: Text(
                                          (data.isRead == 'unread')
                                              ? 'Make as Read'
                                              : 'Viewed',
                                          style: TextStyle(
                                            color: (data.isRead == 'unread')
                                                ? Colors.grey.shade800
                                                : Colors.white,
                                            fontWeight: FontWeight.w400,
                                          )))),
                              onTap: () {
                                valueChanger(data); //TODO work on this
                              }),
                          const SizedBox(height: 30),
                          const Text('Officers Comment',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              )),
                          const SizedBox(height: 5),
                          InkWell(
                              child: const Text(
                                'Make Comments',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 1.6,
                                ),
                              ),
                              onTap: () {}),
                          const SizedBox(height: 10),
                          InkWell(
                              child: const Text(
                                'View Comments',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 1.6,
                                ),
                              ),
                              onTap: () {})
                        ]),
                  ),
                  Positioned(
                    top: 15,
                    right: 17,
                    child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.purple.shade400,
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ]),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, mapping);
                  },
                  child: Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(width: 2, color: Colors.grey.shade700),
                      ),
                      child: Text(
                        'View Effect Rate',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            shadows: [
                              Shadow(
                                  color: Colors.grey.shade800,
                                  offset: const Offset(1, 0))
                            ]),
                      )),
                ),
                const SizedBox(height: 20),
              ]),
            ),
          )),
    );
  }

  valueChanger(var container) async {
    late String status;
    await _generaldata.generalTableGen();
    if (await _generaldata
        .generalReport()
        .then((value) => value[container.id - 1].isRead == 'unread')) {
      await _generaldata.insertGeneral(GeneralData(
        isRead: 'read',
        type: container.type,
        id: container.id,
        surname: container.surname,
        others: container.others,
        address: container.address,
        age: container.age,
        number: container.number,
        city: container.city,
        state: container.state,
        illnessHistory: container.illnessHistory,
        haveIdea: container.haveIdea,
        healthIssue: container.healthIssue,
        commet: container.commet,
        sex: container.sex,
        pCommet: container.pCommet,
        pSpecifyIllness: container.pSpecifyIllness,
        rRelation: container.rRelation,
        pAddress: container.pAddress,
        pFullName: container.pFullName,
        otherSymptoms: container.otherSymptoms,
        symptoms: container.symptoms,
      ));
      status = 'read';

      unitUpdater(status);
    } else {
      await _generaldata.insertGeneral(GeneralData(
        isRead: 'unread',
        type: container.type,
        id: container.id,
        surname: container.surname,
        others: container.others,
        address: container.address,
        age: container.age,
        number: container.number,
        city: container.city,
        state: container.state,
        illnessHistory: container.illnessHistory,
        haveIdea: container.haveIdea,
        healthIssue: container.healthIssue,
        commet: container.commet,
        sex: container.sex,
        pCommet: container.pCommet,
        pSpecifyIllness: container.pSpecifyIllness,
        rRelation: container.rRelation,
        pAddress: container.pAddress,
        pFullName: container.pFullName,
        otherSymptoms: container.otherSymptoms,
        symptoms: container.symptoms,
      ));
      status = 'unread';

      unitUpdater(status);
    }
  }

  void unitUpdater(String status) async {
    if (status == 'read') {
      print('yes');
      await _notify.notificationTable();
      await _notify.currentValues().then((value) => _notify.notiInsert(Values(
          id: 1,
          read: int.parse('${value[0].read}') + 1,
          unread: int.parse('${value[0].unread}') - 1)));
      print('From read: ${await _notify.currentValues()}');
    } else {
      print('no');
      await _notify.notificationTable();
      await _notify.currentValues().then((value) => _notify.notiInsert(Values(
          id: 1,
          unread: int.parse('${value[0].unread}') + 1,
          read: int.parse('${value[0].read}') - 1)));
      print('From unread: ${await _notify.currentValues()}');
    }
  }
}
