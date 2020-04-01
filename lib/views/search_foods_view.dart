import 'package:flutter/material.dart';

class SearchFoodsView extends StatefulWidget {
  SearchFoodsView({Key key, this.title}) : super(key: key);
  final String tooltip = 'Build meal';
  final String title;

  @override
  _SearchFoodsViewState createState() => _SearchFoodsViewState();
}

class _SearchFoodsViewState extends State<SearchFoodsView> {
  TextEditingController editingController = TextEditingController();

  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  var items = List<String>();

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => null,
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
                    labelText: "Search food database",
                    hintText: "Search search food database",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${items[index]}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}