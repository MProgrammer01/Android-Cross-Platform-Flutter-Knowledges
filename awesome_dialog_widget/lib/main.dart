import 'package:awesome_dialog_widget/awesome_dialog_concepts.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مثال AwesomeDialog',

      locale: const Locale('ar'),

      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),

      home: const AwesomeDialogConceptsApp(),

      debugShowCheckedModeBanner: false,
    );
  }
}
