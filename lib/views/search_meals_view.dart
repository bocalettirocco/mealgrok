import 'package:flutter/material.dart';
import 'package:mealgrok/views/search_foods_view.dart';
import 'package:mealgrok/controllers/meal_controller.dart';

class SearchMealsView extends StatefulWidget {
  SearchMealsView({Key key, this.title}) : super(key: key);
  final searchFoodsTitle = 'Build a Meal';
  final tooltip = 'Build meal';
  final String title;

  @override
  _SearchMealsViewState createState() => _SearchMealsViewState();
}

class _SearchMealsViewState extends State<SearchMealsView> {
  TextEditingController editingController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  var items = List<String>();

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  _navigateToFormAndDisplayResult(BuildContext context) async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (_) => SearchFoodsView(title: widget.searchFoodsTitle,)));
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
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _navigateToFormAndDisplayResult(context),
          tooltip: widget.tooltip,
          label: Text(widget.tooltip),
          icon: Icon(Icons.create),
          backgroundColor: Colors.deepOrangeAccent,
        ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search saved meals",
                    hintText: "Search saved meals",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: MealController.getMeals(DateTime.now()),
                builder: (context, snapshot) {
                  if(!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('${snapshot.data[index].name}'),
                      );
                    },
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}