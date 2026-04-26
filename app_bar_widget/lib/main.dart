import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      home: const AppBarScreen(),
    );
  }
}

class AppBarScreen extends StatefulWidget {
  const AppBarScreen({super.key});

  @override
  State<AppBarScreen> createState() => _AppBarScreenState();
}

class _AppBarScreenState extends State<AppBarScreen> {
  bool _centerTitle = true;
  double _elevation = 4;
  double _titleSpacing = NavigationToolbar.kMiddleSpacing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          children: [
            // ── 1
            _buildSectionTitle('1️⃣  title (عنوان النص)'),
            _buildExample(child: _demoPage_TitleText()),

            // ── 2
            _buildSectionTitle('2️⃣  title مع Widget مخصص'),
            _buildExample(child: _demoPage_TitleWidget()),

            // ── 3
            _buildSectionTitle('3️⃣  backgroundColor'),
            _buildExample(child: _demoPage_BackgroundColor()),

            // ── 4
            _buildSectionTitle('4️⃣  foregroundColor'),
            _buildExample(child: _demoPage_ForegroundColor()),

            // ── 5
            _buildSectionTitle('5️⃣  centerTitle'),
            _buildExample(child: _demoPage_CenterTitle()),

            // ── 6
            _buildSectionTitle('6️⃣  leading (زر اليمين)'),
            _buildExample(child: _demoPage_Leading()),

            // ── 7
            _buildSectionTitle('7️⃣  automaticallyImplyLeading'),
            _buildExample(child: _demoPage_AutomaticallyImplyLeading()),

            // ── 8
            _buildSectionTitle('8️⃣  actions (أزرار اليسار)'),
            _buildExample(child: _demoPage_Actions()),

            // ── 9
            _buildSectionTitle('9️⃣  elevation و shadowColor'),
            _buildExample(child: _demoPage_Elevation()),

            // ── 10
            _buildSectionTitle('🔟  scrolledUnderElevation'),
            _buildExample(child: _demoPage_ScrolledUnderElevation()),

            // ── 11
            _buildSectionTitle('1️⃣1️⃣  shape (شكل الـ AppBar)'),
            _buildExample(child: _demoPage_Shape()),

            // ── 12
            _buildSectionTitle('1️⃣2️⃣  bottom (TabBar تحت الـ AppBar)'),
            _buildExample(child: _demoPage_Bottom()),

            // ── 13
            _buildSectionTitle('1️⃣3️⃣  flexibleSpace'),
            _buildExample(child: _demoPage_FlexibleSpace()),

            // ── 14
            _buildSectionTitle('1️⃣4️⃣  toolbarHeight (ارتفاع AppBar)'),
            _buildExample(child: _demoPage_ToolbarHeight()),

            // ── 15
            _buildSectionTitle('1️⃣5️⃣  leadingWidth (عرض leading)'),
            _buildExample(child: _demoPage_LeadingWidth()),

            // ── 16
            _buildSectionTitle('1️⃣6️⃣  titleSpacing'),
            _buildExample(child: _demoPage_TitleSpacing()),

            // ── 17
            _buildSectionTitle('1️⃣7️⃣  titleTextStyle'),
            _buildExample(child: _demoPage_TitleTextStyle()),

            // ── 18
            _buildSectionTitle('1️⃣8️⃣  toolbarTextStyle'),
            _buildExample(child: _demoPage_ToolbarTextStyle()),

            // ── 19
            _buildSectionTitle('1️⃣9️⃣  iconTheme و actionsIconTheme'),
            _buildExample(child: _demoPage_IconTheme()),

            // ── 20
            _buildSectionTitle('2️⃣0️⃣  systemOverlayStyle (شريط الحالة)'),
            _buildExample(child: _demoPage_SystemOverlayStyle()),

            // ── 21
            _buildSectionTitle('2️⃣1️⃣  primary'),
            _buildExample(child: _demoPage_Primary()),

            // ── 22
            _buildSectionTitle('2️⃣2️⃣  SliverAppBar (مع التمرير)'),
            _buildExample(child: _demoPage_SliverAppBar()),

            // ── 23
            _buildSectionTitle('2️⃣3️⃣  SliverAppBar.pinned'),
            _buildExample(child: _demoPage_SliverPinned()),

            // ── 24
            _buildSectionTitle('2️⃣4️⃣  SliverAppBar.floating'),
            _buildExample(child: _demoPage_SliverFloating()),

            // ── 25
            _buildSectionTitle('2️⃣5️⃣  SliverAppBar.snap'),
            _buildExample(child: _demoPage_SliverSnap()),

            // ── 26
            _buildSectionTitle('2️⃣6️⃣  SliverAppBar مع expandedHeight و FlexibleSpaceBar'),
            _buildExample(child: _demoPage_SliverExpanded()),

            // ── 27
            _buildSectionTitle('2️⃣7️⃣  AppBar مع PopupMenuButton'),
            _buildExample(child: _demoPage_PopupMenu()),

            // ── 28
            _buildSectionTitle('2️⃣8️⃣  AppBar مع SearchBar / SearchDelegate'),
            _buildExample(child: _demoPage_Search()),

            // ── 29
            _buildSectionTitle('2️⃣9️⃣  AppBar شفاف (Transparent)'),
            _buildExample(child: _demoPage_Transparent()),

            // ── 30
            _buildSectionTitle('3️⃣0️⃣  AppBar مع Gradient'),
            _buildExample(child: _demoPage_Gradient()),
          ],
        ),
      ),
    );
  }

  // ==================== AppBar الرئيسي ====================
  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('جميع مفاهيم AppBar', style: TextStyle(color: Colors.white)),
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
      color: Colors.blue.shade100,
      child: Text(
        title,
        textDirection: TextDirection.rtl,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
    );
  }

  // ==================== غلاف المثال ====================
  Widget _buildExample({required Widget child}) {
    return Container(
      height: 80,
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
  // 1. title نص عادي
  // ============================================================
  Widget _demoPage_TitleText() {
    return AppBar(
      // title: أي Widget - عادةً Text
      title: const Text('title: نص عادي'),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      automaticallyImplyLeading: false,
    );
  }

  // ============================================================
  // 2. title Widget مخصص
  // ============================================================
  Widget _demoPage_TitleWidget() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.indigo,
      // title: يمكن أن يكون أي Widget مخصص
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(8)),
            child: const Icon(Icons.flutter_dash, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 8),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('تطبيقي', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              Text('v1.0.0', style: TextStyle(color: Colors.white60, fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // 3. backgroundColor
  // ============================================================
  Widget _demoPage_BackgroundColor() {
    return Row(
      children: [
        Expanded(
          child: AppBar(
            automaticallyImplyLeading: false,
            // backgroundColor: لون خلفية الـ AppBar
            backgroundColor: Colors.green,
            title: const Text('أخضر', style: TextStyle(color: Colors.white, fontSize: 13)),
            centerTitle: true,
          ),
        ),
        Expanded(
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.orange,
            title: const Text('برتقالي', style: TextStyle(color: Colors.white, fontSize: 13)),
            centerTitle: true,
          ),
        ),
        Expanded(
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.purple,
            title: const Text('بنفسجي', style: TextStyle(color: Colors.white, fontSize: 13)),
            centerTitle: true,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // 4. foregroundColor
  // ============================================================
  Widget _demoPage_ForegroundColor() {
    return Row(
      children: [
        Expanded(
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            // foregroundColor: لون النص والأيقونات معاً
            foregroundColor: Colors.blue,
            title: const Text('أزرق', style: TextStyle(fontSize: 13)),
            actions: const [Icon(Icons.star)],
          ),
        ),
        Expanded(
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            foregroundColor: Colors.amber,
            title: const Text('ذهبي', style: TextStyle(fontSize: 13)),
            actions: const [Icon(Icons.star)],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // 5. centerTitle
  // ============================================================
  Widget _demoPage_CenterTitle() {
    return Column(
      children: [
        Expanded(
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            // centerTitle: true → العنوان في المنتصف
            centerTitle: true,
            title: const Text('centerTitle: true', style: TextStyle(fontSize: 13)),
            actions: const [Icon(Icons.more_vert)],
          ),
        ),
        Expanded(
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.teal.shade700,
            foregroundColor: Colors.white,
            // centerTitle: false → العنوان على اليمين (RTL)
            centerTitle: false,
            title: const Text('centerTitle: false', style: TextStyle(fontSize: 13)),
            actions: const [Icon(Icons.more_vert)],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // 6. leading
  // ============================================================
  Widget _demoPage_Leading() {
    return Row(
      children: [
        Expanded(
          child: AppBar(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            // leading: Widget يظهر في بداية الـ AppBar (يمين RTL)
            leading: const Icon(Icons.menu),
            title: const Text('menu', style: TextStyle(fontSize: 12)),
            centerTitle: true,
          ),
        ),
        Expanded(
          child: AppBar(
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            leading: GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                backgroundColor: Colors.white24,
                child: Icon(Icons.person, size: 20),
              ),
            ),
            title: const Text('avatar', style: TextStyle(fontSize: 12)),
            centerTitle: true,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // 7. automaticallyImplyLeading
  // ============================================================
  Widget _demoPage_AutomaticallyImplyLeading() {
    return Column(
      children: [
        Expanded(
          child: AppBar(
            backgroundColor: Colors.cyan.shade700,
            foregroundColor: Colors.white,
            // automaticallyImplyLeading: true (افتراضي)
            // يُظهر زر الرجوع تلقائياً إذا كان هناك route سابق
            automaticallyImplyLeading: true,
            title: const Text('automaticallyImplyLeading: true', style: TextStyle(fontSize: 11)),
            centerTitle: true,
          ),
        ),
        Expanded(
          child: AppBar(
            backgroundColor: Colors.cyan.shade900,
            foregroundColor: Colors.white,
            // automaticallyImplyLeading: false → يُخفي زر الرجوع التلقائي
            automaticallyImplyLeading: false,
            title: const Text('automaticallyImplyLeading: false', style: TextStyle(fontSize: 11)),
            centerTitle: true,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // 8. actions
  // ============================================================
  Widget _demoPage_Actions() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.red.shade700,
      foregroundColor: Colors.white,
      title: const Text('actions', style: TextStyle(fontSize: 13)),
      centerTitle: true,
      // actions: قائمة Widgets تظهر في يسار الـ AppBar (RTL)
      actions: [
        IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
      ],
    );
  }

  // ============================================================
  // 9. elevation و shadowColor
  // ============================================================
  Widget _demoPage_Elevation() {
    return Column(
      children: [
        Expanded(
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            // elevation: ارتفاع الظل - 0 بدون ظل
            elevation: 0,
            title: const Text('elevation: 0', style: TextStyle(fontSize: 12)),
            centerTitle: true,
          ),
        ),
        Expanded(
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 8,
            // shadowColor: لون الظل
            shadowColor: Colors.blue.withOpacity(0.5),
            title: const Text('elevation: 8 + shadowColor: blue', style: TextStyle(fontSize: 11)),
            centerTitle: true,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // 10. scrolledUnderElevation
  // ============================================================
  Widget _demoPage_ScrolledUnderElevation() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.amber.shade700,
      foregroundColor: Colors.white,
      // scrolledUnderElevation: الظل عند التمرير تحت الـ AppBar
      scrolledUnderElevation: 12,
      surfaceTintColor: Colors.amber,
      title: const Text('scrolledUnderElevation: 12', style: TextStyle(fontSize: 12)),
      centerTitle: true,
    );
  }

  // ============================================================
  // 11. shape
  // ============================================================
  Widget _demoPage_Shape() {
    return Row(
      children: [
        Expanded(
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            // shape: RoundedRectangleBorder - زوايا دائرية سفلية
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            title: const Text('Rounded', style: TextStyle(fontSize: 12)),
            centerTitle: true,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
            // shape: BeveledRectangleBorder - زوايا مشطوفة
            shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
            ),
            title: const Text('Beveled', style: TextStyle(fontSize: 12)),
            centerTitle: true,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // 12. bottom (TabBar)
  // ============================================================
  Widget _demoPage_Bottom() {
    return DefaultTabController(
      length: 3,
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        title: const Text('bottom: TabBar', style: TextStyle(fontSize: 13)),
        centerTitle: true,
        // bottom: PreferredSizeWidget - عادةً TabBar
        bottom: const TabBar(
          labelColor: Colors.white,
          indicatorColor: Colors.amber,
          unselectedLabelColor: Colors.white60,
          tabs: [
            Tab(icon: Icon(Icons.home, size: 18), text: 'الرئيسية'),
            Tab(icon: Icon(Icons.search, size: 18), text: 'بحث'),
            Tab(icon: Icon(Icons.person, size: 18), text: 'حسابي'),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // 13. flexibleSpace
  // ============================================================
  Widget _demoPage_FlexibleSpace() {
    return AppBar(
      automaticallyImplyLeading: false,
      foregroundColor: Colors.white,
      backgroundColor: Colors.transparent,
      // flexibleSpace: Widget يمتد خلف الـ AppBar
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
      ),
      title: const Text('flexibleSpace: Gradient', style: TextStyle(fontSize: 13)),
      centerTitle: true,
      actions: const [Icon(Icons.more_vert)],
    );
  }

  // ============================================================
  // 14. toolbarHeight
  // ============================================================
  Widget _demoPage_ToolbarHeight() {
    return Column(
      children: [
        Expanded(
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.pink,
            foregroundColor: Colors.white,
            // toolbarHeight: ارتفاع الـ AppBar - الافتراضي 56
            toolbarHeight: 36,
            title: const Text('toolbarHeight: 36 (صغير)', style: TextStyle(fontSize: 11)),
            centerTitle: true,
          ),
        ),
        Expanded(
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.pink.shade700,
            foregroundColor: Colors.white,
            toolbarHeight: 44,
            title: const Text('toolbarHeight: 44 (افتراضي تقريباً)', style: TextStyle(fontSize: 11)),
            centerTitle: true,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // 15. leadingWidth
  // ============================================================
  Widget _demoPage_LeadingWidth() {
    return Column(
      children: [
        Expanded(
          child: AppBar(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            leading: const Icon(Icons.menu),
            // leadingWidth: عرض منطقة الـ leading - الافتراضي 56
            leadingWidth: 56,
            title: const Text('leadingWidth: 56 (افتراضي)', style: TextStyle(fontSize: 11)),
            centerTitle: true,
          ),
        ),
        Expanded(
          child: AppBar(
            backgroundColor: Colors.teal.shade700,
            foregroundColor: Colors.white,
            leading: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.menu, size: 20), Icon(Icons.arrow_back, size: 20)],
            ),
            // leadingWidth أكبر لاستيعاب محتوى أوسع
            leadingWidth: 80,
            title: const Text('leadingWidth: 80 (موسّع)', style: TextStyle(fontSize: 11)),
            centerTitle: true,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // 16. titleSpacing
  // ============================================================
  Widget _demoPage_TitleSpacing() {
    return Column(
      children: [
        Expanded(
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.brown,
            foregroundColor: Colors.white,
            // titleSpacing: المسافة الأفقية حول الـ title
            titleSpacing: 0,
            title: const Text('titleSpacing: 0 (بدون مسافة)', style: TextStyle(fontSize: 11)),
          ),
        ),
        Expanded(
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.brown.shade700,
            foregroundColor: Colors.white,
            titleSpacing: 40,
            title: const Text('titleSpacing: 40 (مسافة كبيرة)', style: TextStyle(fontSize: 11)),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // 17. titleTextStyle
  // ============================================================
  Widget _demoPage_TitleTextStyle() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      // titleTextStyle: تنسيق نص الـ title فقط
      titleTextStyle: const TextStyle(
        color: Colors.amber,
        fontSize: 18,
        fontWeight: FontWeight.w900,
        letterSpacing: 2,
        fontStyle: FontStyle.italic,
      ),
      title: const Text('titleTextStyle مخصص'),
      centerTitle: true,
    );
  }

  // ============================================================
  // 18. toolbarTextStyle
  // ============================================================
  Widget _demoPage_ToolbarTextStyle() {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
      leading: const Icon(Icons.arrow_back),
      // toolbarTextStyle: تنسيق نصوص الـ toolbar (actions وغيرها)
      toolbarTextStyle: const TextStyle(
        color: Colors.yellowAccent,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      title: const Text('toolbarTextStyle', style: TextStyle(color: Colors.white, fontSize: 13)),
      centerTitle: true,
      actions: [
        TextButton(onPressed: () {}, child: const Text('حفظ')),
        TextButton(onPressed: () {}, child: const Text('تراجع')),
      ],
    );
  }

  // ============================================================
  // 19. iconTheme و actionsIconTheme
  // ============================================================
  Widget _demoPage_IconTheme() {
    return AppBar(
      backgroundColor: Colors.grey.shade900,
      // iconTheme: تنسيق أيقونة الـ leading
      iconTheme: const IconThemeData(color: Colors.greenAccent, size: 28),
      // actionsIconTheme: تنسيق أيقونات الـ actions فقط
      actionsIconTheme: const IconThemeData(color: Colors.amber, size: 24),
      leading: const Icon(Icons.menu),
      title: const Text(
        'iconTheme vs actionsIconTheme',
        style: TextStyle(color: Colors.white, fontSize: 11),
      ),
      centerTitle: true,
      actions: [
        IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
      ],
    );
  }

  // ============================================================
  // 20. systemOverlayStyle
  // ============================================================
  Widget _demoPage_SystemOverlayStyle() {
    return Row(
      children: [
        Expanded(
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            // systemOverlayStyle: تحكم في شريط الحالة (status bar)
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            title: const Text('dark icons', style: TextStyle(color: Colors.black, fontSize: 11)),
            centerTitle: true,
          ),
        ),
        Expanded(
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            title: const Text('light icons', style: TextStyle(color: Colors.white, fontSize: 11)),
            centerTitle: true,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // 21. primary
  // ============================================================
  Widget _demoPage_Primary() {
    return Column(
      children: [
        Expanded(
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            // primary: true (افتراضي) → يضيف padding لشريط الحالة
            primary: true,
            title: const Text('primary: true (افتراضي)', style: TextStyle(fontSize: 11)),
            centerTitle: true,
          ),
        ),
        Expanded(
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blue.shade800,
            foregroundColor: Colors.white,
            // primary: false → لا يضيف padding لشريط الحالة
            // يُستخدم في AppBar ليس في أعلى الشاشة
            primary: false,
            title: const Text('primary: false (بدون padding الحالة)', style: TextStyle(fontSize: 11)),
            centerTitle: true,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // 22. SliverAppBar
  // ============================================================
  Widget _demoPage_SliverAppBar() {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _SliverAppBarPage())),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.open_in_new, color: Colors.blue),
              SizedBox(width: 8),
              Text('اضغط لرؤية SliverAppBar الأساسي', style: TextStyle(color: Colors.blue,
                  fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // 23. SliverAppBar.pinned
  // ============================================================
  Widget _demoPage_SliverPinned() {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _SliverPinnedPage())),
      child: _launchButton('اضغط لرؤية pinned: true', Colors.green),
    );
  }

  // ============================================================
  // 24. SliverAppBar.floating
  // ============================================================
  Widget _demoPage_SliverFloating() {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _SliverFloatingPage())),
      child: _launchButton('اضغط لرؤية floating: true', Colors.orange),
    );
  }

  // ============================================================
  // 25. SliverAppBar.snap
  // ============================================================
  Widget _demoPage_SliverSnap() {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _SliverSnapPage())),
      child: _launchButton('اضغط لرؤية snap: true', Colors.purple),
    );
  }

  // ============================================================
  // 26. SliverAppBar مع expandedHeight و FlexibleSpaceBar
  // ============================================================
  Widget _demoPage_SliverExpanded() {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _SliverExpandedPage())),
      child: _launchButton('اضغط لرؤية expandedHeight + FlexibleSpaceBar', Colors.teal),
    );
  }

  // ============================================================
  // 27. PopupMenuButton
  // ============================================================
  Widget _demoPage_PopupMenu() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,
      title: const Text('AppBar مع PopupMenu', style: TextStyle(fontSize: 13)),
      centerTitle: true,
      actions: [
        // PopupMenuButton: قائمة منسدلة في الـ actions
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert),
          onSelected: (value) {},
          itemBuilder: (context) => [
            const PopupMenuItem(value: 'edit', child: Row(children: [Icon(Icons.edit, size: 18), SizedBox(width: 8), Text('تعديل')])),
            const PopupMenuItem(value: 'share', child: Row(children: [Icon(Icons.share, size: 18), SizedBox(width: 8), Text('مشاركة')])),
            const PopupMenuDivider(),
            const PopupMenuItem(value: 'delete', child: Row(children: [Icon(Icons.delete, color: Colors.red, size: 18), SizedBox(width: 8), Text('حذف', style: TextStyle(color: Colors.red))])),
          ],
        ),
      ],
    );
  }

  // ============================================================
  // 28. SearchDelegate
  // ============================================================
  Widget _demoPage_Search() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.blue.shade800,
      foregroundColor: Colors.white,
      title: const Text('AppBar مع Search', style: TextStyle(fontSize: 13)),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          // showSearch: يفتح واجهة البحث باستخدام SearchDelegate
          onPressed: () => showSearch(context: context, delegate: _MySearchDelegate()),
        ),
      ],
    );
  }

  // ============================================================
  // 29. Transparent AppBar
  // ============================================================
  Widget _demoPage_Transparent() {
    return Stack(
      children: [
        // خلفية ملونة
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.deepOrange],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
        AppBar(
          automaticallyImplyLeading: false,
          // backgroundColor: transparent → AppBar شفاف
          backgroundColor: Colors.transparent,
          // elevation: 0 → بدون ظل
          elevation: 0,
          foregroundColor: Colors.white,
          title: const Text('AppBar شفاف', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          centerTitle: true,
          actions: const [Icon(Icons.more_vert)],
        ),
      ],
    );
  }

  // ============================================================
  // 30. AppBar مع Gradient
  // ============================================================
  Widget _demoPage_Gradient() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.white,
      flexibleSpace: Container(
        // flexibleSpace مع Gradient = AppBar بتدرج لوني
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1a237e), Color(0xFF7b1fa2), Color(0xFFad1457)],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
      ),
      title: const Text('AppBar مع Gradient جميل', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
      centerTitle: true,
      actions: [
        IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
      ],
    );
  }

  // ==================== Helper: زر الانتقال ====================
  Widget _launchButton(String label, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.open_in_new, color: color),
            const SizedBox(width: 8),
            Text(label, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// صفحات SliverAppBar المنفصلة
// ============================================================

// 22. SliverAppBar الأساسي
class _SliverAppBarPage extends StatelessWidget {
  const _SliverAppBarPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              // SliverAppBar: AppBar يتفاعل مع التمرير
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              title: const Text('SliverAppBar الأساسي'),
              centerTitle: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (_, i) => ListTile(
                  leading: CircleAvatar(child: Text('$i')),
                  title: Text('عنصر $i'),
                  subtitle: const Text('مرر للأعلى لترى السلوك'),
                ),
                childCount: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 23. pinned: true
class _SliverPinnedPage extends StatelessWidget {
  const _SliverPinnedPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              // pinned: true → يبقى AppBar ظاهراً دائماً عند التمرير
              pinned: true,
              expandedHeight: 150,
              title: const Text('pinned: true'),
              centerTitle: true,
              flexibleSpace: const FlexibleSpaceBar(
                background: ColoredBox(color: Colors.green),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (_, i) => ListTile(title: Text('عنصر $i - AppBar يبقى ثابتاً')),
                childCount: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 24. floating: true
class _SliverFloatingPage extends StatelessWidget {
  const _SliverFloatingPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              // floating: true → يظهر AppBar عند أول تمرير للأعلى
              floating: true,
              title: const Text('floating: true'),
              centerTitle: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (_, i) => ListTile(title: Text('عنصر $i - AppBar يظهر عند التمرير للأعلى')),
                childCount: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 25. snap: true
class _SliverSnapPage extends StatelessWidget {
  const _SliverSnapPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              floating: true,
              // snap: true → يظهر/يختفي AppBar دفعة واحدة (مع floating: true)
              snap: true,
              title: const Text('floating: true + snap: true'),
              centerTitle: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (_, i) => ListTile(title: Text('عنصر $i - AppBar يظهر/يختفي دفعة واحدة')),
                childCount: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 26. expandedHeight + FlexibleSpaceBar
class _SliverExpandedPage extends StatelessWidget {
  const _SliverExpandedPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              pinned: true,
              // expandedHeight: الارتفاع عند التوسع
              expandedHeight: 220,
              // flexibleSpace: FlexibleSpaceBar للمحتوى المتوسع
              flexibleSpace: FlexibleSpaceBar(
                // title: يظهر عند الانهيار
                title: const Text('FlexibleSpaceBar', style: TextStyle(fontSize: 14)),
                centerTitle: true,
                // titlePadding: موضع العنوان
                titlePadding: const EdgeInsets.only(bottom: 12),
                // background: خلفية المنطقة الموسعة
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.teal, Colors.cyan],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 40),
                      CircleAvatar(radius: 40, backgroundColor: Colors.white24, child: Icon(Icons.person, size: 40, color: Colors.white)),
                      SizedBox(height: 8),
                      Text('اسم المستخدم', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                // collapseMode: سلوك الخلفية عند الانهيار
                collapseMode: CollapseMode.parallax,
                // stretchModes: سلوك عند السحب للأسفل
                stretchModes: const [StretchMode.zoomBackground],
              ),
              // stretch: true → يسمح بالتمدد عند السحب للأسفل
              stretch: true,
              actions: [IconButton(icon: const Icon(Icons.more_vert), onPressed: () {})],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (_, i) => ListTile(
                  leading: CircleAvatar(child: Text('$i')),
                  title: Text('عنصر $i'),
                  subtitle: const Text('مرر للأعلى لترى التأثير'),
                ),
                childCount: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// SearchDelegate مخصص
// ============================================================
class _MySearchDelegate extends SearchDelegate<String> {
  final List<String> _suggestions = ['Flutter', 'Dart', 'Widget', 'AppBar', 'ListView', 'GridView', 'Scaffold'];

  @override
  String get searchFieldLabel => 'ابحث هنا...';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      // زر مسح النص
      IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // زر الرجوع
    return IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => close(context, ''));
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _suggestions.where((s) => s.toLowerCase().contains(query.toLowerCase())).toList();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.builder(
        itemCount: results.length,
        itemBuilder: (_, i) => ListTile(
          leading: const Icon(Icons.search),
          title: Text(results[i]),
          onTap: () => close(context, results[i]),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? _suggestions
        : _suggestions.where((s) => s.toLowerCase().contains(query.toLowerCase())).toList();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (_, i) => ListTile(
          leading: const Icon(Icons.history),
          title: Text(suggestions[i]),
          onTap: () {
            query = suggestions[i];
            showResults(context);
          },
        ),
      ),
    );
  }
}