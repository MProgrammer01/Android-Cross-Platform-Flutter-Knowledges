import 'package:flutter/material.dart';

class ContainerConceptsApp extends StatelessWidget {
  const ContainerConceptsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSectionTitle('1. Container Basic Properties'),
            _buildBasicPropertiesExamples(),

            _buildSectionTitle('2. Container Border & Border Radius'),
            _buildBorderExamples(),

            _buildSectionTitle('3. Container Decoration (BoxDecoration)'),
            _buildDecorationExamples(),

            _buildSectionTitle('4. Container Decoration Image'),
            _buildDecorationImageExamples(),

            _buildSectionTitle('5. Container Alignment'),
            _buildAlignmentExamples(),
          ],
        ),
      ),
    );
  }

  // ==================== AppBar ====================
  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "Container Concepts",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blue,
      centerTitle: true,
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
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  // ==================== 1. Basic Properties ====================
  Widget _buildBasicPropertiesExamples() {
    return Column(
      children: [
        // Container with padding
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(8),
          color: Colors.blue,
          child: const Text(
            'Padding: 20 on all sides',
            style: TextStyle(color: Colors.white),
          ),
        ),

        // Container with different padding
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          margin: const EdgeInsets.all(8),
          color: Colors.green,
          child: const Text(
            'Padding: H:30, V:10',
            style: TextStyle(color: Colors.white),
          ),
        ),

        // Container with margin
        Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(10),
          color: Colors.orange,
          child: const Text(
            'Margin: 20 on all sides',
            style: TextStyle(color: Colors.white),
          ),
        ),

        // Container with width and height
        Container(
          width: 200,
          height: 100,
          margin: const EdgeInsets.all(8),
          color: Colors.purple,
          child: const Center(
            child: Text(
              'Width: 200, Height: 100',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),

        // Container with double.infinity
        Container(
          width: double.infinity,
          height: 80,
          margin: const EdgeInsets.all(8),
          color: Colors.teal,
          child: const Center(
            child: Text(
              'Width: double.infinity',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  // ==================== 2. Border & Border Radius ====================
  Widget _buildBorderExamples() {
    return Column(
      children: [
        // Simple border
        Container(
          width: 200,
          height: 100,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.blue,
              width: 3,
            ),
          ),
          child: const Center(
            child: Text('Border: 3px blue'),
          ),
        ),

        // Border with radius
        Container(
          width: 200,
          height: 100,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.lightBlue.shade50,
            border: Border.all(
              color: Colors.blue,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(
            child: Text('Border Radius: 15'),
          ),
        ),

        // Different border radius for each corner
        Container(
          width: 200,
          height: 100,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.orange.shade50,
            border: Border.all(
              color: Colors.orange,
              width: 3,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: const Center(
            child: Text('Different Corners'),
          ),
        ),

        // Circular container
        Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.purple,
            border: Border.all(
              color: Colors.deepPurple,
              width: 4,
            ),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Text(
              'Circle',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),

        // Different border sides
        Container(
          width: 200,
          height: 100,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            border: const Border(
              top: BorderSide(color: Colors.red, width: 5),
              bottom: BorderSide(color: Colors.blue, width: 5),
              left: BorderSide(color: Colors.green, width: 5),
              right: BorderSide(color: Colors.orange, width: 5),
            ),
          ),
          child: const Center(
            child: Text('Different Border Sides'),
          ),
        ),
      ],
    );
  }

  // ==================== 3. Container Decoration ====================
  Widget _buildDecorationExamples() {
    return Column(
      children: [
        // Linear Gradient
        Container(
          width: double.infinity,
          height: 100,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(
            child: Text(
              'Linear Gradient',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),

        // Radial Gradient
        Container(
          width: double.infinity,
          height: 100,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: const RadialGradient(
              colors: [Colors.yellow, Colors.orange, Colors.red],
              center: Alignment.center,
              radius: 0.8,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(
            child: Text(
              'Radial Gradient',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),

        // Sweep Gradient
        Container(
          width: 150,
          height: 150,
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            gradient: SweepGradient(
              colors: [
                Colors.red,
                Colors.orange,
                Colors.yellow,
                Colors.green,
                Colors.blue,
                Colors.purple,
                Colors.red,
              ],
              center: Alignment.center,
            ),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Text(
              'Sweep\nGradient',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),

        // Box Shadow
        Container(
          width: 200,
          height: 100,
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: const Center(
            child: Text('Box Shadow'),
          ),
        ),

        // Multiple Shadows
        Container(
          width: 200,
          height: 100,
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.red.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(-5, -5),
              ),
              BoxShadow(
                color: Colors.blue.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(5, 5),
              ),
            ],
          ),
          child: const Center(
            child: Text('Multiple Shadows'),
          ),
        ),

        // Gradient with Border and Shadow
        Container(
          width: double.infinity,
          height: 120,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'Combined: Gradient + Border + Shadow',
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  // ==================== 4. Decoration Image ====================
  Widget _buildDecorationImageExamples() {
    return Column(
      children: [
        // Network Image - Cover
        Container(
          width: double.infinity,
          height: 200,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage(
                'assets/logo.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black.withOpacity(0.3),
            ),
            child: const Center(
              child: Text(
                'BoxFit.cover',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),

        // Network Image - Contain
        Container(
          width: double.infinity,
          height: 200,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage(
                'assets/logo.jpg',
              ),
              fit: BoxFit.contain,
            ),
          ),
          child: const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'BoxFit.contain',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ),
        ),

        // Network Image - Fill
        Container(
          width: double.infinity,
          height: 200,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage(
                'assets/logo.jpg',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'BoxFit.fill',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),

        // Image with Border and Shadow
        Container(
          width: 250,
          height: 250,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
            image: const DecorationImage(
              image: AssetImage(
                'assets/logo.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Image with Gradient Overlay
        Container(
          width: double.infinity,
          height: 250,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage(
                'assets/logo.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.purple.withOpacity(0.8),
                ],
              ),
            ),
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Image with Gradient Overlay',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ==================== 5. Container Alignment ====================
  Widget _buildAlignmentExamples() {
    return Column(
      children: [
        // Alignment.topLeft
        Container(
          width: 200,
          height: 100,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            border: Border.all(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.topLeft,
          child: const Text(
            'topLeft',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        // Alignment.topCenter
        Container(
          width: 200,
          height: 100,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.topCenter,
          child: const Text(
            'topCenter',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        // Alignment.topRight
        Container(
          width: 200,
          height: 100,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.orange.shade100,
            border: Border.all(color: Colors.orange, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.topRight,
          child: const Text(
            'topRight',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        // Alignment.centerLeft
        Container(
          width: 200,
          height: 100,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.purple.shade100,
            border: Border.all(color: Colors.purple, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.centerLeft,
          child: const Text(
            'centerLeft',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        // Alignment.center
        Container(
          width: 200,
          height: 100,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.teal.shade100,
            border: Border.all(color: Colors.teal, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: const Text(
            'center',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        // Alignment.centerRight
        Container(
          width: 200,
          height: 100,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.pink.shade100,
            border: Border.all(color: Colors.pink, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.centerRight,
          child: const Text(
            'centerRight',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        // Alignment.bottomLeft
        Container(
          width: 200,
          height: 100,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.cyan.shade100,
            border: Border.all(color: Colors.cyan, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.bottomLeft,
          child: const Text(
            'bottomLeft',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        // Alignment.bottomCenter
        Container(
          width: 200,
          height: 100,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.amber.shade100,
            border: Border.all(color: Colors.amber, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.bottomCenter,
          child: const Text(
            'bottomCenter',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        // Alignment.bottomRight
        Container(
          width: 200,
          height: 100,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.red.shade100,
            border: Border.all(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.bottomRight,
          child: const Text(
            'bottomRight',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        // Custom Alignment with coordinates
        Container(
          width: 200,
          height: 100,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.indigo.shade100,
            border: Border.all(color: Colors.indigo, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: const Alignment(0.5, -0.5),
          child: const Text(
            'Custom (0.5, -0.5)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}