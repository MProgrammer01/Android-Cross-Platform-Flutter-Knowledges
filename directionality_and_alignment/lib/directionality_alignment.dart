import 'package:flutter/material.dart';

class DirectionalityAlignmentApp extends StatelessWidget {
  const DirectionalityAlignmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSectionTitle('1. Directionality Widget'),
            _buildDirectionalityExamples(),
            
            _buildSectionTitle('2. TextDirection'),
            _buildTextDirectionExamples(),
            
            _buildSectionTitle('3. Alignment Widget'),
            _buildAlignmentWidgetExamples(),
            
            _buildSectionTitle('4. Alignment Values (9 Positions)'),
            _buildAlignmentValuesExamples(),
            
            _buildSectionTitle('5. Custom Alignment (x, y)'),
            _buildCustomAlignmentExamples(),
            
            _buildSectionTitle('6. AlignmentDirectional'),
            _buildAlignmentDirectionalExamples(),
            
            _buildSectionTitle('7. EdgeInsetsDirectional'),
            _buildEdgeInsetsDirectionalExamples(),
            
            _buildSectionTitle('8. Alignment in Container'),
            _buildAlignmentInContainerExamples(),
            
            _buildSectionTitle('9. Directionality with RTL/LTR'),
            _buildRtlLtrComparisonExamples(),
            
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
        "Directionality & Alignment",
        style: TextStyle(color: Colors.white, fontSize: 18),
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

  // ==================== 1. Directionality ====================
  Widget _buildDirectionalityExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Directionality - تحديد اتجاه المحتوى',
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
              'Directionality widget يحدد اتجاه العناصر الفرعية (RTL أو LTR) لكل ما بداخله',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),
          
          const SizedBox(height: 16),
          
          // LTR Example
          const Text(
            'Directionality.ltr',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue, width: 2),
            ),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.blue,
                    child: const Text('1', style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green,
                    child: const Text('2', style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.orange,
                    child: const Text('3', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            '← الترتيب: 1, 2, 3 (من اليسار لليمين)',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          
          const SizedBox(height: 16),
          
          // RTL Example
          const Text(
            'Directionality.rtl',
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
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.blue,
                    child: const Text('1', style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green,
                    child: const Text('2', style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.orange,
                    child: const Text('3', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            '→ الترتيب: 1, 2, 3 (من اليمين لليسار)',
            style: TextStyle(fontSize: 12, color: Colors.grey),
            textDirection: TextDirection.rtl,
          ),
          
          const SizedBox(height: 8),
          _buildCodeBox(
            'Directionality(\n'
            '  textDirection: TextDirection.rtl,\n'
            '  child: Row(\n'
            '    children: [...],\n'
            '  ),\n'
            ')'
          ),
        ],
      ),
    );
  }

  // ==================== 2. TextDirection ====================
  Widget _buildTextDirectionExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'TextDirection - اتجاه النص',
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
              'يحدد اتجاه النص نفسه فقط (وليس كل العناصر مثل Directionality)',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'TextDirection.rtl:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.white,
                  child: const Text(
                    'مرحباً بكم في تطبيق Flutter',
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(height: 12),
                
                const Text(
                  'TextDirection.ltr:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.white,
                  child: const Text(
                    'مرحباً بكم في تطبيق Flutter',
                    textDirection: TextDirection.ltr,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Mixed content
          const Text(
            'محتوى مختلط عربي/إنجليزي',
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
                Text(
                  'السعر: 100 درهم Price: 100 MAD',
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 8),
                Text(
                  'Email: test@example.com البريد الإلكتروني',
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 8),
          _buildCodeBox(
            'Text(\n'
            '  "نص عربي",\n'
            '  textDirection: TextDirection.rtl,\n'
            ')'
          ),
        ],
      ),
    );
  }

  // ==================== 3. Alignment Widget ====================
  Widget _buildAlignmentWidgetExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Align Widget - محاذاة العنصر',
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
              'Align widget يضع العنصر الفرعي في موضع محدد داخل المساحة المتاحة',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),
          
          const SizedBox(height: 16),
          
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.purple, width: 2),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 100,
                height: 50,
                color: Colors.purple,
                child: const Center(
                  child: Text(
                    'في المنتصف',
                    style: TextStyle(color: Colors.white),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 8),
          _buildCodeBox(
            'Align(\n'
            '  alignment: Alignment.center,\n'
            '  child: Widget,\n'
            ')'
          ),
        ],
      ),
    );
  }

  // ==================== 4. Alignment Values ====================
  Widget _buildAlignmentValuesExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            '9 مواضع Alignment الأساسية',
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
              border: Border.all(color: Colors.indigo, width: 2),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: _buildAlignBox('topLeft', Colors.red),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: _buildAlignBox('topCenter', Colors.orange),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: _buildAlignBox('topRight', Colors.amber),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: _buildAlignBox('centerLeft', Colors.green),
                ),
                Align(
                  alignment: Alignment.center,
                  child: _buildAlignBox('center', Colors.blue),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: _buildAlignBox('centerRight', Colors.indigo),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: _buildAlignBox('bottomLeft', Colors.purple),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildAlignBox('bottomCenter', Colors.pink),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: _buildAlignBox('bottomRight', Colors.teal),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 8),
          _buildCodeBox(
            'Alignment.topLeft      Alignment.topCenter      Alignment.topRight\n'
            'Alignment.centerLeft   Alignment.center         Alignment.centerRight\n'
            'Alignment.bottomLeft   Alignment.bottomCenter   Alignment.bottomRight'
          ),
        ],
      ),
    );
  }

  Widget _buildAlignBox(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }

  // ==================== 5. Custom Alignment ====================
  Widget _buildCustomAlignmentExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Alignment مخصص (x, y)',
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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Alignment(x, y):',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  '• x: -1 (يسار) إلى 1 (يمين), 0 = المنتصف\n'
                  '• y: -1 (أعلى) إلى 1 (أسفل), 0 = المنتصف',
                  style: TextStyle(fontSize: 13),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue, width: 2),
            ),
            child: Align(
              alignment: const Alignment(0.5, -0.5),
              child: Container(
                width: 80,
                height: 50,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    '(0.5, -0.5)',
                    style: TextStyle(color: Colors.white, fontSize: 12),
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
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                    alignment: const Alignment(-0.5, 0),
                    child: Container(
                      width: 50,
                      height: 40,
                      color: Colors.green,
                      child: const Center(
                        child: Text(
                          '(-0.5, 0)',
                          style: TextStyle(color: Colors.white, fontSize: 10),
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
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                    alignment: const Alignment(1, 1),
                    child: Container(
                      width: 50,
                      height: 40,
                      color: Colors.red,
                      child: const Center(
                        child: Text(
                          '(1, 1)',
                          style: TextStyle(color: Colors.white, fontSize: 10),
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
            'Align(\n'
            '  alignment: Alignment(0.5, -0.5),\n'
            '  // x: 0.5 = يمين قليلاً\n'
            '  // y: -0.5 = أعلى قليلاً\n'
            '  child: Widget,\n'
            ')'
          ),
        ],
      ),
    );
  }

  // ==================== 6. AlignmentDirectional ====================
  Widget _buildAlignmentDirectionalExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'AlignmentDirectional - محاذاة تتبع الاتجاه',
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
              'يستخدم start/end بدلاً من left/right، فيتغير تلقائياً حسب RTL أو LTR',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),
          
          const SizedBox(height: 16),
          
          // RTL Context
          const Text(
            'في سياق RTL (عربي)',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  color: Colors.green,
                  child: const Text(
                    'centerStart',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            '↑ في RTL: start = يمين',
            style: TextStyle(fontSize: 12, color: Colors.grey),
            textDirection: TextDirection.rtl,
          ),
          
          const SizedBox(height: 16),
          
          // LTR Context
          const Text(
            'في سياق LTR (إنجليزي)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue, width: 2),
            ),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  color: Colors.blue,
                  child: const Text(
                    'centerStart',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            '↑ في LTR: start = يسار',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          
          const SizedBox(height: 8),
          _buildCodeBox(
            'Align(\n'
            '  alignment: AlignmentDirectional.centerStart,\n'
            '  // start = يمين في RTL / يسار في LTR\n'
            '  // end = يسار في RTL / يمين في LTR\n'
            '  child: Widget,\n'
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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '⭐ الأفضل للتطبيقات متعددة اللغات:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 4),
                Text(
                  'استخدم AlignmentDirectional بدلاً من Alignment العادي\n'
                  'حتى يعمل تطبيقك بشكل صحيح مع اللغة العربية والإنجليزية',
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

  // ==================== 7. EdgeInsetsDirectional ====================
  Widget _buildEdgeInsetsDirectionalExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'EdgeInsetsDirectional - مسافات تتبع الاتجاه',
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
              'مثل EdgeInsets لكن يستخدم start/end بدلاً من left/right',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),
          
          const SizedBox(height: 16),
          
          // RTL
          const Text(
            'في RTL - start: 40',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 40),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  color: Colors.green,
                  child: const Text(
                    'محتوى',
                    style: TextStyle(color: Colors.white),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            '↑ start=40 يعني مسافة من اليمين في RTL',
            style: TextStyle(fontSize: 12, color: Colors.grey),
            textDirection: TextDirection.rtl,
          ),
          
          const SizedBox(height: 16),
          
          // LTR
          const Text(
            'في LTR - start: 40',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue, width: 2),
            ),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 40),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  color: Colors.blue,
                  child: const Text(
                    'Content',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            '↑ start=40 يعني مسافة من اليسار في LTR',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          
          const SizedBox(height: 8),
          _buildCodeBox(
            'Padding(\n'
            '  padding: EdgeInsetsDirectional.only(\n'
            '    start: 20,\n'
            '    end: 10,\n'
            '  ),\n'
            '  child: Widget,\n'
            ')'
          ),
        ],
      ),
    );
  }

  // ==================== 8. Alignment in Container ====================
  Widget _buildAlignmentInContainerExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'استخدام alignment في Container',
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
              'Container يحتوي على خاصية alignment مباشرة (بدون الحاجة لـ Align)',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),
          
          const SizedBox(height: 16),
          
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Text('topLeft', style: TextStyle(fontSize: 12)),
                    const SizedBox(height: 4),
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 30,
                        height: 30,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  children: [
                    const Text('center', style: TextStyle(fontSize: 12)),
                    const SizedBox(height: 4),
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Container(
                        width: 30,
                        height: 30,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  children: [
                    const Text('bottomRight', style: TextStyle(fontSize: 12)),
                    const SizedBox(height: 4),
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 30,
                        height: 30,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          _buildCodeBox(
            'Container(\n'
            '  alignment: Alignment.center,\n'
            '  child: Widget,\n'
            ')\n\n'
            '// أبسط من:\n'
            'Align(\n'
            '  alignment: Alignment.center,\n'
            '  child: Widget,\n'
            ')'
          ),
        ],
      ),
    );
  }

  // ==================== 9. RTL vs LTR Comparison ====================
  Widget _buildRtlLtrComparisonExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'مقارنة شاملة RTL vs LTR',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          
          // Row comparison
          const Text(
            'ترتيب Row',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Text('LTR', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildMiniBox('1', Colors.red),
                            _buildMiniBox('2', Colors.green),
                            _buildMiniBox('3', Colors.blue),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  children: [
                    const Text('RTL', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildMiniBox('1', Colors.red),
                            _buildMiniBox('2', Colors.green),
                            _buildMiniBox('3', Colors.blue),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Padding comparison table
          const Text(
            'جدول المقارنة',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Table(
              border: TableBorder.all(color: Colors.grey.shade400),
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.indigo.shade100),
                  children: [
                    _buildTableCell('المفهوم', bold: true),
                    _buildTableCell('LTR', bold: true),
                    _buildTableCell('RTL', bold: true),
                  ],
                ),
                TableRow(
                  children: [
                    _buildTableCell('start'),
                    _buildTableCell('يسار'),
                    _buildTableCell('يمين'),
                  ],
                ),
                TableRow(
                  children: [
                    _buildTableCell('end'),
                    _buildTableCell('يمين'),
                    _buildTableCell('يسار'),
                  ],
                ),
                TableRow(
                  children: [
                    _buildTableCell('Row order'),
                    _buildTableCell('L → R'),
                    _buildTableCell('R → L'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniBox(String text, Color color) {
    return Container(
      width: 35,
      height: 35,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      color: color,
      child: Center(
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildTableCell(String text, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          fontSize: 13,
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      ),
    );
  }

  // ==================== 10. Real-World Examples ====================
  Widget _buildRealWorldExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // App wrapper with Directionality
          const Text(
            'تطبيق كامل مع Directionality',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
              'أفضل ممارسة: استخدم MaterialApp.locale بدلاً من Directionality يدوياً',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),
          
          const SizedBox(height: 8),
          _buildCodeBox(
            '// في main.dart\n'
            'MaterialApp(\n'
            '  locale: Locale("ar"),\n'
            '  supportedLocales: [\n'
            '    Locale("ar"),\n'
            '    Locale("en"),\n'
            '  ],\n'
            '  home: MyApp(),\n'
            ')'
          ),
          
          const SizedBox(height: 24),
          
          // Card with badge (top-right in RTL)
          const Text(
            'بطاقة مع Badge (يستخدم Align)',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          
          SizedBox(
            height: 150,
            child: Stack(
              children: [
                Card(
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    padding: const EdgeInsets.all(16),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'منتج جديد',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'وصف المنتج هنا...',
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'جديد',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Chat bubble (aligned by sender)
          const Text(
            'فقاعات محادثة Chat Bubbles',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                // Received message (start)
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'مرحباً! كيف حالك؟',
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Sent message (end)
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'أنا بخير شكراً!',
                      style: TextStyle(color: Colors.white),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'رائع! هل نلتقي غداً؟',
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 8),
          _buildCodeBox(
            '// فقاعة المستلم (تظهر عند البداية)\n'
            'Align(\n'
            '  alignment: AlignmentDirectional.centerStart,\n'
            '  child: MessageBubble(),\n'
            ')\n\n'
            '// فقاعة المرسل (تظهر عند النهاية)\n'
            'Align(\n'
            '  alignment: AlignmentDirectional.centerEnd,\n'
            '  child: MessageBubble(),\n'
            ')'
          ),
          
          const SizedBox(height: 24),
          
          // Login form with icon positioning
          const Text(
            'نموذج مع أيقونات موضعية',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      hintText: 'البريد الإلكتروني',
                      hintTextDirection: TextDirection.rtl,
                      // في RTL: الأيقونة تظهر تلقائياً على اليمين
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    textDirection: TextDirection.rtl,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'كلمة المرور',
                      hintTextDirection: TextDirection.rtl,
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
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