class User {
  final int id;
  final String userName;
  final String password;

  User({required this.id, required this.userName, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, userName: $userName, password: $password}';
  }
}

class SelfReport {
  final int? id;
  final String? surname;
  final String? others;
  final String? address;
  final int? age;
  final int? number;
  final String? city;
  final String? state;
  final String? illnessHistory;
  final String? haveIdea;
  final String? healthIssue;
  final String? commet;
  final String? otherSymptoms;
  final String? symptoms;
  final String? sex;

  SelfReport(
      {this.id,
      required this.surname,
      required this.others,
      required this.address,
      required this.age,
      required this.number,
      required this.city,
      required this.state,
      required this.illnessHistory,
      required this.haveIdea,
      required this.healthIssue,
      required this.commet,
      required this.otherSymptoms,
      required this.sex,
      required this.symptoms});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'surname': surname,
      'others': others,
      'address': address,
      'age': age,
      'number': number,
      'city': city,
      'state': state,
      'illnessHistory': illnessHistory,
      'haveIdea': haveIdea,
      'healthIssue': healthIssue,
      'commet': commet,
      'otherSymptoms': otherSymptoms,
      'symptoms': symptoms,
      'sex': sex,
    };
  }

  @override
  String toString() {
    return 'SelfReport{ id : $id, surname : $surname, healthIssue : $healthIssue, others : $others, address : $address, age : $age, number : $number, city : $city, state : $state, illnessHistory : $illnessHistory,haveIdea : $haveIdea, commet : $commet, otherSymptoms : $otherSymptoms, sex : $sex,  symptoms : $symptoms}';
  }
}

class OtherReport {
  final int? id;
  final String? surname;
  final String? others;
  final String? address;
  final String? city;
  final String? sex;
  final String? state;
  final int? age;
  final int? number;
  final String? pCommet;
  final String? pSpecifyIllness;
  final String? rRelation;
  final String? pAddress;
  final String? pFullName;
  final String? otherSymptoms;
  final String? symptoms;

  OtherReport(
      {required this.otherSymptoms,
      required this.symptoms,
      required this.id,
      required this.surname,
      required this.others,
      required this.address,
      required this.city,
      required this.sex,
      required this.state,
      required this.age,
      required this.number,
      required this.pCommet,
      required this.pSpecifyIllness,
      required this.rRelation,
      required this.pAddress,
      required this.pFullName,
      otherSymptom});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'surname': surname,
      'others': others,
      'address': address,
      'city': city,
      'sex': sex,
      'state': state,
      'age': age,
      'number': number,
      'pcommet': pCommet,
      'pSpecifyIllness': pSpecifyIllness,
      'rRelation': rRelation,
      'pAddress': pAddress,
      'pFullName': pFullName,
      'otherSymptoms': otherSymptoms,
      'symptoms': symptoms,
    };
  }

  @override
  String toString() {
    return 'OtherReport{ id: $id, surname: $surname, symptoms : $symptoms, otherSymptoms : $otherSymptoms, other: $others, address: $address, city: $city, sex: $sex, state: $state, age: $age, number: $number, pcommet: $pCommet, pSpecifyIllness: $pSpecifyIllness, rRelation: $rRelation, pAddress: $pAddress, pFullName: $pFullName }';
  }
}

class AdminSignUp {
  final int? id;
  final String aFirstname;
  final String aCity;
  final String ahospitalName;
  final String aMName;
  final String aLName;
  final String aSpecial;
  final String aState;
  final String aStreetAddress;
  final String aDOB;
  final int aNumber1;
  final int aNumber2;
  final String aReligiou;
  final String aUserName;
  final String aPassword;
  final String aDescription;
  final String aEmail;
  final String sex;

  AdminSignUp(
      {required this.sex,
      required this.id,
      required this.aFirstname,
      required this.aCity,
      required this.ahospitalName,
      required this.aMName,
      required this.aLName,
      required this.aSpecial,
      required this.aState,
      required this.aStreetAddress,
      required this.aDOB,
      required this.aNumber1,
      required this.aNumber2,
      required this.aReligiou,
      required this.aUserName,
      required this.aPassword,
      required this.aDescription,
      required this.aEmail});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'aFirstname': aFirstname,
      'aCity': aCity,
      'ahospitalName': ahospitalName,
      'aMName': aMName,
      'aLName': aLName,
      'aSpecial': aSpecial,
      'aState': aState,
      'aStreetAddress': aStreetAddress,
      'aDOB': aDOB,
      'aNumber1': aNumber1,
      'aNumber2': aNumber2,
      'aReligiou': aReligiou,
      'aUserName': aUserName,
      'aPassword': aPassword,
      'aDescription': aDescription,
      'aEmail': aEmail,
      'sex': sex,
    };
  }

  @override
  String toString() {
    return 'AdminSingUp{ id: $id, aFirstname :aFirstname, aCity : $aCity, ahospitalName : $ahospitalName, aMName : $aMName, aLName : $aLName, aSpecial : $aSpecial, aState : $aState, aStreetAddress : $aStreetAddress, aDOB : $aDOB, aNumber1 : $aNumber1, aNumber2 : $aNumber2, aReligiou : $aReligiou, aUserName : $aUserName, aPassword : $aPassword, aDescription : $aDescription, aEmail : $aEmail , sex : $sex };}';
  }
}

class Values {
  final int id;
  final int? read;
  final int? unread;

  Values({required this.id, this.read, this.unread});

  Map<String, dynamic> toMap() {
    return {
      //(oUnread as int) + (unread as int)
      'id': id,
      'read': read,
      'unread': unread,
    };
  }

  @override
  String toString() {
    return 'Values{id : $id, read: $read, unread: $unread}';
  }
}

class GeneralData {
  final int? id;
  final String? isRead;
  final String? surname;
  final String? others;
  final String? address;
  final int? age;
  final int? number;
  final String? city;
  final String? state;
  final String? illnessHistory;
  final String? haveIdea;
  final String? healthIssue;
  final String? commet;
  final String? sex;
  final String? pCommet;
  final String? pSpecifyIllness;
  final String? rRelation;
  final String? pAddress;
  final String? pFullName;
  final String? otherSymptoms;
  final String? symptoms;
  final String type;

  GeneralData(
      {required this.isRead,
      this.id,
      this.surname,
      required this.type,
      this.others,
      this.address,
      this.age,
      this.number,
      this.city,
      this.state,
      this.illnessHistory,
      this.haveIdea,
      this.healthIssue,
      this.commet,
      this.sex,
      this.pCommet,
      this.pSpecifyIllness,
      this.rRelation,
      this.pAddress,
      this.pFullName,
      this.otherSymptoms,
      this.symptoms});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isRead': isRead,
      'type': type,
      'surname': surname,
      'others': others,
      'address': address,
      'age': age,
      'number': number,
      'city': city,
      'state': state,
      'illnessHistory': illnessHistory,
      'haveIdea': haveIdea,
      'healthIssue': healthIssue,
      'commet': commet,
      'sex': sex,
      'pCommet': pCommet,
      'pSpecifyIllness': pSpecifyIllness,
      'rRelation': rRelation,
      'pAddress': pAddress,
      'pFullName': pFullName,
      'otherSymptoms': otherSymptoms,
      'symptoms': symptoms,
    };
  }

  @override
  String toString() {
    return 'GeneralData{ id : $id, surname : $surname, isRead : $isRead, type : $type, healthIssue : $healthIssue, others : $others, address : $address, age : $age, number : $number, city : $city, state : $state, illnessHistory : $illnessHistory,haveIdea : $haveIdea, commet : $commet, otherSymptoms : $otherSymptoms, sex : $sex,  symptoms : $symptoms, pcommet: $pCommet, pSpecifyIllness: $pSpecifyIllness, rRelation: $rRelation, pAddress: $pAddress, pFullName: $pFullName}';
  }
}
