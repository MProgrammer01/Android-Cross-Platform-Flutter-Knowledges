import 'package:flutter/material.dart';
import 'package:sized_box_widget/sized_box_concepts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SizedBoxConcepts(),
    );
  }
}