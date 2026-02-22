import 'package:flutter/material.dart';
import 'package:row_widget/row_concepts_app.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RowConcepts(),
    );
  }
}