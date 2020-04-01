import 'package:flutter/material.dart';
import 'package:mealgrok/views/graph_view.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MealGrok',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: GraphView(title: 'MealGrok', tooltip: 'Add a meal'),
    );
  }
}