import 'package:flutter/material.dart';

class SingleChildScrollViewConcepts extends StatelessWidget {
  const SingleChildScrollViewConcepts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSectionTitle('1. Basic SingleChildScrollView'),
            _buildBasicScrollViewExamples(),

            _buildSectionTitle('2. Scroll Direction'),
            _buildScrollDirectionExamples(),

            _buildSectionTitle('3. Scroll Physics'),
            _buildScrollPhysicsExamples(),

            _buildSectionTitle('4. Padding'),
            _buildPaddingExamples(),

            _buildSectionTitle('5. Reverse'),
            _buildReverseExamples(),

            _buildSectionTitle('6. ScrollController'),
            _buildScrollControllerExamples(),

            _buildSectionTitle('7. Nested Scroll'),
            _buildNestedScrollExamples(),

            _buildSectionTitle('8. Horizontal Scroll'),
            _buildHorizontalScrollExamples(),

            _buildSectionTitle('9. Common Use Cases'),
            _buildCommonUseCasesExamples(),

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
        "SingleChildScrollView Concepts",
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

  // ==================== 1. Basic ScrollView ====================
  Widget _buildBasicScrollViewExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'المشكلة بدون SingleChildScrollView',
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
              border: Border.all(color: Colors.red, width: 2),
            ),
            child: Column(
              children: [
                Container(
                  height: 80,
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
                Container(
                  height: 80,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'عنصر 2',
                      style: TextStyle(color: Colors.white),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 80,
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      'عنصر 3 (مخفي)',
                      style: TextStyle(color: Colors.white),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '❌ بدون Scroll: المحتوى يتجاوز الحدود ولا يمكن رؤيته',
            style: TextStyle(color: Colors.red, fontSize: 12),
            textDirection: TextDirection.rtl,
          ),

          const SizedBox(height: 24),

          const Text(
            'الحل مع SingleChildScrollView',
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
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      height: 80,
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
                    Container(
                      height: 80,
                      color: Colors.blue,
                      child: const Center(
                        child: Text(
                          'عنصر 2',
                          style: TextStyle(color: Colors.white),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 80,
                      color: Colors.green,
                      child: const Center(
                        child: Text(
                          'عنصر 3 (مرر للأسفل)',
                          style: TextStyle(color: Colors.white),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 80,
                      color: Colors.orange,
                      child: const Center(
                        child: Text(
                          'عنصر 4',
                          style: TextStyle(color: Colors.white),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '✅ مع Scroll: يمكن التمرير لرؤية كل المحتوى',
            style: TextStyle(color: Colors.green, fontSize: 12),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'SingleChildScrollView(\n'
                  '  child: Column(\n'
                  '    children: [\n'
                  '      // المحتوى هنا\n'
                  '    ],\n'
                  '  ),\n'
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
                    'SingleChildScrollView يسمح بتمرير عنصر واحد فقط (child واحد)',
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

  // ==================== 2. Scroll Direction ====================
  Widget _buildScrollDirectionExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'اتجاه التمرير Scroll Direction',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          // Vertical (default)
          const Text(
            'Axis.vertical (افتراضي - عمودي)',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: List.generate(
                    8,
                        (index) => Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      height: 60,
                      color: Colors.primaries[index % Colors.primaries.length],
                      child: Center(
                        child: Text(
                          'عنصر عمودي ${index + 1}',
                          style: const TextStyle(color: Colors.white),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '↕️ مرر عمودياً (أعلى/أسفل)',
            style: TextStyle(fontSize: 12, color: Colors.grey),
            textDirection: TextDirection.rtl,
          ),

          const SizedBox(height: 16),

          // Horizontal
          const Text(
            'Axis.horizontal (أفقي)',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: List.generate(
                    8,
                        (index) => Container(
                      margin: const EdgeInsets.only(right: 8),
                      width: 100,
                      height: 80,
                      color: Colors.primaries[index % Colors.primaries.length],
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
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
          const Text(
            '↔️ مرر أفقياً (يمين/يسار)',
            style: TextStyle(fontSize: 12, color: Colors.grey),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'SingleChildScrollView(\n'
                  '  scrollDirection: Axis.horizontal,\n'
                  '  child: Row(\n'
                  '    children: [...],\n'
                  '  ),\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 3. Scroll Physics ====================
  Widget _buildScrollPhysicsExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'فيزياء التمرير Scroll Physics',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          // BouncingScrollPhysics
          _buildPhysicsExample(
            'BouncingScrollPhysics (iOS)',
            'تأثير الارتداد عند الوصول للحدود',
            const BouncingScrollPhysics(),
            Colors.blue,
          ),

          const SizedBox(height: 16),

          // ClampingScrollPhysics
          _buildPhysicsExample(
            'ClampingScrollPhysics (Android)',
            'توقف فوري عند الوصول للحدود',
            const ClampingScrollPhysics(),
            Colors.green,
          ),

          const SizedBox(height: 16),

          // AlwaysScrollableScrollPhysics
          _buildPhysicsExample(
            'AlwaysScrollableScrollPhysics',
            'دائماً قابل للتمرير حتى لو كان المحتوى صغير',
            const AlwaysScrollableScrollPhysics(),
            Colors.orange,
          ),

          const SizedBox(height: 16),

          // NeverScrollableScrollPhysics
          _buildPhysicsExample(
            'NeverScrollableScrollPhysics',
            'غير قابل للتمرير نهائياً',
            const NeverScrollableScrollPhysics(),
            Colors.red,
          ),

          const SizedBox(height: 8),
          _buildCodeBox(
              'SingleChildScrollView(\n'
                  '  physics: BouncingScrollPhysics(),\n'
                  '  child: ...,\n'
                  ')'
          ),
        ],
      ),
    );
  }

  Widget _buildPhysicsExample(
      String title,
      String description,
      ScrollPhysics physics,
      Color color,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: color, width: 2),
          ),
          child: SingleChildScrollView(
            physics: physics,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: List.generate(
                  5,
                      (index) => Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    height: 50,
                    color: color.withOpacity(0.7),
                    child: Center(
                      child: Text(
                        'عنصر ${index + 1}',
                        style: const TextStyle(color: Colors.white),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ==================== 4. Padding ====================
  Widget _buildPaddingExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'المسافات Padding',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          const Text(
            'بدون Padding',
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
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  4,
                      (index) => Container(
                    height: 50,
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: Center(
                      child: Text(
                        'عنصر ${index + 1}',
                        style: const TextStyle(color: Colors.white),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            'مع Padding (16 من كل الجهات)',
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: List.generate(
                  4,
                      (index) => Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.primaries[index % Colors.primaries.length],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'عنصر ${index + 1}',
                        style: const TextStyle(color: Colors.white),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'SingleChildScrollView(\n'
                  '  padding: EdgeInsets.all(16),\n'
                  '  child: ...,\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 5. Reverse ====================
  Widget _buildReverseExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'عكس الاتجاه Reverse',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          const Text(
            'reverse: false (افتراضي)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
              reverse: false,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: List.generate(
                    6,
                        (index) => Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      height: 50,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          'عنصر ${index + 1}',
                          style: const TextStyle(color: Colors.white),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'يبدأ من الأعلى (1, 2, 3...)',
            style: TextStyle(fontSize: 12, color: Colors.grey),
            textDirection: TextDirection.rtl,
          ),

          const SizedBox(height: 16),

          const Text(
            'reverse: true',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: List.generate(
                    6,
                        (index) => Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      height: 50,
                      color: Colors.green,
                      child: Center(
                        child: Text(
                          'عنصر ${index + 1}',
                          style: const TextStyle(color: Colors.white),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'يبدأ من الأسفل (مفيد للمحادثات)',
            style: TextStyle(fontSize: 12, color: Colors.grey),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'SingleChildScrollView(\n'
                  '  reverse: true, // يبدأ من الأسفل\n'
                  '  child: ...,\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 6. ScrollController ====================
  Widget _buildScrollControllerExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'التحكم في التمرير ScrollController',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          const ScrollControllerExample(),

          const SizedBox(height: 8),
          _buildCodeBox(
              'ScrollController controller = ScrollController();\n\n'
                  'SingleChildScrollView(\n'
                  '  controller: controller,\n'
                  '  child: ...,\n'
                  ')\n\n'
                  '// التمرير للأعلى\n'
                  'controller.animateTo(0);\n\n'
                  '// التمرير للأسفل\n'
                  'controller.animateTo(\n'
                  '  controller.position.maxScrollExtent\n'
                  ');'
          ),
        ],
      ),
    );
  }

  // ==================== 7. Nested Scroll ====================
  Widget _buildNestedScrollExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Scroll متداخل Nested Scroll',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      color: Colors.blue,
                      child: const Center(
                        child: Text(
                          'عنصر ثابت 1',
                          style: TextStyle(color: Colors.white),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Horizontal scroll inside vertical
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: List.generate(
                            8,
                                (index) => Container(
                              margin: const EdgeInsets.only(right: 8),
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.primaries[
                                index % Colors.primaries.length],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    Container(
                      height: 100,
                      color: Colors.green,
                      child: const Center(
                        child: Text(
                          'عنصر ثابت 2',
                          style: TextStyle(color: Colors.white),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    Container(
                      height: 100,
                      color: Colors.orange,
                      child: const Center(
                        child: Text(
                          'عنصر ثابت 3',
                          style: TextStyle(color: Colors.white),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'تمرير عمودي + تمرير أفقي داخله',
            style: TextStyle(fontSize: 12, color: Colors.grey),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }

  // ==================== 8. Horizontal Scroll ====================
  Widget _buildHorizontalScrollExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'أمثلة على التمرير الأفقي',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          // Image Gallery
          const Text(
            'معرض صور Image Gallery',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              child: Row(
                children: List.generate(
                  6,
                      (index) => Container(
                    margin: const EdgeInsets.only(right: 8),
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.primaries[index % Colors.primaries.length]
                          .shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          size: 50,
                          color: Colors.primaries[
                          index % Colors.primaries.length],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'صورة ${index + 1}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Categories
          const Text(
            'فئات Categories',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  _buildCategoryChip('الكل', Colors.blue, true),
                  _buildCategoryChip('تصميم', Colors.purple, false),
                  _buildCategoryChip('برمجة', Colors.green, false),
                  _buildCategoryChip('تسويق', Colors.orange, false),
                  _buildCategoryChip('أعمال', Colors.red, false),
                  _buildCategoryChip('تعليم', Colors.teal, false),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, Color color, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: selected ? color : color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : color,
          fontWeight: FontWeight.bold,
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }

  // ==================== 9. Common Use Cases ====================
  Widget _buildCommonUseCasesExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'حالات استخدام شائعة Common Use Cases',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          // Form
          const Text(
            '1. نماذج طويلة Long Forms',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: const Text(
              'نماذج التسجيل أو الإدخال الطويلة التي تحتوي على حقول كثيرة',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),

          const SizedBox(height: 16),

          // Content
          const Text(
            '2. محتوى طويل Long Content',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: const Text(
              'المقالات، التفاصيل، الشروط والأحكام',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),

          const SizedBox(height: 16),

          // Horizontal Lists
          const Text(
            '3. قوائم أفقية Horizontal Lists',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.orange.shade200),
            ),
            child: const Text(
              'معارض الصور، قوائم المنتجات، الفئات',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
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
                        'ملاحظة مهمة:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'لا تستخدم SingleChildScrollView للقوائم الطويلة جداً.\n'
                            'استخدم ListView أو GridView بدلاً منه للأداء الأفضل.',
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

  // ==================== 10. Real-World Examples ====================
  Widget _buildRealWorldExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Profile Page
          const Text(
            'صفحة الملف الشخصي Profile Page',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            height: 400,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Header
                  Container(
                    height: 150,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.purple, Colors.blue],
                      ),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                              'assets/logo.jpg',

                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'MProgrammer01',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            'Full-Stack Developer',
                            style: TextStyle(color: Colors.white70),
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Stats
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              '245',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('منشور', textDirection: TextDirection.rtl),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '12.5K',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('متابع', textDirection: TextDirection.rtl),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '892',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('متابَع', textDirection: TextDirection.rtl),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const Divider(height: 1),

                  // Posts
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'المنشورات',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),

                  Container(
                    height: 100,
                    color: Colors.blue.shade50,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Center(child: Text('منشور 1')),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 100,
                    color: Colors.green.shade50,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Center(child: Text('منشور 2')),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Settings Page
          const Text(
            'صفحة الإعدادات Settings Page',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            height: 400,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildSettingsSection(
                    'الحساب',
                    [
                      _buildSettingsTile(Icons.person, 'الملف الشخصي', 'تعديل معلوماتك'),
                      _buildSettingsTile(Icons.lock, 'الخصوصية', 'إدارة الخصوصية'),
                      _buildSettingsTile(Icons.security, 'الأمان', 'كلمة المرور والأمان'),
                    ],
                  ),
                  _buildSettingsSection(
                    'الإشعارات',
                    [
                      _buildSettingsTile(Icons.notifications, 'الإشعارات', 'إدارة الإشعارات'),
                      _buildSettingsTile(Icons.email, 'البريد الإلكتروني', 'تفضيلات البريد'),
                    ],
                  ),
                  _buildSettingsSection(
                    'عام',
                    [
                      _buildSettingsTile(Icons.language, 'اللغة', 'العربية'),
                      _buildSettingsTile(Icons.dark_mode, 'المظهر', 'فاتح/داكن'),
                      _buildSettingsTile(Icons.info, 'حول', 'معلومات التطبيق'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'تسجيل الخروج',
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.grey,
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
        Container(
          color: Colors.white,
          child: Column(children: items),
        ),
      ],
    );
  }

  Widget _buildSettingsTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, textDirection: TextDirection.rtl),
      subtitle: Text(subtitle, textDirection: TextDirection.rtl),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
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

// ==================== ScrollController Example ====================
class ScrollControllerExample extends StatefulWidget {
  const ScrollControllerExample({super.key});

  @override
  State<ScrollControllerExample> createState() =>
      _ScrollControllerExampleState();
}

class _ScrollControllerExampleState extends State<ScrollControllerExample> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: _scrollToTop,
              icon: const Icon(Icons.arrow_upward),
              label: const Text(
                'للأعلى',
                textDirection: TextDirection.rtl,
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton.icon(
              onPressed: _scrollToBottom,
              icon: const Icon(Icons.arrow_downward),
              label: const Text(
                'للأسفل',
                textDirection: TextDirection.rtl,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: List.generate(
                  10,
                      (index) => Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    height: 50,
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: Center(
                      child: Text(
                        'عنصر ${index + 1}',
                        style: const TextStyle(color: Colors.white),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}