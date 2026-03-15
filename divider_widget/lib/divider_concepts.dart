import 'package:flutter/material.dart';

class DividerConcepts extends StatelessWidget {
  const DividerConcepts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSectionTitle('1. Basic Divider'),
            _buildBasicDividerExamples(),

            _buildSectionTitle('2. Divider Thickness'),
            _buildThicknessExamples(),

            _buildSectionTitle('3. Divider Color'),
            _buildColorExamples(),

            _buildSectionTitle('4. Divider Indent'),
            _buildIndentExamples(),

            _buildSectionTitle('5. Divider Height'),
            _buildHeightExamples(),

            _buildSectionTitle('6. Vertical Divider'),
            _buildVerticalDividerExamples(),

            _buildSectionTitle('7. Custom Dividers'),
            _buildCustomDividersExamples(),

            _buildSectionTitle('8. Divider in Lists'),
            _buildDividerInListsExamples(),

            _buildSectionTitle('9. Divider with Text'),
            _buildDividerWithTextExamples(),

            _buildSectionTitle('10. Real-World Examples'),
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
        "Divider Widget Concepts",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.indigo,
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
          colors: [Colors.indigo.shade100, Colors.indigo.shade50],
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.indigo.shade700,
        ),
      ),
    );
  }

  // ==================== 1. Basic Divider ====================
  Widget _buildBasicDividerExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'فاصل أساسي Basic Divider',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'النص الأول First Text',
                  textDirection: TextDirection.rtl,
                ),
                Divider(),
                Text(
                  'النص الثاني Second Text',
                  textDirection: TextDirection.rtl,
                ),
                Divider(),
                Text(
                  'النص الثالث Third Text',
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'Divider()\n'
                  '// خط فاصل أفقي بسيط'
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
                  child: Text(
                    'Divider يضع خط فاصل أفقي رفيع بين العناصر',
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

  // ==================== 2. Thickness ====================
  Widget _buildThicknessExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'سُمك مختلف Different Thickness',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('thickness: 1 (default)'),
                Divider(thickness: 1),
                SizedBox(height: 8),

                Text('thickness: 2'),
                Divider(thickness: 2),
                SizedBox(height: 8),

                Text('thickness: 3'),
                Divider(thickness: 3),
                SizedBox(height: 8),

                Text('thickness: 5'),
                Divider(thickness: 5),
                SizedBox(height: 8),

                Text('thickness: 8'),
                Divider(thickness: 8),
                SizedBox(height: 8),

                Text('thickness: 10'),
                Divider(thickness: 10),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'Divider(\n'
                  '  thickness: 5, // السُمك بالبكسل\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 3. Color ====================
  Widget _buildColorExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'ألوان مختلفة Different Colors',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('اللون الافتراضي Default Color'),
                Divider(thickness: 2),
                SizedBox(height: 8),

                Text('أحمر Red', textDirection: TextDirection.rtl),
                Divider(thickness: 2, color: Colors.red),
                SizedBox(height: 8),

                Text('أزرق Blue', textDirection: TextDirection.rtl),
                Divider(thickness: 2, color: Colors.blue),
                SizedBox(height: 8),

                Text('أخضر Green', textDirection: TextDirection.rtl),
                Divider(thickness: 2, color: Colors.green),
                SizedBox(height: 8),

                Text('برتقالي Orange', textDirection: TextDirection.rtl),
                Divider(thickness: 2, color: Colors.orange),
                SizedBox(height: 8),

                Text('بنفسجي Purple', textDirection: TextDirection.rtl),
                Divider(thickness: 2, color: Colors.purple),
                SizedBox(height: 8),

                Text('أسود Black', textDirection: TextDirection.rtl),
                Divider(thickness: 2, color: Colors.black),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // With Opacity
          const Text(
            'مع الشفافية With Opacity',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Opacity: 1.0 (كامل)', textDirection: TextDirection.rtl),
                Divider(thickness: 3, color: Colors.blue.withOpacity(1.0)),
                const SizedBox(height: 8),

                const Text('Opacity: 0.8'),
                Divider(thickness: 3, color: Colors.blue.withOpacity(0.8)),
                const SizedBox(height: 8),

                const Text('Opacity: 0.6'),
                Divider(thickness: 3, color: Colors.blue.withOpacity(0.6)),
                const SizedBox(height: 8),

                const Text('Opacity: 0.4'),
                Divider(thickness: 3, color: Colors.blue.withOpacity(0.4)),
                const SizedBox(height: 8),

                const Text('Opacity: 0.2'),
                Divider(thickness: 3, color: Colors.blue.withOpacity(0.2)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'Divider(\n'
                  '  thickness: 2,\n'
                  '  color: Colors.red,\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 4. Indent ====================
  Widget _buildIndentExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'المسافة البادئة Indent',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          // indent (left/start)
          const Text(
            'indent - المسافة من البداية',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('indent: 0 (default)'),
                Divider(thickness: 2, color: Colors.blue, indent: 0),
                SizedBox(height: 8),

                Text('indent: 20'),
                Divider(thickness: 2, color: Colors.blue, indent: 20),
                SizedBox(height: 8),

                Text('indent: 40'),
                Divider(thickness: 2, color: Colors.blue, indent: 40),
                SizedBox(height: 8),

                Text('indent: 60'),
                Divider(thickness: 2, color: Colors.blue, indent: 60),
                SizedBox(height: 8),

                Text('indent: 80'),
                Divider(thickness: 2, color: Colors.blue, indent: 80),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // endIndent (right/end)
          const Text(
            'endIndent - المسافة من النهاية',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('endIndent: 0 (default)'),
                Divider(thickness: 2, color: Colors.green, endIndent: 0),
                SizedBox(height: 8),

                Text('endIndent: 20'),
                Divider(thickness: 2, color: Colors.green, endIndent: 20),
                SizedBox(height: 8),

                Text('endIndent: 40'),
                Divider(thickness: 2, color: Colors.green, endIndent: 40),
                SizedBox(height: 8),

                Text('endIndent: 60'),
                Divider(thickness: 2, color: Colors.green, endIndent: 60),
                SizedBox(height: 8),

                Text('endIndent: 80'),
                Divider(thickness: 2, color: Colors.green, endIndent: 80),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Both indent and endIndent
          const Text(
            'indent و endIndent معاً',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('indent: 20, endIndent: 20'),
                Divider(
                  thickness: 2,
                  color: Colors.purple,
                  indent: 20,
                  endIndent: 20,
                ),
                SizedBox(height: 8),

                Text('indent: 40, endIndent: 40'),
                Divider(
                  thickness: 2,
                  color: Colors.purple,
                  indent: 40,
                  endIndent: 40,
                ),
                SizedBox(height: 8),

                Text('indent: 60, endIndent: 20'),
                Divider(
                  thickness: 2,
                  color: Colors.orange,
                  indent: 60,
                  endIndent: 20,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'Divider(\n'
                  '  indent: 20,    // من البداية\n'
                  '  endIndent: 40, // من النهاية\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 5. Height ====================
  Widget _buildHeightExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'ارتفاع Divider (المسافة العمودية)',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.amber, width: 2),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('النص 1'),
                Divider(
                  thickness: 2,
                  color: Colors.blue,
                  height: 10,
                ),
                Text('height: 10 - مسافة صغيرة', textDirection: TextDirection.rtl),
                SizedBox(height: 16),

                Text('النص 2'),
                Divider(
                  thickness: 2,
                  color: Colors.blue,
                  height: 20,
                ),
                Text('height: 20 (default)'),
                SizedBox(height: 16),

                Text('النص 3'),
                Divider(
                  thickness: 2,
                  color: Colors.blue,
                  height: 40,
                ),
                Text('height: 40 - مسافة كبيرة', textDirection: TextDirection.rtl),
                SizedBox(height: 16),

                Text('النص 4'),
                Divider(
                  thickness: 2,
                  color: Colors.blue,
                  height: 60,
                ),
                Text('height: 60 - مسافة أكبر', textDirection: TextDirection.rtl),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'Divider(\n'
                  '  height: 40, // المسافة العمودية الكلية\n'
                  '  thickness: 2, // سُمك الخط نفسه\n'
                  ')'
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.warning_amber, color: Colors.amber),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'الفرق بين height و thickness:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(height: 4),
                      Text(
                        '• height: المسافة العمودية الكلية (padding + الخط)\n'
                            '• thickness: سُمك الخط نفسه',
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

  // ==================== 6. Vertical Divider ====================
  Widget _buildVerticalDividerExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'فاصل عمودي Vertical Divider',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          // Basic Vertical Divider
          Container(
            width: double.infinity,
            height: 100,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('النص 1', textDirection: TextDirection.rtl),
                VerticalDivider(),
                Text('النص 2', textDirection: TextDirection.rtl),
                VerticalDivider(),
                Text('النص 3', textDirection: TextDirection.rtl),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'Row(\n'
                  '  children: [\n'
                  '    Text("نص 1"),\n'
                  '    VerticalDivider(),\n'
                  '    Text("نص 2"),\n'
                  '  ],\n'
                  ')'
          ),

          const SizedBox(height: 16),

          // Vertical Divider with properties
          const Text(
            'خصائص VerticalDivider',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 150,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home, size: 40, color: Colors.blue),
                    SizedBox(height: 8),
                    Text('الرئيسية', textDirection: TextDirection.rtl),
                  ],
                ),
                VerticalDivider(
                  thickness: 2,
                  color: Colors.blue,
                  width: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search, size: 40, color: Colors.green),
                    SizedBox(height: 8),
                    Text('بحث', textDirection: TextDirection.rtl),
                  ],
                ),
                VerticalDivider(
                  thickness: 2,
                  color: Colors.green,
                  width: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person, size: 40, color: Colors.orange),
                    SizedBox(height: 8),
                    Text('الملف', textDirection: TextDirection.rtl),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Different thickness
          const Text(
            'سُمك مختلف Different Thickness',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 100,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('A'),
                VerticalDivider(thickness: 1, color: Colors.red),
                Text('B'),
                VerticalDivider(thickness: 3, color: Colors.blue),
                Text('C'),
                VerticalDivider(thickness: 5, color: Colors.green),
                Text('D'),
                VerticalDivider(thickness: 8, color: Colors.orange),
                Text('E'),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'VerticalDivider(\n'
                  '  thickness: 3,\n'
                  '  color: Colors.blue,\n'
                  '  width: 40,\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 7. Custom Dividers ====================
  Widget _buildCustomDividersExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'فواصل مخصصة Custom Dividers',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          // Dotted Divider (using Container)
          const Text(
            'فاصل منقط Dotted Divider',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                const Text('النص الأول', textDirection: TextDirection.rtl),
                const SizedBox(height: 8),
                Row(
                  children: List.generate(
                    30,
                        (index) => Expanded(
                      child: Divider(
                        height: 2,
                        color: index % 2 == 0 ? Colors.blue : Colors.transparent,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text('النص الثاني', textDirection: TextDirection.rtl),
              ],
            ),
          ),

          const SizedBox(height: 16),

          const SizedBox(height: 16),

          // Decorative Divider
          const Text(
            'فاصل زخرفي Decorative Divider',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                const Text('قسم 1', textDirection: TextDirection.rtl),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Divider(height: 2, color: Colors.blue),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: const Icon(Icons.star, color: Colors.blue, size: 20),
                    ),
                    Expanded(
                      child: Divider(height: 2, color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('قسم 2', textDirection: TextDirection.rtl),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Thick Colored Divider
          const Text(
            'فاصل سميك ملون Thick Colored Divider',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                const Text('محتوى 1', textDirection: TextDirection.rtl),
                const SizedBox(height: 8),
                Divider(
                  height: 5,
                  color: Colors.red,
                  radius: BorderRadius.circular(10),
                  thickness: 10,
                ),
                const SizedBox(height: 8),
                const Text('محتوى 2', textDirection: TextDirection.rtl),
                const SizedBox(height: 8),
                Divider(
                  height: 5,
                  color: Colors.green,
                  radius: BorderRadius.circular(10),
                  thickness: 10,
                ),
                const SizedBox(height: 8),
                const Text('محتوى 3', textDirection: TextDirection.rtl),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 8. Divider in Lists ====================
  Widget _buildDividerInListsExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Divider في القوائم Lists',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          // List with Divider
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.person, color: Colors.blue),
                  title: Text(
                    'أحمد محمد Ahmed',
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: Text(
                    'ahmed@example.com',
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                const Divider(height: 1),

                const ListTile(
                  leading: Icon(Icons.person, color: Colors.green),
                  title: Text(
                    'فاطمة علي Fatima',
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: Text(
                    'fatima@example.com',
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                const Divider(height: 1),

                const ListTile(
                  leading: Icon(Icons.person, color: Colors.orange),
                  title: Text(
                    'خالد سعيد Khaled',
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: Text(
                    'khaled@example.com',
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                const Divider(height: 1),

                const ListTile(
                  leading: Icon(Icons.person, color: Colors.purple),
                  title: Text(
                    'مريم حسن Mariam',
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: Text(
                    'mariam@example.com',
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // List with Colored Dividers
          const Text(
            'قائمة مع فواصل ملونة',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              children: [
                ListTile(
                  leading: Icon(Icons.home, color: Colors.blue),
                  title: Text(
                    'الصفحة الرئيسية Home',
                    textDirection: TextDirection.rtl,
                  ),
                ),
                Divider(thickness: 2, color: Colors.blue, height: 1),

                ListTile(
                  leading: Icon(Icons.settings, color: Colors.green),
                  title: Text(
                    'الإعدادات Settings',
                    textDirection: TextDirection.rtl,
                  ),
                ),
                Divider(thickness: 2, color: Colors.green, height: 1),

                ListTile(
                  leading: Icon(Icons.info, color: Colors.orange),
                  title: Text(
                    'حول About',
                    textDirection: TextDirection.rtl,
                  ),
                ),
                Divider(thickness: 2, color: Colors.orange, height: 1),

                ListTile(
                  leading: Icon(Icons.exit_to_app, color: Colors.red),
                  title: Text(
                    'تسجيل الخروج Logout',
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'Column(\n'
                  '  children: [\n'
                  '    ListTile(...),\n'
                  '    Divider(height: 1),\n'
                  '    ListTile(...),\n'
                  '  ],\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 9. Divider with Text ====================
  Widget _buildDividerWithTextExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'فاصل مع نص Divider with Text',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          // Text between dividers
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                const Text('محتوى قبل', textDirection: TextDirection.rtl),
                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: Divider(height: 1, color: Colors.grey),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'أو',
                        style: TextStyle(color: Colors.grey),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    Expanded(
                      child: Divider(height: 1, color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                const Text('محتوى بعد', textDirection: TextDirection.rtl),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Section headers with dividers
          const Text(
            'عناوين الأقسام مع فواصل',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'القسم الأول Section 1',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Divider(height: 2, color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'محتوى القسم الأول...',
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    const Text(
                      'القسم الثاني Section 2',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Divider(height: 2, color: Colors.green),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'محتوى القسم الثاني...',
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Decorative text divider
          const Text(
            'فاصل نصي زخرفي',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                const Text('بداية المحتوى', textDirection: TextDirection.rtl),
                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: Divider(height: 2, color: Colors.purple),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'مهم',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    Expanded(
                      child: Divider(height: 2, color: Colors.purple),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                const Text('نهاية المحتوى', textDirection: TextDirection.rtl),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 10. Real-World Examples ====================
  Widget _buildRealWorldExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Settings Menu
          const Text(
            'قائمة الإعدادات Settings Menu',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Card(
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.person, color: Colors.blue),
                  title: Text(
                    'الملف الشخصي Profile',
                    textDirection: TextDirection.rtl,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                const Divider(height: 1, indent: 72),

                const ListTile(
                  leading: Icon(Icons.notifications, color: Colors.orange),
                  title: Text(
                    'الإشعارات Notifications',
                    textDirection: TextDirection.rtl,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                const Divider(height: 1, indent: 72),

                const ListTile(
                  leading: Icon(Icons.security, color: Colors.green),
                  title: Text(
                    'الأمان Security',
                    textDirection: TextDirection.rtl,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                const Divider(height: 1, indent: 72),

                const ListTile(
                  leading: Icon(Icons.language, color: Colors.purple),
                  title: Text(
                    'اللغة Language',
                    textDirection: TextDirection.rtl,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Product Info
          const Text(
            'معلومات المنتج Product Info',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'منتج مميز Premium Product',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star_half, color: Colors.amber, size: 20),
                      SizedBox(width: 8),
                      Text('(4.5)'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  const Text(
                    'السعر',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 4),
                  const Row(
                    children: [
                      Text(
                        '\$99.99',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '\$149.99',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  const Text(
                    'الوصف Description',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'هذا منتج عالي الجودة مع مواصفات ممتازة...',
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Timeline
          const Text(
            'الجدول الزمني Timeline',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildTimelineItem(
                    'تم الطلب Order Placed',
                    '10:30 AM',
                    Colors.blue,
                    true,
                  ),
                  _buildTimelineItem(
                    'قيد التحضير Preparing',
                    '11:00 AM',
                    Colors.orange,
                    true,
                  ),
                  _buildTimelineItem(
                    'في الطريق On the way',
                    '12:30 PM',
                    Colors.purple,
                    true,
                  ),
                  _buildTimelineItem(
                    'تم التوصيل Delivered',
                    '01:45 PM',
                    Colors.green,
                    false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(
      String title,
      String time,
      Color color,
      bool showDivider,
      ) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (showDivider)
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: SizedBox(
              height: 40,
              child: VerticalDivider(
                color: Colors.grey.shade300,
                thickness: 3,
              ),
            ),
          ),
      ],
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