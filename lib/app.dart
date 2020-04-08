import 'package:flutter/material.dart';
import 'package:mealgrok/views/graph_view.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MealGrok',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: GraphView(title: DateTime.now().toString().split(' ')[0], tooltip: 'Add a meal'),
    );
  }
}