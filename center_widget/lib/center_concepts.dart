import 'package:flutter/material.dart';

class CenterConcepts extends StatelessWidget {
  const CenterConcepts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSectionTitle('1. Basic Center'),
            _buildBasicCenterExamples(),

            _buildSectionTitle('2. Center vs Without Center'),
            _buildCenterComparisonExamples(),

            _buildSectionTitle('3. Center with Different Widgets'),
            _buildDifferentWidgetsExamples(),

            _buildSectionTitle('4. Center with widthFactor'),
            _buildWidthFactorExamples(),

            _buildSectionTitle('5. Center with heightFactor'),
            _buildHeightFactorExamples(),

            _buildSectionTitle('6. Center with Both Factors'),
            _buildBothFactorsExamples(),

            _buildSectionTitle('7. Center in Column/Row'),
            _buildCenterInLayoutExamples(),

            _buildSectionTitle('8. Nested Center'),
            _buildNestedCenterExamples(),

            _buildSectionTitle('9. Center vs Align'),
            _buildCenterVsAlignExamples(),

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
        "Center Widget Concepts",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.deepOrange,
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
          colors: [Colors.deepOrange.shade100, Colors.orange.shade50],
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.deepOrange.shade700,
        ),
      ),
    );
  }

  // ==================== 1. Basic Center ====================
  Widget _buildBasicCenterExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Center أساسي Basic Center',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue, width: 2),
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.blue,
                child: const Text(
                  'في المنتصف!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'Center(\n'
                  '  child: Widget,\n'
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
                    'Center يضع العنصر في منتصف المساحة المتاحة (أفقياً وعمودياً)',
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

  // ==================== 2. Center vs Without ====================
  Widget _buildCenterComparisonExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'المقارنة: مع وبدون Center',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          // Without Center
          const Text(
            'بدون Center (في الأعلى واليسار)',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.red, width: 2),
            ),
            child: Container(
              width: 100,
              height: 60,
              color: Colors.red,
              child: Text(
                'بدون Center',
                style: TextStyle(color: Colors.white),
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '❌ العنصر في الزاوية العلوية',
            style: TextStyle(color: Colors.red, fontSize: 12),
            textDirection: TextDirection.rtl,
          ),

          const SizedBox(height: 16),

          // With Center
          const Text(
            'مع Center (في المنتصف)',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: Center(
              child: Container(
                width: 100,
                height: 60,
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'مع Center',
                    style: TextStyle(color: Colors.white),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '✅ العنصر في المنتصف تماماً',
            style: TextStyle(color: Colors.green, fontSize: 12),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }

  // ==================== 3. Different Widgets ====================
  Widget _buildDifferentWidgetsExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Center مع عناصر مختلفة',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          // Text
          const Text(
            'نص Text',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'نص في المنتصف',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Icon
          const Text(
            'أيقونة Icon',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Icon(
                Icons.favorite,
                size: 60,
                color: Colors.red,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Image placeholder
          const Text(
            'صورة Image',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.image,
                  size: 40,
                  color: Colors.blue,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Button
          const Text(
            'زر Button',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'اضغط هنا',
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Multiple widgets
          const Text(
            'عناصر متعددة Multiple Widgets',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.check_circle, size: 50, color: Colors.green),
                  const SizedBox(height: 8),
                  const Text(
                    'تم بنجاح!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'العملية اكتملت',
                    style: TextStyle(color: Colors.grey.shade600),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 4. widthFactor ====================
  Widget _buildWidthFactorExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'widthFactor - عامل العرض',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.amber.shade200),
            ),
            child: const Text(
              'widthFactor يحدد عرض Center كنسبة من عرض العنصر الداخلي\n'
                  'مثلاً: widthFactor: 2 = العرض = عرض العنصر × 2',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),

          const SizedBox(height: 16),

          // widthFactor: null (default)
          const Text(
            'widthFactor: null (default - عرض كامل)',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 100,
            color: Colors.purple.shade50,
            child: Center(
              widthFactor: null,
              child: Container(
                width: 100,
                height: 60,
                color: Colors.purple,
                child: const Center(
                  child: Text(
                    'عرض كامل',
                    style: TextStyle(color: Colors.white),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // widthFactor: 1
          const Text(
            'widthFactor: 1 (نفس عرض العنصر)',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 100,
            color: Colors.blue.shade50,
            child: Center(
              widthFactor: 1,
              child: Container(
                width: 100,
                height: 60,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    '100px',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // widthFactor: 2
          const Text(
            'widthFactor: 2 (ضعف عرض العنصر)',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 100,
            color: Colors.green.shade50,
            child: Center(
              widthFactor: 2,
              child: Container(
                width: 100,
                height: 60,
                color: Colors.green,
                child: const Center(
                  child: Text(
                    '200px',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // widthFactor: 3
          const Text(
            'widthFactor: 3 (ثلاث أضعاف)',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 100,
            color: Colors.orange.shade50,
            child: Center(
              widthFactor: 3,
              child: Container(
                width: 100,
                height: 60,
                color: Colors.orange,
                child: const Center(
                  child: Text(
                    '300px',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),
          _buildCodeBox(
              'Center(\n'
                  '  widthFactor: 2, // العرض = عرض العنصر × 2\n'
                  '  child: Widget,\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 5. heightFactor ====================
  Widget _buildHeightFactorExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'heightFactor - عامل الارتفاع',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.amber.shade200),
            ),
            child: const Text(
              'heightFactor يحدد ارتفاع Center كنسبة من ارتفاع العنصر الداخلي\n'
                  'مثلاً: heightFactor: 2 = الارتفاع = ارتفاع العنصر × 2',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              // heightFactor: null
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      'null',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 200,
                      color: Colors.purple.shade50,
                      child: Center(
                        heightFactor: null,
                        child: Container(
                          width: 60,
                          height: 50,
                          color: Colors.purple,
                          child: const Center(
                            child: Text(
                              'كامل',
                              style: TextStyle(color: Colors.white, fontSize: 12),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),

              // heightFactor: 1
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      '1.0',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 200,
                      color: Colors.blue.shade50,
                      child: Center(
                        heightFactor: 1,
                        child: Container(
                          width: 60,
                          height: 50,
                          color: Colors.blue,
                          child: const Center(
                            child: Text(
                              '50px',
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),

              // heightFactor: 2
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      '2.0',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 200,
                      color: Colors.green.shade50,
                      child: Center(
                        heightFactor: 2,
                        child: Container(
                          width: 60,
                          height: 50,
                          color: Colors.green,
                          child: const Center(
                            child: Text(
                              '100px',
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),

              // heightFactor: 3
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      '3.0',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 200,
                      color: Colors.orange.shade50,
                      child: Center(
                        heightFactor: 3,
                        child: Container(
                          width: 60,
                          height: 50,
                          color: Colors.orange,
                          child: const Center(
                            child: Text(
                              '150px',
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),
          _buildCodeBox(
              'Center(\n'
                  '  heightFactor: 2, // الارتفاع = ارتفاع العنصر × 2\n'
                  '  child: Widget,\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 6. Both Factors ====================
  Widget _buildBothFactorsExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'widthFactor و heightFactor معاً',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 250,
            color: Colors.grey.shade100,
            child: Center(
              widthFactor: 2,
              heightFactor: 2,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Colors.blue.shade900, width: 3),
                ),
                child: const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'width: 2',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'height: 2',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '200x200',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: Container(
                  height: 150,
                  color: Colors.purple.shade50,
                  child: Center(
                    widthFactor: 1.5,
                    heightFactor: 1.5,
                    child: Container(
                      width: 80,
                      height: 80,
                      color: Colors.purple,
                      child: const Center(
                        child: Text(
                          '1.5\n120x120',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: 150,
                  color: Colors.teal.shade50,
                  child: Center(
                    widthFactor: 2.5,
                    heightFactor: 1,
                    child: Container(
                      width: 60,
                      height: 60,
                      color: Colors.teal,
                      child: const Center(
                        child: Text(
                          'W:2.5\nH:1',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),
          _buildCodeBox(
              'Center(\n'
                  '  widthFactor: 2,\n'
                  '  heightFactor: 2,\n'
                  '  child: Widget,\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 7. Center in Column/Row ====================
  Widget _buildCenterInLayoutExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Center داخل Column/Row',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          // Center in Column
          const Text(
            'Center داخل Column',
            style: TextStyle(fontWeight: FontWeight.bold),
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
                Container(
                  height: 50,
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      'عنصر 1',
                      style: TextStyle(color: Colors.white),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Container(
                    width: 150,
                    height: 50,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'Center (150px)',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 50,
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      'عنصر 3',
                      style: TextStyle(color: Colors.white),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Center in Row
          const Text(
            'Center داخل Row',
            style: TextStyle(fontWeight: FontWeight.bold),
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
            child: Row(
              children: [
                Container(
                  width: 60,
                  color: Colors.red,
                  child: const Center(child: Text('1')),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Center(
                    child: Container(
                      width: 80,
                      height: 60,
                      color: Colors.blue,
                      child: const Center(
                        child: Text(
                          'Center',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 60,
                  color: Colors.green,
                  child: const Center(child: Text('3')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 8. Nested Center ====================
  Widget _buildNestedCenterExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Center متداخل Nested Center',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.purple.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.purple, width: 2),
            ),
            child: Center(
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      border: Border.all(color: Colors.green, width: 2),
                    ),
                    child: Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        color: Colors.orange,
                        child: const Center(
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'Center(\n'
                  '  child: Container(\n'
                  '    child: Center(\n'
                  '      child: Container(\n'
                  '        child: Center(\n'
                  '          child: Widget,\n'
                  '        ),\n'
                  '      ),\n'
                  '    ),\n'
                  '  ),\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 9. Center vs Align ====================
  Widget _buildCenterVsAlignExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Center vs Align',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 8),

          Row(
            children: [
              // Center
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      'Center',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue),
                      ),
                      child: Center(
                        child: Container(
                          width: 60,
                          height: 60,
                          color: Colors.blue,
                          child: const Center(
                            child: Icon(
                              Icons.center_focus_strong,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'دائماً في المنتصف',
                      style: TextStyle(fontSize: 12),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),

              // Align
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      'Align',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.green),
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 60,
                          height: 60,
                          color: Colors.green,
                          child: const Center(
                            child: Icon(
                              Icons.my_location,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'في أي مكان',
                      style: TextStyle(fontSize: 12),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'الفرق:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 4),
                Text(
                  '• Center: يضع العنصر في المنتصف فقط\n'
                      '• Align: يضع العنصر في أي مكان (9 مواضع أو مخصص)',
                  style: TextStyle(fontSize: 13),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 8),
                Text(
                  'Center() = Align(alignment: Alignment.center)',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'monospace',
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
          // Empty State
          const Text(
            'حالة فارغة Empty State',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Card(
            child: Container(
              height: 250,
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.inbox_outlined,
                      size: 80,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'لا توجد عناصر',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'لم يتم العثور على أي بيانات',
                      style: TextStyle(color: Colors.grey.shade500),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Loading State
          const Text(
            'حالة التحميل Loading State',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Card(
            child: SizedBox(
              height: 200,
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text(
                      'جاري التحميل...',
                      style: TextStyle(fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Success Message
          const Text(
            'رسالة نجاح Success Message',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Card(
            color: Colors.green.shade50,
            child: SizedBox(
              height: 200,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'تم بنجاح!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'تمت العملية بنجاح',
                      style: TextStyle(color: Colors.green),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Login Form
          const Text(
            'نموذج تسجيل دخول Login Form',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Card(
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.lock_outline,
                      size: 60,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'البريد الإلكتروني',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.email),
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'كلمة المرور',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 24),
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
                          'دخول',
                          style: TextStyle(fontSize: 18),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Profile Card
          const Text(
            'بطاقة الملف Profile Card',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                        'assets/logo.jpg',

                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Center(
                    child: Text(
                      'MProgrammer01',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      'Full-Stack Developer',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.location_on, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(
                          'المغرب',
                          style: TextStyle(color: Colors.grey),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatColumn('245', 'منشور'),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey.shade300,
                      ),
                      _buildStatColumn('12.5K', 'متابع'),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey.shade300,
                      ),
                      _buildStatColumn('892', 'متابَع'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
          textDirection: TextDirection.rtl,
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