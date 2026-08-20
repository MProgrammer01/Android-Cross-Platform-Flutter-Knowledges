import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(),
    debugShowCheckedModeBanner: false,);
  }
}

class HomePage extends StatelessWidget {
  final List<String> data = [
    "Apple",
    "Banana",
    "Orange",
    "Mango",
    "Pineapple",
    "Peach",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SearchDelegate Example"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(data),
              );
            },
          ),
        ],
      ),
      body: Center(child: Text("Click search icon to start")),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> items = [];

  MySearchDelegate(List<String> Items){
    this.items = Items;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = ""; // يمسح النص
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // يسد البحث
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var results = items.where((item) => item.toLowerCase().contains(query.toLowerCase()));
    return ListView(
      children: results.map((item) => ListTile(title: Text(item))).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var suggestions = items.where((item) => item.toLowerCase().startsWith(query.toLowerCase()));
    return ListView(
      children: suggestions.map((item) => ListTile(
        title: Text(item),
        onTap: () {
          query = item;
          showResults(context); // يوري النتيجة
        },
      )).toList(),
    );
  }
}
