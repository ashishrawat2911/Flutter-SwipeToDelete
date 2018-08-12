import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final List<String> items =
      new List<String>.generate(30, (int i) => "${i + 1}");

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Swipe to delete"),
            ),
            body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, int index) {
                return new Dismissible(
                  key: Key(items[index]),
                  onDismissed: (direction) {
                    items.removeAt(index);
                    Scaffold.of(context).showSnackBar(
                        new SnackBar(content: Text("Items Dismissed")));
                  },
                  background: Container(
                    color: Colors.red,
                  ),
                  child: Card(
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          Icon(Icons.bubble_chart),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                          ),
                          Text(
                            "Assignment  ${items[index]}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )));
  }
}
