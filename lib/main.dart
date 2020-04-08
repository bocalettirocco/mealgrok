import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mealgrok/app.dart';

void main() async {
  const String schemaPath = 'assets/schema.sql';
  const String dbName = 'mealgrok.db';
  
  WidgetsFlutterBinding.ensureInitialized();

  await deleteDatabase(dbName);

  final String schema = await rootBundle.loadString(schemaPath);

  final bool skipWelcomePage =  await databaseExists(dbName); 
  
  Database db = await openDatabase(
    dbName, version: 1, onCreate: (Database db, int version) async {
      await db.execute(schema);
    }
  );
  
  await db.close();

  runApp(App());
}
