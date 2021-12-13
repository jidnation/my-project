// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, use_key_in_widget_constructors
import 'package:flutter/cupertino.dart';
import 'package:my_project/Models/json_formatter.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Database extends StatefulWidget {
  @override
  State<Database> createState() => _DatabaseState();

  var database;

  /// ADMIN-SECTION (USERS).
//Open DataBase and store the reference.
  tableGen() async {
    //Create a user and add it to the admin table
    database = openDatabase(
      join(await getDatabasesPath(), 'Users_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, userName TEXT, password TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insert(User user) async {
    final db = await database; //creating reference to the database

    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<User>> users() async {
    //Get a reference to the  table
    final db = await database;

    //Query the table for all the users
    final List<Map<String, dynamic>> maps = await db.query('users');

    //Convert the Lis<Map<sstring, dynamic>> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        userName: maps[i]['userName'],
        password: maps[i]['password'],
      );
    });
  }

  Future<void> updateUser(User user) async {
    //Get a reference to the  table
    final db = await database;

    //Update the given user
    await db.update(
      'users',
      user.toMap(),

      //Ensure that the user has matching id.
      where: 'userName = ?',
      //Passthe Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [user.userName],
    );
  }

  Future<void> userDeleter(String user) async {
    //Get a reference to the database
    final db = await database;

    //Remove the Dog from the database.
    await db.delete(
      'users',
      //Use a where  clause to delete a specific dog.
      where: 'userName = ?',
      //Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [user],
    );
  }
}

final _notiDatabase = NotificationDB();
final _reporting = Reporter();

class Reporter {
  bool isRead = false;
  int unread = 0;
  int read = 0;

  valueSetter() async {
    await _notiDatabase.notificationTable();
    await _notiDatabase
        .currentValues()
        .then((value) => _notiDatabase.notiInsert(Values(
              id: 1,
              read: (value[0].read == null) ? 0 : value[0].read,
              unread: (value[0].unread == null)
                  ? 1
                  : ((value[0].unread as int) + 1),
            )));
  }
}

class _DatabaseState extends State<Database> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class AdminDatabase extends StatefulWidget {
  @override
  State<AdminDatabase> createState() => _AdminDatabaseState();

  var adminDatabase;

  var admin1 = User(id: 2, userName: 'JidNation', password: 'kunledami0');

  AdminSignUp adminSignUpSetch = AdminSignUp(
      sex: 'Male',
      id: 1,
      aFirstname: 'Babajide',
      aCity: 'Akure',
      ahospitalName: 'Primary Health Care, Enuwa, ife-central',
      aMName: 'Damilola',
      aLName: 'Olatunji',
      aSpecial: 'Surveillance Officer',
      aState: 'Ondo State',
      aStreetAddress: '1, modakeke Street',
      aDOB: '01/09/1995',
      aNumber1: 08033962132,
      aNumber2: 07069533773,
      aReligiou: 'Christain',
      aUserName: 'Adeola',
      aPassword: '12345678',
      aDescription: 'Nothing much to say about me',
      aEmail: 'jaid1074@gmail.com');

  ///ADMIN-SIGNUP SECTION

  //Open DataBase and store the reference.
  adminRegTableGen() async {
    //Create a user and add it to the admin table
    adminDatabase = openDatabase(
      join(await getDatabasesPath(), 'AdminSignUp.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE adminReg(id INTEGER PRIMARY KEY, aFirstname TEXT, ahospitalName TEXT, aMName TEXT, aLName TEXT, aState TEXT, aCity TEXT, aSpecial TEXT, aStreetAddress TEXT, aDOB TEXT, aNumber1 INTEGER, aNumber2 INTEGER, aReligiou TEXT, aUserName TEXT, aPassword TEXT, aDescription TEXT, aEmail TEXT , sex TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertAdmin(AdminSignUp adminReg) async {
    final _database = Database();
    await _database.tableGen();
    int currentUsersNumbers =
        await _database.users().then((value) => value.length);
    //creating reference to the database
    final db = await adminDatabase;

    await db.insert(
      'adminReg',
      adminReg.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await _database.insert(User(
        id: currentUsersNumbers++,
        userName: adminReg.aUserName,
        password: adminReg.aPassword));
  }

  Future<void> updateAdmin(AdminSignUp adminReg) async {
    //Get a reference to the  table
    final db = await adminDatabase;

    //Update the given user
    await db.update(
      'adminReg',
      adminReg.toMap(),

      //Ensure that the user has matching id.
      where: 'aEmail = ?',
      //Passthe Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [adminReg.aEmail],
    );
  }

  Future<List<AdminSignUp>> adminList() async {
    //Get a reference to the  table
    final db = await adminDatabase;

    //Query the table for all the users
    final List<Map<String, dynamic>> maps = await db.query('adminReg');

    //Convert the Lis<Map<sstring, dynamic>> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return AdminSignUp(
        id: maps[i]['id'],
        aFirstname: maps[i]['aFirstname'],
        aCity: maps[i]['aCity'],
        ahospitalName: maps[i]['ahospitalName'],
        aMName: maps[i]['aMName'],
        aLName: maps[i]['aLName'],
        aSpecial: maps[i]['aSpecial'],
        aState: maps[i]['aState'],
        aStreetAddress: maps[i]['aStreetAddress'],
        aDOB: maps[i]['aDOB'],
        aNumber1: maps[i]['aNumber1'],
        aNumber2: maps[i]['aNumber2'],
        aReligiou: maps[i]['aReligiou'],
        aUserName: maps[i]['aUserName'],
        aPassword: maps[i]['aPassword'],
        aDescription: maps[i]['aDescription'],
        aEmail: maps[i]['aEmail'],
        sex: maps[i]['sex'],
      );
    });
  }

  Future<void> deleteAdmin(AdminSignUp admin) async {
    //Get a reference to the  table
    final db = await adminDatabase;

    //Update the given user
    await db.delete(
      'adminReg',
      admin.toMap(),

      //Ensure that the user has matching id.
      where: 'aEmail = ?',
      //Passthe Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [admin.aEmail],
    );
  }
}

class _AdminDatabaseState extends State<AdminDatabase> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class SelfDatabase extends StatefulWidget {
  SelfDatabase({Key? key}) : super(key: key);

  @override
  State<SelfDatabase> createState() => _SelfDatabaseState();

  var selfDatabase;

  ///SELF-REPORT SECTION

  //Open DataBase and store the reference.
  selfReportTableGen() async {
    //Create a user and add it to the admin table
    selfDatabase = openDatabase(
      join(await getDatabasesPath(), 'Self_Reports.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE selfReports(id INTEGER PRIMARY KEY, surname TEXT, others TEXT, address TEXT, age INTEGER, number INTEGER, city TEXT, state TEXT, illnessHistory TEXT, haveIdea TEXT, healthIssue TEXT, commet TEXT, otherSymptoms TEXT, sex TEXT, symptoms TEXT)');
      },
      version: 1,
    );
  }

  Future<void> insertSelfReport(SelfReport sReport) async {
    final _general = GeneralDB();

    //creating reference to the database
    final db = await selfDatabase;

    await db.insert(
      'selfReports',
      sReport.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    var data2 = sReport.toMap();

    await _general.generalTableGen();
    await _general.insertGeneral(GeneralData(
      type: 'self',
      isRead: 'unread',
      surname: data2['surname'],
      others: data2['others'],
      address: data2['address'],
      state: data2['state'],
      city: data2['city'],
      sex: data2['sex'],
      number: data2['number'],
      age: data2['age'],
      symptoms: data2['symptoms'],
      otherSymptoms: data2['otherSymptoms'],
      illnessHistory: data2['illnessHistory'],
      id: data2['id'],
      haveIdea: data2['haveIdea'],
      healthIssue: data2['healthIssue'],
      commet: data2['commet'],
    ));
  }

  Future<void> updateSReport(SelfReport sReport) async {
    //Get a reference to the  table
    final db = await selfDatabase;

    //Update the given user
    await db.update(
      'selfReports',
      sReport.toMap(),

      //Ensure that the user has matching id.
      where: 'surname = ?',
      //Passthe Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [sReport.surname],
    );
  }

  Future<List<SelfReport>> selfReport() async {
    //Get a reference to the  table
    final db = await selfDatabase;

    //Query the table for all the reports
    final List<Map<String, dynamic>> maps = await db.query('SelfReports');

    //Convert the Lis<Map<sstring, dynamic>> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return SelfReport(
        id: maps[i]['id'],
        surname: maps[i]['surname'],
        others: maps[i]['others'],
        address: maps[i]['address'],
        age: maps[i]['age'],
        number: maps[i]['number'],
        healthIssue: maps[i]['healthIssue'],
        city: maps[i]['city'],
        state: maps[i]['state'],
        illnessHistory: maps[i]['illnessHistory'],
        haveIdea: maps[i]['haveIdea'],
        commet: maps[i]['commet'],
        otherSymptoms: maps[i]['otherSymptoms'],
        sex: maps[i]['sex'],
        symptoms: maps[i]['symptoms'],
      );
    });
  }
}

class _SelfDatabaseState extends State<SelfDatabase> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class OtherDatabase extends StatefulWidget {
  var otherDatabase;

  @override
  State<OtherDatabase> createState() => _OtherDatabaseState();

  ///OTHER-REPORT SECTION

  //Open DataBase and store the reference.
  otherReportTableGen() async {
    //Create a user and add it to the admin table
    otherDatabase = openDatabase(
      join(await getDatabasesPath(), 'OtherReport.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE otherReports(id INTEGER PRIMARY KEY, surname TEXT, others TEXT, address TEXT, age INTEGER, sex TEXT, number INTEGER, city TEXT, state TEXT, pFullName TEXT, pCommet TEXT, pAddress TEXT, pSpecifyIllness TEXT, rRelation TEXT, otherSymptoms TEXT, symptoms TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertOtherReport(OtherReport oReport) async {
    final _general = GeneralDB();
    //creating reference to the database
    final db = await otherDatabase;

    await db.insert(
      'otherReports',
      oReport.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    var data2 = oReport.toMap();
    await _general.generalTableGen();
    await _general.insertGeneral(GeneralData(
      type: 'others',
      isRead: 'unread',
      surname: data2['surname'],
      others: data2['others'],
      address: data2['address'],
      state: data2['state'],
      city: data2['city'],
      sex: data2['sex'],
      number: data2['number'],
      age: data2['age'],
      symptoms: data2['symptoms'],
      otherSymptoms: data2['otherSymptoms'],
      pFullName: data2['pFullName'],
      pAddress: data2['pAddress'],
      rRelation: data2['rRelation'],
      pSpecifyIllness: data2['pSpecifyIllness'],
      pCommet: data2['pCommet'],
      id: data2['id'],
    ));
  }

  Future<void> updateOReport(OtherReport oReport) async {
    //Get a reference to the  table
    final db = await otherDatabase;

    //Update the given user
    await db.update(
      'otherReports',
      oReport.toMap(),

      //Ensure that the user has matching id.
      where: 'pFullName = ?',
      //Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [oReport.pFullName],
    );
  }

  Future<List<OtherReport>> otherReportList() async {
    //Get a reference to the  table
    final db = await otherDatabase;

    //Query the table for all the users
    final List<Map<String, dynamic>> maps = await db.query('otherReports');

    //Convert the Lis<Map<sstring, dynamic>> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return OtherReport(
          id: maps[i]['id'],
          surname: maps[i]['surname'],
          others: maps[i]['others'],
          address: maps[i]['address'],
          age: maps[i]['age'],
          number: maps[i]['number'],
          city: maps[i]['city'],
          state: maps[i]['state'],
          pCommet: maps[i]['pCommet'],
          pAddress: maps[i]['pAddress'],
          sex: maps[i]['sex'],
          pFullName: maps[i]['pFullName'],
          pSpecifyIllness: maps[i]['pSpecifyIllness'],
          rRelation: maps[i]['rRelation'],
          symptoms: maps[i]['symptoms'],
          otherSymptoms: maps[i]['otherSymptoms']);
    });
  }

  Future<void> deleteOReport(OtherReport oReport) async {
    //Get a reference to the  table
    final db = await otherDatabase;

    //Update the given user
    await db.delete(
      'otherReports',
      oReport.toMap(),

      //Ensure that the user has matching id.
      where: 'surname = ?',
      //Passthe Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [oReport.surname],
    );
  }
}

class _OtherDatabaseState extends State<OtherDatabase> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class GeneralDB extends StatefulWidget {
  GeneralDB({Key? key, id}) : super(key: key);

  @override
  _GeneralDBState createState() => _GeneralDBState();

  var generalDB;

  ///GENERAL-REPORT SECTION

  //Open DataBase and store the reference.
  generalTableGen() async {
    //Create a user and add it to the admin table
    generalDB = openDatabase(
      join(await getDatabasesPath(), 'GenReportContainer.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE generalReports(id INTEGER PRIMARY KEY, surname TEXT, isRead TEXT, type TEXT, others TEXT, address TEXT, age INTEGER, number INTEGER, city TEXT, state TEXT, illnessHistory TEXT, haveIdea TEXT, healthIssue TEXT, commet TEXT, otherSymptoms TEXT, sex TEXT, symptoms TEXT, pFullName TEXT, pCommet TEXT, pAddress TEXT, pSpecifyIllness TEXT, rRelation TEXT)');
      },
      version: 1,
    );
  }

  Future<void> insertGeneral(GeneralData gReport) async {
    //creating reference to the database
    final db = await generalDB;

    await _reporting.valueSetter();

    await db.insert(
      'generalReports',
      gReport.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateSReport(GeneralData gReport) async {
    //Get a reference to the  table
    final db = await generalDB;

    //Update the given user
    await db.update(
      'generalReports',
      gReport.toMap(),

      //Ensure that the user has matching id.
      where: 'surname = ?',
      //Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [gReport.surname],
    );
  }

  Future<List<GeneralData>> generalReport() async {
    //Get a reference to the  table
    final db = await generalDB;

    //Query the table for all the reports
    final List<Map<String, dynamic>> maps = await db.query('generalReports');

    //Convert the Lis<Map<String, dynamic>> into a List.
    return List.generate(maps.length, (i) {
      return GeneralData(
          id: maps[i]['id'],
          surname: maps[i]['surname'],
          type: maps[i]['type'],
          isRead: maps[i]['isRead'],
          others: maps[i]['others'],
          address: maps[i]['address'],
          age: maps[i]['age'],
          number: maps[i]['number'],
          healthIssue: maps[i]['healthIssue'],
          city: maps[i]['city'],
          state: maps[i]['state'],
          illnessHistory: maps[i]['illnessHistory'],
          haveIdea: maps[i]['haveIdea'],
          commet: maps[i]['commet'],
          otherSymptoms: maps[i]['otherSymptoms'],
          symptoms: maps[i]['symptoms'],
          pCommet: maps[i]['pCommet'],
          pAddress: maps[i]['pAddress'],
          sex: maps[i]['sex'],
          pFullName: maps[i]['pFullName'],
          pSpecifyIllness: maps[i]['pSpecifyIllness'],
          rRelation: maps[i]['rRelation']);
    });
  }
}

class _GeneralDBState extends State<GeneralDB> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class NotificationDB extends StatefulWidget {
  @override
  State<NotificationDB> createState() => _NotificationDBState();

  var notifyDatabase;

  notificationTable() async {
    //Create a user and add it to the admin table
    notifyDatabase = openDatabase(
      join(await getDatabasesPath(), 'NotificationTabl.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE dataVal(id INTEGER PRIMARY KEY, read INTEGER, unread INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<void> notiInsert(Values _values) async {
    final db = await notifyDatabase; //creating reference to the database

    await db.insert(
      'dataVal',
      _values.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Values>> currentValues() async {
    //Get a reference to the  table
    final db = await notifyDatabase;

    //Query the table for all the users
    final List<Map<String, dynamic>> maps = await db.query('dataVal');

    //Convert the Lis<Map<sstring, dynamic>> into a List<values>.
    return List.generate(maps.length, (i) {
      return Values(
          id: maps[i]['id'], unread: maps[i]['unread'], read: maps[i]['read']);
    });
  }

  Future<void> updateValues(Values _value) async {
    //Get a reference to the  table
    final db = await notifyDatabase;

    //Update the given user
    await db.update(
      'dataVal',
      _value.toMap(),

      //Ensure that the user has matching id.
      where: 'id = ?',
      //Passthe Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [_value.id],
    );
  }
}

class _NotificationDBState extends State<NotificationDB> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
