import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TestPage(),
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String? selected;

  final List<String> countries = [
    'المغرب',
    'الجزائر',
    'تونس',
    'مصر',
    'السعودية',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Search'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: DropdownSearch<String>(
          selectedItem: selected,

          items: (filter, loadProps) async {
            if (filter.isEmpty) {
              return countries;
            }

            return countries
                .where(
                  (country) => country.contains(filter),
                )
                .toList();
          },

          onSelected: (value) {
            setState(() {
              selected = value;
            });
          },

          decoratorProps: const DropDownDecoratorProps(
            decoration: InputDecoration(
              labelText: 'الدولة',
              border: OutlineInputBorder(),
            ),
          ),

          popupProps: const PopupProps.menu(
            showSearchBox: true,
          ),
        ),
      ),
    );
  }
}