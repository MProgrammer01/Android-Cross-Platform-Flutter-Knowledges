import 'package:flutter/material.dart';

class ImageConcepts extends StatelessWidget {
  const ImageConcepts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSectionTitle('1. Basic Image.asset'),
            _buildBasicImageExamples(),

            _buildSectionTitle('2. Image Properties (width, height, fit)'),
            _buildImagePropertiesExamples(),

            _buildSectionTitle('3. Image BoxFit Types'),
            _buildBoxFitExamples(),

            _buildSectionTitle('4. Image with Border & Decoration'),
            _buildImageDecorationExamples(),

            _buildSectionTitle('5. Image Alignment & Repeat'),
            _buildImageAlignmentExamples(),

            _buildSectionTitle('6. Image Color & ColorBlendMode'),
            _buildImageColorExamples(),

            _buildSectionTitle('7. Circular & Shaped Images'),
            _buildShapedImageExamples(),

            _buildSectionTitle('8. Image with Placeholder & Error'),
            _buildImageErrorHandlingExamples(),

            _buildSectionTitle('9. Network vs Asset Images'),
            _buildNetworkVsAssetExamples(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ==================== AppBar ====================
  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "Image Concepts",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.deepPurple,
      centerTitle: true,
    );
  }

  // ==================== Section Title ====================
  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 16, bottom: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple.shade100, Colors.purple.shade50],
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple.shade700,
        ),
      ),
    );
  }

  // ==================== 1. Basic Image.asset ====================
  Widget _buildBasicImageExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Simple Image.asset
          const Text(
            'Simple Image.asset',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Image.asset(
            'assets/images/background.jpg',
            width: 200,
            height: 150,
          ),
          const SizedBox(height: 16),

          // Code example
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "Image.asset('assets/images/background.jpg')",
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 2. Image Properties ====================
  Widget _buildImagePropertiesExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Width and Height
          const Text(
            'Image with Width & Height',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Image.asset(
            'assets/images/logo.jpg',
            width: 250,
            height: 150,
          ),
          const SizedBox(height: 8),
          _buildCodeBox("width: 250, height: 150"),

          const SizedBox(height: 16),

          // Double.infinity width
          const Text(
            'Image with double.infinity width',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Image.asset(
            'assets/images/profile.jpg',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          _buildCodeBox("width: double.infinity, height: 200"),
        ],
      ),
    );
  }

  // ==================== 3. BoxFit Types ====================
  Widget _buildBoxFitExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _buildBoxFitExample('BoxFit.cover', BoxFit.cover),
          _buildBoxFitExample('BoxFit.contain', BoxFit.contain),
          _buildBoxFitExample('BoxFit.fill', BoxFit.fill),
          _buildBoxFitExample('BoxFit.fitWidth', BoxFit.fitWidth),
          _buildBoxFitExample('BoxFit.fitHeight', BoxFit.fitHeight),
          _buildBoxFitExample('BoxFit.none', BoxFit.none),
          _buildBoxFitExample('BoxFit.scaleDown', BoxFit.scaleDown),
        ],
      ),
    );
  }

  Widget _buildBoxFitExample(String title, BoxFit fit) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          width: 300,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            color: Colors.grey.shade200,
          ),
          child: Image.asset(
            'assets/images/logo.jpg',
            fit: fit,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // ==================== 4. Image with Border & Decoration ====================
  Widget _buildImageDecorationExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Image with Border
          const Text(
            'Image with Border',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            width: 250,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.deepPurple,
                width: 5,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/logo.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Image with Shadow
          const Text(
            'Image with Box Shadow',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            width: 250,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/images/logo.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Image with Gradient Border
          const Text(
            'Image with Gradient Border',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            width: 250,
            height: 200,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.purple, Colors.blue, Colors.pink],
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/logo.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // ==================== 5. Image Alignment & Repeat ====================
  Widget _buildImageAlignmentExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Image Alignment
          const Text(
            'Image Alignment (topLeft)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            width: 300,
            height: 200,
            color: Colors.grey.shade300,
            child: Image.asset(
              'assets/images/logo.jpg',
              width: 150,
              height: 100,
              alignment: Alignment.topLeft,
            ),
          ),
          const SizedBox(height: 16),

          // Image Repeat
          const Text(
            'Image Repeat',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Image.asset(
              'assets/images/logo.jpg',
              width: 100,
              height: 100,
              repeat: ImageRepeat.repeat,
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox("repeat: ImageRepeat.repeat"),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // ==================== 6. Image Color & ColorBlendMode ====================
  Widget _buildImageColorExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Original Image
          const Text(
            'Original Image',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Image.asset(
            'assets/images/logo.jpg',
            width: 250,
            height: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),

          // Color with BlendMode.colorBurn
          const Text(
            'BlendMode.colorBurn (Blue)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Image.asset(
            'assets/images/logo.jpg',
            width: 250,
            height: 150,
            fit: BoxFit.cover,
            color: Colors.blue,
            colorBlendMode: BlendMode.colorBurn,
          ),
          const SizedBox(height: 16),

          // Color with BlendMode.modulate
          const Text(
            'BlendMode.modulate (Purple)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Image.asset(
            'assets/images/logo.jpg',
            width: 250,
            height: 150,
            fit: BoxFit.cover,
            color: Colors.purple,
            colorBlendMode: BlendMode.modulate,
          ),
          const SizedBox(height: 16),

          // Color with BlendMode.multiply
          const Text(
            'BlendMode.multiply (Red)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Image.asset(
            'assets/images/logo.jpg',
            width: 250,
            height: 150,
            fit: BoxFit.cover,
            color: Colors.red.withOpacity(0.5),
            colorBlendMode: BlendMode.multiply,
          ),
          const SizedBox(height: 16),

          // Color with BlendMode.screen
          const Text(
            'BlendMode.screen (Green)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Image.asset(
            'assets/images/logo.jpg',
            width: 250,
            height: 150,
            fit: BoxFit.cover,
            color: Colors.green,
            colorBlendMode: BlendMode.screen,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // ==================== 7. Circular & Shaped Images ====================
  Widget _buildShapedImageExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Circular Image with ClipOval
          const Text(
            'Circular Image (ClipOval)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ClipOval(
            child: Image.asset(
              'assets/icons/user-icon.png',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),

          // Circular Image with CircleAvatar
          const Text(
            'Circular Image (CircleAvatar)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const CircleAvatar(
            radius: 75,
            backgroundImage: AssetImage(
              'assets/images/logo.jpg',
            ),
          ),
          const SizedBox(height: 16),

          // Rounded Rectangle with ClipRRect
          const Text(
            'Rounded Rectangle (ClipRRect)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              'assets/images/logo.jpg',
              width: 250,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),

          // Custom Shape with ClipPath
          const Text(
            'Custom Shape (ClipPath - Triangle)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ClipPath(
            clipper: TriangleClipper(),
            child: Image.asset(
              'assets/images/logo.jpg',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),

          // Hexagon Shape
          const Text(
            'Hexagon Shape',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ClipPath(
            clipper: HexagonClipper(),
            child: Image.asset(
              'assets/images/logo.jpg',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // ==================== 8. Error Handling ====================
  Widget _buildImageErrorHandlingExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Image with error builder
          const Text(
            'Image with Error Handler',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Image.network(
            'https://invalid-url-that-will-fail.com/image.jpg',
            width: 200,
            height: 150,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 200,
                height: 150,
                color: Colors.grey.shade300,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, size: 50, color: Colors.red),
                    SizedBox(height: 8),
                    Text('Failed to load image'),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 16),

          // Image with loading builder
          const Text(
            'Image with Loading Indicator',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Image.network(
            'https://images.unsplash.com/photo-1506905925346-21bda4d32df4',
            width: 200,
            height: 150,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                width: 200,
                height: 150,
                color: Colors.grey.shade300,
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // ==================== 9. Network vs Asset ====================
  Widget _buildNetworkVsAssetExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Network Image
          const Text(
            'Image.network()',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Image.network(
            'https://images.unsplash.com/photo-1469474968028-56623f02e42e',
            width: 250,
            height: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          _buildCodeBox("Image.network('https://...')"),
          const SizedBox(height: 16),

          // Asset Image (using network as example)
          const Text(
            'Image.asset()',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Image.asset(
            'assets/images/background.jpg',
            width: 250,
            height: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          _buildCodeBox("Image.asset('assets/images/background.jpg')"),
          const SizedBox(height: 16),

          // Comparison table
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.purple.shade50,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.purple.shade200),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Comparison:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 8),
                Text('📱 Image.asset():'),
                Text('  • Stored locally in app'),
                Text('  • Fast loading'),
                Text('  • Always available offline'),
                Text('  • Increases app size'),
                SizedBox(height: 8),
                Text('🌐 Image.network():'),
                Text('  • Loaded from internet'),
                Text('  • Requires internet connection'),
                Text('  • Smaller app size'),
                Text('  • May take time to load'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==================== Helper Methods ====================
  Widget _buildCodeBox(String code) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Text(
        code,
        style: const TextStyle(
          fontFamily: 'monospace',
          fontSize: 12,
        ),
      ),
    );
  }
}

// ==================== Custom Clippers ====================
class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;

    path.moveTo(w * 0.5, 0);
    path.lineTo(w, h * 0.25);
    path.lineTo(w, h * 0.75);
    path.lineTo(w * 0.5, h);
    path.lineTo(0, h * 0.75);
    path.lineTo(0, h * 0.25);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}