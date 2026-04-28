import 'package:flutter/gestures.dart';
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
      home: const TabBarScreen(),
    );
  }
}

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('جميع مفاهيم TabBar & TabBarView', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 32),
        children: [
          _buildSectionTitle('1️⃣  TabBar + TabBarView الأساسي'),
          _buildLaunchButton(context, 'فتح المثال الأساسي', Colors.blue, const _BasicTabBarPage()),

          _buildSectionTitle('2️⃣  DefaultTabController'),
          _buildLaunchButton(context, 'DefaultTabController', Colors.green, const _DefaultTabControllerPage()),

          _buildSectionTitle('3️⃣  TabController يدوي (مع SingleTickerProviderStateMixin)'),
          _buildLaunchButton(context, 'TabController يدوي', Colors.purple, const _ManualTabControllerPage()),

          _buildSectionTitle('4️⃣  Tab مع icon فقط'),
          _buildLaunchButton(context, 'Tab مع أيقونات فقط', Colors.orange, const _IconOnlyTabPage()),

          _buildSectionTitle('5️⃣  Tab مع text فقط'),
          _buildLaunchButton(context, 'Tab مع نص فقط', Colors.teal, const _TextOnlyTabPage()),

          _buildSectionTitle('6️⃣  Tab مع icon + text'),
          _buildLaunchButton(context, 'Tab مع أيقونة + نص', Colors.indigo, const _IconTextTabPage()),

          _buildSectionTitle('7️⃣  Tab مع child مخصص'),
          _buildLaunchButton(context, 'Tab مع child مخصص', Colors.pink, const _CustomChildTabPage()),

          _buildSectionTitle('8️⃣  isScrollable: true (تبويبات قابلة للتمرير)'),
          _buildLaunchButton(context, 'isScrollable: true', Colors.cyan.shade700, const _ScrollableTabPage()),

          _buildSectionTitle('9️⃣  tabAlignment (محاذاة التبويبات)'),
          _buildLaunchButton(context, 'tabAlignment', Colors.deepOrange, const _TabAlignmentPage()),

          _buildSectionTitle('🔟  indicatorColor و indicatorWeight'),
          _buildLaunchButton(context, 'indicatorColor + indicatorWeight', Colors.red, const _IndicatorColorPage()),

          _buildSectionTitle('1️⃣1️⃣  indicatorSize (TabBarIndicatorSize)'),
          _buildLaunchButton(context, 'indicatorSize: label vs tab', Colors.brown, const _IndicatorSizePage()),

          _buildSectionTitle('1️⃣2️⃣  indicator مخصص (BoxDecoration)'),
          _buildLaunchButton(context, 'indicator مخصص', Colors.deepPurple, const _CustomIndicatorPage()),

          _buildSectionTitle('1️⃣3️⃣  labelColor و unselectedLabelColor'),
          _buildLaunchButton(context, 'labelColor + unselectedLabelColor', Colors.green.shade700, const _LabelColorPage()),

          _buildSectionTitle('1️⃣4️⃣  labelStyle و unselectedLabelStyle'),
          _buildLaunchButton(context, 'labelStyle + unselectedLabelStyle', Colors.blueGrey, const _LabelStylePage()),

          _buildSectionTitle('1️⃣5️⃣  labelPadding'),
          _buildLaunchButton(context, 'labelPadding', Colors.amber.shade700, const _LabelPaddingPage()),

          _buildSectionTitle('1️⃣6️⃣  padding داخل TabBar'),
          _buildLaunchButton(context, 'padding في TabBar', Colors.lime.shade700, const _TabBarPaddingPage()),

          _buildSectionTitle('1️⃣7️⃣  dividerColor و dividerHeight'),
          _buildLaunchButton(context, 'dividerColor + dividerHeight', Colors.teal.shade700, const _DividerPage()),

          _buildSectionTitle('1️⃣8️⃣  overlayColor (تأثير الضغط)'),
          _buildLaunchButton(context, 'overlayColor', Colors.purple.shade700, const _OverlayColorPage()),

          _buildSectionTitle('1️⃣9️⃣  splashFactory (تأثير الموجة)'),
          _buildLaunchButton(context, 'splashFactory', Colors.cyan.shade900, const _SplashFactoryPage()),

          _buildSectionTitle('2️⃣0️⃣  mouseCursor'),
          _buildLaunchButton(context, 'mouseCursor', Colors.indigo.shade700, const _MouseCursorPage()),

          _buildSectionTitle('2️⃣1️⃣  enableFeedback'),
          _buildLaunchButton(context, 'enableFeedback', Colors.orange.shade700, const _EnableFeedbackPage()),

          _buildSectionTitle('2️⃣2️⃣  onTap callback'),
          _buildLaunchButton(context, 'onTap callback', Colors.red.shade700, const _OnTapPage()),

          _buildSectionTitle('2️⃣3️⃣  TabBarView physics'),
          _buildLaunchButton(context, 'TabBarView physics', Colors.green.shade800, const _PhysicsPage()),

          _buildSectionTitle('2️⃣4️⃣  TabBarView dragStartBehavior'),
          _buildLaunchButton(context, 'dragStartBehavior', Colors.pink.shade700, const _DragBehaviorPage()),

          _buildSectionTitle('2️⃣5️⃣  TabBarView viewportFraction'),
          _buildLaunchButton(context, 'viewportFraction', Colors.blue.shade800, const _ViewportFractionPage()),

          _buildSectionTitle('2️⃣6️⃣  TabBar داخل body (بدون AppBar)'),
          _buildLaunchButton(context, 'TabBar داخل body', Colors.teal.shade800, const _TabBarInBodyPage()),

          _buildSectionTitle('2️⃣7️⃣  TabBar مع KeepAlive (حفظ حالة الصفحة)'),
          _buildLaunchButton(context, 'AutomaticKeepAliveClientMixin', Colors.purple.shade800, const _KeepAlivePage()),

          _buildSectionTitle('2️⃣8️⃣  TabController addListener (مراقبة التغيير)'),
          _buildLaunchButton(context, 'TabController.addListener', Colors.orange.shade800, const _ListenerPage()),

          _buildSectionTitle('2️⃣9️⃣  TabController animateTo (انتقال برمجي)'),
          _buildLaunchButton(context, 'animateTo برمجياً', Colors.cyan.shade800, const _AnimateToPage()),

          _buildSectionTitle('3️⃣0️⃣  TabBar مع Badge على التبويب'),
          _buildLaunchButton(context, 'Tab مع Badge', Colors.red.shade800, const _BadgeTabPage()),

          _buildSectionTitle('3️⃣1️⃣  TabBar ثانوي (secondary)'),
          _buildLaunchButton(context, 'TabBar.secondary', Colors.deepPurple.shade700, const _SecondaryTabPage()),

          _buildSectionTitle('3️⃣2️⃣  تصميم TabBar مخصص كامل احترافي'),
          _buildLaunchButton(context, 'تصميم TabBar احترافي', Colors.deepOrange.shade700, const _ProTabBarPage()),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 16, bottom: 4),
      color: Colors.blue.shade100,
      child: Text(title, textDirection: TextDirection.rtl,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue)),
    );
  }

  Widget _buildLaunchButton(BuildContext context, String label, Color color, Widget page) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ElevatedButton.icon(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
        icon: const Icon(Icons.open_in_new, size: 16),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}

// ============================================================
// مكوّنات مساعدة مشتركة
// ============================================================
AppBar _appBar(String title, Color color) => AppBar(
  title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 14)),
  backgroundColor: color,
  centerTitle: true,
);

Widget _tabContent(String label, Color color, IconData icon) {
  return Center(
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(icon, size: 64, color: color),
      const SizedBox(height: 16),
      Text(label, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
      const SizedBox(height: 8),
      Text('محتوى تبويب: $label', style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
    ]),
  );
}

// ============================================================
// 1. TabBar + TabBarView الأساسي
// ============================================================
class _BasicTabBarPage extends StatelessWidget {
  const _BasicTabBarPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      // DefaultTabController: يوفر TabController للـ TabBar و TabBarView
      child: DefaultTabController(
        // length: عدد التبويبات - يجب أن يتطابق مع عدد tabs و children
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('TabBar الأساسي', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.blue,
            // bottom: مكان وضع TabBar في AppBar
            bottom: const TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'الأول'),
                Tab(text: 'الثاني'),
                Tab(text: 'الثالث'),
              ],
            ),
          ),
          // TabBarView: يعرض محتوى كل تبويب - يجب أن يتطابق عدد children مع length
          body: TabBarView(
            children: [
              _tabContent('الأول', Colors.blue, Icons.looks_one),
              _tabContent('الثاني', Colors.blue, Icons.looks_two),
              _tabContent('الثالث', Colors.blue, Icons.looks_3),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// 2. DefaultTabController
// ============================================================
class _DefaultTabControllerPage extends StatelessWidget {
  const _DefaultTabControllerPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 4,
        // initialIndex: التبويب الذي يُفتح أولاً (الافتراضي: 0)
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('DefaultTabController', style: TextStyle(color: Colors.white, fontSize: 13)),
            backgroundColor: Colors.green,
            bottom: const TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.amber,
              tabs: [
                Tab(text: 'tab 0'),
                Tab(text: 'tab 1 ← initialIndex'),
                Tab(text: 'tab 2'),
                Tab(text: 'tab 3'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              _tabContent('tab 0', Colors.green, Icons.looks_one),
              _tabContent('tab 1 (initialIndex: 1)', Colors.green, Icons.looks_two),
              _tabContent('tab 2', Colors.green, Icons.looks_3),
              _tabContent('tab 3', Colors.green, Icons.looks_4),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// 3. TabController يدوي
// ============================================================
class _ManualTabControllerPage extends StatefulWidget {
  const _ManualTabControllerPage();

  @override
  State<_ManualTabControllerPage> createState() => _ManualTabControllerPageState();
}

class _ManualTabControllerPageState extends State<_ManualTabControllerPage>
// SingleTickerProviderStateMixin: مطلوب لـ TabController
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // إنشاء TabController يدوياً
    _tabController = TabController(
      length: 3,
      vsync: this, // vsync: مطلوب لتحسين الأداء
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    // dispose: مهم جداً لتحرير الموارد
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabController يدوي', style: TextStyle(color: Colors.white, fontSize: 13)),
          backgroundColor: Colors.purple,
          bottom: TabBar(
            // controller: ربط TabController يدوياً
            controller: _tabController,
            labelColor: Colors.white,
            indicatorColor: Colors.amber,
            tabs: const [Tab(text: 'أ'), Tab(text: 'ب'), Tab(text: 'ج')],
          ),
        ),
        body: Column(
          children: [
            // أزرار تحكم يدوية
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3, (i) => ElevatedButton(
                  onPressed: () => _tabController.animateTo(i),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.purple, foregroundColor: Colors.white),
                  child: Text('Tab $i'),
                )),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _tabContent('أ', Colors.purple, Icons.looks_one),
                  _tabContent('ب', Colors.purple, Icons.looks_two),
                  _tabContent('ج', Colors.purple, Icons.looks_3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 4. Tab مع icon فقط
// ============================================================
class _IconOnlyTabPage extends StatelessWidget {
  const _IconOnlyTabPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tab: icon فقط', style: TextStyle(color: Colors.white, fontSize: 13)),
            backgroundColor: Colors.orange,
            bottom: const TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              tabs: [
                // Tab مع icon فقط
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.search)),
                Tab(icon: Icon(Icons.favorite)),
                Tab(icon: Icon(Icons.person)),
              ],
            ),
          ),
          body: TabBarView(children: [
            _tabContent('الرئيسية', Colors.orange, Icons.home),
            _tabContent('البحث', Colors.orange, Icons.search),
            _tabContent('المفضلة', Colors.orange, Icons.favorite),
            _tabContent('الملف الشخصي', Colors.orange, Icons.person),
          ]),
        ),
      ),
    );
  }
}

// ============================================================
// 5. Tab مع text فقط
// ============================================================
class _TextOnlyTabPage extends StatelessWidget {
  const _TextOnlyTabPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tab: text فقط', style: TextStyle(color: Colors.white, fontSize: 13)),
            backgroundColor: Colors.teal,
            bottom: const TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white60,
              indicatorColor: Colors.amber,
              tabs: [
                // Tab مع text فقط
                Tab(text: 'كل المنتجات'),
                Tab(text: 'الأكثر مبيعاً'),
                Tab(text: 'العروض'),
              ],
            ),
          ),
          body: TabBarView(children: [
            _tabContent('كل المنتجات', Colors.teal, Icons.grid_view),
            _tabContent('الأكثر مبيعاً', Colors.teal, Icons.trending_up),
            _tabContent('العروض', Colors.teal, Icons.local_offer),
          ]),
        ),
      ),
    );
  }
}

// ============================================================
// 6. Tab مع icon + text
// ============================================================
class _IconTextTabPage extends StatelessWidget {
  const _IconTextTabPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tab: icon + text', style: TextStyle(color: Colors.white, fontSize: 13)),
            backgroundColor: Colors.indigo,
            bottom: const TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white54,
              indicatorColor: Colors.amber,
              tabs: [
                // Tab مع icon + text معاً
                Tab(icon: Icon(Icons.home), text: 'الرئيسية'),
                Tab(icon: Icon(Icons.explore), text: 'استكشاف'),
                Tab(icon: Icon(Icons.settings), text: 'الإعدادات'),
              ],
            ),
          ),
          body: TabBarView(children: [
            _tabContent('الرئيسية', Colors.indigo, Icons.home),
            _tabContent('استكشاف', Colors.indigo, Icons.explore),
            _tabContent('الإعدادات', Colors.indigo, Icons.settings),
          ]),
        ),
      ),
    );
  }
}

// ============================================================
// 7. Tab مع child مخصص
// ============================================================
class _CustomChildTabPage extends StatelessWidget {
  const _CustomChildTabPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tab: child مخصص', style: TextStyle(color: Colors.white, fontSize: 13)),
            backgroundColor: Colors.pink,
            bottom: TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              tabs: [
                // Tab مع child: أي Widget مخصص
                Tab(child: Row(mainAxisSize: MainAxisSize.min, children: const [Icon(Icons.star, size: 14), SizedBox(width: 4), Text('مميز')])),
                Tab(child: Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(12)), child: const Text('جديد', style: TextStyle(fontSize: 12)))),
                Tab(child: Row(mainAxisSize: MainAxisSize.min, children: const [Icon(Icons.local_fire_department, size: 14, color: Colors.amber), SizedBox(width: 4), Text('الأكثر')])),
              ],
            ),
          ),
          body: TabBarView(children: [
            _tabContent('مميز', Colors.pink, Icons.star),
            _tabContent('جديد', Colors.pink, Icons.fiber_new),
            _tabContent('الأكثر', Colors.pink, Icons.local_fire_department),
          ]),
        ),
      ),
    );
  }
}

// ============================================================
// 8. isScrollable: true
// ============================================================
class _ScrollableTabPage extends StatelessWidget {
  const _ScrollableTabPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 8,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('isScrollable: true', style: TextStyle(color: Colors.white, fontSize: 13)),
            backgroundColor: Colors.cyan.shade700,
            bottom: const TabBar(
              // isScrollable: true → تبويبات قابلة للتمرير أفقياً
              // تُستخدم عندما يكون عدد التبويبات كبيراً
              isScrollable: true,
              labelColor: Colors.white,
              indicatorColor: Colors.amber,
              tabs: [
                Tab(text: 'الكل'),
                Tab(text: 'إلكترونيات'),
                Tab(text: 'ملابس'),
                Tab(text: 'كتب'),
                Tab(text: 'رياضة'),
                Tab(text: 'طعام'),
                Tab(text: 'سفر'),
                Tab(text: 'صحة'),
              ],
            ),
          ),
          body: TabBarView(children: List.generate(8, (i) => _tabContent('تبويب $i', Colors.cyan.shade700, Icons.category))),
        ),
      ),
    );
  }
}

// ============================================================
// 9. tabAlignment
// ============================================================
class _TabAlignmentPage extends StatelessWidget {
  const _TabAlignmentPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('tabAlignment', style: TextStyle(color: Colors.white, fontSize: 13)),
            backgroundColor: Colors.deepOrange,
            bottom: const TabBar(
              // tabAlignment: محاذاة التبويبات
              // TabAlignment.start → محاذاة لليمين (مع isScrollable)
              // TabAlignment.center → في المنتصف
              // TabAlignment.fill → يملأ العرض كاملاً (افتراضي)
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              tabs: [Tab(text: 'تبويب 1'), Tab(text: 'تبويب 2'), Tab(text: 'تبويب 3')],
            ),
          ),
          body: TabBarView(children: List.generate(3, (i) => Center(child: Text('tabAlignment: start - تبويب $i', style: const TextStyle(fontSize: 16))))),
        ),
      ),
    );
  }
}

// ============================================================
// 10. indicatorColor و indicatorWeight
// ============================================================
class _IndicatorColorPage extends StatelessWidget {
  const _IndicatorColorPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('indicatorColor + indicatorWeight', style: TextStyle(color: Colors.white, fontSize: 11)),
            backgroundColor: Colors.red,
            bottom: const TabBar(
              // indicatorColor: لون خط المؤشر أسفل التبويب المحدد
              indicatorColor: Colors.amber,
              // indicatorWeight: سماكة خط المؤشر (الافتراضي: 2)
              indicatorWeight: 5,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white54,
              tabs: [Tab(text: 'الأول'), Tab(text: 'الثاني'), Tab(text: 'الثالث')],
            ),
          ),
          body: TabBarView(children: List.generate(3, (i) => _tabContent('تبويب $i\nindicatorWeight: 5', Colors.red, Icons.horizontal_rule))),
        ),
      ),
    );
  }
}

// ============================================================
// 11. indicatorSize
// ============================================================
class _IndicatorSizePage extends StatelessWidget {
  const _IndicatorSizePage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('indicatorSize', style: TextStyle(color: Colors.white, fontSize: 13)),
            backgroundColor: Colors.brown,
            bottom: const TabBar(
              indicatorColor: Colors.amber,
              indicatorWeight: 4,
              // indicatorSize: حجم مؤشر التبويب
              // TabBarIndicatorSize.tab → يمتد بعرض التبويب كاملاً
              // TabBarIndicatorSize.label → يمتد بعرض النص فقط
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.white,
              tabs: [Tab(text: 'label (بعرض النص)'), Tab(text: 'label')],
            ),
          ),
          body: TabBarView(children: [
            _tabContent('indicatorSize: label\nالمؤشر بعرض النص فقط', Colors.brown, Icons.text_fields),
            _tabContent('indicatorSize: tab\nالمؤشر بعرض التبويب', Colors.brown, Icons.tab),
          ]),
        ),
      ),
    );
  }
}

// ============================================================
// 12. indicator مخصص
// ============================================================
class _CustomIndicatorPage extends StatelessWidget {
  const _CustomIndicatorPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('indicator مخصص', style: TextStyle(color: Colors.white, fontSize: 13)),
            backgroundColor: Colors.deepPurple,
            bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white54,
              // indicator: BoxDecoration مخصص بالكامل بدلاً من الخط الافتراضي
              indicator: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white, width: 1.5),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [Tab(text: 'الأول'), Tab(text: 'الثاني'), Tab(text: 'الثالث')],
            ),
          ),
          body: TabBarView(children: List.generate(3, (i) => _tabContent('indicator مخصص $i', Colors.deepPurple, Icons.rounded_corner))),
        ),
      ),
    );
  }
}

// ============================================================
// 13. labelColor و unselectedLabelColor
// ============================================================
class _LabelColorPage extends StatelessWidget {
  const _LabelColorPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('labelColor + unselectedLabelColor', style: TextStyle(color: Colors.white, fontSize: 11)),
            backgroundColor: Colors.green.shade700,
            bottom: const TabBar(
              // labelColor: لون نص وأيقونة التبويب المحدد
              labelColor: Colors.amber,
              // unselectedLabelColor: لون التبويبات غير المحددة
              unselectedLabelColor: Colors.white38,
              indicatorColor: Colors.amber,
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'الرئيسية'),
                Tab(icon: Icon(Icons.search), text: 'بحث'),
                Tab(icon: Icon(Icons.person), text: 'حسابي'),
              ],
            ),
          ),
          body: TabBarView(children: List.generate(3, (i) => _tabContent('تبويب $i', Colors.green.shade700, Icons.color_lens))),
        ),
      ),
    );
  }
}

// ============================================================
// 14. labelStyle و unselectedLabelStyle
// ============================================================
class _LabelStylePage extends StatelessWidget {
  const _LabelStylePage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('labelStyle + unselectedLabelStyle', style: TextStyle(color: Colors.white, fontSize: 11)),
            backgroundColor: Colors.blueGrey,
            bottom: const TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white54,
              indicatorColor: Colors.amber,
              // labelStyle: تنسيق نص التبويب المحدد
              labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: 1),
              // unselectedLabelStyle: تنسيق نصوص التبويبات غير المحددة
              unselectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
              tabs: [Tab(text: 'الرئيسية'), Tab(text: 'البحث'), Tab(text: 'حسابي')],
            ),
          ),
          body: TabBarView(children: List.generate(3, (i) => _tabContent('تبويب $i', Colors.blueGrey, Icons.text_format))),
        ),
      ),
    );
  }
}

// ============================================================
// 15. labelPadding
// ============================================================
class _LabelPaddingPage extends StatelessWidget {
  const _LabelPaddingPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('labelPadding', style: TextStyle(color: Colors.white, fontSize: 13)),
            backgroundColor: Colors.amber.shade700,
            bottom: const TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              // labelPadding: المسافة الداخلية حول كل تبويب
              labelPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              tabs: [Tab(text: 'tab 1'), Tab(text: 'tab 2'), Tab(text: 'tab 3')],
            ),
          ),
          body: TabBarView(children: List.generate(3, (i) => _tabContent('labelPadding: h24 v8\nتبويب $i', Colors.amber.shade700, Icons.padding))),
        ),
      ),
    );
  }
}

// ============================================================
// 16. padding في TabBar
// ============================================================
class _TabBarPaddingPage extends StatelessWidget {
  const _TabBarPaddingPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('padding في TabBar', style: TextStyle(color: Colors.white, fontSize: 13)),
            backgroundColor: Colors.lime.shade700,
            bottom: const TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              // padding: مسافة خارجية حول كامل الـ TabBar
              padding: EdgeInsets.symmetric(horizontal: 20),
              tabs: [Tab(text: 'tab 1'), Tab(text: 'tab 2'), Tab(text: 'tab 3')],
            ),
          ),
          body: TabBarView(children: List.generate(3, (i) => _tabContent('padding حول TabBar\nتبويب $i', Colors.lime.shade700, Icons.space_bar))),
        ),
      ),
    );
  }
}

// ============================================================
// 17. dividerColor و dividerHeight
// ============================================================
class _DividerPage extends StatelessWidget {
  const _DividerPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('dividerColor + dividerHeight', style: TextStyle(color: Colors.white, fontSize: 11)),
            backgroundColor: Colors.teal.shade700,
            bottom: TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.amber,
              // dividerColor: لون الخط الفاصل أسفل TabBar كاملاً
              dividerColor: Colors.teal.shade200,
              // dividerHeight: ارتفاع الخط الفاصل
              dividerHeight: 3,
              tabs: [Tab(text: 'الأول'), Tab(text: 'الثاني'), Tab(text: 'الثالث')],
            ),
          ),
          body: TabBarView(children: List.generate(3, (i) => _tabContent('dividerColor + dividerHeight\nتبويب $i', Colors.teal.shade700, Icons.horizontal_rule))),
        ),
      ),
    );
  }
}

// ============================================================
// 18. overlayColor
// ============================================================
class _OverlayColorPage extends StatelessWidget {
  const _OverlayColorPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('overlayColor', style: TextStyle(color: Colors.white, fontSize: 13)),
            backgroundColor: Colors.purple.shade700,
            bottom: TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.amber,
              // overlayColor: تأثير اللون عند التحويم والضغط
              overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
                if (states.contains(WidgetState.hovered)) return Colors.amber.withOpacity(0.1);
                if (states.contains(WidgetState.pressed)) return Colors.amber.withOpacity(0.3);
                return null;
              }),
              tabs: const [Tab(text: 'اضغط هنا'), Tab(text: 'شوف التأثير'), Tab(text: 'overlayColor')],
            ),
          ),
          body: TabBarView(children: List.generate(3, (i) => _tabContent('overlayColor مخصص\nتبويب $i', Colors.purple.shade700, Icons.touch_app))),
        ),
      ),
    );
  }
}

// ============================================================
// 19. splashFactory
// ============================================================
class _SplashFactoryPage extends StatelessWidget {
  const _SplashFactoryPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('splashFactory', style: TextStyle(color: Colors.white, fontSize: 13)),
            backgroundColor: Colors.cyan.shade900,
            bottom: TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.amber,
              // splashFactory: نوع تأثير الموجة عند الضغط
              // NoSplash.splashFactory → بدون تأثير موجة
              // InkRipple.splashFactory → موجة دائرية (افتراضي)
              // InkSplash.splashFactory → موجة بسيطة
              splashFactory: InkRipple.splashFactory,
              tabs: const [Tab(text: 'InkRipple'), Tab(text: 'اضغط'), Tab(text: 'وشوف')],
            ),
          ),
          body: TabBarView(children: List.generate(3, (i) => _tabContent('splashFactory: InkRipple\nتبويب $i', Colors.cyan.shade900, Icons.water_drop))),
        ),
      ),
    );
  }
}

// ============================================================
// 20. mouseCursor
// ============================================================
class _MouseCursorPage extends StatelessWidget {
  const _MouseCursorPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('mouseCursor', style: TextStyle(color: Colors.white, fontSize: 13)),
            backgroundColor: Colors.indigo.shade700,
            bottom: const TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.amber,
              // mouseCursor: شكل مؤشر الماوس عند التحويم (للـ Web و Desktop)
              mouseCursor: SystemMouseCursors.click,
              tabs: [Tab(text: 'click cursor'), Tab(text: 'hover'), Tab(text: 'mouseCursor')],
            ),
          ),
          body: TabBarView(children: List.generate(3, (i) => _tabContent('mouseCursor: click\n(Web/Desktop)\nتبويب $i', Colors.indigo.shade700, Icons.mouse))),
        ),
      ),
    );
  }
}

// ============================================================
// 21. enableFeedback
// ============================================================
class _EnableFeedbackPage extends StatelessWidget {
  const _EnableFeedbackPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('enableFeedback', style: TextStyle(color: Colors.white, fontSize: 13)),
            backgroundColor: Colors.orange.shade700,
            bottom: const TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              // enableFeedback: true (افتراضي) → صوت/اهتزاز عند الضغط
              // enableFeedback: false → بدون ردود فعل صوتية أو اهتزازية
              enableFeedback: true,
              tabs: [Tab(text: 'enableFeedback: true'), Tab(text: 'صوت + اهتزاز')],
            ),
          ),
          body: TabBarView(children: List.generate(2, (i) => _tabContent('enableFeedback: true\nصوت/اهتزاز عند الضغط', Colors.orange.shade700, Icons.vibration))),
        ),
      ),
    );
  }
}

// ============================================================
// 22. onTap callback
// ============================================================
class _OnTapPage extends StatefulWidget {
  const _OnTapPage();

  @override
  State<_OnTapPage> createState() => _OnTapPageState();
}

class _OnTapPageState extends State<_OnTapPage> {
  int _lastTapped = -1;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('onTap callback', style: TextStyle(color: Colors.white, fontSize: 13)),
            backgroundColor: Colors.red.shade700,
            bottom: TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              // onTap: دالة تُستدعى عند الضغط على تبويب
              // تأخذ index التبويب الذي تم الضغط عليه
              onTap: (index) {
                setState(() => _lastTapped = index);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('onTap: ضغطت على التبويب رقم $index'), duration: const Duration(seconds: 1)),
                );
              },
              tabs: const [Tab(text: 'Tab 0'), Tab(text: 'Tab 1'), Tab(text: 'Tab 2')],
            ),
          ),
          body: TabBarView(children: List.generate(3, (i) => Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(Icons.touch_app, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('onTap: تبويب $i', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('آخر tab ضُغط: $_lastTapped', style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
          ])))),
        ),
      ),
    );
  }
}

// ============================================================
// 23. TabBarView physics
// ============================================================
class _PhysicsPage extends StatelessWidget {
  const _PhysicsPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('TabBarView physics', style: TextStyle(color: Colors.white, fontSize: 13)),
            backgroundColor: Colors.green.shade800,
            bottom: const TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.amber,
              tabs: [Tab(text: 'Bouncing'), Tab(text: 'Clamping'), Tab(text: 'Never')],
            ),
          ),
          body: TabBarView(
            // physics: سلوك التمرير داخل TabBarView
            // NeverScrollableScrollPhysics → لا سحب يدوي بين التبويبات
            // BouncingScrollPhysics → ارتداد عند النهاية
            physics: const BouncingScrollPhysics(),
            children: List.generate(3, (i) => _tabContent('physics: BouncingScrollPhysics\nتبويب $i', Colors.green.shade800, Icons.swap_horiz)),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// 24. dragStartBehavior
// ============================================================
class _DragBehaviorPage extends StatelessWidget {
  const _DragBehaviorPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('dragStartBehavior', style: TextStyle(color: Colors.white, fontSize: 13)),
            backgroundColor: Colors.pink.shade700,
            bottom: const TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              tabs: [Tab(text: 'down'), Tab(text: 'start'), Tab(text: 'drag')],
            ),
          ),
          body: TabBarView(
            // dragStartBehavior: متى يبدأ تتبع السحب
            // DragStartBehavior.down → عند لمس الشاشة (أسرع)
            // DragStartBehavior.start → عند بدء الحركة (أكثر دقة)
            dragStartBehavior: DragStartBehavior.start,
            children: List.generate(3, (i) => _tabContent('dragStartBehavior: start\nتبويب $i', Colors.pink.shade700, Icons.drag_indicator)),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// 25. viewportFraction
// ============================================================
class _ViewportFractionPage extends StatelessWidget {
  const _ViewportFractionPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('viewportFraction', style: TextStyle(color: Colors.white, fontSize: 13)),
            backgroundColor: Colors.blue.shade800,
            bottom: const TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.amber,
              isScrollable: true,
              tabs: [Tab(text: 'tab 0'), Tab(text: 'tab 1'), Tab(text: 'tab 2'), Tab(text: 'tab 3')],
            ),
          ),
          body: TabBarView(
            // viewportFraction: نسبة عرض كل صفحة من عرض الشاشة
            // الافتراضي: 1.0 (ملء الشاشة)
            // 0.8 → تظهر حواف الصفحات المجاورة
            viewportFraction: 0.85,
            children: List.generate(4, (i) {
              final colors = [Colors.blue, Colors.green, Colors.orange, Colors.purple];
              return Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: colors[i].withOpacity(0.1), border: Border.all(color: colors[i]), borderRadius: BorderRadius.circular(16)),
                child: _tabContent('viewportFraction: 0.85\nتبويب $i', colors[i], Icons.crop),
              );
            }),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// 26. TabBar داخل body
// ============================================================
class _TabBarInBodyPage extends StatelessWidget {
  const _TabBarInBodyPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('TabBar داخل body', style: TextStyle(color: Colors.white, fontSize: 13)),
            backgroundColor: Colors.teal.shade800,
          ),
          body: Column(
            children: [
              // TabBar داخل body وليس في AppBar
              Container(
                color: Colors.teal.shade800,
                child: const TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white60,
                  indicatorColor: Colors.amber,
                  tabs: [Tab(text: 'الأول'), Tab(text: 'الثاني'), Tab(text: 'الثالث')],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: List.generate(3, (i) => _tabContent('TabBar في body\nتبويب $i', Colors.teal.shade800, Icons.view_agenda)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// 27. KeepAlive
// ============================================================
class _KeepAlivePage extends StatelessWidget {
  const _KeepAlivePage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('AutomaticKeepAlive', style: TextStyle(color: Colors.white, fontSize: 11)),
            backgroundColor: Colors.purple.shade800,
            bottom: const TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.amber,
              tabs: [Tab(text: 'محفوظ ✅'), Tab(text: 'محفوظ ✅'), Tab(text: 'محفوظ ✅')],
            ),
          ),
          body: TabBarView(
            children: List.generate(3, (i) => _KeepAliveTab(index: i)),
          ),
        ),
      ),
    );
  }
}

class _KeepAliveTab extends StatefulWidget {
  final int index;
  const _KeepAliveTab({required this.index});

  @override
  State<_KeepAliveTab> createState() => _KeepAliveTabState();
}

class _KeepAliveTabState extends State<_KeepAliveTab>
// AutomaticKeepAliveClientMixin: يحفظ حالة الصفحة عند التبديل بين التبويبات
    with AutomaticKeepAliveClientMixin {

  int _counter = 0;

  // wantKeepAlive: true → يحفظ الحالة
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // مطلوب استدعاء super.build عند استخدام AutomaticKeepAliveClientMixin
    super.build(context);
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.save, size: 48, color: Colors.purple.shade800),
        const SizedBox(height: 16),
        Text('تبويب ${widget.index}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text('العداد: $_counter', style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 8),
        const Text('الحالة محفوظة عند التبديل\n(wantKeepAlive: true)', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: () => setState(() => _counter++),
          icon: const Icon(Icons.add),
          label: const Text('زيادة العداد'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.purple.shade800, foregroundColor: Colors.white),
        ),
      ]),
    );
  }
}

// ============================================================
// 28. TabController addListener
// ============================================================
class _ListenerPage extends StatefulWidget {
  const _ListenerPage();

  @override
  State<_ListenerPage> createState() => _ListenerPageState();
}

class _ListenerPageState extends State<_ListenerPage> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _currentIndex = 0;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
    // addListener: مراقبة تغيير التبويب
    _controller.addListener(() {
      setState(() {
        _currentIndex = _controller.index;
        _isAnimating = _controller.indexIsChanging;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabController.addListener', style: TextStyle(color: Colors.white, fontSize: 11)),
          backgroundColor: Colors.orange.shade800,
          bottom: TabBar(
            controller: _controller,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: const [Tab(text: 'tab 0'), Tab(text: 'tab 1'), Tab(text: 'tab 2'), Tab(text: 'tab 3')],
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              color: Colors.orange.shade50,
              child: Column(children: [
                Text('التبويب الحالي: $_currentIndex', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('جاري التحريك: $_isAnimating', style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
                Text('controller.index: ${_controller.index}', style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                Text('controller.previousIndex: ${_controller.previousIndex}', style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
              ]),
            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: List.generate(4, (i) => _tabContent('Tab $i\nمراقب عبر addListener', Colors.orange.shade800, Icons.sensors)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 29. animateTo
// ============================================================
class _AnimateToPage extends StatefulWidget {
  const _AnimateToPage();

  @override
  State<_AnimateToPage> createState() => _AnimateToPageState();
}

class _AnimateToPageState extends State<_AnimateToPage> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('animateTo برمجياً', style: TextStyle(color: Colors.white, fontSize: 13)),
          backgroundColor: Colors.cyan.shade800,
          bottom: TabBar(
            controller: _controller,
            isScrollable: true,
            labelColor: Colors.white,
            indicatorColor: Colors.amber,
            tabs: List.generate(5, (i) => Tab(text: 'Tab $i')),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(children: [
                const Text('انتقل برمجياً إلى أي تبويب:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(5, (i) => ElevatedButton(
                    onPressed: () => _controller.animateTo(i, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan.shade800, foregroundColor: Colors.white, minimumSize: const Size(48, 36), padding: EdgeInsets.zero),
                    child: Text('$i', style: const TextStyle(fontSize: 13)),
                  )),
                ),
                const SizedBox(height: 4),
                const Text('animateTo(index, duration, curve)', style: TextStyle(fontSize: 11, color: Colors.grey)),
              ]),
            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: List.generate(5, (i) => _tabContent('Tab $i\nانتقال برمجي\nعبر animateTo()', Colors.cyan.shade800, Icons.animation)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 30. Tab مع Badge
// ============================================================
class _BadgeTabPage extends StatelessWidget {
  const _BadgeTabPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tab مع Badge', style: TextStyle(color: Colors.white, fontSize: 13)),
            backgroundColor: Colors.red.shade800,
            bottom: TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              tabs: [
                const Tab(text: 'الكل'),
                Tab(
                  child: Stack(clipBehavior: Clip.none, children: [
                    const Text('الرسائل'),
                    Positioned(top: -6, left: -10, child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
                      child: const Text('5', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.black)),
                    )),
                  ]),
                ),
                Tab(
                  child: Stack(clipBehavior: Clip.none, children: [
                    const Icon(Icons.notifications),
                    Positioned(top: -4, left: -4, child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                      decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(8)),
                      child: const Text('12', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.black)),
                    )),
                  ]),
                ),
                const Tab(icon: Icon(Icons.person)),
              ],
            ),
          ),
          body: TabBarView(children: [
            _tabContent('الكل', Colors.red.shade800, Icons.all_inbox),
            _tabContent('الرسائل (5)', Colors.red.shade800, Icons.message),
            _tabContent('الإشعارات (12)', Colors.red.shade800, Icons.notifications),
            _tabContent('الملف الشخصي', Colors.red.shade800, Icons.person),
          ]),
        ),
      ),
    );
  }
}

// ============================================================
// 31. TabBar.secondary
// ============================================================
class _SecondaryTabPage extends StatelessWidget {
  const _SecondaryTabPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('TabBar.secondary (M3)', style: TextStyle(color: Colors.white, fontSize: 13)),
            backgroundColor: Colors.deepPurple.shade700,
          ),
          body: Column(
            children: [
              Container(
                color: Colors.deepPurple.shade50,
                // TabBar.secondary: نمط Material 3 للتبويبات الثانوية
                // يُستخدم داخل body وليس في AppBar
                child: const TabBar.secondary(
                  tabs: [Tab(text: 'قائمة'), Tab(text: 'شبكة'), Tab(text: 'خريطة')],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: List.generate(3, (i) {
                    final icons = [Icons.list, Icons.grid_view, Icons.map];
                    final labels = ['قائمة', 'شبكة', 'خريطة'];
                    return _tabContent('TabBar.secondary\n${labels[i]}', Colors.deepPurple.shade700, icons[i]);
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// 32. تصميم TabBar احترافي كامل
// ============================================================
class _ProTabBarPage extends StatefulWidget {
  const _ProTabBarPage();

  @override
  State<_ProTabBarPage> createState() => _ProTabBarPageState();
}

class _ProTabBarPageState extends State<_ProTabBarPage> with SingleTickerProviderStateMixin {
  late TabController _controller;
  final List<Map<String, dynamic>> _tabs = [
    {'label': 'الكل', 'icon': Icons.grid_view, 'count': 124},
    {'label': 'مميز', 'icon': Icons.star, 'count': 18},
    {'label': 'جديد', 'icon': Icons.fiber_new, 'count': 7},
    {'label': 'الأكثر', 'icon': Icons.trending_up, 'count': 33},
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
    _controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1565C0),
          foregroundColor: Colors.white,
          title: const Text('متجر إلكتروني', style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {}), IconButton(icon: const Icon(Icons.shopping_cart_outlined), onPressed: () {})],
        ),
        body: Column(
          children: [
            // ── TabBar مخصص
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: TabBar(
                controller: _controller,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicator: BoxDecoration(color: const Color(0xFF1565C0), borderRadius: BorderRadius.circular(24)),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                tabs: _tabs.asMap().entries.map((entry) {
                  final i = entry.key;
                  final tab = entry.value;
                  final isSelected = _controller.index == i;
                  return Tab(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        Icon(tab['icon'] as IconData, size: 16, color: isSelected ? Colors.white : const Color(0xFF1565C0)),
                        const SizedBox(width: 6),
                        Text(tab['label'] as String, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: isSelected ? Colors.white : const Color(0xFF1565C0))),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.white24 : const Color(0xFF1565C0).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text('${tab['count']}', style: TextStyle(fontSize: 10, color: isSelected ? Colors.white : const Color(0xFF1565C0), fontWeight: FontWeight.bold)),
                        ),
                      ]),
                    ),
                  );
                }).toList(),
              ),
            ),

            // ── TabBarView
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: _tabs.map((tab) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.78),
                    itemCount: tab['count'] as int,
                    itemBuilder: (_, i) => Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Column(children: [
                        Expanded(child: Container(
                          decoration: BoxDecoration(color: const Color(0xFF1565C0).withOpacity(0.08), borderRadius: const BorderRadius.vertical(top: Radius.circular(12))),
                          child: Center(child: Icon(tab['icon'] as IconData, size: 36, color: const Color(0xFF1565C0))),
                        )),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text('${tab['label']} $i', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 2),
                            Text('${(i + 1) * 49} درهم', style: const TextStyle(fontSize: 12, color: Color(0xFF1565C0), fontWeight: FontWeight.w600)),
                          ]),
                        ),
                      ]),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}