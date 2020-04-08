import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:mealgrok/models/nutrient.dart';
import 'package:mealgrok/helpers/time.dart';


class NutrientController {
  static const String _createNutrient = 'INSERT INTO nutrient(val, lim, nutrient_name, units, date_tracked) VALUES(?, ?, ?, ?, ?)';
  //static const String _deleteQuery = 'DELETE FROM journal_entries WHERE id = ?';
  static const String _getNutrientsForDay = 'SELECT * FROM nutrient WHERE date_tracked BETWEEN ? AND ?';

  static const String _dbName = 'mealgrok.db';

  static charts.Color _colorize(Nutrient nutrient) {
    int percentageFromLim = ((nutrient.value / nutrient.limit) * 100).toInt();
    
    if (percentageFromLim <= 100) {
      return charts.ColorUtil.fromDartColor(Colors.green[200]);
    }  else if (percentageFromLim < 120){
      return charts.ColorUtil.fromDartColor(Colors.red[100]);
    }  else if (percentageFromLim < 150){
      return charts.ColorUtil.fromDartColor(Colors.red[200]);
    }  else if (percentageFromLim < 200){
      return charts.ColorUtil.fromDartColor(Colors.red[300]);
    } else {
      return charts.ColorUtil.fromDartColor(Colors.red[400]);
    }
  }

  static Future<List<Nutrient>> getNutrients(DateTime day) async{

    var beginning = Time.beginning(DateTime.now());

    var end = Time.end(DateTime.now());
    
    Database db = await openDatabase(_dbName, version: 1);
    var table = await db.rawQuery(_getNutrientsForDay, [ beginning.toString(), end.toString() ]);

    List<Nutrient> data = [];
    Nutrient temp;
    table.forEach((ent) {
      temp = Nutrient(value: ent['val'], limit: ent['lim'], nutrientName: ent['nutrient_name'], units: ent['units']);
      temp.barColor = _colorize(temp);
      print(temp);
      data.add(temp);
      //print(data.length);
    });
    print('post loop');
    return data;
  }

  static Future<int> createNutrient(Nutrient nutrient, DateTime day) async{
    
    Database db = await openDatabase(_dbName, version: 1);

    Future<int> id;
    await db.transaction ((action) async {
      id = action.rawInsert(
        _createNutrient, 
        [ nutrient.value, nutrient.limit, nutrient.nutrientName, nutrient.units, day.toString() ]
      );
    });

    await db.close();
    return id;
  }

  static Future<List<Nutrient>> getNutrientsTest(DateTime day) {
    final List<Nutrient> data = [
      Nutrient(
        value: 100,
        limit: 150,
        units: 'mg',
        nutrientName: 'potassium',
        barColor: charts.ColorUtil.fromDartColor(Colors.green[200]),
      ),
      Nutrient(
        value: 200,
        limit: 1000,
        units: 'mg',
        nutrientName: 'sodium',
        barColor: charts.ColorUtil.fromDartColor(Colors.green[200]),
      ),
      Nutrient(
        value: 100,
        limit: 200,
        units: 'mg',
        nutrientName: 'phosphorus',
        barColor: charts.ColorUtil.fromDartColor(Colors.green[200]),
      ),
      Nutrient(
        value: 80,
        limit: 60,
        units: 'g',
        nutrientName: 'protein',
        barColor: charts.ColorUtil.fromDartColor(Colors.red[200]),
      ),
      Nutrient(
        value: 100,
        limit: 20,
        units: 'g',
        nutrientName: 'sugar',
        barColor: charts.ColorUtil.fromDartColor(Colors.red[400]),
      ),
    ];

    return Future.delayed(const Duration(milliseconds: 1), () => data);
  }
}