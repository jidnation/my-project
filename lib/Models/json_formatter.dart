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
  final String? id;
  final String surname;
  final String others;
  final String address;
  final String age;
  final String number;
  final String city;
  final String state;
  final String illnessHistory;
  final String? haveIdea;
  final String? healthIssue;
  final String commet;
  final String otherSymptoms;
  final String symptoms;
  final String sex;

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
      this.haveIdea,
      this.healthIssue,
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
      'commet': commet,
      'otherSymptoms': otherSymptoms,
      'symptoms': symptoms,
      'sex': sex,
    };
  }

  @override
  String toString() {
    return 'SelfReport{ id : $id, surname : $surname, others : $others, address : $address, age : $age, number : $number, city : $city, state : $state, illnessHistory : $illnessHistory,haveIdea : $haveIdea, commet : $commet, otherSymptoms : $otherSymptoms, sex : $sex,  symptoms : $symptoms}';
  }
}

class OtherReport {
  final String? id;
  final String surname;
  final String others;
  final String address;
  final String city;
  final String sex;
  final String state;
  final String age;
  final String number;
  final String? illnessHistory;
  final String pCommet;
  final String pSpecifyIllness;
  final String rRelation;
  final String pAge;
  final String pSex;
  final String pNumber;
  final String pAddress;
  final String pFullName;
  final String? otherSymptoms;
  final String symptoms;

  OtherReport({required this.otherSymptoms,  required this.symptoms, 
      required this.id,
      required this.surname,
      required this.others,
      required this.address,
      required this.city,
      required this.sex,
      required this.state,
      required this.age,
      required this.number,
      required this.illnessHistory,
      required this.pCommet,
      required this.pSpecifyIllness,
      required this.rRelation,
      required this.pAge,
      required this.pSex,
      required this.pNumber,
      required this.pAddress,
      required this.pFullName, otherSymptom});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'surname': surname,
      'other': others,
      'address': address,
      'city': city,
      'sex': sex,
      'state': state,
      'age': age,
      'number': number,
      'illnessHistory': illnessHistory,
      'pcommet': pCommet,
      'pSpecifyIllness': pSpecifyIllness,
      'rRelation': rRelation,
      'pAge': pAge,
      'pSex': pSex,
      'pNumber': pNumber,
      'pAddress': pAddress,
      'pFullName': pFullName,
      'otherSymptoms': otherSymptoms,
      'symptoms': symptoms,
    };
  }

  @override
  String toString() {
    return 'OtherReport{ id: $id, surname: $surname, symptoms : $symptoms, otherSymptoms : $otherSymptoms, other: $others, address: $address, city: $city, sex: $sex, state: $state, age: $age, number: $number, illnessHistory: $illnessHistory, pcommet: $pCommet, pSpecifyIllness: $pSpecifyIllness, rRelation: $rRelation, pAge: $pAge, pSex: $pSex, pNumber: $pNumber, pAddress: $pAddress, pFullName: $pFullName }';
  }
}
