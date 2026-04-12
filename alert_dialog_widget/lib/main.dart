import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ✅ دعم اللغة العربية و RTL
      locale: const Locale('ar'),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      home: const AlertDialogScreen(),
    );
  }
}

class AlertDialogScreen extends StatelessWidget {
  const AlertDialogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          children: [
            _buildSectionTitle('AlertDialog بسيط'),
            _buildSimpleDialogExample(context),

            _buildSectionTitle('AlertDialog مع أزرار متعددة'),
            _buildMultiButtonDialogExample(context),

            _buildSectionTitle('AlertDialog مع محتوى مخصص'),
            _buildCustomContentDialogExample(context),

            _buildSectionTitle('AlertDialog مع حقل إدخال'),
            _buildInputDialogExample(context),

            _buildSectionTitle('AlertDialog غير قابل للإغلاق'),
            _buildNonDismissibleDialogExample(context),

            _buildSectionTitle('SimpleDialog لاختيار خيار'),
            _buildSimpleChoiceDialogExample(context),

            _buildSectionTitle('BottomSheet كبديل للـ Dialog'),
            _buildBottomSheetExample(context),

            _buildSectionTitle('Dialog مع صورة وتصميم مخصص'),
            _buildStyledDialogExample(context),
          ],
        ),
      ),
    );
  }

  // ==================== AppBar ====================
  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "مفاهيم AlertDialog",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blue,
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
        textDirection: TextDirection.rtl,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  // ==================== 1. AlertDialog بسيط ====================
  Widget _buildSimpleDialogExample(BuildContext context) {
    return _buildExampleTile(
      label: 'اضغط لفتح AlertDialog بسيط',
      icon: Icons.info_outline,
      color: Colors.blue,
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) => Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: const Text('تنبيه بسيط'),
              content: const Text(
                'هذا مثال على AlertDialog بسيط يحتوي على عنوان ومحتوى وزر واحد.',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('حسناً'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ==================== 2. AlertDialog مع أزرار متعددة ====================
  Widget _buildMultiButtonDialogExample(BuildContext context) {
    return _buildExampleTile(
      label: 'AlertDialog مع زر تأكيد وإلغاء',
      icon: Icons.check_circle_outline,
      color: Colors.green,
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) => Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: const Text('تأكيد الحذف'),
              content: const Text(
                'هل أنت متأكد أنك تريد حذف هذا العنصر؟ لا يمكن التراجع عن هذا الإجراء.',
              ),
              actions: [
                // ❌ زر الإلغاء
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text(
                    'إلغاء',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                // ✅ زر التأكيد
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                    // منطق الحذف هنا
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('حذف'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ==================== 3. AlertDialog مع محتوى مخصص ====================
  Widget _buildCustomContentDialogExample(BuildContext context) {
    return _buildExampleTile(
      label: 'AlertDialog مع محتوى Widget مخصص',
      icon: Icons.widgets_outlined,
      color: Colors.purple,
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) => Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: const Text('اختر لوناً'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('اختر لونك المفضل:'),
                  const SizedBox(height: 12),
                  // محتوى مخصص: صفوف ألوان
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Colors.red, Colors.green, Colors.blue, Colors.orange]
                        .map(
                          (c) => GestureDetector(
                        onTap: () => Navigator.of(ctx).pop(),
                        child: CircleAvatar(
                          backgroundColor: c,
                          radius: 20,
                        ),
                      ),
                    )
                        .toList(),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('إغلاق'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ==================== 4. AlertDialog مع حقل إدخال ====================
  Widget _buildInputDialogExample(BuildContext context) {
    return _buildExampleTile(
      label: 'AlertDialog مع TextField للإدخال',
      icon: Icons.edit_outlined,
      color: Colors.teal,
      onPressed: () {
        final controller = TextEditingController();
        showDialog(
          context: context,
          builder: (ctx) => Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: const Text('أدخل اسمك'),
              content: TextField(
                controller: controller,
                textDirection: TextDirection.rtl,
                decoration: const InputDecoration(
                  hintText: 'الاسم الكامل...',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('إلغاء'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final name = controller.text;
                    Navigator.of(ctx).pop();
                    // استخدام الاسم: name
                  },
                  child: const Text('تأكيد'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ==================== 5. AlertDialog غير قابل للإغلاق ====================
  Widget _buildNonDismissibleDialogExample(BuildContext context) {
    return _buildExampleTile(
      label: 'AlertDialog لا يُغلق بالضغط خارجه',
      icon: Icons.lock_outline,
      color: Colors.red,
      onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: false, // ⬅️ منع الإغلاق بالضغط خارجاً
          builder: (ctx) => Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: const Text('مهم جداً!'),
              content: const Text(
                'barrierDismissible: false\n\nلا يمكنك إغلاق هذا الـ Dialog بالضغط خارجه. يجب الضغط على الزر.',
              ),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('فهمت، أغلق'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ==================== 6. SimpleDialog لاختيار خيار ====================
  Widget _buildSimpleChoiceDialogExample(BuildContext context) {
    return _buildExampleTile(
      label: 'SimpleDialog لاختيار أحد الخيارات',
      icon: Icons.list_alt,
      color: Colors.orange,
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) => Directionality(
            textDirection: TextDirection.rtl,
            child: SimpleDialog(
              title: const Text('اختر لغة البرمجة'),
              children: [
                _buildSimpleDialogOption(ctx, '🐦 Flutter / Dart'),
                _buildSimpleDialogOption(ctx, '🐍 Python'),
                _buildSimpleDialogOption(ctx, '⚡ JavaScript'),
                _buildSimpleDialogOption(ctx, '☕ Java'),
              ],
            ),
          ),
        );
      },
    );
  }

  SimpleDialogOption _buildSimpleDialogOption(BuildContext ctx, String label) {
    return SimpleDialogOption(
      onPressed: () => Navigator.of(ctx).pop(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(label, style: const TextStyle(fontSize: 16)),
      ),
    );
  }

  // ==================== 7. BottomSheet ====================
  Widget _buildBottomSheetExample(BuildContext context) {
    return _buildExampleTile(
      label: 'showModalBottomSheet كبديل للـ Dialog',
      icon: Icons.arrow_upward,
      color: Colors.indigo,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (ctx) => Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'خيارات المشاركة',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildBottomSheetItem(Icons.share, 'مشاركة الرابط'),
                  _buildBottomSheetItem(Icons.copy, 'نسخ الرابط'),
                  _buildBottomSheetItem(Icons.download, 'تنزيل'),
                  _buildBottomSheetItem(Icons.report, 'إبلاغ عن مشكلة'),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomSheetItem(IconData icon, String label) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(label),
      onTap: () {},
    );
  }

  // ==================== 8. Dialog مخصص بتصميم جميل ====================
  Widget _buildStyledDialogExample(BuildContext context) {
    return _buildExampleTile(
      label: 'Dialog مخصص بتصميم وألوان متميزة',
      icon: Icons.star_outline,
      color: Colors.amber.shade700,
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) => Directionality(
            textDirection: TextDirection.rtl,
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header ملون
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.purple],
                      ),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: const Column(
                      children: [
                        Icon(Icons.emoji_events, color: Colors.white, size: 48),
                        SizedBox(height: 8),
                        Text(
                          'مبروك! 🎉',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Body
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Text(
                          'لقد أكملت المستوى بنجاح! استمر في التقدم للوصول إلى المستوى التالي.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, height: 1.5),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => Navigator.of(ctx).pop(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'استمر ▶',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () => Navigator.of(ctx).pop(),
                          child: const Text('العودة للقائمة'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // ==================== Helper: بطاقة زر المثال ====================
  Widget _buildExampleTile({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(
          label,
          textDirection: TextDirection.rtl,
          style: const TextStyle(fontSize: 14),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          alignment: Alignment.centerRight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}