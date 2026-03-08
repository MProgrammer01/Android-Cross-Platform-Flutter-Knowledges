import 'package:flutter/material.dart';

class StackConcepts extends StatelessWidget {
  const StackConcepts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSectionTitle('1. Basic Stack'),
            _buildBasicStackExamples(),

            _buildSectionTitle('2. Stack Alignment'),
            _buildAlignmentExamples(),

            _buildSectionTitle('3. Positioned Widget'),
            _buildPositionedExamples(),

            _buildSectionTitle('4. Positioned - All Directions'),
            _buildPositionedAllDirectionsExamples(),

            _buildSectionTitle('5. Stack Fit'),
            _buildStackFitExamples(),

            _buildSectionTitle('6. Stack Overflow'),
            _buildOverflowExamples(),

            _buildSectionTitle('7. Combining Alignment & Positioned'),
            _buildCombinedExamples(),

            _buildSectionTitle('8. IndexedStack'),
            _buildIndexedStackExamples(),

            _buildSectionTitle('9. Real-World Examples'),
            _buildRealWorldExamples(),

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
        "Stack Widget Concepts",
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

  // ==================== 1. Basic Stack ====================
  Widget _buildBasicStackExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Stack تضع العناصر فوق بعضها',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      'الطبقة 1 (الأسفل)',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'الطبقة 2',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      'الطبقة 3\n(الأعلى)',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              "Stack(\n"
                  "  children: [\n"
                  "    Widget1, // الأسفل\n"
                  "    Widget2, // الوسط\n"
                  "    Widget3, // الأعلى\n"
                  "  ],\n"
                  ")"
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.amber.shade200),
            ),
            child: const Row(
              children: [
                Icon(Icons.layers, color: Colors.amber),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'العنصر الأول في القائمة يكون في الأسفل، والأخير في الأعلى',
                    style: TextStyle(fontSize: 13),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 2. Stack Alignment ====================
  Widget _buildAlignmentExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Alignment.topLeft
          _buildAlignmentExample('Alignment.topLeft', Alignment.topLeft),

          // Alignment.topCenter
          _buildAlignmentExample('Alignment.topCenter', Alignment.topCenter),

          // Alignment.topRight
          _buildAlignmentExample('Alignment.topRight', Alignment.topRight),

          // Alignment.centerLeft
          _buildAlignmentExample('Alignment.centerLeft', Alignment.centerLeft),

          // Alignment.center
          _buildAlignmentExample('Alignment.center (default)', Alignment.center),

          // Alignment.centerRight
          _buildAlignmentExample('Alignment.centerRight', Alignment.centerRight),

          // Alignment.bottomLeft
          _buildAlignmentExample('Alignment.bottomLeft', Alignment.bottomLeft),

          // Alignment.bottomCenter
          _buildAlignmentExample('Alignment.bottomCenter', Alignment.bottomCenter),

          // Alignment.bottomRight
          _buildAlignmentExample('Alignment.bottomRight', Alignment.bottomRight),
        ],
      ),
    );
  }

  Widget _buildAlignmentExample(String title, Alignment alignment) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400, width: 2),
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade100,
          ),
          child: Stack(
            alignment: alignment,
            children: [
              Container(
                width: 150,
                height: 120,
                color: Colors.red.withOpacity(0.3),
                child: const Center(child: Text('Big')),
              ),
              Container(
                width: 100,
                height: 80,
                color: Colors.blue.withOpacity(0.5),
                child: const Center(child: Text('Medium')),
              ),
              Container(
                width: 60,
                height: 50,
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'Small',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // ==================== 3. Positioned Widget ====================
  Widget _buildPositionedExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Positioned من الأعلى والأيسر',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 2),
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade100,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 20,
                  child: Container(
                    width: 100,
                    height: 80,
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        'top: 20\nleft: 20',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox('Positioned(\n  top: 20,\n  left: 20,\n  child: Widget,\n)'),

          const SizedBox(height: 16),

          const Text(
            'Positioned من الأسفل والأيمن',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 2),
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade100,
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 30,
                  right: 30,
                  child: Container(
                    width: 100,
                    height: 80,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'bottom: 30\nright: 30',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox('Positioned(\n  bottom: 30,\n  right: 30,\n  child: Widget,\n)'),

          const SizedBox(height: 16),

          const Text(
            'عدة عناصر بـ Positioned',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 2),
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade100,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        '1',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        '2',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        '3',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        '4',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 4. Positioned All Directions ====================
  Widget _buildPositionedAllDirectionsExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Positioned.fill - ملء كامل',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    color: Colors.purple.withOpacity(0.3),
                    child: const Center(
                      child: Text(
                        'Positioned.fill\nيملأ كل المساحة',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox('Positioned.fill(\n  child: Widget,\n)'),

          const SizedBox(height: 16),

          const Text(
            'Positioned مع top, bottom, left, right',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 2),
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade100,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Container(
                    color: Colors.teal,
                    child: const Center(
                      child: Text(
                        'مسافة 20 من كل الجهات',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'Positioned(\n'
                  '  top: 20,\n'
                  '  bottom: 20,\n'
                  '  left: 20,\n'
                  '  right: 20,\n'
                  '  child: Widget,\n'
                  ')'
          ),

          const SizedBox(height: 16),

          const Text(
            'Positioned مع width و height',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 2),
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade100,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 50,
                  left: 50,
                  width: 120,
                  height: 80,
                  child: Container(
                    color: Colors.pink,
                    child: const Center(
                      child: Text(
                        'width: 120\nheight: 80',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'Positioned(\n'
                  '  top: 50,\n'
                  '  left: 50,\n'
                  '  width: 120,\n'
                  '  height: 80,\n'
                  '  child: Widget,\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 5. Stack Fit ====================
  Widget _buildStackFitExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'StackFit.loose (default)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'العناصر غير الـ Positioned تأخذ حجمها الطبيعي',
            style: TextStyle(color: Colors.grey, fontSize: 12),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              fit: StackFit.loose,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue.withOpacity(0.3),
                  child: const Center(child: Text('loose: حجم طبيعي', textDirection: TextDirection.rtl,)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox('Stack(\n  fit: StackFit.loose,\n  children: [...],\n)'),

          const SizedBox(height: 16),

          const Text(
            'StackFit.expand',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'العناصر غير الـ Positioned تملأ كل Stack',
            style: TextStyle(color: Colors.grey, fontSize: 12),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  color: Colors.green.withOpacity(0.3),
                  child: const Center(child: Text('expand: ملء كامل', textDirection: TextDirection.rtl,)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox('Stack(\n  fit: StackFit.expand,\n  children: [...],\n)'),

          const SizedBox(height: 16),

          const Text(
            'StackFit.passthrough',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'العناصر تأخذ حجم الـ parent constraints',
            style: TextStyle(color: Colors.grey, fontSize: 12),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                Container(
                  height: 100,
                  color: Colors.orange.withOpacity(0.3),
                  child: const Center(child: Text('passthrough')),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox('Stack(\n  fit: StackFit.passthrough,\n  children: [...],\n)'),
        ],
      ),
    );
  }

  // ==================== 6. Overflow ====================
  Widget _buildOverflowExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Overflow.clip (default)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'العناصر خارج حدود Stack يتم قصها',
            style: TextStyle(color: Colors.grey, fontSize: 12),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 3),
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade100,
            ),
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                Positioned(
                  top: -20,
                  left: -20,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        'Clipped',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -20,
                  right: -20,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'Clipped',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox('Stack(\n  clipBehavior: Clip.hardEdge,\n  children: [...],\n)'),

          const SizedBox(height: 16),

          const Text(
            'Overflow.visible',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'العناصر خارج حدود Stack تظهر',
            style: TextStyle(color: Colors.grey, fontSize: 12),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          Container(
            margin: const EdgeInsets.all(30),
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 3),
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade100,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -30,
                  left: -30,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        'Visible',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -30,
                  right: -30,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'Visible',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox('Stack(\n  clipBehavior: Clip.none,\n  children: [...],\n)'),

          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.amber.shade200),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.warning_amber, color: Colors.amber),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ملاحظة مهمة:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(height: 4),
                      Text(
                        '• Clip.hardEdge: قص العناصر خارج الحدود\n'
                            '• Clip.none: إظهار العناصر خارج الحدود\n'
                            '• استخدم margin عند استعمال Clip.none',
                        style: TextStyle(fontSize: 13),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 7. Combined Examples ====================
  Widget _buildCombinedExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'دمج Alignment و Positioned',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 2),
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade100,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Background with alignment
                Container(
                  width: 180,
                  height: 180,
                  color: Colors.purple.withOpacity(0.2),
                  child: const Center(
                    child: Text(
                      'Aligned Center',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                // Positioned elements
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 8. IndexedStack ====================
  Widget _buildIndexedStackExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'IndexedStack - عرض عنصر واحد فقط',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          const Text(
            'يعرض فقط العنصر عند index المحدد',
            style: TextStyle(color: Colors.grey, fontSize: 12),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: IndexedStack(
              index: 1, // يعرض العنصر الثاني (index 1)
              children: [
                Container(
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      'Page 1 (index: 0)',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Page 2 (index: 1) ✓',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      'Page 3 (index: 2)',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'IndexedStack(\n'
                  '  index: 1, // العنصر المعروض\n'
                  '  children: [\n'
                  '    Page1,\n'
                  '    Page2, // ← معروض\n'
                  '    Page3,\n'
                  '  ],\n'
                  ')'
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline, color: Colors.blue),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'فائدة IndexedStack:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'يحافظ على حالة جميع العناصر (state) حتى لو كانت مخفية.\n'
                            'مفيد للتنقل بين الصفحات مع الحفاظ على البيانات.',
                        style: TextStyle(fontSize: 13),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 9. Real-World Examples ====================
  Widget _buildRealWorldExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Image with overlay text
          const Text(
            'صورة مع نص فوقها',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Image.asset(
                  'assets/logo.jpg',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mountain Adventure',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Explore the beautiful peaks',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Badge notification
          const Text(
            'Badge Notification',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                Positioned(
                  top: -5,
                  right: -5,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Profile with online status
          const Text(
            'Profile with Status',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'assets/logo.jpg',
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Product card with discount badge
          const Text(
            'Product Card with Badge',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Card(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(4),
                      ),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1523275335684-37898b6baf30',
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Premium Watch',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                '\$199',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                '\$299',
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '-33%',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.star, color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Text(
                          '4.8',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Floating Action Button
          const Text(
            'Custom Floating Button',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Messages',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text('No messages yet...'),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
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