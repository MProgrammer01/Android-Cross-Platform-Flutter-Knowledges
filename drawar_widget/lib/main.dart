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
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      home: const DrawerScreen(),
    );
  }
}

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  int _selectedIndex = 0;
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> _menuItems = [
    {'icon': Icons.home, 'title': 'الرئيسية', 'badge': null},
    {'icon': Icons.person, 'title': 'الملف الشخصي', 'badge': null},
    {'icon': Icons.notifications, 'title': 'الإشعارات', 'badge': '5'},
    {'icon': Icons.message, 'title': 'الرسائل', 'badge': '12'},
    {'icon': Icons.bookmark, 'title': 'المحفوظات', 'badge': null},
    {'icon': Icons.settings, 'title': 'الإعدادات', 'badge': null},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(),
      // ── drawer: يفتح من اليمين في RTL
      drawer: _buildMainDrawer(),
      // ── endDrawer: يفتح من اليسار
      endDrawer: _buildEndDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          children: [
            // ── 1
            _buildSectionTitle('1️⃣  Drawer الأساسي'),
            _buildConceptCard(
              description: 'drawer: اضغط على (☰) في الـ AppBar',
              code: 'Scaffold(\n  drawer: Drawer(...),\n)',
              color: Colors.blue,
            ),

            // ── 2
            _buildSectionTitle('2️⃣  endDrawer'),
            _buildConceptCard(
              description: 'endDrawer: اضغط على (←) في الـ AppBar',
              code: 'Scaffold(\n  endDrawer: Drawer(...),\n)',
              color: Colors.green,
              buttonLabel: 'فتح endDrawer',
              onTap: () => _scaffoldKey.currentState?.openEndDrawer(),
            ),

            // ── 3
            _buildSectionTitle('3️⃣  DrawerHeader'),
            _buildExample(child: _buildDrawerHeaderPreview()),

            // ── 4
            _buildSectionTitle('4️⃣  UserAccountsDrawerHeader'),
            _buildExample(child: _buildUserAccountsPreview()),

            // ── 5
            _buildSectionTitle('5️⃣  DrawerHeader مع Gradient مخصص'),
            _buildExample(child: _buildGradientHeaderPreview()),

            // ── 6
            _buildSectionTitle('6️⃣  ListTile داخل Drawer'),
            _buildExample(child: _buildListTilePreview()),

            // ── 7
            _buildSectionTitle('7️⃣  selected و selectedTileColor'),
            _buildExample(child: _buildSelectedTilePreview()),

            // ── 8
            _buildSectionTitle('8️⃣  Drawer مع Divider و عناوين أقسام'),
            _buildExample(child: _buildSectionsPreview()),

            // ── 9
            _buildSectionTitle('9️⃣  Drawer مع Badge (إشعارات)'),
            _buildExample(child: _buildBadgePreview()),

            // ── 10
            _buildSectionTitle('🔟  Drawer مع Switch و Checkbox'),
            _buildExample(child: _buildSwitchCheckboxPreview()),

            // ── 11
            _buildSectionTitle('1️⃣1️⃣  Navigator.pop لإغلاق Drawer'),
            _buildConceptCard(
              description: 'Navigator.pop(context) يُغلق الـ Drawer بعد الضغط على عنصر',
              code: 'ListTile(\n  onTap: () {\n    Navigator.pop(context);\n    // تنفيذ الإجراء\n  },\n)',
              color: Colors.orange,
            ),

            // ── 12
            _buildSectionTitle('1️⃣2️⃣  فتح Drawer برمجياً (Scaffold.of)'),
            _buildConceptCard(
              description: 'فتح/إغلاق الـ Drawer يدوياً بدون الضغط على زر AppBar',
              code: 'Scaffold.of(context).openDrawer();\nScaffold.of(context).closeDrawer();\n// أو عبر GlobalKey:\n_scaffoldKey.currentState?.openDrawer();',
              color: Colors.purple,
              buttonLabel: 'فتح Drawer برمجياً',
              onTap: () => _scaffoldKey.currentState?.openDrawer(),
            ),

            // ── 13
            _buildSectionTitle('1️⃣3️⃣  drawerEnableOpenDragGesture'),
            _buildConceptCard(
              description: 'drawerEnableOpenDragGesture: false → يمنع فتح الـ Drawer بالسحب',
              code: 'Scaffold(\n  drawerEnableOpenDragGesture: false,\n  drawer: Drawer(...),\n)',
              color: Colors.red,
            ),

            // ── 14
            _buildSectionTitle('1️⃣4️⃣  drawerEdgeDragWidth'),
            _buildConceptCard(
              description: 'drawerEdgeDragWidth: يحدد عرض المنطقة القابلة للسحب من الحافة',
              code: 'Scaffold(\n  drawerEdgeDragWidth: 40,\n  drawer: Drawer(...),\n)',
              color: Colors.teal,
            ),

            // ── 15
            _buildSectionTitle('1️⃣5️⃣  drawerScrimColor (لون الخلفية)'),
            _buildConceptCard(
              description: 'drawerScrimColor: لون الطبقة الداكنة خلف الـ Drawer عند فتحه',
              code: 'Scaffold(\n  drawerScrimColor: Colors.blue.withOpacity(0.5),\n  drawer: Drawer(...),\n)',
              color: Colors.indigo,
              buttonLabel: 'رؤية scrimColor مخصص',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _ScrimColorPage())),
            ),

            // ── 16
            _buildSectionTitle('1️⃣6️⃣  Drawer width (العرض)'),
            _buildConceptCard(
              description: 'width: تحديد عرض الـ Drawer - الافتراضي 304',
              code: 'Drawer(\n  width: 200, // عرض مخصص\n  child: ...,\n)',
              color: Colors.brown,
              buttonLabel: 'رؤية Drawer ضيق',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _NarrowDrawerPage())),
            ),

            // ── 17
            _buildSectionTitle('1️⃣7️⃣  Drawer shape (الشكل)'),
            _buildConceptCard(
              description: 'shape: تخصيص شكل حواف الـ Drawer',
              code: 'Drawer(\n  shape: RoundedRectangleBorder(\n    borderRadius: BorderRadius.horizontal(\n      left: Radius.circular(24),\n    ),\n  ),\n)',
              color: Colors.pink,
              buttonLabel: 'رؤية Drawer مع زوايا دائرية',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _ShapedDrawerPage())),
            ),

            // ── 18
            _buildSectionTitle('1️⃣8️⃣  Drawer backgroundColor'),
            _buildConceptCard(
              description: 'backgroundColor: تغيير لون خلفية الـ Drawer بالكامل',
              code: 'Drawer(\n  backgroundColor: Colors.grey.shade900,\n  child: ...,\n)',
              color: Colors.grey.shade700,
              buttonLabel: 'رؤية Drawer داكن',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _DarkDrawerPage())),
            ),

            // ── 19
            _buildSectionTitle('1️⃣9️⃣  Drawer elevation و shadowColor'),
            _buildConceptCard(
              description: 'elevation: ارتفاع الظل خلف الـ Drawer\nshadowColor: لون الظل',
              code: 'Drawer(\n  elevation: 20,\n  shadowColor: Colors.blue,\n  child: ...,\n)',
              color: Colors.cyan.shade700,
              buttonLabel: 'رؤية Drawer مع ظل ملون',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _ElevatedDrawerPage())),
            ),

            // ── 20
            _buildSectionTitle('2️⃣0️⃣  NavigationDrawer (Material 3)'),
            _buildConceptCard(
              description: 'NavigationDrawer: نسخة Material 3 مع NavigationDrawerDestination',
              code: 'NavigationDrawer(\n  selectedIndex: _index,\n  onDestinationSelected: (i) => setState(...),\n  children: [\n    NavigationDrawerDestination(\n      icon: Icon(Icons.home),\n      label: Text("الرئيسية"),\n    ),\n  ],\n)',
              color: Colors.deepPurple,
              buttonLabel: 'رؤية NavigationDrawer',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _NavigationDrawerPage())),
            ),

            // ── 21
            _buildSectionTitle('2️⃣1️⃣  Drawer مع ExpansionTile (قوائم منسدلة)'),
            _buildConceptCard(
              description: 'ExpansionTile داخل Drawer لإنشاء قوائم فرعية قابلة للتوسع',
              code: 'Drawer(\n  child: ListView(\n    children: [\n      ExpansionTile(\n        title: Text("الإعدادات"),\n        children: [...],\n      ),\n    ],\n  ),\n)',
              color: Colors.amber.shade700,
              buttonLabel: 'رؤية Drawer مع ExpansionTile',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _ExpansionDrawerPage())),
            ),

            // ── 22
            _buildSectionTitle('2️⃣2️⃣  Drawer مع تصميم كامل احترافي'),
            _buildConceptCard(
              description: 'Drawer احترافي كامل: UserAccountsDrawerHeader + قائمة + footer',
              code: '// رؤية الكود في الصفحة المنفصلة',
              color: Colors.deepOrange,
              buttonLabel: 'رؤية Drawer احترافي كامل',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _ProDrawerPage())),
            ),
          ],
        ),
      ),
    );
  }

  // ==================== AppBar ====================
  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('جميع مفاهيم Drawer', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.blue,
      centerTitle: true,
      actions: [
        Builder(
          builder: (ctx) => IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Scaffold.of(ctx).openEndDrawer(),
            tooltip: 'فتح endDrawer',
          ),
        ),
      ],
    );
  }

  // ==================== Drawer الرئيسي ====================
  Widget _buildMainDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // UserAccountsDrawerHeader
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.indigo],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            accountName: const Text('MProgrammer01', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            accountEmail: const Text('exemple@gmail.com', style: TextStyle(fontSize: 13)),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40, color: Colors.blue),
            ),
            otherAccountsPictures: [
              CircleAvatar(backgroundColor: Colors.green.shade200, child: const Icon(Icons.person, size: 18, color: Colors.green)),
            ],
          ),

          // عناصر القائمة
          ..._menuItems.asMap().entries.map((entry) {
            final i = entry.key;
            final item = entry.value;
            return ListTile(
              selected: _selectedIndex == i,
              selectedTileColor: Colors.blue.shade50,
              selectedColor: Colors.blue,
              leading: Icon(item['icon']),
              title: Text(item['title']),
              trailing: item['badge'] != null
                  ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(12)),
                child: Text(item['badge'], style: const TextStyle(color: Colors.white, fontSize: 12)),
              )
                  : null,
              onTap: () {
                setState(() => _selectedIndex = i);
                Navigator.pop(context);
              },
            );
          }),

          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('تسجيل الخروج', style: TextStyle(color: Colors.red)),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  // ==================== endDrawer ====================
  Widget _buildEndDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green.shade700),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back, color: Colors.white, size: 36),
                SizedBox(height: 8),
                Text('endDrawer', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                Text('يفتح من اليسار', style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          ListTile(leading: const Icon(Icons.info), title: const Text('يفتح من اليسار في  هده الحالة لان الاتجاه RTL'), onTap: () => Navigator.pop(context)),
          ListTile(leading: const Icon(Icons.close), title: const Text('إغلاق'), onTap: () => Navigator.pop(context)),
        ],
      ),
    );
  }

  // ==================== Section Title ====================
  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 16, bottom: 8),
      color: Colors.blue.shade100,
      child: Text(title, textDirection: TextDirection.rtl,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.blue)),
    );
  }

  // ==================== بطاقة المفهوم ====================
  Widget _buildConceptCard({
    required String description,
    required String code,
    required Color color,
    String? buttonLabel,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.06),
        border: Border.all(color: color.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(description, style: const TextStyle(fontSize: 13, height: 1.5)),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.grey.shade900, borderRadius: BorderRadius.circular(8)),
            child: Text(code, style: const TextStyle(color: Colors.greenAccent, fontSize: 11, fontFamily: 'monospace')),
          ),
          if (buttonLabel != null) ...[
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onTap,
                icon: const Icon(Icons.open_in_new, size: 16),
                label: Text(buttonLabel),
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ==================== غلاف معاينة ====================
  Widget _buildExample({required Widget child}) {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade50,
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }

  // ============================================================
  // معاينات داخلية
  // ============================================================

  // 3. DrawerHeader
  Widget _buildDrawerHeaderPreview() {
    return DrawerHeader(
      // decoration: تزيين خلفية الـ DrawerHeader
      decoration: const BoxDecoration(color: Colors.blue),
      // padding: مسافات داخلية
      padding: const EdgeInsets.all(16),
      // margin: مسافة خارجية
      margin: EdgeInsets.zero,
      child: const Row(
        children: [
          CircleAvatar(radius: 28, backgroundColor: Colors.white, child: Icon(Icons.person, size: 30, color: Colors.blue)),
          SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('DrawerHeader', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              Text('decoration + padding + margin', style: TextStyle(color: Colors.white70, fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }

  // 4. UserAccountsDrawerHeader
  Widget _buildUserAccountsPreview() {
    return UserAccountsDrawerHeader(
      decoration: const BoxDecoration(color: Colors.indigo),
      margin: EdgeInsets.zero,
      // accountName: اسم الحساب الرئيسي
      accountName: const Text('UserAccountsDrawerHeader', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
      // accountEmail: البريد الإلكتروني
      accountEmail: const Text('user@example.com', style: TextStyle(fontSize: 11)),
      // currentAccountPicture: صورة الحساب الرئيسي
      currentAccountPicture: const CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.person, color: Colors.indigo)),
      // otherAccountsPictures: حسابات أخرى
      otherAccountsPictures: [
        const CircleAvatar(backgroundColor: Colors.orange, child: Icon(Icons.person, size: 16, color: Colors.white)),
        const CircleAvatar(backgroundColor: Colors.green, child: Icon(Icons.add, size: 16, color: Colors.white)),
      ],
      // onDetailsPressed: عند الضغط على السهم
      onDetailsPressed: () {}, //ادا لم تكن بحاجة لزر فلتقم بمسح الحدت onDetailsPressed
    );
  }

  // 5. Gradient Header
  Widget _buildGradientHeaderPreview() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1a237e), Color(0xFF7b1fa2), Color(0xFFad1457)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 28, backgroundColor: Colors.white24, child: Icon(Icons.star, color: Colors.white, size: 28)),
            SizedBox(height: 6),
            Text('DrawerHeader + Gradient', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  // 6. ListTile داخل Drawer
  Widget _buildListTilePreview() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          dense: true,
          leading: const Icon(Icons.home, color: Colors.blue),
          title: const Text('الرئيسية', style: TextStyle(fontSize: 13)),
          trailing: const Icon(Icons.arrow_forward_ios, size: 14),
          onTap: () {},
        ),
        ListTile(
          dense: true,
          leading: const Icon(Icons.person, color: Colors.green),
          title: const Text('الملف الشخصي', style: TextStyle(fontSize: 13)),
          subtitle: const Text('عرض وتعديل بياناتك', style: TextStyle(fontSize: 10)),
          onTap: () {},
        ),
        ListTile(
          dense: true,
          leading: const Icon(Icons.settings, color: Colors.grey),
          title: const Text('الإعدادات', style: TextStyle(fontSize: 13)),
          onTap: () {},
        ),
      ],
    );
  }

  // 7. selected و selectedTileColor
  Widget _buildSelectedTilePreview() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          dense: true,
          // selected: true → يطبق selectedColor و selectedTileColor
          selected: true,
          selectedTileColor: Colors.blue.shade50,
          selectedColor: Colors.blue,
          leading: const Icon(Icons.home),
          title: const Text('selected: true', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ),
        ListTile(
          dense: true,
          selected: false,
          leading: const Icon(Icons.person, color: Colors.grey),
          title: const Text('selected: false', style: TextStyle(fontSize: 12, color: Colors.grey)),
        ),
        ListTile(
          dense: true,
          selected: true,
          selectedTileColor: Colors.green.shade50,
          selectedColor: Colors.green,
          leading: const Icon(Icons.star),
          title: const Text('selectedTileColor أخضر', style: TextStyle(fontSize: 12)),
        ),
      ],
    );
  }

  // 8. Sections مع Divider
  Widget _buildSectionsPreview() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text('القائمة الرئيسية', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey)),
        ),
        ListTile(dense: true, leading: const Icon(Icons.home, size: 20), title: const Text('الرئيسية', style: TextStyle(fontSize: 12)), onTap: () {}),
        ListTile(dense: true, leading: const Icon(Icons.search, size: 20), title: const Text('بحث', style: TextStyle(fontSize: 12)), onTap: () {}),
        const Divider(height: 1),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text('الحساب', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey)),
        ),
        ListTile(dense: true, leading: const Icon(Icons.person, size: 20), title: const Text('الملف الشخصي', style: TextStyle(fontSize: 12)), onTap: () {}),
        ListTile(dense: true, leading: const Icon(Icons.settings, size: 20), title: const Text('الإعدادات', style: TextStyle(fontSize: 12)), onTap: () {}),
      ],
    );
  }

  // 9. Badge
  Widget _buildBadgePreview() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          dense: true,
          leading: const Icon(Icons.notifications, color: Colors.orange),
          title: const Text('الإشعارات', style: TextStyle(fontSize: 13)),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(12)),
            child: const Text('5', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
          ),
          onTap: () {},
        ),
        ListTile(
          dense: true,
          leading: const Icon(Icons.message, color: Colors.blue),
          title: const Text('الرسائل', style: TextStyle(fontSize: 13)),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(12)),
            child: const Text('12', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
          ),
          onTap: () {},
        ),
        const ListTile(
          dense: true,
          leading: Icon(Icons.home, color: Colors.green),
          title: Text('الرئيسية (بدون badge)', style: TextStyle(fontSize: 13)),
        ),
      ],
    );
  }

  // 10. Switch و Checkbox
  Widget _buildSwitchCheckboxPreview() {
    return StatefulBuilder(
      builder: (context, setS) => ListView(
        padding: EdgeInsets.zero,
        children: [
          SwitchListTile(
            dense: true,
            value: _notificationsEnabled,
            onChanged: (v) => setS(() => _notificationsEnabled = v),
            title: const Text('الإشعارات', style: TextStyle(fontSize: 13)),
            secondary: const Icon(Icons.notifications),
            activeColor: Colors.blue,
          ),
          CheckboxListTile(
            dense: true,
            value: _darkModeEnabled,
            onChanged: (v) => setS(() => _darkModeEnabled = v!),
            title: const Text('الوضع الداكن', style: TextStyle(fontSize: 13)),
            secondary: const Icon(Icons.dark_mode),
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ],
      ),
    );
  }
}

// ============================================================
// صفحات منفصلة للمفاهيم المتقدمة
// ============================================================

// 15. ScrimColor
class _ScrimColorPage extends StatelessWidget {
  const _ScrimColorPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // drawerScrimColor: لون الطبقة خلف الـ Drawer
        drawerScrimColor: Colors.blue.withOpacity(0.5),
        appBar: AppBar(
          title: const Text('drawerScrimColor', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.indigo,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Colors.indigo),
                child: const Center(child: Text('drawerScrimColor\nالخلفية زرقاء عند الفتح', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16))),
              ),
              ListTile(leading: const Icon(Icons.close), title: const Text('إغلاق'), onTap: () => Navigator.pop(context)),
            ],
          ),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.swipe_left, size: 64, color: Colors.indigo),
              SizedBox(height: 16),
              Text('اسحب من اليمين\nستظهر خلفية زرقاء', textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}

// 16. Narrow Drawer
class _NarrowDrawerPage extends StatelessWidget {
  const _NarrowDrawerPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Drawer width مخصص', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.brown,
        ),
        endDrawer: Drawer(
          // width: تحديد عرض الـ Drawer
          width: 200,
          backgroundColor: Colors.brown.shade50,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.brown),
                child: const Center(child: Text('width: 200\n(ضيق)', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))),
              ),
              ...['الرئيسية', 'البحث', 'الإعدادات'].map((t) => ListTile(title: Text(t, style: const TextStyle(fontSize: 13)), leading: const Icon(Icons.chevron_left, size: 18), onTap: () => Navigator.pop(context))),
              const Divider(),
              ListTile(title: const Text('إغلاق', style: TextStyle(color: Colors.red, fontSize: 13)), leading: const Icon(Icons.close, color: Colors.red, size: 18), onTap: () => Navigator.pop(context)),
            ],
          ),
        ),
        body: const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.swipe_right, size: 64, color: Colors.brown), SizedBox(height: 16), Text('اسحب لفتح Drawer ضيق\nwidth: 200', textAlign: TextAlign.center, style: TextStyle(fontSize: 16))])),
      ),
    );
  }
}

// 17. Shaped Drawer
class _ShapedDrawerPage extends StatelessWidget {
  const _ShapedDrawerPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('Drawer shape', style: TextStyle(color: Colors.white)), backgroundColor: Colors.pink),
        drawer: Drawer(
          // shape: شكل حواف الـ Drawer
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(32)),
          ),
          backgroundColor: Colors.pink.shade50,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.pink, borderRadius: const BorderRadius.only(topLeft: Radius.circular(32))),
                child: const Center(child: Text('shape: زوايا دائرية\nمن اليسار', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))),
              ),
              ...['الرئيسية', 'الملف الشخصي', 'الإعدادات'].map((t) => ListTile(title: Text(t), leading: const Icon(Icons.rounded_corner, color: Colors.pink, size: 18), onTap: () => Navigator.pop(context))),
              const Divider(),
              ListTile(title: const Text('إغلاق', style: TextStyle(color: Colors.red)), leading: const Icon(Icons.close, color: Colors.red), onTap: () => Navigator.pop(context)),
            ],
          ),
        ),
        body: const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.rounded_corner, size: 64, color: Colors.pink), SizedBox(height: 16), Text('اسحب لرؤية شكل الـ Drawer المخصص', textAlign: TextAlign.center, style: TextStyle(fontSize: 16))])),
      ),
    );
  }
}

// 18. Dark Drawer
class _DarkDrawerPage extends StatelessWidget {
  const _DarkDrawerPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('Drawer داكن', style: TextStyle(color: Colors.white)), backgroundColor: Colors.grey.shade900),
        drawer: Drawer(
          // backgroundColor: لون خلفية الـ Drawer
          backgroundColor: Colors.grey.shade900,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.grey.shade800),
                child: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CircleAvatar(radius: 28, backgroundColor: Colors.white10, child: Icon(Icons.person, color: Colors.white, size: 30)),
                  SizedBox(height: 8),
                  Text('وضع داكن', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('backgroundColor: grey.shade900', style: TextStyle(color: Colors.white38, fontSize: 10)),
                ]),
              ),
              ...['الرئيسية', 'البحث', 'المفضلة', 'الإعدادات'].map((t) => ListTile(
                leading: const Icon(Icons.circle, size: 8, color: Colors.white54),
                title: Text(t, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                onTap: () => Navigator.pop(context),
              )),
              const Divider(color: Colors.white24),
              ListTile(leading: const Icon(Icons.logout, color: Colors.redAccent), title: const Text('خروج', style: TextStyle(color: Colors.redAccent, fontSize: 13)), onTap: () => Navigator.pop(context)),
            ],
          ),
        ),
        backgroundColor: Colors.grey.shade800,
        body: const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.dark_mode, size: 64, color: Colors.white54), SizedBox(height: 16), Text('اسحب لرؤية Drawer الداكن', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.white70))])),
      ),
    );
  }
}

// 19. Elevated Drawer
class _ElevatedDrawerPage extends StatelessWidget {
  const _ElevatedDrawerPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('Drawer elevation', style: TextStyle(color: Colors.white)), backgroundColor: Colors.cyan.shade700),
        drawerScrimColor: Colors.cyan.withOpacity(0.2),
        drawer: Drawer(
          // elevation: ارتفاع الظل
          elevation: 24,
          // shadowColor: لون الظل
          shadowColor: Colors.cyan.shade700,
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.cyan.shade700),
                child: const Center(child: Text('elevation: 24\nshadowColor: cyan', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))),
              ),
              ...['الرئيسية', 'الإعدادات', 'مساعدة'].map((t) => ListTile(title: Text(t), leading: Icon(Icons.arrow_left, color: Colors.cyan.shade700), onTap: () => Navigator.pop(context))),
              const Divider(),
              ListTile(title: const Text('إغلاق', style: TextStyle(color: Colors.red)), leading: const Icon(Icons.close, color: Colors.red), onTap: () => Navigator.pop(context)),
            ],
          ),
        ),
        body: const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.layers, size: 64, color: Colors.cyan), SizedBox(height: 16), Text('اسحب لرؤية الظل الملون\nحول الـ Drawer', textAlign: TextAlign.center, style: TextStyle(fontSize: 16))])),
      ),
    );
  }
}

// 20. NavigationDrawer
class _NavigationDrawerPage extends StatefulWidget {
  const _NavigationDrawerPage();

  @override
  State<_NavigationDrawerPage> createState() => _NavigationDrawerPageState();
}

class _NavigationDrawerPageState extends State<_NavigationDrawerPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('NavigationDrawer (M3)', style: TextStyle(color: Colors.white)), backgroundColor: Colors.deepPurple),
        // NavigationDrawer: مكوّن Material 3 الرسمي للـ Drawer
        drawer: NavigationDrawer(
          // selectedIndex: العنصر المحدد حالياً
          selectedIndex: _selectedIndex,
          // onDestinationSelected: عند الضغط على عنصر
          onDestinationSelected: (index) {
            setState(() => _selectedIndex = index);
            Navigator.pop(context);
          },
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
              child: Text('القائمة الرئيسية', style: Theme.of(context).textTheme.titleSmall),
            ),
            // NavigationDrawerDestination: عنصر الوجهة
            const NavigationDrawerDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: Text('الرئيسية'),
            ),
            const NavigationDrawerDestination(
              icon: Icon(Icons.search_outlined),
              selectedIcon: Icon(Icons.search),
              label: Text('بحث'),
            ),
            const NavigationDrawerDestination(
              icon: Icon(Icons.notifications_outlined),
              selectedIcon: Icon(Icons.notifications),
              label: Text('الإشعارات'),
            ),
            const Divider(indent: 28, endIndent: 28),
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 10, 16, 10),
              child: Text('الحساب', style: Theme.of(context).textTheme.titleSmall),
            ),
            const NavigationDrawerDestination(
              icon: Icon(Icons.person_outlined),
              selectedIcon: Icon(Icons.person),
              label: Text('الملف الشخصي'),
            ),
            const NavigationDrawerDestination(
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings),
              label: Text('الإعدادات'),
            ),
          ],
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(Icons.navigation, size: 64, color: Colors.deepPurple),
            const SizedBox(height: 16),
            Text('NavigationDrawer - Material 3\nالعنصر المحدد: $_selectedIndex', textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
          ]),
        ),
      ),
    );
  }
}

// 21. ExpansionTile Drawer
class _ExpansionDrawerPage extends StatelessWidget {
  const _ExpansionDrawerPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('Drawer + ExpansionTile', style: TextStyle(color: Colors.white)), backgroundColor: Colors.amber.shade700),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.amber.shade700),
                child: const Center(child: Text('ExpansionTile\nداخل Drawer', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))),
              ),
              ListTile(leading: const Icon(Icons.home), title: const Text('الرئيسية'), onTap: () => Navigator.pop(context)),
              // ExpansionTile: قائمة فرعية قابلة للتوسع
              ExpansionTile(
                leading: const Icon(Icons.category),
                title: const Text('الفئات'),
                children: [
                  ListTile(contentPadding: const EdgeInsets.only(right: 40), leading: const Icon(Icons.circle, size: 10), title: const Text('إلكترونيات', style: TextStyle(fontSize: 13)), onTap: () => Navigator.pop(context)),
                  ListTile(contentPadding: const EdgeInsets.only(right: 40), leading: const Icon(Icons.circle, size: 10), title: const Text('ملابس', style: TextStyle(fontSize: 13)), onTap: () => Navigator.pop(context)),
                  ListTile(contentPadding: const EdgeInsets.only(right: 40), leading: const Icon(Icons.circle, size: 10), title: const Text('كتب', style: TextStyle(fontSize: 13)), onTap: () => Navigator.pop(context)),
                ],
              ),
              ExpansionTile(
                leading: const Icon(Icons.settings),
                title: const Text('الإعدادات'),
                children: [
                  ListTile(contentPadding: const EdgeInsets.only(right: 40), leading: const Icon(Icons.circle, size: 10), title: const Text('الحساب', style: TextStyle(fontSize: 13)), onTap: () => Navigator.pop(context)),
                  ListTile(contentPadding: const EdgeInsets.only(right: 40), leading: const Icon(Icons.circle, size: 10), title: const Text('الإشعارات', style: TextStyle(fontSize: 13)), onTap: () => Navigator.pop(context)),
                  ListTile(contentPadding: const EdgeInsets.only(right: 40), leading: const Icon(Icons.circle, size: 10), title: const Text('الخصوصية', style: TextStyle(fontSize: 13)), onTap: () => Navigator.pop(context)),
                ],
              ),
              const Divider(),
              ListTile(leading: const Icon(Icons.logout, color: Colors.red), title: const Text('خروج', style: TextStyle(color: Colors.red)), onTap: () => Navigator.pop(context)),
            ],
          ),
        ),
        body: const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.expand_more, size: 64, color: Colors.amber), SizedBox(height: 16), Text('اسحب لرؤية Drawer\nمع قوائم منسدلة', textAlign: TextAlign.center, style: TextStyle(fontSize: 16))])),
      ),
    );
  }
}

// 22. Drawer احترافي كامل
class _ProDrawerPage extends StatefulWidget {
  const _ProDrawerPage();

  @override
  State<_ProDrawerPage> createState() => _ProDrawerPageState();
}

class _ProDrawerPageState extends State<_ProDrawerPage> {
  int _selectedIndex = 0;
  bool _notifications = true;

  final List<Map<String, dynamic>> _mainItems = [
    {'icon': Icons.home_outlined, 'activeIcon': Icons.home, 'title': 'الرئيسية', 'badge': null},
    {'icon': Icons.explore_outlined, 'activeIcon': Icons.explore, 'title': 'استكشاف', 'badge': null},
    {'icon': Icons.notifications_outlined, 'activeIcon': Icons.notifications, 'title': 'الإشعارات', 'badge': '3'},
    {'icon': Icons.message_outlined, 'activeIcon': Icons.message, 'title': 'الرسائل', 'badge': '7'},
    {'icon': Icons.bookmark_outlined, 'activeIcon': Icons.bookmark, 'title': 'المحفوظات', 'badge': null},
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Drawer احترافي كامل', style: TextStyle(color: Colors.white)),
          backgroundColor: const Color(0xFF1565C0),
          actions: [IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {})],
        ),
        drawer: Drawer(
          width: 300,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(24)),
          ),
          child: Column(
            children: [
              // ── Header
              UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1565C0), Color(0xFF6A1B9A)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                accountName: const Text('MProgrammer01', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                accountEmail: const Text('exemple@gmail.com', style: TextStyle(fontSize: 12)),
                currentAccountPicture: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)),
                  child: const CircleAvatar(backgroundColor: Colors.white24, child: Icon(Icons.person, color: Colors.white, size: 36)),
                ),
                otherAccountsPictures: [
                  CircleAvatar(backgroundColor: Colors.green.shade300, child: const Text('MP', style: TextStyle(color: Colors.white, fontSize: 12))),
                ],
                onDetailsPressed: () {},
              ),

              // ── القائمة الرئيسية
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      child: Text('الرئيسية', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1)),
                    ),

                    // عناصر القائمة
                    ..._mainItems.asMap().entries.map((entry) {
                      final i = entry.key;
                      final item = entry.value;
                      final isSelected = _selectedIndex == i;
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFF1565C0).withOpacity(0.1) : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          selected: isSelected,
                          selectedColor: const Color(0xFF1565C0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          leading: Icon(isSelected ? item['activeIcon'] : item['icon']),
                          title: Text(item['title'], style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, fontSize: 14)),
                          trailing: item['badge'] != null
                              ? Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                              child: Text(item['badge'], style: const TextStyle(color: Colors.white, fontSize: 11)))
                              : null,
                          onTap: () {
                            setState(() => _selectedIndex = i);
                            Navigator.pop(context);
                          },
                        ),
                      );
                    }),

                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 6),
                      child: Text('الإعدادات', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1)),
                    ),

                    // Switch إعداد
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: SwitchListTile(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        secondary: const Icon(Icons.notifications_outlined),
                        title: const Text('الإشعارات', style: TextStyle(fontSize: 14)),
                        value: _notifications,
                        onChanged: (v) => setState(() => _notifications = v),
                        activeColor: const Color(0xFF1565C0),
                        dense: true,
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: ListTile(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        leading: const Icon(Icons.person_outline),
                        title: const Text('الملف الشخصي', style: TextStyle(fontSize: 14)),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                        onTap: () => Navigator.pop(context),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: ListTile(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        leading: const Icon(Icons.help_outline),
                        title: const Text('المساعدة', style: TextStyle(fontSize: 14)),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ),

              // ── Footer
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade200))),
                child: Column(
                  children: [
                    ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      leading: const Icon(Icons.logout, color: Colors.red),
                      title: const Text('تسجيل الخروج', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600, fontSize: 14)),
                      onTap: () => Navigator.pop(context),
                    ),
                    const SizedBox(height: 4),
                    Text('الإصدار 1.0.0', style: TextStyle(fontSize: 11, color: Colors.grey.shade400)),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(Icons.menu, size: 64, color: Color(0xFF1565C0)),
            const SizedBox(height: 16),
            const Text('Drawer احترافي كامل', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('اضغط على ☰ لفتح الـ Drawer', style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
          ]),
        ),
      ),
    );
  }
}