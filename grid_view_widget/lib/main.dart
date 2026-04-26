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
      home: const GridViewScreen(),
    );
  }
}

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  // ==================== بيانات ====================
  final List<Map<String, dynamic>> _products = List.generate(
    20,
        (i) => {
      'title': 'منتج ${i + 1}',
      'price': '${(i + 1) * 29} درهم',
      'icon': Icons.shopping_bag,
      'color': Colors.primaries[i % Colors.primaries.length],
    },
  );

  final List<String> _dynamicItems = List.generate(6, (i) => 'بطاقة ${i + 1}');
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  int _selectedIndex = -1;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadMore() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _products.addAll(
        List.generate(
          4,
              (i) => {
            'title': 'منتج محمّل ${_products.length + i + 1}',
            'price': '${(_products.length + i + 1) * 15} درهم',
            'icon': Icons.new_releases,
            'color': Colors.primaries[(_products.length + i) % Colors.primaries.length],
          },
        ),
      );
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          children: [
            // ── 1
            _buildSectionTitle('1️⃣  GridView العادي (children)'),
            _buildBasicGridView(),

            // ── 2
            _buildSectionTitle('2️⃣  GridView.builder'),
            _buildGridViewBuilder(),

            // ── 3
            _buildSectionTitle('3️⃣  GridView.count'),
            _buildGridViewCount(),

            // ── 4
            _buildSectionTitle('4️⃣  GridView.extent'),
            _buildGridViewExtent(),

            // ── 5
            _buildSectionTitle('5️⃣  GridView.custom (SliverGridDelegate)'),
            _buildGridViewCustom(),

            // ── 6
            _buildSectionTitle('6️⃣  SliverGridDelegateWithFixedCrossAxisCount'),
            _buildFixedCrossAxisCount(),

            // ── 7
            _buildSectionTitle('7️⃣  SliverGridDelegateWithMaxCrossAxisExtent'),
            _buildMaxCrossAxisExtent(),

            // ── 8
            _buildSectionTitle('8️⃣  crossAxisCount (عدد الأعمدة)'),
            _buildCrossAxisCountExamples(),

            // ── 9
            _buildSectionTitle('9️⃣  mainAxisSpacing و crossAxisSpacing'),
            _buildSpacingExamples(),

            // ── 10
            _buildSectionTitle('🔟  childAspectRatio (نسبة العرض للارتفاع)'),
            _buildAspectRatioExamples(),

            // ── 11
            _buildSectionTitle('1️⃣1️⃣  mainAxisExtent (ارتفاع ثابت للعنصر)'),
            _buildMainAxisExtentExample(),

            // ── 12
            _buildSectionTitle('1️⃣2️⃣  scrollDirection: Horizontal (أفقي)'),
            _buildHorizontalGridView(),

            // ── 13
            _buildSectionTitle('1️⃣3️⃣  reverse: true (عكسي)'),
            _buildReverseGridView(),

            // ── 14
            _buildSectionTitle('1️⃣4️⃣  shrinkWrap: true داخل Column'),
            _buildShrinkWrapGridView(),

            // ── 15
            _buildSectionTitle('1️⃣5️⃣  physics (سلوك التمرير)'),
            _buildPhysicsExamples(),

            // ── 16
            _buildSectionTitle('1️⃣6️⃣  padding داخل GridView'),
            _buildPaddingExample(),

            // ── 17
            _buildSectionTitle('1️⃣7️⃣  cacheExtent (التخزين المؤقت)'),
            _buildCacheExtentExample(),

            // ── 18
            _buildSectionTitle('1️⃣8️⃣  ScrollController والتحكم يدوياً'),
            _buildScrollControllerExample(),

            // ── 19
            _buildSectionTitle('1️⃣9️⃣  Lazy Loading (تحميل عند التمرير)'),
            _buildLazyLoadingExample(),

            // ── 20
            _buildSectionTitle('2️⃣0️⃣  إضافة وحذف ديناميكي'),
            _buildDynamicGridView(),

            // ── 21
            _buildSectionTitle('2️⃣1️⃣  Grid مع اختيار عنصر (selected)'),
            _buildSelectableGridView(),

            // ── 22
            _buildSectionTitle('2️⃣2️⃣  GridView مع Scrollbar'),
            _buildScrollbarGridView(),

            // ── 23
            _buildSectionTitle('2️⃣3️⃣  GridView مع Card وتصميم منتجات'),
            _buildProductGridView(),

            // ── 24
            _buildSectionTitle('2️⃣4️⃣  keyboardDismissBehavior'),
            _buildKeyboardDismissExample(),
          ],
        ),
      ),
    );
  }

  // ==================== AppBar ====================
  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'جميع مفاهيم GridView',
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
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  // ============================================================
  // 1. GridView العادي (children)
  // ============================================================
  Widget _buildBasicGridView() {
    return SizedBox(
      height: 220,
      child: GridView(
        // gridDelegate: مطلوب دائماً - يحدد شكل الشبكة
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        // children: قائمة ثابتة - كلها تُبنى دفعة واحدة في الذاكرة
        children: List.generate(
          9,
              (i) => _gridCell(
            label: 'children[$i]',
            color: Colors.blue,
            icon: Icons.grid_3x3,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // 2. GridView.builder
  // ============================================================
  Widget _buildGridViewBuilder() {
    return SizedBox(
      height: 220,
      child: GridView.builder(
        // gridDelegate: يحدد شكل الشبكة
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
        ),
        // itemCount: عدد العناصر
        itemCount: 12,
        // itemBuilder: يبني كل عنصر عند الحاجة فقط (lazy) → أداء أفضل
        itemBuilder: (context, index) {
          return _gridCell(
            label: 'builder\n[$index]',
            color: Colors.green,
            icon: Icons.build,
          );
        },
        padding: const EdgeInsets.all(6),
      ),
    );
  }

  // ============================================================
  // 3. GridView.count
  // ============================================================
  Widget _buildGridViewCount() {
    return SizedBox(
      height: 220,
      child: GridView.count(
        // crossAxisCount: عدد الأعمدة مباشرةً بدون SliverGridDelegate
        crossAxisCount: 4,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
        padding: const EdgeInsets.all(6),
        // childAspectRatio: نسبة العرض للارتفاع لكل عنصر
        childAspectRatio: 0.9,
        children: List.generate(
          12,
              (i) => _gridCell(
            label: 'count\n[$i]',
            color: Colors.orange,
            icon: Icons.apps,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // 4. GridView.extent
  // ============================================================
  Widget _buildGridViewExtent() {
    return SizedBox(
      height: 220,
      child: GridView.extent(
        // maxCrossAxisExtent: الحد الأقصى لعرض كل عنصر
        // Flutter يحسب عدد الأعمدة تلقائياً بناءً على عرض الشاشة
        maxCrossAxisExtent: 100,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
        padding: const EdgeInsets.all(6),
        children: List.generate(
          12,
              (i) => _gridCell(
            label: 'extent\n[$i]',
            color: Colors.purple,
            icon: Icons.aspect_ratio,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // 5. GridView.custom
  // ============================================================
  Widget _buildGridViewCustom() {
    return SizedBox(
      height: 220,
      child: GridView.custom(
        // gridDelegate: مخصص كامل
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        // childrenDelegate: SliverChildDelegate للتحكم الكامل
        childrenDelegate: SliverChildBuilderDelegate(
              (context, index) => _gridCell(
            label: 'custom\n[$index]',
            color: Colors.teal,
            icon: Icons.tune,
          ),
          // childCount: عدد العناصر
          childCount: 9,
          // addAutomaticKeepAlives: الحفاظ على حالة العناصر
          addAutomaticKeepAlives: true,
          // addRepaintBoundaries: تحسين أداء إعادة الرسم
          addRepaintBoundaries: true,
        ),
        padding: const EdgeInsets.all(8),
      ),
    );
  }

  // ============================================================
  // 6. SliverGridDelegateWithFixedCrossAxisCount
  // ============================================================
  Widget _buildFixedCrossAxisCount() {
    return SizedBox(
      height: 230,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // crossAxisCount: عدد الأعمدة ثابت
          crossAxisCount: 3,
          // crossAxisSpacing: المسافة بين الأعمدة
          crossAxisSpacing: 10,
          // mainAxisSpacing: المسافة بين الصفوف
          mainAxisSpacing: 10,
          // childAspectRatio: عرض/ارتفاع = 1.0 مربع، < 1.0 طويل، > 1.0 عريض
          childAspectRatio: 0.85,
          // mainAxisExtent: ارتفاع ثابت - يتجاهل childAspectRatio
          // mainAxisExtent: 100,
        ),
        itemCount: 9,
        padding: const EdgeInsets.all(8),
        itemBuilder: (_, i) => _gridCell(
          label: 'Fixed\ncrossAxis\n[$i]',
          color: Colors.indigo,
          icon: Icons.grid_view,
        ),
      ),
    );
  }

  // ============================================================
  // 7. SliverGridDelegateWithMaxCrossAxisExtent
  // ============================================================
  Widget _buildMaxCrossAxisExtent() {
    return SizedBox(
      height: 220,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          // maxCrossAxisExtent: أقصى عرض لكل عنصر - Flutter يحسب الأعمدة تلقائياً
          maxCrossAxisExtent: 120,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.0,
        ),
        itemCount: 10,
        padding: const EdgeInsets.all(8),
        itemBuilder: (_, i) => _gridCell(
          label: 'MaxExtent\n[$i]',
          color: Colors.pink,
          icon: Icons.fullscreen,
        ),
      ),
    );
  }

  // ============================================================
  // 8. crossAxisCount مقارنة
  // ============================================================
  Widget _buildCrossAxisCountExamples() {
    return Column(
      children: [
        _crossAxisLabel('crossAxisCount: 2 → عمودان'),
        SizedBox(
          height: 120,
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            padding: const EdgeInsets.all(6),
            children: List.generate(4, (i) => _gridCell(label: '$i', color: Colors.red, icon: Icons.looks_two)),
          ),
        ),
        _crossAxisLabel('crossAxisCount: 3 → ثلاثة أعمدة'),
        SizedBox(
          height: 120,
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            padding: const EdgeInsets.all(6),
            children: List.generate(6, (i) => _gridCell(label: '$i', color: Colors.blue, icon: Icons.looks_3)),
          ),
        ),
        _crossAxisLabel('crossAxisCount: 4 → أربعة أعمدة'),
        SizedBox(
          height: 120,
          child: GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            padding: const EdgeInsets.all(6),
            children: List.generate(8, (i) => _gridCell(label: '$i', color: Colors.green, icon: Icons.looks_4)),
          ),
        ),
      ],
    );
  }

  Widget _crossAxisLabel(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
    );
  }

  // ============================================================
  // 9. mainAxisSpacing و crossAxisSpacing
  // ============================================================
  Widget _buildSpacingExamples() {
    return Column(
      children: [
        _crossAxisLabel('بدون spacing'),
        SizedBox(
          height: 110,
          child: GridView.count(
            crossAxisCount: 3,
            // بدون مسافات
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            children: List.generate(6, (i) => _gridCell(label: '$i', color: Colors.grey, icon: Icons.close)),
          ),
        ),
        _crossAxisLabel('crossAxisSpacing: 12, mainAxisSpacing: 12'),
        SizedBox(
          height: 130,
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            padding: const EdgeInsets.all(8),
            children: List.generate(6, (i) => _gridCell(label: '$i', color: Colors.teal, icon: Icons.space_bar)),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // 10. childAspectRatio
  // ============================================================
  Widget _buildAspectRatioExamples() {
    return Column(
      children: [
        _crossAxisLabel('childAspectRatio: 1.0 → مربع تماماً'),
        SizedBox(
          height: 110,
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            padding: const EdgeInsets.all(6),
            childAspectRatio: 1.0,
            children: List.generate(3, (i) => _gridCell(label: '1:1', color: Colors.blue, icon: Icons.square)),
          ),
        ),
        _crossAxisLabel('childAspectRatio: 0.6 → طويل (بطاقة)'),
        SizedBox(
          height: 190,
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            padding: const EdgeInsets.all(6),
            childAspectRatio: 0.6,
            children: List.generate(3, (i) => _gridCell(label: '0.6', color: Colors.purple, icon: Icons.credit_card)),
          ),
        ),
        _crossAxisLabel('childAspectRatio: 2.0 → عريض (شريط)'),
        SizedBox(
          height: 100,
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            padding: const EdgeInsets.all(6),
            childAspectRatio: 2.5,
            children: List.generate(4, (i) => _gridCell(label: '2.5', color: Colors.orange, icon: Icons.horizontal_rule)),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // 11. mainAxisExtent
  // ============================================================
  Widget _buildMainAxisExtentExample() {
    return SizedBox(
      height: 220,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          // mainAxisExtent: ارتفاع ثابت بالبكسل لكل عنصر
          // يتجاهل childAspectRatio تماماً عند تحديده
          mainAxisExtent: 80,
        ),
        itemCount: 8,
        padding: const EdgeInsets.all(8),
        itemBuilder: (_, i) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.cyan.shade100,
              border: Border.all(color: Colors.cyan),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.height, color: Colors.cyan),
                const SizedBox(width: 6),
                Text('mainAxisExtent: 80\nعنصر $i', style: const TextStyle(fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }

  // ============================================================
  // 12. scrollDirection: Horizontal
  // ============================================================
  Widget _buildHorizontalGridView() {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        // scrollDirection: Axis.horizontal → تمرير أفقي
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // في الوضع الأفقي crossAxisCount = عدد الصفوف
          crossAxisCount: 2,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
        ),
        itemCount: 14,
        padding: const EdgeInsets.all(8),
        itemBuilder: (_, i) => _gridCell(
          label: 'H[$i]',
          color: Colors.deepOrange,
          icon: Icons.swap_horiz,
        ),
      ),
    );
  }

  // ============================================================
  // 13. reverse: true
  // ============================================================
  Widget _buildReverseGridView() {
    return SizedBox(
      height: 220,
      child: GridView.builder(
        // reverse: true → يعكس اتجاه التمرير (يبدأ من الأسفل)
        reverse: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
        ),
        itemCount: 9,
        padding: const EdgeInsets.all(8),
        itemBuilder: (_, i) => _gridCell(
          label: 'rev[$i]',
          color: Colors.pink,
          icon: Icons.swap_vert,
        ),
      ),
    );
  }

  // ============================================================
  // 14. shrinkWrap
  // ============================================================
  Widget _buildShrinkWrapGridView() {
    return Container(
      color: Colors.yellow.shade50,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text('⬆️ نص فوق الـ GridView', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          GridView.count(
            // shrinkWrap: true → يأخذ فقط المساحة اللازمة لمحتواه
            shrinkWrap: true,
            // ضروري مع shrinkWrap لمنع التعارض مع التمرير الخارجي
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            childAspectRatio: 1.2,
            children: List.generate(
              6,
                  (i) => _gridCell(label: 'wrap[$i]', color: Colors.amber.shade700, icon: Icons.compress),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text('⬇️ نص تحت الـ GridView', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // 15. physics
  // ============================================================
  Widget _buildPhysicsExamples() {
    return Column(
      children: [
        _physicsBox(label: 'BouncingScrollPhysics - ارتداد (iOS)', physics: const BouncingScrollPhysics(), color: Colors.blue),
        const SizedBox(height: 8),
        _physicsBox(label: 'ClampingScrollPhysics - بدون ارتداد (Android)', physics: const ClampingScrollPhysics(), color: Colors.green),
        const SizedBox(height: 8),
        _physicsBox(label: 'NeverScrollableScrollPhysics - لا تمرير', physics: const NeverScrollableScrollPhysics(), color: Colors.red),
        const SizedBox(height: 8),
        _physicsBox(label: 'AlwaysScrollableScrollPhysics - دائماً', physics: const AlwaysScrollableScrollPhysics(), color: Colors.orange),
      ],
    );
  }

  Widget _physicsBox({required String label, required ScrollPhysics physics, required Color color}) {
    return Container(
      height: 140,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(6),
            color: color.withOpacity(0.15),
            child: Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 12)),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              physics: physics,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              padding: const EdgeInsets.all(4),
              children: List.generate(
                8,
                    (i) => Container(
                  decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(6)),
                  child: Center(child: Text('$i', style: TextStyle(color: color, fontWeight: FontWeight.bold))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // 16. padding
  // ============================================================
  Widget _buildPaddingExample() {
    return Column(
      children: [
        _crossAxisLabel('padding: EdgeInsets.zero'),
        SizedBox(
          height: 100,
          child: GridView.count(
            crossAxisCount: 3,
            padding: EdgeInsets.zero,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            children: List.generate(3, (i) => _gridCell(label: 'zero', color: Colors.red, icon: Icons.border_clear)),
          ),
        ),
        _crossAxisLabel('padding: EdgeInsets.all(16)'),
        SizedBox(
          height: 130,
          child: GridView.count(
            crossAxisCount: 3,
            padding: const EdgeInsets.all(16),
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            children: List.generate(3, (i) => _gridCell(label: 'p:16', color: Colors.green, icon: Icons.border_all)),
          ),
        ),
        _crossAxisLabel('padding: symmetric(horizontal: 24, vertical: 8)'),
        SizedBox(
          height: 120,
          child: GridView.count(
            crossAxisCount: 3,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            children: List.generate(3, (i) => _gridCell(label: 'sym', color: Colors.blue, icon: Icons.border_style)),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // 17. cacheExtent
  // ============================================================
  Widget _buildCacheExtentExample() {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        // cacheExtent: المسافة خارج الشاشة التي يتم فيها بناء العناصر مسبقاً
        // الافتراضي: 250 بكسل - قيمة أكبر = تمرير أسلس لكن ذاكرة أكبر
        cacheExtent: 600,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
        ),
        itemCount: 18,
        padding: const EdgeInsets.all(8),
        itemBuilder: (_, i) => _gridCell(
          label: 'cache[$i]',
          color: Colors.brown,
          icon: Icons.cached,
        ),
      ),
    );
  }

  // ============================================================
  // 18. ScrollController
  // ============================================================
  Widget _buildScrollControllerExample() {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: GridView.builder(
            controller: _scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
            ),
            itemCount: 30,
            padding: const EdgeInsets.all(8),
            itemBuilder: (_, i) => _gridCell(
              label: 'ctrl[$i]',
              color: Colors.indigo,
              icon: Icons.gamepad,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () => _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
              ),
              icon: const Icon(Icons.arrow_upward),
              label: const Text('للأعلى'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, foregroundColor: Colors.white),
            ),
            ElevatedButton.icon(
              onPressed: () => _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
              ),
              icon: const Icon(Icons.arrow_downward),
              label: const Text('للأسفل'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, foregroundColor: Colors.white),
            ),
            ElevatedButton.icon(
              onPressed: () => _scrollController.jumpTo(300),
              icon: const Icon(Icons.vertical_align_center),
              label: const Text('jumpTo'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey, foregroundColor: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  // ============================================================
  // 19. Lazy Loading
  // ============================================================
  Widget _buildLazyLoadingExample() {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent - 50 && !_isLoading) {
          _loadMore();
        }
        return false;
      },
      child: SizedBox(
        height: 260,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
          ),
          itemCount: _products.length + 1,
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) {
            if (index == _products.length) {
              return _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : const SizedBox.shrink();
            }
            final p = _products[index];
            return _gridCell(
              label: p['title'],
              color: p['color'],
              icon: p['icon'],
            );
          },
        ),
      ),
    );
  }

  // ============================================================
  // 20. إضافة وحذف ديناميكي
  // ============================================================
  Widget _buildDynamicGridView() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => setState(() => _dynamicItems.add('جديد ${_dynamicItems.length + 1} 🆕')),
                  icon: const Icon(Icons.add),
                  label: const Text('إضافة'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (_dynamicItems.isNotEmpty) setState(() => _dynamicItems.removeLast());
                  },
                  icon: const Icon(Icons.remove),
                  label: const Text('حذف'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
                ),
              ),
            ],
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          padding: const EdgeInsets.all(8),
          childAspectRatio: 1.1,
          children: _dynamicItems
              .map((item) => _gridCell(label: item, color: Colors.teal, icon: Icons.add_box))
              .toList(),
        ),
      ],
    );
  }

  // ============================================================
  // 21. Grid مع اختيار (selected)
  // ============================================================
  Widget _buildSelectableGridView() {
    final colors = [Colors.red, Colors.blue, Colors.green, Colors.orange, Colors.purple, Colors.pink];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: 6,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        final isSelected = _selectedIndex == index;
        return GestureDetector(
          onTap: () => setState(() => _selectedIndex = index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: isSelected ? colors[index] : colors[index].withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: colors[index],
                width: isSelected ? 3 : 1,
              ),
              boxShadow: isSelected
                  ? [BoxShadow(color: colors[index].withOpacity(0.4), blurRadius: 8, offset: const Offset(0, 4))]
                  : [],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(isSelected ? Icons.check_circle : Icons.circle_outlined,
                    color: isSelected ? Colors.white : colors[index], size: 28),
                const SizedBox(height: 4),
                Text(
                  'خيار $index',
                  style: TextStyle(
                    color: isSelected ? Colors.white : colors[index],
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ============================================================
  // 22. GridView مع Scrollbar
  // ============================================================
  Widget _buildScrollbarGridView() {
    final controller = ScrollController();
    return SizedBox(
      height: 220,
      child: Scrollbar(
        controller: controller,
        thumbVisibility: true,
        trackVisibility: true,
        thickness: 8,
        radius: const Radius.circular(4),
        child: GridView.builder(
          controller: controller,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
          ),
          itemCount: 18,
          padding: const EdgeInsets.all(8),
          itemBuilder: (_, i) => _gridCell(
            label: 'bar[$i]',
            color: Colors.blueGrey,
            icon: Icons.view_module,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // 23. Grid تصميم منتجات
  // ============================================================
  Widget _buildProductGridView() {
    final items = [
      {'name': 'حذاء رياضي', 'price': '299 درهم', 'icon': Icons.directions_run, 'color': Colors.blue},
      {'name': 'ساعة ذكية', 'price': '599 درهم', 'icon': Icons.watch, 'color': Colors.indigo},
      {'name': 'سماعات', 'price': '199 درهم', 'icon': Icons.headphones, 'color': Colors.purple},
      {'name': 'حقيبة', 'price': '349 درهم', 'icon': Icons.shopping_bag, 'color': Colors.brown},
      {'name': 'نظارات', 'price': '149 درهم', 'icon': Icons.visibility, 'color': Colors.teal},
      {'name': 'قميص', 'price': '99 درهم', 'icon': Icons.checkroom, 'color': Colors.green},
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.78,
      ),
      itemCount: items.length,
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) {
        final item = items[index];
        final color = item['color'] as Color;
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // صورة المنتج
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.12),
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Center(
                    child: Icon(item['icon'] as IconData, color: color, size: 52),
                  ),
                ),
              ),
              // تفاصيل المنتج
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['name'] as String,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item['price'] as String,
                            style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 13)),
                        Icon(Icons.favorite_border, color: Colors.grey.shade400, size: 18),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ============================================================
  // 24. keyboardDismissBehavior
  // ============================================================
  Widget _buildKeyboardDismissExample() {
    return Container(
      height: 220,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridView(
        // keyboardDismissBehavior: يتحكم في إغلاق الكيبورد عند التمرير
        // onDrag → يُغلق عند السحب
        // manual → لا يُغلق تلقائياً
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          childAspectRatio: 1.5,
        ),
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        children: List.generate(
          12,
              (i) => _gridCell(
            label: 'key[$i]',
            color: Colors.blueGrey,
            icon: Icons.keyboard_hide,
          ),
        ),
      ),
    );
  }

  // ==================== Helper: خلية Grid ====================
  Widget _gridCell({required String label, required Color color, required IconData icon}) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        border: Border.all(color: color.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}