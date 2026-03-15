import 'package:flutter/material.dart';

class SizedBoxConcepts extends StatelessWidget {
  const SizedBoxConcepts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSectionTitle('1. Basic SizedBox'),
            _buildBasicSizedBoxExamples(),

            _buildSectionTitle('2. SizedBox for Spacing'),
            _buildSpacingExamples(),

            _buildSectionTitle('3. SizedBox with Width'),
            _buildWidthExamples(),

            _buildSectionTitle('4. SizedBox with Height'),
            _buildHeightExamples(),

            _buildSectionTitle('5. SizedBox with Both'),
            _buildBothDimensionsExamples(),

            _buildSectionTitle('6. SizedBox.expand'),
            _buildExpandExamples(),

            _buildSectionTitle('7. SizedBox.shrink'),
            _buildShrinkExamples(),

            _buildSectionTitle('8. SizedBox.square'),
            _buildSquareExamples(),

            _buildSectionTitle('9. Constraining Child Size'),
            _buildConstrainingExamples(),

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
        "SizedBox Widget Concepts",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.teal,
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
          colors: [Colors.teal.shade100, Colors.teal.shade50],
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.teal.shade700,
        ),
      ),
    );
  }

  // ==================== 1. Basic SizedBox ====================
  Widget _buildBasicSizedBoxExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'SizedBox أساسي Basic SizedBox',
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
            child: Column(
              children: [
                Row(
                  children: [
                    const Text('بدون SizedBox:', textDirection: TextDirection.rtl),
                    Container(
                      color: Colors.red,
                      child: const Text(
                        'نص',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('مع SizedBox:', textDirection: TextDirection.rtl),
                    SizedBox(
                      width: 100,
                      height: 50,
                      child: Container(
                        color: Colors.blue,
                        child: const Center(
                          child: Text(
                            'نص',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'SizedBox(\n'
                  '  width: 100,\n'
                  '  height: 50,\n'
                  '  child: Container(...),\n'
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
                  child: Text(
                    'SizedBox يستخدم لتحديد حجم ثابت للعنصر أو لإنشاء مسافة فارغة',
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

  // ==================== 2. Spacing ====================
  Widget _buildSpacingExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'استخدام SizedBox للمسافات Spacing',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          // Vertical Spacing
          const Text(
            'مسافة عمودية Vertical Spacing',
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
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.red,
                  child: const Text(
                    'عنصر 1',
                    style: TextStyle(color: Colors.white),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(height: 8), // مسافة 8
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.blue,
                  child: const Text(
                    'عنصر 2 (مسافة 8)',
                    style: TextStyle(color: Colors.white),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(height: 16), // مسافة 16
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.green,
                  child: const Text(
                    'عنصر 3 (مسافة 16)',
                    style: TextStyle(color: Colors.white),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(height: 24), // مسافة 24
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.orange,
                  child: const Text(
                    'عنصر 4 (مسافة 24)',
                    style: TextStyle(color: Colors.white),
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
                  '    Widget1,\n'
                  '    SizedBox(height: 16),\n'
                  '    Widget2,\n'
                  '  ],\n'
                  ')'
          ),

          const SizedBox(height: 16),

          // Horizontal Spacing
          const Text(
            'مسافة أفقية Horizontal Spacing',
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
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.red,
                  child: const Text(
                    '1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8), // مسافة 8
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.blue,
                  child: const Text(
                    '2',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 16), // مسافة 16
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.green,
                  child: const Text(
                    '3',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 24), // مسافة 24
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.orange,
                  child: const Text(
                    '4',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'Row(\n'
                  '  children: [\n'
                  '    Widget1,\n'
                  '    SizedBox(width: 16),\n'
                  '    Widget2,\n'
                  '  ],\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 3. Width Examples ====================
  Widget _buildWidthExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'عرض محدد Fixed Width',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                  child: Container(
                    height: 40,
                    color: Colors.red,
                    child: const Center(child: Text('50')),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 100,
                  child: Container(
                    height: 40,
                    color: Colors.blue,
                    child: const Center(child: Text('100')),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 150,
                  child: Container(
                    height: 40,
                    color: Colors.green,
                    child: const Center(child: Text('150')),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 200,
                  child: Container(
                    height: 40,
                    color: Colors.orange,
                    child: const Center(child: Text('200')),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    height: 40,
                    color: Colors.purple,
                    child: const Center(
                      child: Text(
                        'double.infinity (عرض كامل)',
                        style: TextStyle(color: Colors.white),
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
              'SizedBox(\n'
                  '  width: 100,\n'
                  '  child: Widget,\n'
                  ')\n\n'
                  'SizedBox(\n'
                  '  width: double.infinity, // عرض كامل\n'
                  '  child: Widget,\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 4. Height Examples ====================
  Widget _buildHeightExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'ارتفاع محدد Fixed Height',
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 30,
                  child: Container(
                    width: 50,
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        '30',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: Container(
                    width: 50,
                    color: Colors.blue,
                    child: const Center(child: Text('60')),
                  ),
                ),
                SizedBox(
                  height: 90,
                  child: Container(
                    width: 50,
                    color: Colors.green,
                    child: const Center(child: Text('90')),
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: Container(
                    width: 50,
                    color: Colors.orange,
                    child: const Center(child: Text('120')),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: Container(
                    width: 50,
                    color: Colors.purple,
                    child: const Center(child: Text('150')),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'SizedBox(\n'
                  '  height: 100,\n'
                  '  child: Widget,\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 5. Both Dimensions ====================
  Widget _buildBothDimensionsExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'عرض وارتفاع معاً Width & Height',
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
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Container(
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        '80x80',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 60,
                  child: Container(
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        '100x60',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 120,
                  height: 80,
                  child: Container(
                    color: Colors.green,
                    child: const Center(
                      child: Text(
                        '120x80',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 100,
                  child: Container(
                    color: Colors.orange,
                    child: const Center(
                      child: Text(
                        '150x100',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'SizedBox(\n'
                  '  width: 100,\n'
                  '  height: 80,\n'
                  '  child: Widget,\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 6. SizedBox.expand ====================
  Widget _buildExpandExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'SizedBox.expand - ملء كامل',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.purple, width: 2),
            ),
            child: SizedBox.expand(
              child: Container(
                color: Colors.purple.withOpacity(0.3),
                child: const Center(
                  child: Text(
                    'SizedBox.expand\nيملأ كل المساحة المتاحة',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'SizedBox.expand(\n'
                  '  child: Widget,\n'
                  ')\n\n'
                  '// يساوي:\n'
                  'SizedBox(\n'
                  '  width: double.infinity,\n'
                  '  height: double.infinity,\n'
                  '  child: Widget,\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 7. SizedBox.shrink ====================
  Widget _buildShrinkExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'SizedBox.shrink - بدون حجم',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'مع عنصر:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.red,
                      child: const Text('عنصر 1'),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.blue,
                      child: const Text('عنصر 2'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'مع SizedBox.shrink (لا يظهر شيء):',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.red,
                      child: const Text('عنصر 1'),
                    ),
                    const SizedBox.shrink(), // لا يظهر شيء
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.blue,
                      child: const Text('عنصر 2'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'SizedBox.shrink()\n\n'
                  '// يساوي:\n'
                  'SizedBox(\n'
                  '  width: 0,\n'
                  '  height: 0,\n'
                  ')\n\n'
                  '// مفيد عند إخفاء العناصر شرطياً'
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
                Icon(Icons.lightbulb_outline, color: Colors.amber),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'استخدام شائع:\nshowButton ? Button() : SizedBox.shrink()',
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

  // ==================== 8. SizedBox.square ====================
  Widget _buildSquareExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'SizedBox.square - مربع',
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
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                SizedBox.square(
                  dimension: 50,
                  child: Container(
                    color: Colors.red,
                    child: const Center(child: Text('50')),
                  ),
                ),
                SizedBox.square(
                  dimension: 70,
                  child: Container(
                    color: Colors.blue,
                    child: const Center(child: Text('70')),
                  ),
                ),
                SizedBox.square(
                  dimension: 90,
                  child: Container(
                    color: Colors.green,
                    child: const Center(child: Text('90')),
                  ),
                ),
                SizedBox.square(
                  dimension: 110,
                  child: Container(
                    color: Colors.orange,
                    child: const Center(child: Text('110')),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'SizedBox.square(\n'
                  '  dimension: 80, // نفس الحجم للعرض والارتفاع\n'
                  '  child: Widget,\n'
                  ')\n\n'
                  '// يساوي:\n'
                  'SizedBox(\n'
                  '  width: 80,\n'
                  '  height: 80,\n'
                  '  child: Widget,\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 9. Constraining Child ====================
  Widget _buildConstrainingExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'تقييد حجم العنصر الداخلي Constraining Child',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          const Text(
            'بدون SizedBox - النص يأخذ كل المساحة',
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
            child: Container(
              color: Colors.red.withOpacity(0.3),
              child: const Text(
                'هذا نص طويل جداً يأخذ كل العرض المتاح ولا يوجد تحديد للحجم',
                textDirection: TextDirection.rtl,
              ),
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            'مع SizedBox - النص محدود بالعرض',
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
            child: SizedBox(
              width: 150,
              child: Container(
                color: Colors.green.withOpacity(0.3),
                child: const Text(
                  'هذا نص طويل جداً محدود بعرض 150 بكسل',
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            'تقييد ارتفاع Container',
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
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  height: 60,
                  child: Container(
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'محدود\n100x60',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.red,
                  child: const Text(
                    'حجم عادي',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
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
          // Avatar with SizedBox
          const Text(
            'صورة دائرية بحجم محدد Avatar',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            'assets/logo.jpg',

                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MProgrammer01',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Full-Stack Developer',
                          style: TextStyle(color: Colors.grey),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Button with fixed size
          const Text(
            'أزرار بأحجام محددة Fixed Size Buttons',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'زر بعرض كامل',
                        style: TextStyle(fontSize: 16),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: 200,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'زر متوسط',
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'نعم',
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text(
                            'لا',
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Icon Grid
          const Text(
            'شبكة أيقونات Icon Grid',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  _buildIconBox(Icons.home, 'الرئيسية', Colors.blue),
                  _buildIconBox(Icons.search, 'بحث', Colors.green),
                  _buildIconBox(Icons.favorite, 'المفضلة', Colors.red),
                  _buildIconBox(Icons.settings, 'إعدادات', Colors.orange),
                  _buildIconBox(Icons.person, 'الملف', Colors.purple),
                  _buildIconBox(Icons.notifications, 'إشعارات', Colors.teal),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Product Card
          const Text(
            'بطاقة منتج Product Card',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Card(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Container(
                    color: Colors.grey.shade300,
                    child: const Icon(
                      Icons.image,
                      size: 80,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'منتج مميز Premium Product',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'وصف المنتج هنا...',
                        style: TextStyle(color: Colors.grey),
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        '\$99.99',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_cart),
                          label: const Text(
                            'أضف للسلة',
                            textDirection: TextDirection.rtl,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Loading Placeholder
          const Text(
            'عناصر تحميل Loading Placeholders',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 16,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 150,
                          height: 12,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconBox(IconData icon, String label, Color color) {
    return SizedBox(
      width: 80,
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 30),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 11),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
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