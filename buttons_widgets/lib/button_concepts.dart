import 'package:flutter/material.dart';

class ButtonConcepts extends StatelessWidget {
  const ButtonConcepts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSectionTitle('1. ElevatedButton'),
            _buildElevatedButtonExamples(),

            _buildSectionTitle('2. ElevatedButton.icon'),
            _buildElevatedButtonIconExamples(),

            _buildSectionTitle('3. TextButton'),
            _buildTextButtonExamples(),

            _buildSectionTitle('4. OutlinedButton'),
            _buildOutlinedButtonExamples(),

            _buildSectionTitle('5. IconButton'),
            _buildIconButtonExamples(),

            _buildSectionTitle('6. FloatingActionButton'),
            _buildFloatingActionButtonExamples(),

            _buildSectionTitle('7. MaterialButton'),
            _buildMaterialButtonExamples(),

            _buildSectionTitle('8. InkWell'),
            _buildInkWellExamples(),

            _buildSectionTitle('9. GestureDetector'),
            _buildGestureDetectorExamples(),

            _buildSectionTitle('10. InkWell vs GestureDetector'),
            _buildInkWellVsGestureDetectorExamples(),

            _buildSectionTitle('11. Real-World Examples'),
            _buildRealWorldExamples(),

            const SizedBox(height: 80), // Space for FAB
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }

  // ==================== AppBar ====================
  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "Buttons & Interactive Widgets",
        style: TextStyle(color: Colors.white, fontSize: 18),
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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade100, Colors.blue.shade50],
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.blue.shade700,
        ),
      ),
    );
  }

  // ==================== 1. ElevatedButton ====================
  Widget _buildElevatedButtonExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'ElevatedButton - زر بارز مع ظل',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
              'زر رئيسي بارز مع ظل، يستخدم للإجراءات المهمة',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),

          const SizedBox(height: 16),

          // Basic
          const Text(
            'أساسي Basic',
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
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'زر عادي',
                    textDirection: TextDirection.rtl,
                  ),
                ),
                ElevatedButton(
                  onPressed: null, // Disabled
                  child: const Text(
                    'معطل',
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // With Style
          const Text(
            'مع تنسيق Styled',
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
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'أزرق',
                    textDirection: TextDirection.rtl,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'أخضر',
                    textDirection: TextDirection.rtl,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'أحمر',
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Different sizes
          const Text(
            'أحجام مختلفة Different Sizes',
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
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                  child: const Text(
                    'صغير Small',
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    'متوسط Medium',
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                  ),
                  child: const Text(
                    'كبير Large',
                    style: TextStyle(fontSize: 18),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Custom shapes
          const Text(
            'أشكال مخصصة Custom Shapes',
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
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('زوايا 8'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('زوايا 20'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('دائري Pill'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
          _buildCodeBox(
              'ElevatedButton(\n'
                  '  onPressed: () {},\n'
                  '  style: ElevatedButton.styleFrom(\n'
                  '    backgroundColor: Colors.blue,\n'
                  '    foregroundColor: Colors.white,\n'
                  '    padding: EdgeInsets.all(16),\n'
                  '  ),\n'
                  '  child: Text("زر"),\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 2. ElevatedButton.icon ====================
  Widget _buildElevatedButtonIconExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'ElevatedButton.icon - زر مع أيقونة',
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
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text(
                    'إضافة Add',
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                  label: const Text(
                    'تحميل Download',
                    textDirection: TextDirection.rtl,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                  label: const Text(
                    'مشاركة Share',
                    textDirection: TextDirection.rtl,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.delete),
                  label: const Text(
                    'حذف Delete',
                    textDirection: TextDirection.rtl,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'ElevatedButton.icon(\n'
                  '  onPressed: () {},\n'
                  '  icon: Icon(Icons.add),\n'
                  '  label: Text("إضافة"),\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 3. TextButton ====================
  Widget _buildTextButtonExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'TextButton - زر نصي بدون خلفية',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
              'زر نصي بسيط بدون خلفية، للإجراءات الثانوية',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),

          const SizedBox(height: 16),

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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('إلغاء Cancel', textDirection: TextDirection.rtl),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {},
                      child: const Text('تأكيد Confirm', textDirection: TextDirection.rtl),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.blue,
                      ),
                      child: const Text('أزرق', textDirection: TextDirection.rtl),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                      ),
                      child: const Text('أحمر', textDirection: TextDirection.rtl),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.green,
                      ),
                      child: const Text('أخضر', textDirection: TextDirection.rtl),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text(
                    'المزيد More',
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'TextButton(\n'
                  '  onPressed: () {},\n'
                  '  child: Text("نص"),\n'
                  ')\n\n'
                  'TextButton.icon(\n'
                  '  onPressed: () {},\n'
                  '  icon: Icon(Icons.add),\n'
                  '  label: Text("نص"),\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 4. OutlinedButton ====================
  Widget _buildOutlinedButtonExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'OutlinedButton - زر محدد بإطار',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
              'زر بإطار فقط بدون خلفية، للإجراءات المتوسطة الأهمية',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),

          const SizedBox(height: 16),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    'زر محدد',
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blue,
                    side: const BorderSide(color: Colors.blue, width: 2),
                  ),
                  child: const Text(
                    'أزرق',
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                  label: const Text(
                    'تعديل Edit',
                    textDirection: TextDirection.rtl,
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.green,
                    side: const BorderSide(color: Colors.green, width: 2),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'OutlinedButton(\n'
                  '  onPressed: () {},\n'
                  '  style: OutlinedButton.styleFrom(\n'
                  '    foregroundColor: Colors.blue,\n'
                  '    side: BorderSide(color: Colors.blue),\n'
                  '  ),\n'
                  '  child: Text("نص"),\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 5. IconButton ====================
  Widget _buildIconButtonExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'IconButton - زر أيقونة فقط',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
              'زر يحتوي على أيقونة فقط بدون نص',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),

          const SizedBox(height: 16),

          // Basic
          const Text(
            'أساسي Basic',
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
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.home),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                  color: Colors.red,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                  color: Colors.blue,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                  color: Colors.grey,
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Different sizes
          const Text(
            'أحجام مختلفة',
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.star),
                  iconSize: 20,
                  color: Colors.amber,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.star),
                  iconSize: 30,
                  color: Colors.amber,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.star),
                  iconSize: 40,
                  color: Colors.amber,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.star),
                  iconSize: 50,
                  color: Colors.amber,
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // With background
          const Text(
            'مع خلفية With Background',
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
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.check),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
          _buildCodeBox(
              'IconButton(\n'
                  '  onPressed: () {},\n'
                  '  icon: Icon(Icons.favorite),\n'
                  '  color: Colors.red,\n'
                  '  iconSize: 30,\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 6. FloatingActionButton ====================
  Widget _buildFloatingActionButtonExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'FloatingActionButton - زر عائم',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
              'زر دائري عائم للإجراء الرئيسي في الشاشة',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),

          const SizedBox(height: 16),

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
              alignment: WrapAlignment.center,
              children: [
                // Normal
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
                // Small
                FloatingActionButton.small(
                  onPressed: () {},
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.edit),
                ),
                // Large
                FloatingActionButton.large(
                  onPressed: () {},
                  backgroundColor: Colors.orange,
                  child: const Icon(Icons.camera),
                ),
                // Extended
                FloatingActionButton.extended(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text(
                    'إضافة',
                    textDirection: TextDirection.rtl,
                  ),
                  backgroundColor: Colors.purple,
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
          _buildCodeBox(
              'FloatingActionButton(\n'
                  '  onPressed: () {},\n'
                  '  child: Icon(Icons.add),\n'
                  ')\n\n'
                  'FloatingActionButton.extended(\n'
                  '  onPressed: () {},\n'
                  '  icon: Icon(Icons.add),\n'
                  '  label: Text("نص"),\n'
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
              children: [
                Icon(Icons.info_outline, color: Colors.amber),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'يوضع في Scaffold باستخدام floatingActionButton',
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

  // ==================== 7. MaterialButton ====================
  Widget _buildMaterialButtonExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'MaterialButton - زر قديم (مهمل)',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
            child: const Row(
              children: [
                Icon(Icons.warning_amber, color: Colors.orange),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'MaterialButton مهمل (deprecated)، استخدم ElevatedButton أو TextButton بدلاً منه',
                    style: TextStyle(fontSize: 13),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                MaterialButton(
                  onPressed: () {},
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: const Text(
                    'MaterialButton (قديم)',
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  '↓ استخدم بدلاً منه ↓',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'ElevatedButton (جديد)',
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

  // ==================== 8. InkWell ====================
  Widget _buildInkWellExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'InkWell - تفاعل مع تأثير Material',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
              'يضيف تفاعل بتأثير Ripple (موجة) من Material Design',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),

          const SizedBox(height: 16),

          // Basic InkWell
          const Text(
            'InkWell أساسي',
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
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'اضغط هنا - سترى تأثير Ripple',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // InkWell with custom splash color
          const Text(
            'مع لون Ripple مخصص',
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
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.red.withOpacity(0.3),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'أحمر',
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.green.withOpacity(0.3),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'أخضر',
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Custom cards with InkWell
          const Text(
            'بطاقات تفاعلية',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Card(
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(12),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.home, color: Colors.blue, size: 40),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'الرئيسية',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'الذهاب للصفحة الرئيسية',
                                  style: TextStyle(color: Colors.grey),
                                  textDirection: TextDirection.rtl,
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, size: 16),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Card(
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(12),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.settings, color: Colors.orange, size: 40),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'الإعدادات',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'تعديل الإعدادات',
                                  style: TextStyle(color: Colors.grey),
                                  textDirection: TextDirection.rtl,
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, size: 16),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
          _buildCodeBox(
              'InkWell(\n'
                  '  onTap: () {},\n'
                  '  splashColor: Colors.blue.withOpacity(0.3),\n'
                  '  borderRadius: BorderRadius.circular(8),\n'
                  '  child: Container(...),\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 9. GestureDetector ====================
  Widget _buildGestureDetectorExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'GestureDetector - كشف الحركات',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
              'يكشف جميع أنواع الحركات (نقر، سحب، تكبير...) بدون تأثير بصري',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),

          const SizedBox(height: 16),

          // Basic tap
          const Text(
            'نقرة بسيطة onTap',
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
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'اضغط هنا - بدون تأثير Ripple',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Multiple gestures
          const Text(
            'حركات متعددة Multiple Gestures',
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
            child: const GestureExample(),
          ),

          const SizedBox(height: 16),

          // Drag
          const Text(
            'السحب Drag',
            style: TextStyle(fontWeight: FontWeight.bold),
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
            ),
            child: const DraggableExample(),
          ),

          const SizedBox(height: 8),
          _buildCodeBox(
              'GestureDetector(\n'
                  '  onTap: () {},\n'
                  '  onDoubleTap: () {},\n'
                  '  onLongPress: () {},\n'
                  '  onPanUpdate: (details) {},\n'
                  '  child: Widget,\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 10. InkWell vs GestureDetector ====================
  Widget _buildInkWellVsGestureDetectorExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'الفرق بين InkWell و GestureDetector',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          // Comparison table
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200, width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'InkWell:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 8),
                _buildComparisonPoint('✓', 'يظهر تأثير Ripple (موجة)', Colors.green),
                _buildComparisonPoint('✓', 'من Material Design', Colors.green),
                _buildComparisonPoint('✓', 'يعطي تغذية بصرية للمستخدم', Colors.green),
                _buildComparisonPoint('✓', 'مناسب للبطاقات والقوائم', Colors.green),
                _buildComparisonPoint('✗', 'فقط onTap, onDoubleTap, onLongPress', Colors.red),

                const Divider(height: 24),

                const Text(
                  'GestureDetector:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 8),
                _buildComparisonPoint('✗', 'لا يظهر أي تأثير بصري', Colors.red),
                _buildComparisonPoint('✓', 'يكشف جميع أنواع الحركات', Colors.green),
                _buildComparisonPoint('✓', 'السحب، التمرير، التكبير...', Colors.green),
                _buildComparisonPoint('✓', 'مناسب للألعاب والرسم', Colors.green),
                _buildComparisonPoint('✓', 'تحكم كامل في الحركات', Colors.green),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Visual comparison
          const Text(
            'مقارنة بصرية',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Row(
            children: [
              // InkWell
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      'InkWell',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Card(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 100,
                          child: const Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.touch_app, size: 40, color: Colors.blue),
                                SizedBox(height: 8),
                                Text(
                                  'مع Ripple',
                                  style: TextStyle(fontSize: 12),
                                  textDirection: TextDirection.rtl,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),

              // GestureDetector
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      'GestureDetector',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Card(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 100,
                          child: const Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.touch_app, size: 40, color: Colors.orange),
                                SizedBox(height: 8),
                                Text(
                                  'بدون تأثير',
                                  style: TextStyle(fontSize: 12),
                                  textDirection: TextDirection.rtl,
                                ),
                              ],
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

          const SizedBox(height: 16),

          // When to use
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.amber.shade200),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.lightbulb_outline, color: Colors.amber),
                    SizedBox(width: 8),
                    Text(
                      'متى تستخدم أيهما؟',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  '🟦 InkWell:\n'
                      '• للأزرار والبطاقات والقوائم\n'
                      '• عندما تريد تغذية بصرية (Ripple)\n'
                      '• واجهات Material Design\n\n'
                      '🟧 GestureDetector:\n'
                      '• للألعاب والرسم والتطبيقات المخصصة\n'
                      '• عندما تحتاج حركات معقدة (سحب، تكبير)\n'
                      '• عندما لا تريد تأثير Ripple',
                  style: TextStyle(fontSize: 13),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComparisonPoint(String icon, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            icon,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 11. Real-World Examples ====================
  Widget _buildRealWorldExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Dialog buttons
          const Text(
            'أزرار مربع حوار Dialog Buttons',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Icon(Icons.delete_outline, size: 60, color: Colors.red),
                  const SizedBox(height: 16),
                  const Text(
                    'هل أنت متأكد؟',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'سيتم حذف هذا العنصر نهائياً',
                    style: TextStyle(color: Colors.grey),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'إلغاء',
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          'حذف',
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Action buttons row
          const Text(
            'أزرار الإجراءات Action Buttons',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border),
                          label: const Text(
                            'إعجاب',
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.comment_outlined),
                          label: const Text(
                            'تعليق',
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.share),
                      label: const Text(
                        'مشاركة Share',
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
          ),

          const SizedBox(height: 24),

          // Social media actions
          const Text(
            'إجراءات تفاعلية Interactive Actions',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.thumb_up_outlined),
                        color: Colors.blue,
                        iconSize: 28,
                      ),
                      const Text(
                        '245',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.comment_outlined),
                        color: Colors.green,
                        iconSize: 28,
                      ),
                      const Text(
                        '89',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.share_outlined),
                        color: Colors.orange,
                        iconSize: 28,
                      ),
                      const Text(
                        '34',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.bookmark_border),
                        color: Colors.purple,
                        iconSize: 28,
                      ),
                      const Text(
                        'حفظ',
                        style: TextStyle(fontSize: 12),
                        textDirection: TextDirection.rtl,
                      ),
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

// ==================== Gesture Example ====================
class GestureExample extends StatefulWidget {
  const GestureExample({super.key});

  @override
  State<GestureExample> createState() => _GestureExampleState();
}

class _GestureExampleState extends State<GestureExample> {
  String _action = 'اضغط في أي مكان';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _action = 'نقرة واحدة Tap';
        });
      },
      onDoubleTap: () {
        setState(() {
          _action = 'نقرة مزدوجة Double Tap';
        });
      },
      onLongPress: () {
        setState(() {
          _action = 'ضغط طويل Long Press';
        });
      },
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.teal.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            _action,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }
}

// ==================== Draggable Example ====================
class DraggableExample extends StatefulWidget {
  const DraggableExample({super.key});

  @override
  State<DraggableExample> createState() => _DraggableExampleState();
}

class _DraggableExampleState extends State<DraggableExample> {
  Offset _position = const Offset(50, 50);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: _position.dx,
          top: _position.dy,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                _position = Offset(
                  _position.dx + details.delta.dx,
                  _position.dy + details.delta.dy,
                );
              });
            },
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Icon(
                  Icons.drag_indicator,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}