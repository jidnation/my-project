// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable
import 'package:my_project/Models/json_formatter.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Database {
  var database;
  var admin1 = User(id: 2, userName: 'JidNation', password: 'kunledami0');

  /// ADMIN-SECTION
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

  //Functon to add to the table
  Future<void> insertUser(User user) async {
    final db = await database; //creating reference to the database

    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //function to retrieve data from the table
  Future<List<User>> users() async {
    //Get a reference to the  table
    final db = await database;

    //Query the table for all the users
    final List<Map<String, dynamic>> maps = await db.query('selfReports');

    //Convert the Lis<Map<sstring, dynamic>> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        userName: maps[i]['userName'],
        password: maps[i]['password'],
      );
    });
  }

  //function to update data from the table
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

  ///SELF-REPORT SECTION

  //Open DataBase and store the reference.
  selfReportTableGen() async {
    //Create a user and add it to the admin table
    database = openDatabase(
      join(await getDatabasesPath(), 'Report.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE selfReports(id INTEGER PRIMARY KEY, surname TEXT, others TEXT, address TEXT, age NUMERIC, number NUMERIC, city TEXT,state TEXT,illnessHistory TEXT,haveIdea TEXT,healthIssue TEXT,commet TEXT,otherSymptoms TEXT,sex TEXT,symptoms TEXT,)',
        );
      },
      version: 1,
    );

    //Functon to add to the table
    Future<void> selfIReport(SelfReport sReport) async {
      //creating reference to the database
      final db = await database;

      await db.insert(
        'selfReports',
        sReport.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  //function to update data from the table
  Future<void> updateSReport(SelfReport sReport) async {
    //Get a reference to the  table
    final db = await database;

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

  //function to retrieve data from the table
  Future<List<SelfReport>> SelfReports() async {
    //Get a reference to the  table
    final db = await database;

    //Query the table for all the users
    final List<Map<String, dynamic>> maps = await db.query('SelfReport');

    //Convert the Lis<Map<sstring, dynamic>> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return SelfReport(
        id: maps[i]['id'],
        surname: maps[i]['surname'],
        others: maps[i]['others'],
        address: maps[i]['address'],
        age: maps[i]['age'],
        number: maps[i]['number'],
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

  //function to update data from the table
  Future<void> deleteSReport(SelfReport sReport) async {
    //Get a reference to the  table
    final db = await database;

    //Update the given user
    await db.delete(
      'selfReports',
      sReport.toMap(),

      //Ensure that the user has matching id.
      where: 'surname = ?',
      //Passthe Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [sReport.surname],
    );
  }

  ///OTHER-REPORT SECTION

  //Open DataBase and store the reference.
  otherReportTableGen() async {
    //Create a user and add it to the admin table
    database = openDatabase(
      join(await getDatabasesPath(), 'Report.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE otherReports(id INTEGER PRIMARY KEY, surname TEXT, others TEXT, address TEXT, age NUMERIC, sex TEXT, number NUMERIC, city TEXT, state TEXT, illnessHistory TEXT, pCommet TEXT, pNumber NUMERIC, pAddress TEXT, pSpecifyIllness TEXT,  pAge NUMERIC, rRelation TEXT, otherSymptoms TEXT, pSex TEXT, symptoms TEXT, pFullName TEXT)',
        );
      },
      version: 1,
    );

    //Functon to add to the table
    Future<void> OtherReports(OtherReport oReport) async {
      //creating reference to the database
      final db = await database;

      await db.insert(
        'otherReports',
        oReport.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  //function to update data from the table
  Future<void> updateOReport(OtherReport oReport) async {
    //Get a reference to the  table
    final db = await database;

    //Update the given user
    await db.update(
      'otherReports',
      oReport.toMap(),

      //Ensure that the user has matching id.
      where: 'pFullName = ?',
      //Passthe Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [oReport.pFullName],
    );
  }

  //function to retrieve data from the table
  Future<List<OtherReport>> OtherReports() async {
    //Get a reference to the  table
    final db = await database;

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
          illnessHistory: maps[i]['illnessHistory'],
          pCommet: maps[i]['pCommet'],
          pSex: maps[i]['pSex'],
          pAddress: maps[i]['pAddress'],
          sex: maps[i]['sex'],
          pFullName: maps[i]['pFullName'],
          pAge: maps[i]['pAge'],
          pNumber: maps[i]['pFullName'],
          pSpecifyIllness: maps[i]['pSpecifyIllness'],
          rRelation: maps[i]['pFullName'],
          symptoms: maps[i]['symptoms'],
          otherSymptoms: maps[i]['otherSymptoms']);
    });
  }

  //function to update data from the table
  Future<void> deleteOReport(OtherReport oReport) async {
    //Get a reference to the  table
    final db = await database;

    //Update the given user
    await db.delete(
      'otherfReports',
      oReport.toMap(),

      //Ensure that the user has matching id.
      where: 'surname = ?',
      //Passthe Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [oReport.surname],
    );
  }
}
