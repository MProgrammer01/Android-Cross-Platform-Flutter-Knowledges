import 'package:flutter/material.dart';
import 'package:single_child_scroll_view_widget/single_child_scroll_view_concepts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SingleChildScrollViewConcepts(),
    );
  }
}