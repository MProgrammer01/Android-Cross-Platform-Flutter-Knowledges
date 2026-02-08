import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(
  MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSectionTitle('Text Alignment'),
            _buildTextAlignmentExamples(),

            _buildSectionTitle('Text Direction (RTL/LTR)'),
            _buildTextDirectionExamples(),

            _buildSectionTitle('Text Overflow'),
            _buildTextOverflowExamples(),

            _buildSectionTitle('Soft Wrap'),
            _buildSoftWrapExamples(),

            _buildSectionTitle('Max Lines'),
            _buildMaxLinesExample(),

            _buildSectionTitle('Text Styling'),
            _buildTextStylingExample(),

            _buildSectionTitle('Text Shadows'),
            _buildTextShadowsExample(),
          ],
        ),
      ),
    );
  }

  // ==================== AppBar ====================
  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "Text Widget Examples",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blue,
    );
  }

  // ==================== Section Title ====================
  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 16, bottom: 8),
      color: Colors.blue.shade100,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  // ==================== Text Alignment Examples ====================
  Widget _buildTextAlignmentExamples() {
    return Column(
      children: [
        _buildTextContainer(
          text: "textAlign: TextAlign.left",
          textAlign: TextAlign.left,
        ),
        _buildTextContainer(
          text: "textAlign: TextAlign.center",
          textAlign: TextAlign.center,
        ),
        _buildTextContainer(
          text: "textAlign: TextAlign.right",
          textAlign: TextAlign.right,
        ),
        _buildTextContainer(
          text: "textAlign: TextAlign.justify - This is a longer text to demonstrate justify alignment with multiple words",
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }

  // ==================== Text Direction Examples ====================
  Widget _buildTextDirectionExamples() {
    return Column(
      children: [
        _buildTextContainer(
          text: "هذا نص عربي مع TextAlign.left و TextDirection.rtl",
          textAlign: TextAlign.left,
          textDirection: TextDirection.rtl,
        ),
        _buildTextContainer(
          text: "هذا نص عربي مع TextAlign.right و TextDirection.rtl",
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
        ),
        _buildTextContainer(
          text: "هذا نص عربي مع TextAlign.left و TextDirection.ltr",
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
        ),
      ],
    );
  }

  // ==================== Text Overflow Examples ====================
  Widget _buildTextOverflowExamples() {
    return Column(
      children: [
        _buildOverflowContainer(
          text: "overflow: TextOverflow.clip - This text will be clipped",
          overflow: TextOverflow.clip,
        ),
        _buildOverflowContainer(
          text: "overflow: TextOverflow.ellipsis - This text will show ellipsis",
          overflow: TextOverflow.ellipsis,
        ),
        _buildOverflowContainer(
          text: "overflow: TextOverflow.fade - This text will fade out",
          overflow: TextOverflow.fade,
        ),
        Container(
          width: 100,
          height: 50,
          margin: const EdgeInsets.symmetric(vertical: 4),
          color: Colors.brown,
          child: Text(
            "overflow: TextOverflow.visible (still visible) (still visible)",
            style: const TextStyle(
              backgroundColor: Colors.amber,
            ),
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }

  // ==================== Soft Wrap Examples ====================
  Widget _buildSoftWrapExamples() {
    return Column(
      children: [
        Container(
          width: 150,
          margin: const EdgeInsets.symmetric(vertical: 4),
          color: Colors.brown,
          child: const Text(
            "softWrap: true - This is a long text that will wrap to multiple lines",
            style: TextStyle(
              backgroundColor: Colors.amber,
            ),
            softWrap: true,
          ),
        ),
        Container(
          width: 150,
          margin: const EdgeInsets.symmetric(vertical: 4),
          color: Colors.brown,
          child: const Text(
            "softWrap: false - This is a long text that will not wrap",
            style: TextStyle(
              backgroundColor: Colors.amber,
            ),
            softWrap: false,
          ),
        ),
      ],
    );
  }

  // ==================== Max Lines Example ====================
  Widget _buildMaxLinesExample() {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: Colors.brown,
      child: const Text(
        "This Is A Text For MaxLines Property Limited To One Line Only",
        style: TextStyle(
          backgroundColor: Colors.amber,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  // ==================== Text Styling Example ====================
  Widget _buildTextStylingExample() {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        "Advanced Text Styling: FontSize: 20, Color: DeepOrange, "
            "FontWeight: w900, LetterSpacing: 2, WordSpacing: 10, "
            "Decoration: Underline, FontStyle: Normal, GoogleFonts: Acme",
        style: GoogleFonts.acme(
          backgroundColor: Colors.amber,
          fontSize: 20,
          color: Colors.deepOrange,
          fontWeight: FontWeight.w900,
          letterSpacing: 2,
          wordSpacing: 10,
          decoration: TextDecoration.underline,
          decorationColor: Colors.deepOrange,
          decorationThickness: 2,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  // ==================== Text Shadows Example ====================
  Widget _buildTextShadowsExample() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: const Text(
        "Text With Multiple Shadows",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              color: Colors.greenAccent,
              blurRadius: 5,
              offset: Offset(-15, 0),
            ),
            Shadow(
              color: Colors.lightBlue,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
            Shadow(
              color: Colors.deepOrange,
              blurRadius: 5,
              offset: Offset(0, -5),
            ),
            Shadow(
              color: Colors.deepPurpleAccent,
              blurRadius: 5,
              offset: Offset(15, 0),
            ),
          ],
        ),
      ),
    );
  }

  // ==================== Helper Methods ====================
  Widget _buildTextContainer({
    required String text,
    TextAlign? textAlign,
    TextDirection? textDirection,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      padding: const EdgeInsets.all(4),
      color: Colors.brown,
      child: Text(
        text,
        style: const TextStyle(
          backgroundColor: Colors.amber,
        ),
        textAlign: textAlign,
        textDirection: textDirection,
      ),
    );
  }

  Widget _buildOverflowContainer({
    required String text,
    required TextOverflow overflow,
  }) {
    return Container(
      width: 200,
      height: 20,
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: Colors.brown,
      child: Text(
        text,
        style: const TextStyle(
          backgroundColor: Colors.amber,
        ),
        overflow: overflow,
      ),
    );
  }
}