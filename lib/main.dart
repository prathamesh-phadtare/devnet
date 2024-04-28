import 'dart:async';
import 'package:flutter/material.dart';
import 'package:verified_devnet/modules/dev/dev_home.dart';
import 'package:verified_devnet/starter/splashscreen.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

dynamic database;
List<Map<String, dynamic>> developersCredentialsList = [];
List<Map<String, dynamic>> companyCredentialsList = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  database = await openDatabase(
    join(await getDatabasesPath(), 'DevnetDB59.db'),
    version: 1,
    onCreate: (db, version) {
      // =============== DEVELOPER LOGIN TABLE ==============

      db.execute('''
          CREATE TABLE devLoginTable(
            email TEXT,   
            username TEXT PRIMARY KEY,
            password TEXT
          )
      ''');

      // =============== COMPANY LOGIN TABLE =================

      db.execute('''
          CREATE TABLE companyLoginTable(
            email TEXT,
            username TEXT PRIMARY KEY,
            password TEXT
          )
      ''');

      // =============== ProjectCard TABLE =================

      db.execute('''
          CREATE TABLE projectCardTable(
            projectId  INTEGER PRIMARY KEY,
            developerName TEXT,
            projectName TEXT,
            timeRequired TEXT,
            gitLink TEXT,
            techStack TEXT,
            type TEXT,
            status TEXT
          )
      ''');
    },
  );

  runApp(const MainApp());
}

Future getDeveloperLoginInfo() async {
  developersCredentialsList = await database.query('devLoginTable');
  return developersCredentialsList;
}

Future getCompanyLoginInfo() async {
  companyCredentialsList = await database.query('companyLoginTable');
  return companyCredentialsList;
}

Future updateFlag(ProjectCard obj) async {
  final localDB = await database;
  await localDB.update(
    'projectCardTable',
    obj.toMap(),
    where: 'projectId=?',
    whereArgs: [obj.projectId],
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
