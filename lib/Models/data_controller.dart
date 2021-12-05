
import 'package:my_project/Models/configurations.dart';
import 'package:my_project/Routes/report_page.dart';
import 'package:my_project/Widgets/form_gen.dart';
import 'package:my_project/Widgets/tab_gen.dart';

class ReportData {
  Map<String, dynamic> reportData = {};
  String? surname;
  String? others;
  String? address;
  String? city;
  String? state;
  String? age;
  String? number;
  String? otherSymptoms;
  String? illnessHistory;
  String? haveIdea;
  String? healthIssue;
  String? commet;
  String? pCommet;
  String? pSpecifyIllness;
  String? rRelation;
  String? pAge;
  String? pNumber;
  String? pAddress;
  String? pFullName;

  // String? sexStorage;
  // String? fullNameStorage;
  // String? pNumberStorage;
  // String? relationStorage;
  // String? pAddressStorage;

  // List dataList = [];

  void saveReportData() {
    surname = ReportingPage.surnameController.text;
    others = ReportingPage.othersController.text;
    address = ReportingPage.addressController.text;
    city = ReportingPage.cityController.text;
    state = ReportingPage.stateController.text;
    age = ReportingPage.ageController.text;
    // otherSymptoms = SymptomsWidget.otherSymptomsController.text;
    pCommet = OthersWidget.pCommetController.text;
    pSpecifyIllness = OthersWidget.pSpecifyIllnessController.text;
    rRelation = OthersWidget.rRelationController.text;
    pAge = OthersWidget.pAgeController.text;
    pNumber = OthersWidget.pNumberController.text;
    pAddress = OthersWidget.pAddressController.text;
    pFullName = OthersWidget.pFullNameController.text;

    var surnameStorage = {'surname': surname};
    var othersStorage = {'others': others};
    var addressStorage = {'address': address};
    var cityStorage = {'city': city};
    var stateStorage = {'state': state};
    var ageStorage = {'age': age};
    var numberStorage = {'number': number};
    var illnessHistoryStorage = {'illnessHistory': illnessHistory};
    var haveIdeaStorage = {'haveIdea': haveIdea};
    var healthIssueStorage = {'healthIssue': healthIssue};
    var commetStorage = {'commet': commet};
    var otherSymptomsStorage = {'otherSymptoms': otherSymptoms};
    var sex = {'sex': RadioButton.sexValue};
    var symptomsChecked = {'symptoms': SymptomsCheckBox.symptoms};
    var pCommetStorage = {'pCommet': pCommet};
    var pSpecifyIllnessStorage = {'pSpecifyIllness': pSpecifyIllness};
    var rRelationStorage = {'rRelation': rRelation};
    var pAgeStorage = {'pAge': pAge};
    var pNumberStorage = {'pNumber': pNumber};
    var pAddressStorage = {'pAddress': pAddress};
    var pFullNameStorage = {'pFullName': pFullName};

    reportData.addAll(surnameStorage);
    reportData.addAll(othersStorage);
    reportData.addAll(addressStorage);
    reportData.addAll(cityStorage);
    reportData.addAll(stateStorage);
    reportData.addAll(ageStorage);
    reportData.addAll(numberStorage);
    reportData.addAll(illnessHistoryStorage);
    reportData.addAll(haveIdeaStorage);
    reportData.addAll(healthIssueStorage);
    reportData.addAll(commetStorage);
    reportData.addAll(otherSymptomsStorage);
    reportData.addAll(sex);
    reportData.addAll(symptomsChecked);
    reportData.addAll(pCommetStorage);
    reportData.addAll(pSpecifyIllnessStorage);
    reportData.addAll(rRelationStorage);
    reportData.addAll(pAgeStorage);
    reportData.addAll(pNumberStorage);
    reportData.addAll(pAddressStorage);
    reportData.addAll(pFullNameStorage);

    print(reportData);
  }

  void saveReportData2() {
    surname = ReportingPage.surnameController.text;
    others = ReportingPage.othersController.text;
    address = ReportingPage.addressController.text;
    city = ReportingPage.cityController.text;
    state = ReportingPage.stateController.text;
    age = ReportingPage.ageController.text;
    number = ReportingPage.numberController.text;
    illnessHistory = SelfWidget.illnessHistoryController.text;
    haveIdea = SelfWidget.nameGuessingController.text;
    healthIssue = SelfWidget.healthIssuesController.text;
    commet = SelfWidget.commentController.text;
    // otherSymptoms = SymptomsWidget.otherSymptomsController.text;
    pCommet = OthersWidget.pCommetController.text;
    pSpecifyIllness = OthersWidget.pSpecifyIllnessController.text;
    rRelation = OthersWidget.rRelationController.text;
    pAge = OthersWidget.pAgeController.text;
    pNumber = OthersWidget.pNumberController.text;
    pAddress = OthersWidget.pAddressController.text;
    pFullName = OthersWidget.pFullNameController.text;

    var surnameStorage = {'surname': surname};
    var othersStorage = {'others': others};
    var addressStorage = {'address': address};
    var cityStorage = {'city': city};
    var stateStorage = {'state': state};
    var otherSymptomsStorage = {'otherSymptoms': otherSymptoms};
    var sex = {'sex': RadioButton.sexValue};
    var symptomsChecked = {'symptoms': SymptomsCheckBox.symptoms};
    var pCommetStorage = {'pCommet': pCommet};
    var pSpecifyIllnessStorage = {'pSpecifyIllness': pSpecifyIllness};
    var rRelationStorage = {'rRelation': rRelation};
    var pAgeStorage = {'pAge': pAge};
    var pNumberStorage = {'pNumber': pNumber};
    var pAddressStorage = {'pAddress': pAddress};
    var pFullNameStorage = {'pFullName': pFullName};

    reportData.addAll(surnameStorage);
    reportData.addAll(othersStorage);
    reportData.addAll(addressStorage);
    reportData.addAll(cityStorage);
    reportData.addAll(stateStorage);
    reportData.addAll(otherSymptomsStorage);
    reportData.addAll(sex);
    reportData.addAll(symptomsChecked);
    reportData.addAll(pCommetStorage);
    reportData.addAll(pSpecifyIllnessStorage);
    reportData.addAll(rRelationStorage);
    reportData.addAll(pAgeStorage);
    reportData.addAll(pNumberStorage);
    reportData.addAll(pAddressStorage);
    reportData.addAll(pFullNameStorage);

    print(reportData);
  }
}
