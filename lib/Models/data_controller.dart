import 'package:my_project/Models/configurations.dart';
import 'package:my_project/Routes/report_page.dart';
import 'package:my_project/Widgets/admin_form_reg.dart';
import 'package:my_project/Widgets/form_gen.dart';
import 'package:my_project/Widgets/tab_gen.dart';

class ReportData {
  Map<String, dynamic> selfReportData = {};
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

  void saveReportData() {
    surname = ReportingPage.surnameController.text;
    others = ReportingPage.othersController.text;
    address = ReportingPage.addressController.text;
    city = ReportingPage.cityController.text;
    state = ReportingPage.stateController.text;
    age = ReportingPage.ageController.text;
    otherSymptoms = SymptomsWidget.otherSymptomsController.text;
    number = ReportingPage.numberController.text;
    commet = SelfWidget.commentController.text;
    healthIssue = SelfWidget.healthIssuesController.text;
    haveIdea = SelfWidget.nameGuessingController.text;
    illnessHistory = SelfWidget.illnessHistoryController.text;

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
    // var symptomsChecked = {'symptoms': SymptomsCheckBox.symptoms};

    selfReportData.addAll(surnameStorage);
    selfReportData.addAll(othersStorage);
    selfReportData.addAll(addressStorage);
    selfReportData.addAll(cityStorage);
    selfReportData.addAll(stateStorage);
    selfReportData.addAll(ageStorage);
    selfReportData.addAll(numberStorage);
    selfReportData.addAll(illnessHistoryStorage);
    selfReportData.addAll(haveIdeaStorage);
    selfReportData.addAll(healthIssueStorage);
    selfReportData.addAll(commetStorage);
    selfReportData.addAll(otherSymptomsStorage);
    selfReportData.addAll(sex);

    print(selfReportData);
    // print(selfReportData['symptoms']);
  }
}

class OtherReportF {
  late Map<String, dynamic> otherReportData;

  String? surname;
  String? others;
  String? address;
  String? city;
  String? state;
  String? age;
  String? number;
  String? otherSymptoms;
  String? pCommet;
  String? pSpecifyIllness;
  String? rRelation;
  String? pAddress;
  String? pFullName;
  // String? pNumber;

  void saveReportData() {
    surname = ReportingPage.surnameController.text;
    others = ReportingPage.othersController.text;
    address = ReportingPage.addressController.text;
    city = ReportingPage.cityController.text;
    state = ReportingPage.stateController.text;
    age = ReportingPage.ageController.text;
    number = ReportingPage.numberController.text;
    otherSymptoms = SymptomsWidget.otherSymptomsController.text;
    pCommet = OthersWidget.pCommetController.text;
    pSpecifyIllness = OthersWidget.pSpecifyIllnessController.text;
    rRelation = OthersWidget.rRelationController.text;
    // pNumber = OthersWidget.pNumberController.text;
    pAddress = OthersWidget.pAddressController.text;
    pFullName = OthersWidget.pFullNameController.text;

    var surnameStorage = {'surname': surname};
    var othersStorage = {'others': others};
    var addressStorage = {'address': address};
    var cityStorage = {'city': city};
    var stateStorage = {'state': state};
    var ageStorage = {'age': age};
    var numberStorage = {'number': number};
    var otherSymptomsStorage = {'otherSymptoms': otherSymptoms};
    var sex = {'sex': RadioButton.sexValue};
    var symptomsChecked = {'symptoms': SymptomsCheckBox.symptoms};
    var pCommetStorage = {'pCommet': pCommet};
    var pSpecifyIllnessStorage = {'pSpecifyIllness': pSpecifyIllness};
    var rRelationStorage = {'rRelation': rRelation};
    // var pNumberStorage = {'pNumber': pNumber};
    var pAddressStorage = {'pAddress': pAddress};
    var pFullNameStorage = {'pFullName': pFullName};

    otherReportData.addAll(surnameStorage);
    otherReportData.addAll(othersStorage);
    otherReportData.addAll(addressStorage);
    otherReportData.addAll(cityStorage);
    otherReportData.addAll(stateStorage);
    otherReportData.addAll(otherSymptomsStorage);
    otherReportData.addAll(sex);
    otherReportData.addAll(ageStorage);
    otherReportData.addAll(numberStorage);
    otherReportData.addAll(symptomsChecked);
    otherReportData.addAll(pCommetStorage);
    otherReportData.addAll(pSpecifyIllnessStorage);
    otherReportData.addAll(rRelationStorage);
    // otherReportData.addAll(pNumberStorage);
    otherReportData.addAll(pAddressStorage);
    otherReportData.addAll(pFullNameStorage);

    print(otherReportData);
  }
}

class SignUpData {
  Map<String, dynamic> signUpData = {};
  String? aFirstname;
  String? aCity;
  String? ahospitalName;
  String? aMName;
  String? aLName;
  String? aSpecial;
  String? aState;
  String? aStreetAddress;
  String? aDOB;
  String? sex;
  String? aNumber1;
  String? aNumber2;
  String? aReligiou;
  String? aUserName;
  String? aPassword;
  String? aDescription;
  String? aEmail;

  void saveSignUp() {
    aFirstname = AdminFormReg.aFirstnameController.text;
    aCity = AdminFormReg.aCityController.text;
    ahospitalName = AdminFormReg.ahospitalNameController.text;
    aMName = AdminFormReg.aMNameController.text;
    aLName = AdminFormReg.aLNameController.text;
    aSpecial = AdminFormReg.aSpecialController.text;
    aState = AdminFormReg.aStateController.text;
    aStreetAddress = AdminFormReg.aStreetAddressController.text;
    aDOB = AdminFormReg.aDOBController.text;
    aNumber1 = AdminFormReg.aNumber1Controller.text;
    aNumber2 = AdminFormReg.aNumber2Controller.text;
    aReligiou = AdminFormReg.aReligiouController.text;
    aUserName = AdminFormReg.aUserNameController.text;
    aPassword = AdminFormReg.aPasswordController.text;
    aDescription = AdminFormReg.aDescriptionController.text;
    aEmail = AdminFormReg.aEmailController.text;

    var aFirstnameStorage = {'aFirstname': aFirstname};
    var aCityStorage = {'aCity': aCity};
    var ahospitalNameStorage = {'ahospitalName': ahospitalName};
    var aMNameStorage = {'aMName': aMName};
    var aLNameStorage = {'aLName': aLName};
    var aSpecialStorage = {'aSpecial': aSpecial};
    var aStateStorage = {'aState': aState};
    var aStreetAddressStorage = {'aStreetAddress': aStreetAddress};
    var aDOBStorage = {'aDOB': aDOB};
    var aNumber1Storage = {'aNumber1': aNumber1};
    var aNumber2Storage = {'aNumber2': aNumber2};
    var aReligiouStorage = {'aReligiou': aReligiou};
    var aUserNameStorage = {'aUserName': aUserName};
    var aPasswordStorage = {'aPassword': aPassword};
    var aDescriptionStorage = {'aDescription': aDescription};
    var aEmailStorage = {'aEmail': aEmail};
    var sex = {'sex': RadioButton.sexValue};

    signUpData.addAll(aFirstnameStorage);
    signUpData.addAll(aCityStorage);
    signUpData.addAll(ahospitalNameStorage);
    signUpData.addAll(aMNameStorage);
    signUpData.addAll(aLNameStorage);
    signUpData.addAll(aSpecialStorage);
    signUpData.addAll(aStateStorage);
    signUpData.addAll(aStreetAddressStorage);
    signUpData.addAll(aDOBStorage);
    signUpData.addAll(aNumber1Storage);
    signUpData.addAll(aNumber2Storage);
    signUpData.addAll(aReligiouStorage);
    signUpData.addAll(aUserNameStorage);
    signUpData.addAll(aPasswordStorage);
    signUpData.addAll(aDescriptionStorage);
    signUpData.addAll(aEmailStorage);
    signUpData.addAll(sex);

    print(signUpData);
  }
}
