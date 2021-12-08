import 'package:my_project/Widgets/admin_form_reg.dart';
import 'package:my_project/Widgets/form_gen.dart';
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
  }
}
