// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_project/Models/json_formatter.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBase extends StatefulWidget {
  DataBase({Key? key}) : super(key: key);

  @override
  State<DataBase> createState() => _DataBaseState();
  static var database;

  databaseControlRoom() async {
    DataBase.database = openDatabase(
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
  // Future<void> insertUseruserInserter

  //Create a user and add it to the admin table
  // await insertUser(admin1);

  //function to retrieve data from the table
  // Future<List<User>> userGetter

  // print(await users());

  //function to update data from the table
  // const DataBase().userUdater(admin1);

  // await updateuser(admin1);

  //print the updated results.
  // print(await users());

  userInserter(User user) async {
    final db = await DataBase.database; //creating reference to the database

    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  var admin1 = User(id: 1, userName: 'JidNation', password: '12345678');
  //  User admin1 = User(id: admin1.id, userName: admin1.userName, password: 'adeola123');

  //function to retrieve data from the table
  userGetter() async {
    //Get a reference to the  table
    final db = await DataBase.database;

    //Query the table for all the users
    final List<Map<String, dynamic>> maps = await db.query('Users');

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
  userUdater(User user) async {
    //Get a reference to the  table
    final db = await DataBase.database;

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
    final db = await DataBase.database;

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

class _DataBaseState extends State<DataBase> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  // databaseControlRoom() async {
  //   DataBase.database = openDatabase(
  //     join(await getDatabasesPath(), 'Users_database.db'),
  //     onCreate: (db, version) {
  //       return db.execute(
  //         'CREATE TABLE users(id INTEGER PRIMARY KEY, userName TEXT, password TEXT)',
  //       );
  //     },
  //     version: 1,
  //   );

  //   //Functon to add to the table
  //   Future<void> insertUser(User user) async {
  //     final db = await DataBase.database; //creating reference to the database

  //     await db.insert(
  //       'users',
  //       user.toMap(),
  //       conflictAlgorithm: ConflictAlgorithm.replace,
  //     );
  //   }

  //   //Create a user and add it to the admin table
  //   var admin1 = User(id: 1, userName: 'JidNation', password: '12345678');
  //   await insertUser(admin1);

  //   //function to retrieve data from the table
  //   Future<List<User>> users() async {
  //     //Get a reference to the  table
  //     final db = await DataBase.database;

  //     //Query the table for all the users
  //     final List<Map<String, dynamic>> maps = await db.query('Users');

  //     //Convert the Lis<Map<sstring, dynamic>> into a List<Dog>.
  //     return List.generate(maps.length, (i) {
  //       return User(
  //         id: maps[i]['id'],
  //         userName: maps[i]['userName'],
  //         password: maps[i]['password'],
  //       );
  //     });
  //   }

  //   print(await users());

  //   //function to update data from the table
  //   updateuser(User user) async {
  //     //Get a reference to the  table
  //     final db = await DataBase.database;

  //     //Update the given user
  //     await db.update(
  //       'users',
  //       user.toMap(),

  //       //Ensure that the user has matching id.
  //       where: 'userName = ?',
  //       //Passthe Dog's id as a whereArg to prevent SQL injection.
  //       whereArgs: [user.userName],
  //     );
  //   }

  //   admin1 =
  //       User(id: admin1.id, userName: admin1.userName, password: 'adeola123');
  //   await updateuser(admin1);

  //   //print the updated results.
  //   print(await users());
  // }
}
