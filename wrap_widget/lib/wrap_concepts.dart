import 'package:flutter/material.dart';

class WrapConcepts extends StatelessWidget {
  const WrapConcepts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSectionTitle('1. Basic Wrap'),
            _buildBasicWrapExamples(),

            _buildSectionTitle('2. Wrap vs Row (Overflow Problem)'),
            _buildWrapVsRowExamples(),

            _buildSectionTitle('3. Spacing & RunSpacing'),
            _buildSpacingExamples(),

            _buildSectionTitle('4. Direction'),
            _buildDirectionExamples(),

            _buildSectionTitle('5. Alignment'),
            _buildAlignmentExamples(),

            _buildSectionTitle('6. RunAlignment'),
            _buildRunAlignmentExamples(),

            _buildSectionTitle('7. CrossAxisAlignment'),
            _buildCrossAxisAlignmentExamples(),

            _buildSectionTitle('8. Wrap with Different Widgets'),
            _buildMixedWidgetsExamples(),

            _buildSectionTitle('9. Vertical Wrap'),
            _buildVerticalWrapExamples(),

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
        "Wrap Widget Concepts",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.cyan,
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
          colors: [Colors.cyan.shade100, Colors.cyan.shade50],
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.cyan.shade700,
        ),
      ),
    );
  }

  // ==================== 1. Basic Wrap ====================
  Widget _buildBasicWrapExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Wrap أساسي Basic Wrap',
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
              children: [
                Container(
                  width: 80,
                  height: 60,
                  color: Colors.red,
                  child: const Center(child: Text('1')),
                ),
                Container(
                  width: 80,
                  height: 60,
                  color: Colors.blue,
                  child: const Center(child: Text('2')),
                ),
                Container(
                  width: 80,
                  height: 60,
                  color: Colors.green,
                  child: const Center(child: Text('3')),
                ),
                Container(
                  width: 80,
                  height: 60,
                  color: Colors.orange,
                  child: const Center(child: Text('4')),
                ),
                Container(
                  width: 80,
                  height: 60,
                  color: Colors.purple,
                  child: const Center(child: Text('5')),
                ),
                Container(
                  width: 80,
                  height: 60,
                  color: Colors.pink,
                  child: const Center(child: Text('6')),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'Wrap(\n'
                  '  children: [\n'
                  '    Widget1,\n'
                  '    Widget2,\n'
                  '    Widget3,\n'
                  '    // تلقائياً ينزل لسطر جديد\n'
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
                  child: Text(
                    'Wrap يرتب العناصر أفقياً، وعندما لا يوجد مساحة كافية، ينزل تلقائياً لسطر جديد',
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

  // ==================== 2. Wrap vs Row ====================
  Widget _buildWrapVsRowExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'المشكلة مع Row - Overflow',
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
              border: Border.all(color: Colors.red, width: 2),
            ),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 60,
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      'عنصر 1',
                      style: TextStyle(color: Colors.white),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 60,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'عنصر 2',
                      style: TextStyle(color: Colors.white),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 60,
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      'عنصر 3',
                      style: TextStyle(color: Colors.white),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 60,
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
          const SizedBox(height: 8),
          const Text(
            '❌ Row: يحدث Overflow عندما لا تكفي المساحة',
            style: TextStyle(color: Colors.red, fontSize: 12),
            textDirection: TextDirection.rtl,
          ),

          const SizedBox(height: 24),

          const Text(
            'الحل مع Wrap - لا Overflow',
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
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: Wrap(
              children: [
                Container(
                  width: 100,
                  height: 60,
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      'عنصر 1',
                      style: TextStyle(color: Colors.white),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 60,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'عنصر 2',
                      style: TextStyle(color: Colors.white),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 60,
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      'عنصر 3',
                      style: TextStyle(color: Colors.white),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 60,
                  color: Colors.orange,
                  child: const Center(
                    child: Text(
                      'عنصر 4',
                      style: TextStyle(color: Colors.white),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 60,
                  color: Colors.purple,
                  child: const Center(
                    child: Text(
                      'عنصر 5',
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
            '✅ Wrap: ينزل تلقائياً لسطر جديد، لا يوجد Overflow',
            style: TextStyle(color: Colors.green, fontSize: 12),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }

  // ==================== 3. Spacing & RunSpacing ====================
  Widget _buildSpacingExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'المسافات Spacing',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          // Without spacing
          const Text(
            'بدون مسافات (default)',
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
            child: Wrap(
              children: List.generate(
                8,
                    (index) => Container(
                  width: 60,
                  height: 60,
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // With spacing
          const Text(
            'spacing: 10 - مسافة أفقية بين العناصر',
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
            child: Wrap(
              spacing: 10,
              children: List.generate(
                8,
                    (index) => Container(
                  width: 60,
                  height: 60,
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // With runSpacing
          const Text(
            'runSpacing: 10 - مسافة عمودية بين الأسطر',
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
            child: Wrap(
              runSpacing: 10,
              children: List.generate(
                8,
                    (index) => Container(
                  width: 60,
                  height: 60,
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Both spacing and runSpacing
          const Text(
            'spacing: 12, runSpacing: 12',
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
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: List.generate(
                8,
                    (index) => Container(
                  width: 60,
                  height: 60,
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'Wrap(\n'
                  '  spacing: 10,    // أفقي\n'
                  '  runSpacing: 10, // عمودي\n'
                  '  children: [...],\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 4. Direction ====================
  Widget _buildDirectionExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'الاتجاه Direction',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          // Horizontal (default)
          const Text(
            'Axis.horizontal (default)',
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
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                6,
                    (index) => Container(
                  width: 70,
                  height: 50,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '← العناصر تترتب أفقياً، ثم تنزل لسطر جديد',
            style: TextStyle(fontSize: 12, color: Colors.grey),
            textDirection: TextDirection.rtl,
          ),

          const SizedBox(height: 16),

          // Vertical
          const Text(
            'Axis.vertical',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Wrap(
              direction: Axis.vertical,
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                6,
                    (index) => Container(
                  width: 70,
                  height: 50,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '↓ العناصر تترتب عمودياً، ثم تنتقل لعمود جديد',
            style: TextStyle(fontSize: 12, color: Colors.grey),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'Wrap(\n'
                  '  direction: Axis.horizontal, // or Axis.vertical\n'
                  '  children: [...],\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 5. Alignment ====================
  Widget _buildAlignmentExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'محاذاة العناصر في السطر Alignment',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          // WrapAlignment.start
          _buildAlignmentExample(
            'WrapAlignment.start (default)',
            WrapAlignment.start,
          ),

          // WrapAlignment.center
          _buildAlignmentExample(
            'WrapAlignment.center',
            WrapAlignment.center,
          ),

          // WrapAlignment.end
          _buildAlignmentExample(
            'WrapAlignment.end',
            WrapAlignment.end,
          ),

          // WrapAlignment.spaceBetween
          _buildAlignmentExample(
            'WrapAlignment.spaceBetween',
            WrapAlignment.spaceBetween,
          ),

          // WrapAlignment.spaceAround
          _buildAlignmentExample(
            'WrapAlignment.spaceAround',
            WrapAlignment.spaceAround,
          ),

          // WrapAlignment.spaceEvenly
          _buildAlignmentExample(
            'WrapAlignment.spaceEvenly',
            WrapAlignment.spaceEvenly,
          ),
        ],
      ),
    );
  }

  Widget _buildAlignmentExample(String title, WrapAlignment alignment) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue.shade200, width: 2),
          ),
          child: Wrap(
            alignment: alignment,
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
              5,
                  (index) => Container(
                width: 60,
                height: 50,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // ==================== 6. RunAlignment ====================
  Widget _buildRunAlignmentExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'محاذاة الأسطر RunAlignment',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          // WrapAlignment.start
          _buildRunAlignmentExample(
            'WrapAlignment.start (default)',
            WrapAlignment.start,
          ),

          // WrapAlignment.center
          _buildRunAlignmentExample(
            'WrapAlignment.center',
            WrapAlignment.center,
          ),

          // WrapAlignment.end
          _buildRunAlignmentExample(
            'WrapAlignment.end',
            WrapAlignment.end,
          ),

          // WrapAlignment.spaceBetween
          _buildRunAlignmentExample(
            'WrapAlignment.spaceBetween',
            WrapAlignment.spaceBetween,
          ),

          // WrapAlignment.spaceAround
          _buildRunAlignmentExample(
            'WrapAlignment.spaceAround',
            WrapAlignment.spaceAround,
          ),

          // WrapAlignment.spaceEvenly
          _buildRunAlignmentExample(
            'WrapAlignment.spaceEvenly',
            WrapAlignment.spaceEvenly,
          ),
        ],
      ),
    );
  }

  Widget _buildRunAlignmentExample(String title, WrapAlignment runAlignment) {
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
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.green.shade200, width: 2),
          ),
          child: Wrap(
            runAlignment: runAlignment,
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
              8,
                  (index) => Container(
                width: 60,
                height: 50,
                color: Colors.green,
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // ==================== 7. CrossAxisAlignment ====================
  Widget _buildCrossAxisAlignmentExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'محاذاة عمودية CrossAxisAlignment',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          // WrapCrossAlignment.start
          _buildCrossAlignmentExample(
            'WrapCrossAlignment.start (default)',
            WrapCrossAlignment.start,
          ),

          // WrapCrossAlignment.center
          _buildCrossAlignmentExample(
            'WrapCrossAlignment.center',
            WrapCrossAlignment.center,
          ),

          // WrapCrossAlignment.end
          _buildCrossAlignmentExample(
            'WrapCrossAlignment.end',
            WrapCrossAlignment.end,
          ),
        ],
      ),
    );
  }

  Widget _buildCrossAlignmentExample(
      String title,
      WrapCrossAlignment crossAlignment,
      ) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 150,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.orange.shade200, width: 2),
          ),
          child: Wrap(
            crossAxisAlignment: crossAlignment,
            spacing: 8,
            runSpacing: 8,
            children: [
              Container(
                width: 60,
                height: 40,
                color: Colors.orange,
                child: const Center(child: Text('40')),
              ),
              Container(
                width: 60,
                height: 60,
                color: Colors.orange,
                child: const Center(child: Text('60')),
              ),
              Container(
                width: 60,
                height: 50,
                color: Colors.orange,
                child: const Center(child: Text('50')),
              ),
              Container(
                width: 60,
                height: 70,
                color: Colors.orange,
                child: const Center(child: Text('70')),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // ==================== 8. Mixed Widgets ====================
  Widget _buildMixedWidgetsExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'عناصر مختلفة Mixed Widgets',
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
              spacing: 8,
              runSpacing: 8,
              children: [
                // Icons
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.home, color: Colors.white),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.favorite, color: Colors.white),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.settings, color: Colors.white),
                ),
                // Chips
                Chip(
                  label: const Text('تصميم Design', textDirection: TextDirection.rtl),
                  avatar: const Icon(Icons.design_services, size: 18),
                  backgroundColor: Colors.purple.shade100,
                ),
                Chip(
                  label: const Text('تطوير Development', textDirection: TextDirection.rtl),
                  avatar: const Icon(Icons.code, size: 18),
                  backgroundColor: Colors.orange.shade100,
                ),
                Chip(
                  label: const Text('تسويق Marketing', textDirection: TextDirection.rtl),
                  avatar: const Icon(Icons.campaign, size: 18),
                  backgroundColor: Colors.pink.shade100,
                ),
                // Buttons
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('زر Button'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('زر محدد Outlined'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('زر نصي Text'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 9. Vertical Wrap ====================
  Widget _buildVerticalWrapExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Wrap عمودي مع خصائص',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 250,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Wrap(
              direction: Axis.vertical,
              spacing: 8,
              runSpacing: 8,
              runAlignment: WrapAlignment.spaceAround,
              children: List.generate(
                12,
                    (index) => Container(
                  width: 70,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.primaries[index % Colors.primaries.length],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'Wrap(\n'
                  '  direction: Axis.vertical,\n'
                  '  spacing: 8,\n'
                  '  runSpacing: 8,\n'
                  '  runAlignment: WrapAlignment.spaceAround,\n'
                  '  children: [...],\n'
                  ')'
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
          // Tags/Labels
          const Text(
            'وسوم Tags',
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
                    'مهارات Skills',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildTag('Flutter', Colors.blue),
                      _buildTag('Dart', Colors.cyan),
                      _buildTag('Firebase', Colors.orange),
                      _buildTag('UI/UX', Colors.purple),
                      _buildTag('API', Colors.green),
                      _buildTag('Git', Colors.red),
                      _buildTag('Mobile Dev', Colors.indigo),
                      _buildTag('React', Colors.teal),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Filter Chips
          const Text(
            'فلاتر Filters',
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
                    'فلتر المنتجات Filter Products',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      FilterChip(
                        label: const Text('الكل All', textDirection: TextDirection.rtl),
                        selected: true,
                        onSelected: (value) {},
                      ),
                      FilterChip(
                        label: const Text('إلكترونيات', textDirection: TextDirection.rtl),
                        selected: false,
                        onSelected: (value) {},
                      ),
                      FilterChip(
                        label: const Text('ملابس', textDirection: TextDirection.rtl),
                        selected: false,
                        onSelected: (value) {},
                      ),
                      FilterChip(
                        label: const Text('كتب', textDirection: TextDirection.rtl),
                        selected: false,
                        onSelected: (value) {},
                      ),
                      FilterChip(
                        label: const Text('رياضة', textDirection: TextDirection.rtl),
                        selected: false,
                        onSelected: (value) {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Social Actions
          const Text(
            'إجراءات اجتماعية Social Actions',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  _buildActionButton(
                    Icons.thumb_up_outlined,
                    'إعجاب Like',
                    Colors.blue,
                  ),
                  _buildActionButton(
                    Icons.comment_outlined,
                    'تعليق Comment',
                    Colors.green,
                  ),
                  _buildActionButton(
                    Icons.share_outlined,
                    'مشاركة Share',
                    Colors.orange,
                  ),
                  _buildActionButton(
                    Icons.bookmark_border,
                    'حفظ Save',
                    Colors.purple,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Image Gallery
          const Text(
            'معرض صور Image Gallery',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(
                  6,
                      (index) => Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.primaries[index % Colors.primaries.length]
                          .shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.image,
                      size: 40,
                      color: Colors.primaries[index % Colors.primaries.length],
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Colors Picker
          const Text(
            'اختيار الألوان Color Picker',
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
                    'اختر اللون المفضل Choose Color',
                    style: TextStyle(fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      Colors.red,
                      Colors.pink,
                      Colors.purple,
                      Colors.deepPurple,
                      Colors.indigo,
                      Colors.blue,
                      Colors.lightBlue,
                      Colors.cyan,
                      Colors.teal,
                      Colors.green,
                      Colors.lightGreen,
                      Colors.lime,
                      Colors.yellow,
                      Colors.amber,
                      Colors.orange,
                      Colors.deepOrange,
                      Colors.brown,
                      Colors.grey,
                    ].map((color) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 3,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color color) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
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