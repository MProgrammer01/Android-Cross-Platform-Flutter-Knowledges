import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      home: const ListTileScreen(),
    );
  }
}

class ListTileScreen extends StatefulWidget {
  const ListTileScreen({super.key});

  @override
  State<ListTileScreen> createState() => _ListTileScreenState();
}

class _ListTileScreenState extends State<ListTileScreen> {
  bool _switchValue = true;
  bool _checkboxValue = false;
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          children: [
            _buildSectionTitle('ListTile الأساسي'),
            _buildBasicListTileExamples(),

            _buildSectionTitle('leading و trailing'),
            _buildLeadingTrailingExamples(),

            _buildSectionTitle('ListTile مع subtitle'),
            _buildSubtitleExamples(),

            _buildSectionTitle('isThreeLine و dense'),
            _buildThreeLineAndDenseExamples(),

            _buildSectionTitle('ListTile مع Checkbox'),
            _buildCheckboxListTileExample(),

            _buildSectionTitle('ListTile مع Switch'),
            _buildSwitchListTileExample(),

            _buildSectionTitle('ListTile مع Radio'),
            _buildRadioListTileExample(),

            _buildSectionTitle('onTap و onLongPress'),
            _buildTapExamples(),

            _buildSectionTitle('تخصيص الألوان والشكل'),
            _buildStyledListTileExamples(),

            _buildSectionTitle('ExpansionTile'),
            _buildExpansionTileExample(),

            _buildSectionTitle('ListTile داخل Card'),
            _buildCardListTileExample(),

            _buildSectionTitle('قائمة ListTile كاملة'),
            _buildFullListExample(),
          ],
        ),
      ),
    );
  }

  // ==================== AppBar ====================
  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'مفاهيم ListTile',
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

  // ==================== 1. ListTile الأساسي ====================
  Widget _buildBasicListTileExamples() {
    return Column(
      children: [
        // أبسط شكل
        const ListTile(
          title: Text('title فقط - أبسط شكل للـ ListTile'),
        ),
        const Divider(height: 1),

        // مع تحديد النص
        ListTile(
          title: const Text('title مع تحديد النص يدوياً'),
          subtitle: Text(
            'subtitle: نص ثانوي أسفل العنوان',
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }

  // ==================== 2. leading و trailing ====================
  Widget _buildLeadingTrailingExamples() {
    return Column(
      children: [
        // leading: Icon
        const ListTile(
          leading: Icon(Icons.person, color: Colors.blue),
          title: Text('leading: Icon'),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
        const Divider(height: 1),

        // leading: CircleAvatar
        const ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green,
            child: Text('أ', style: TextStyle(color: Colors.white)),
          ),
          title: Text('leading: CircleAvatar'),
          trailing: Text(
            'trailing: نص',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        const Divider(height: 1),

        // leading: Container ملون
        ListTile(
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.purple.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.star, color: Colors.purple),
          ),
          title: const Text('leading: Container مخصص'),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'جديد',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }

  // ==================== 3. subtitle ====================
  Widget _buildSubtitleExamples() {
    return Column(
      children: [
        // subtitle نص عادي
        const ListTile(
          leading: Icon(Icons.email, color: Colors.teal),
          title: Text('البريد الإلكتروني'),
          subtitle: Text('example@email.com'),
        ),
        const Divider(height: 1),

        // subtitle مع تنسيق
        ListTile(
          leading: const Icon(Icons.phone, color: Colors.green),
          title: const Text('رقم الهاتف'),
          subtitle: Text(
            '+212 600 000 000',
            style: TextStyle(
              color: Colors.green.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(Icons.call, color: Colors.green),
        ),
        const Divider(height: 1),
      ],
    );
  }

  // ==================== 4. isThreeLine و dense ====================
  Widget _buildThreeLineAndDenseExamples() {
    return Column(
      children: [
        // isThreeLine: false (افتراضي)
        const ListTile(
          leading: Icon(Icons.message, color: Colors.blue),
          title: Text('isThreeLine: false (افتراضي)'),
          subtitle: Text('هذا نص ثانوي قصير'),
        ),
        const Divider(height: 1),

        // isThreeLine: true
        const ListTile(
          leading: Icon(Icons.message, color: Colors.orange),
          title: Text('isThreeLine: true'),
          subtitle: Text(
            'هذا نص ثانوي يمكن أن يمتد لسطرين أو أكثر بفضل خاصية isThreeLine',
          ),
          isThreeLine: true,
        ),
        const Divider(height: 1),

        // dense: true
        const ListTile(
          leading: Icon(Icons.compress, color: Colors.purple),
          title: Text('dense: true - حجم أصغر وتباعد أقل'),
          subtitle: Text('subtitle مضغوط'),
          dense: true,
        ),
        const Divider(height: 1),

        // dense: false
        const ListTile(
          leading: Icon(Icons.expand, color: Colors.indigo),
          title: Text('dense: false - الحجم الطبيعي'),
          subtitle: Text('subtitle عادي'),
          dense: false,
        ),
        const Divider(height: 1),
      ],
    );
  }

  // ==================== 5. CheckboxListTile ====================
  Widget _buildCheckboxListTileExample() {
    return Column(
      children: [
        CheckboxListTile(
          value: _checkboxValue,
          onChanged: (val) => setState(() => _checkboxValue = val!),
          title: const Text('CheckboxListTile - اضغط للتفعيل'),
          subtitle: const Text('الـ Checkbox يكون في اليسار العنصر افتراضياً'),
        ),
        const Divider(height: 1),

        // controlAffinity يسار
        CheckboxListTile(
          value: _checkboxValue,
          onChanged: (val) => setState(() => _checkboxValue = val!),
          title: const Text('controlAffinity: leading'),
          subtitle: const Text('الـ Checkbox انتقل لليمين'),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        const Divider(height: 1),
      ],
    );
  }

  // ==================== 6. SwitchListTile ====================
  Widget _buildSwitchListTileExample() {
    return Column(
      children: [
        SwitchListTile(
          value: _switchValue,
          onChanged: (val) => setState(() => _switchValue = val),
          title: const Text('SwitchListTile'),
          subtitle: Text(_switchValue ? '✅ مفعّل' : '❌ معطّل'),
          secondary: Icon(
            _switchValue ? Icons.notifications_active : Icons.notifications_off,
            color: _switchValue ? Colors.blue : Colors.grey,
          ),
          activeColor: Colors.blue,
        ),
        const Divider(height: 1),
      ],
    );
  }

  // ==================== 7. RadioListTile ====================
  Widget _buildRadioListTileExample() {
    return Column(
      children: [
        RadioListTile<int>(
          value: 0,
          groupValue: _selectedIndex,
          onChanged: (val) => setState(() => _selectedIndex = val!),
          title: const Text('الخيار الأول'),
          subtitle: const Text('RadioListTile - اختيار واحد فقط'),
        ),
        RadioListTile<int>(
          value: 1,
          groupValue: _selectedIndex,
          onChanged: (val) => setState(() => _selectedIndex = val!),
          title: const Text('الخيار الثاني'),
          subtitle: const Text('radioListTile مع groupValue'),
        ),
        RadioListTile<int>(
          value: 2,
          groupValue: _selectedIndex,
          onChanged: (val) => setState(() => _selectedIndex = val!),
          title: const Text('الخيار الثالث'),
          subtitle: Text('الخيار المحدد: ${_selectedIndex + 1}'),
        ),
        const Divider(height: 1),
      ],
    );
  }

  // ==================== 8. onTap و onLongPress ====================
  Widget _buildTapExamples() {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.touch_app, color: Colors.blue),
          title: const Text('onTap - اضغط مرة'),
          subtitle: const Text('سيظهر SnackBar عند الضغط'),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('تم الضغط على onTap! ✅'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
        const Divider(height: 1),

        ListTile(
          leading: const Icon(Icons.pan_tool, color: Colors.orange),
          title: const Text('onLongPress - اضغط مطولاً'),
          subtitle: const Text('سيظهر SnackBar عند الضغط المطول'),
          onLongPress: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('تم الضغط المطول على onLongPress! 🔥'),
                backgroundColor: Colors.orange,
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
        const Divider(height: 1),
      ],
    );
  }

  // ==================== 9. تخصيص الألوان والشكل ====================
  Widget _buildStyledListTileExamples() {
    return Column(
      children: [
        // tileColor
        const ListTile(
          tileColor: Color(0xFFE3F2FD),
          leading: Icon(Icons.palette, color: Colors.blue),
          title: Text('tileColor: لون خلفية الـ ListTile'),
          subtitle: Text('tileColor: Colors.blue.shade50'),
        ),
        const SizedBox(height: 4),

        // selectedTileColor
        ListTile(
          selected: true,
          selectedTileColor: Colors.green.shade100,
          selectedColor: Colors.green,
          leading: const Icon(Icons.check_circle),
          title: const Text('selected: true'),
          subtitle: const Text('selectedTileColor و selectedColor'),
        ),
        const SizedBox(height: 4),

        // shape مخصص
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Colors.purple, width: 1.5),
          ),
          tileColor: Colors.purple.shade50,
          leading: const Icon(Icons.rounded_corner, color: Colors.purple),
          title: const Text('shape: RoundedRectangleBorder'),
          subtitle: const Text('حدود دائرية مع border'),
        ),
        const SizedBox(height: 4),

        // contentPadding
        const ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          tileColor: Color(0xFFFFF9C4),
          leading: Icon(Icons.space_bar, color: Colors.amber),
          title: Text('contentPadding مخصص'),
          subtitle: Text('contentPadding: horizontal: 32, vertical: 12'),
        ),
        const SizedBox(height: 4),
      ],
    );
  }

  // ==================== 10. ExpansionTile ====================
  Widget _buildExpansionTileExample() {
    return Column(
      children: [
        ExpansionTile(
          leading: const Icon(Icons.flutter_dash, color: Colors.blue),
          title: const Text('ExpansionTile - اضغط للتوسيع'),
          subtitle: const Text('يحتوي على عناصر مخفية'),
          children: [
            ListTile(
              leading: const Icon(Icons.circle, size: 12, color: Colors.grey),
              title: const Text('عنصر داخلي أول'),
              dense: true,
            ),
            ListTile(
              leading: const Icon(Icons.circle, size: 12, color: Colors.grey),
              title: const Text('عنصر داخلي ثانٍ'),
              dense: true,
            ),
            ListTile(
              leading: const Icon(Icons.circle, size: 12, color: Colors.grey),
              title: const Text('عنصر داخلي ثالث'),
              dense: true,
            ),
          ],
        ),
        const Divider(height: 1),

        ExpansionTile(
          leading: const Icon(Icons.settings, color: Colors.grey),
          title: const Text('إعدادات متقدمة'),
          initiallyExpanded: true,
          backgroundColor: Colors.grey.shade50,
          collapsedBackgroundColor: Colors.white,
          children: [
            SwitchListTile(
              value: _switchValue,
              onChanged: (val) => setState(() => _switchValue = val),
              title: const Text('الإشعارات'),
              dense: true,
            ),
            CheckboxListTile(
              value: _checkboxValue,
              onChanged: (val) => setState(() => _checkboxValue = val!),
              title: const Text('الوضع الليلي'),
              dense: true,
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ],
        ),
        const Divider(height: 1),
      ],
    );
  }

  // ==================== 11. ListTile داخل Card ====================
  Widget _buildCardListTileExample() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Card(
            elevation: 3,
            color: Colors.blue.shade700,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const ListTile(
              leading: Icon(Icons.cloud_done, color: Colors.white, size: 36),
              title: Text(
                'النسخ الاحتياطي',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'آخر نسخ: اليوم 10:30 ص',
                style: TextStyle(color: Colors.white70),
              ),
              trailing: Icon(Icons.refresh, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 12. قائمة كاملة ====================
  Widget _buildFullListExample() {
    final items = [
      {'icon': Icons.home, 'title': 'الرئيسية', 'sub': 'الصفحة الرئيسية', 'color': Colors.blue},
      {'icon': Icons.person, 'title': 'الملف الشخصي', 'sub': 'بيانات المستخدم', 'color': Colors.green},
      {'icon': Icons.shopping_cart, 'title': 'سلة التسوق', 'sub': '3 منتجات', 'color': Colors.orange},
      {'icon': Icons.favorite, 'title': 'المفضلة', 'sub': '12 عنصر', 'color': Colors.red},
      {'icon': Icons.settings, 'title': 'الإعدادات', 'sub': 'تخصيص التطبيق', 'color': Colors.grey},
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: (item['color'] as Color).withOpacity(0.15),
            child: Icon(item['icon'] as IconData, color: item['color'] as Color),
          ),
          title: Text(item['title'] as String),
          subtitle: Text(item['sub'] as String),
          trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
          onTap: () {},
        );
      },
    );
  }
}