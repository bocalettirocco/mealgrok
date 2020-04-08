import 'package:flutter/material.dart';
import 'package:mealgrok/views/nutrient_graph.dart';
import 'package:mealgrok/views/search_meals_view.dart';

class GraphView extends StatefulWidget {
  GraphView({Key key, this.title, this.tooltip}) : super(key: key);

  final String searchMealsTitle= 'Search Meals';
  final String title;
  final String tooltip;

  @override
  _GraphViewState createState() => _GraphViewState();
}

class _GraphViewState extends State<GraphView> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _navigateToFormAndDisplayResult(BuildContext context) async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (_) => SearchMealsView(title: widget.searchMealsTitle,)));
    if (result != null) {
      _scaffoldKey.currentState
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('$result')));

      // Future.delayed(const Duration(milliseconds: _snackbarSleep), () {
      //   setState(() {
      //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => JournalView(_getStyles,_toggleDarkMode)));
      //   });
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
          child: NutrientGraph(),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: FloatingActionButton.extended(
          onPressed: () => _navigateToFormAndDisplayResult(context),
          tooltip: widget.tooltip,
          label: Text(widget.tooltip),
          icon: Icon(Icons.add),
          backgroundColor: Colors.deepOrangeAccent,
        ),
      ),
    );
  }
}
