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
      home: const BottomNavScreen(),
    );
  }
}

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('جميع مفاهيم BottomNavigationBar', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 32),
        children: [
          _sectionTitle('1️⃣  BottomNavigationBar الأساسي'),
          _launchBtn(context, 'الأساسي - fixed + 3 عناصر', Colors.blue, const _BasicPage()),

          _sectionTitle('2️⃣  currentIndex و onTap'),
          _launchBtn(context, 'currentIndex + onTap', Colors.green, const _CurrentIndexPage()),

          _sectionTitle('3️⃣  BottomNavigationBarType.fixed'),
          _launchBtn(context, 'type: fixed (ألوان + نصوص ثابتة)', Colors.teal, const _FixedTypePage()),

          _sectionTitle('4️⃣  BottomNavigationBarType.shifting'),
          _launchBtn(context, 'type: shifting (متحرك ملون)', Colors.purple, const _ShiftingTypePage()),

          _sectionTitle('5️⃣  backgroundColor'),
          _launchBtn(context, 'backgroundColor مخصص', Colors.indigo, const _BackgroundColorPage()),

          _sectionTitle('6️⃣  selectedItemColor و unselectedItemColor'),
          _launchBtn(context, 'selectedItemColor + unselectedItemColor', Colors.orange, const _ItemColorPage()),

          _sectionTitle('7️⃣  selectedIconTheme و unselectedIconTheme'),
          _launchBtn(context, 'selectedIconTheme + unselectedIconTheme', Colors.red, const _IconThemePage()),

          _sectionTitle('8️⃣  selectedLabelStyle و unselectedLabelStyle'),
          _launchBtn(context, 'selectedLabelStyle + unselectedLabelStyle', Colors.brown, const _LabelStylePage()),

          _sectionTitle('9️⃣  showSelectedLabels و showUnselectedLabels'),
          _launchBtn(context, 'إخفاء/إظهار النصوص', Colors.cyan.shade700, const _ShowLabelsPage()),

          _sectionTitle('🔟  selectedFontSize و unselectedFontSize'),
          _launchBtn(context, 'selectedFontSize + unselectedFontSize', Colors.pink, const _FontSizePage()),

          _sectionTitle('1️⃣1️⃣  iconSize (حجم الأيقونة)'),
          _launchBtn(context, 'iconSize مخصص', Colors.amber.shade700, const _IconSizePage()),

          _sectionTitle('1️⃣2️⃣  elevation (الظل)'),
          _launchBtn(context, 'elevation مخصص', Colors.blueGrey, const _ElevationPage()),

          _sectionTitle('1️⃣3️⃣  BottomNavigationBarItem: icon'),
          _launchBtn(context, 'icon + activeIcon + label', Colors.deepPurple, const _ItemPropsPage()),

          _sectionTitle('1️⃣4️⃣  BottomNavigationBarItem: activeIcon'),
          _launchBtn(context, 'activeIcon مختلف عن icon', Colors.deepOrange, const _ActiveIconPage()),

          _sectionTitle('1️⃣5️⃣  BottomNavigationBarItem: backgroundColor'),
          _launchBtn(context, 'backgroundColor لكل عنصر (shifting)', Colors.green.shade700, const _ItemBgColorPage()),

          _sectionTitle('1️⃣6️⃣  BottomNavigationBarItem: tooltip'),
          _launchBtn(context, 'tooltip على كل عنصر', Colors.purple.shade700, const _TooltipPage()),

          _sectionTitle('1️⃣7️⃣  BottomNavigationBarItem: label فارغ'),
          _launchBtn(context, 'label فارغ (أيقونات فقط)', Colors.teal.shade700, const _EmptyLabelPage()),

          _sectionTitle('1️⃣8️⃣  mouseCursor'),
          _launchBtn(context, 'mouseCursor (Web/Desktop)', Colors.indigo.shade700, const _MouseCursorPage()),

          _sectionTitle('1️⃣9️⃣  enableFeedback'),
          _launchBtn(context, 'enableFeedback (صوت/اهتزاز)', Colors.orange.shade700, const _EnableFeedbackPage()),

          _sectionTitle('2️⃣0️⃣  landscapeLayout'),
          _launchBtn(context, 'landscapeLayout (وضع أفقي)', Colors.red.shade700, const _LandscapeLayoutPage()),

          _sectionTitle('2️⃣1️⃣  BottomNavigationBar مع Badge'),
          _launchBtn(context, 'Badge على العناصر', Colors.pink.shade700, const _BadgePage()),

          _sectionTitle('2️⃣2️⃣  BottomNavigationBar مع PageView'),
          _launchBtn(context, 'مع PageView (تمرير بين الصفحات)', Colors.blue.shade700, const _PageViewPage()),

          _sectionTitle('2️⃣3️⃣  BottomNavigationBar مع IndexedStack'),
          _launchBtn(context, 'مع IndexedStack (حفظ الحالة)', Colors.green.shade800, const _IndexedStackPage()),

          _sectionTitle('2️⃣4️⃣  NavigationBar (Material 3)'),
          _launchBtn(context, 'NavigationBar - Material 3', Colors.deepPurple.shade700, const _NavigationBarPage()),

          _sectionTitle('2️⃣5️⃣  NavigationBar: indicatorColor'),
          _launchBtn(context, 'NavigationBar indicatorColor', Colors.cyan.shade800, const _NavBarIndicatorPage()),

          _sectionTitle('2️⃣6️⃣  NavigationBar: labelBehavior'),
          _launchBtn(context, 'NavigationLabelBehavior', Colors.orange.shade800, const _LabelBehaviorPage()),

          _sectionTitle('2️⃣7️⃣  NavigationBar: elevation و shadowColor'),
          _launchBtn(context, 'NavigationBar elevation + shadow', Colors.brown.shade700, const _NavElevationPage()),

          _sectionTitle('2️⃣8️⃣  NavigationBar: overlayColor'),
          _launchBtn(context, 'NavigationBar overlayColor', Colors.purple.shade800, const _NavOverlayPage()),

          _sectionTitle('2️⃣9️⃣  BottomNavigationBar مع FloatingActionButton'),
          _launchBtn(context, 'مع FAB في المنتصف', Colors.red.shade800, const _FabPage()),

          _sectionTitle('3️⃣0️⃣  تصميم BottomNavigationBar احترافي كامل'),
          _launchBtn(context, 'تصميم احترافي كامل', Colors.deepOrange.shade700, const _ProPage()),
        ],
      ),
    );
  }

  Widget _sectionTitle(String t) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    margin: const EdgeInsets.only(top: 16, bottom: 4),
    color: Colors.blue.shade100,
    child: Text(t, textDirection: TextDirection.rtl,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue)),
  );

  Widget _launchBtn(BuildContext ctx, String label, Color color, Widget page) =>
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: ElevatedButton.icon(
          onPressed: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => page)),
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

// ============================================================
// مكوّنات مشتركة
// ============================================================
Widget _pageBody(String label, Color color, IconData icon) => Center(
  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    Icon(icon, size: 72, color: color),
    const SizedBox(height: 16),
    Text(label, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
  ]),
);

AppBar _appBar(String t, Color c) => AppBar(
  title: Text(t, style: const TextStyle(color: Colors.white, fontSize: 13)),
  backgroundColor: c,
  centerTitle: true,
);

// ============================================================
// 1. BottomNavigationBar الأساسي
// ============================================================
class _BasicPage extends StatefulWidget {
  const _BasicPage();

  @override
  State<_BasicPage> createState() => _BasicPageState();
}

class _BasicPageState extends State<_BasicPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('BottomNavigationBar الأساسي', Colors.blue),
        body: [
          _pageBody('الرئيسية', Colors.blue, Icons.home),
          _pageBody('البحث', Colors.blue, Icons.search),
          _pageBody('حسابي', Colors.blue, Icons.person),
        ][_index],
        bottomNavigationBar: BottomNavigationBar(
          // currentIndex: التبويب الحالي
          currentIndex: _index,
          // onTap: عند الضغط على عنصر
          onTap: (i) => setState(() => _index = i),
          // items: قائمة BottomNavigationBarItem - يجب 2 على الأقل
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'بحث'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 2. currentIndex و onTap
// ============================================================
class _CurrentIndexPage extends StatefulWidget {
  const _CurrentIndexPage();

  @override
  State<_CurrentIndexPage> createState() => _CurrentIndexPageState();
}

class _CurrentIndexPageState extends State<_CurrentIndexPage> {
  int _index = 0;
  int _tapCount = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('currentIndex + onTap', Colors.green),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.touch_app, size: 64, color: Colors.green),
          const SizedBox(height: 16),
          Text('currentIndex: $_index', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('إجمالي النقرات: $_tapCount', style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
          const SizedBox(height: 8),
          const Text('onTap يُعطيك index العنصر المضغوط', style: TextStyle(fontSize: 13, color: Colors.grey)),
        ])),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.blueGrey,
          // onTap: (index) → يُستدعى بالـ index الذي ضُغط عليه
          onTap: (i) => setState(() {
            _index = i;
            _tapCount++;
          }),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'بحث'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'المفضلة'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 3. type: fixed
// ============================================================
class _FixedTypePage extends StatefulWidget {
  const _FixedTypePage();

  @override
  State<_FixedTypePage> createState() => _FixedTypePageState();
}

class _FixedTypePageState extends State<_FixedTypePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('type: fixed', Colors.teal),
        body: _pageBody('type: fixed\nالأيقونات والنصوص ثابتة دائماً', Colors.teal, Icons.view_week),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          // type: fixed → الأيقونات والنصوص تبقى ظاهرة دائماً
          // هو الافتراضي عند وجود أقل من 4 عناصر
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'بحث'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'إشعارات'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 4. type: shifting
// ============================================================
class _ShiftingTypePage extends StatefulWidget {
  const _ShiftingTypePage();

  @override
  State<_ShiftingTypePage> createState() => _ShiftingTypePageState();
}

class _ShiftingTypePageState extends State<_ShiftingTypePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('type: shifting', Colors.purple),
        body: _pageBody('type: shifting\nالنص يظهر فقط للعنصر المحدد\nولون الـ bar يتغير', Colors.purple, Icons.animation),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          // type: shifting → النص يظهر فقط للعنصر المحدد
          // ولون الخلفية يتغير حسب backgroundColor لكل عنصر
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'الرئيسية',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'بحث',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'المفضلة',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'حسابي',
              backgroundColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 5. backgroundColor
// ============================================================
class _BackgroundColorPage extends StatefulWidget {
  const _BackgroundColorPage();

  @override
  State<_BackgroundColorPage> createState() => _BackgroundColorPageState();
}

class _BackgroundColorPageState extends State<_BackgroundColorPage> {
  int _index = 0;
  final List<Color> _colors = [Colors.indigo, Colors.deepPurple, Colors.blueGrey, Colors.black87];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('backgroundColor', Colors.indigo),
        body: _pageBody('backgroundColor مخصص\nلون الـ bar: ${_colors[_index]}', Colors.indigo, Icons.color_lens),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          // backgroundColor: لون خلفية الـ BottomNavigationBar
          backgroundColor: _colors[_index],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white54,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'بحث'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'المفضلة'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 6. selectedItemColor و unselectedItemColor
// ============================================================
class _ItemColorPage extends StatefulWidget {
  const _ItemColorPage();

  @override
  State<_ItemColorPage> createState() => _ItemColorPageState();
}

class _ItemColorPageState extends State<_ItemColorPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('selectedItemColor + unselectedItemColor', Colors.orange),
        body: _pageBody('ألوان العناصر المحددة وغير المحددة', Colors.orange, Icons.palette),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          type: BottomNavigationBarType.fixed,
          // selectedItemColor: لون الأيقونة والنص للعنصر المحدد
          selectedItemColor: Colors.orange,
          // unselectedItemColor: لون الأيقونة والنص لباقي العناصر
          unselectedItemColor: Colors.grey.shade400,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'بحث'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'إشعارات'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 7. selectedIconTheme و unselectedIconTheme
// ============================================================
class _IconThemePage extends StatefulWidget {
  const _IconThemePage();

  @override
  State<_IconThemePage> createState() => _IconThemePageState();
}

class _IconThemePageState extends State<_IconThemePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('selectedIconTheme + unselectedIconTheme', Colors.red),
        body: _pageBody('تنسيق الأيقونات بشكل مستقل', Colors.red, Icons.format_paint),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          // selectedIconTheme: حجم ولون أيقونة العنصر المحدد
          selectedIconTheme: const IconThemeData(size: 32, color: Colors.red),
          // unselectedIconTheme: حجم ولون أيقونات العناصر غير المحددة
          unselectedIconTheme: const IconThemeData(size: 22, color: Colors.grey),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'بحث'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'المفضلة'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 8. selectedLabelStyle و unselectedLabelStyle
// ============================================================
class _LabelStylePage extends StatefulWidget {
  const _LabelStylePage();

  @override
  State<_LabelStylePage> createState() => _LabelStylePageState();
}

class _LabelStylePageState extends State<_LabelStylePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('selectedLabelStyle + unselectedLabelStyle', Colors.brown),
        body: _pageBody('تنسيق نصوص العناصر', Colors.brown, Icons.text_format),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.brown,
          unselectedItemColor: Colors.grey,
          // selectedLabelStyle: تنسيق نص العنصر المحدد
          selectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1),
          // unselectedLabelStyle: تنسيق نصوص العناصر غير المحددة
          unselectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'بحث'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'المفضلة'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 9. showSelectedLabels و showUnselectedLabels
// ============================================================
class _ShowLabelsPage extends StatefulWidget {
  const _ShowLabelsPage();

  @override
  State<_ShowLabelsPage> createState() => _ShowLabelsPageState();
}

class _ShowLabelsPageState extends State<_ShowLabelsPage> {
  int _index = 0;
  bool _showSelected = true;
  bool _showUnselected = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('showSelectedLabels + showUnselectedLabels', Colors.cyan.shade700),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.label, size: 48, color: Colors.cyan),
          const SizedBox(height: 16),
          SwitchListTile(
            title: const Text('showSelectedLabels'),
            value: _showSelected,
            onChanged: (v) => setState(() => _showSelected = v),
            activeColor: Colors.cyan,
          ),
          SwitchListTile(
            title: const Text('showUnselectedLabels'),
            value: _showUnselected,
            onChanged: (v) => setState(() => _showUnselected = v),
            activeColor: Colors.cyan,
          ),
        ])),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.cyan.shade700,
          unselectedItemColor: Colors.grey,
          // showSelectedLabels: إظهار/إخفاء نص العنصر المحدد
          showSelectedLabels: _showSelected,
          // showUnselectedLabels: إظهار/إخفاء نصوص العناصر غير المحددة
          showUnselectedLabels: _showUnselected,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'بحث'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'المفضلة'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 10. selectedFontSize و unselectedFontSize
// ============================================================
class _FontSizePage extends StatefulWidget {
  const _FontSizePage();

  @override
  State<_FontSizePage> createState() => _FontSizePageState();
}

class _FontSizePageState extends State<_FontSizePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('selectedFontSize + unselectedFontSize', Colors.pink),
        body: _pageBody('حجم خط النص المحدد وغير المحدد', Colors.pink, Icons.format_size),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.grey,
          // selectedFontSize: حجم خط العنصر المحدد (الافتراضي: 14)
          selectedFontSize: 16,
          // unselectedFontSize: حجم خط العناصر غير المحددة (الافتراضي: 12)
          unselectedFontSize: 10,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'بحث'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'المفضلة'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 11. iconSize
// ============================================================
class _IconSizePage extends StatefulWidget {
  const _IconSizePage();

  @override
  State<_IconSizePage> createState() => _IconSizePageState();
}

class _IconSizePageState extends State<_IconSizePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('iconSize', Colors.amber.shade700),
        body: _pageBody('iconSize: يغير حجم كل الأيقونات', Colors.amber.shade700, Icons.format_size),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.amber.shade700,
          unselectedItemColor: Colors.grey,
          // iconSize: حجم الأيقونات (الافتراضي: 24)
          // يؤثر على جميع الأيقونات - selected و unselected معاً
          iconSize: 32,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'بحث'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'المفضلة'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 12. elevation
// ============================================================
class _ElevationPage extends StatefulWidget {
  const _ElevationPage();

  @override
  State<_ElevationPage> createState() => _ElevationPageState();
}

class _ElevationPageState extends State<_ElevationPage> {
  int _index = 0;
  double _elevation = 8;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('elevation', Colors.blueGrey),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.layers, size: 48, color: Colors.blueGrey),
          const SizedBox(height: 16),
          Text('elevation: ${_elevation.toInt()}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Slider(value: _elevation, min: 0, max: 30, divisions: 30,
              label: _elevation.toInt().toString(),
              onChanged: (v) => setState(() => _elevation = v),
              activeColor: Colors.blueGrey),
        ])),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blueGrey,
          // elevation: ارتفاع الظل فوق المحتوى (الافتراضي: 8)
          elevation: _elevation,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'بحث'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 13. BottomNavigationBarItem: خصائص كاملة
// ============================================================
class _ItemPropsPage extends StatefulWidget {
  const _ItemPropsPage();

  @override
  State<_ItemPropsPage> createState() => _ItemPropsPageState();
}

class _ItemPropsPageState extends State<_ItemPropsPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('BottomNavigationBarItem خصائص', Colors.deepPurple),
        body: _pageBody('خصائص BottomNavigationBarItem', Colors.deepPurple, Icons.widgets),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              // icon: الأيقونة الافتراضية
              icon: Icon(Icons.home_outlined),
              // label: النص أسفل الأيقونة
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'بحث',
              // tooltip: نص يظهر عند الضغط المطول
              tooltip: 'ابحث عن أي شيء',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined),
              label: 'إشعارات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'حسابي',
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 14. activeIcon
// ============================================================
class _ActiveIconPage extends StatefulWidget {
  const _ActiveIconPage();

  @override
  State<_ActiveIconPage> createState() => _ActiveIconPageState();
}

class _ActiveIconPageState extends State<_ActiveIconPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('activeIcon مختلف', Colors.deepOrange),
        body: _pageBody('activeIcon يظهر عند التحديد\nicon يظهر في الحالة العادية', Colors.deepOrange, Icons.swap_horiz),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              // icon: يظهر عندما العنصر غير محدد
              icon: Icon(Icons.home_outlined),
              // activeIcon: يظهر عندما العنصر محدد
              activeIcon: Icon(Icons.home),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
              label: 'بحث',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              activeIcon: Icon(Icons.favorite),
              label: 'المفضلة',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'حسابي',
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 15. BottomNavigationBarItem: backgroundColor (shifting)
// ============================================================
class _ItemBgColorPage extends StatefulWidget {
  const _ItemBgColorPage();

  @override
  State<_ItemBgColorPage> createState() => _ItemBgColorPageState();
}

class _ItemBgColorPageState extends State<_ItemBgColorPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('backgroundColor لكل عنصر (shifting)', Colors.green.shade700),
        body: _pageBody('لون الـ Bar يتغير حسب العنصر المحدد\n(type: shifting فقط)', Colors.green.shade700, Icons.color_lens),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          // يجب استخدام type: shifting لكي يعمل backgroundColor لكل عنصر
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'الرئيسية',
              // backgroundColor: لون الخلفية عند تحديد هذا العنصر
              backgroundColor: Colors.blue.shade700,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.search),
              label: 'بحث',
              backgroundColor: Colors.green.shade700,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite),
              label: 'المفضلة',
              backgroundColor: Colors.red.shade700,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: 'حسابي',
              backgroundColor: Colors.purple.shade700,
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 16. tooltip
// ============================================================
class _TooltipPage extends StatefulWidget {
  const _TooltipPage();

  @override
  State<_TooltipPage> createState() => _TooltipPageState();
}

class _TooltipPageState extends State<_TooltipPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('tooltip على كل عنصر', Colors.purple.shade700),
        body: _pageBody('اضغط مطولاً على أي عنصر\nلرؤية الـ tooltip', Colors.purple.shade700, Icons.info_outline),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'الرئيسية',
              // tooltip: نص يظهر عند الضغط المطول (long press)
              tooltip: 'الذهاب للصفحة الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'بحث',
              tooltip: 'البحث في التطبيق',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'إشعارات',
              tooltip: 'عرض الإشعارات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'حسابي',
              tooltip: 'إدارة الملف الشخصي',
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 17. label فارغ (أيقونات فقط)
// ============================================================
class _EmptyLabelPage extends StatefulWidget {
  const _EmptyLabelPage();

  @override
  State<_EmptyLabelPage> createState() => _EmptyLabelPageState();
}

class _EmptyLabelPageState extends State<_EmptyLabelPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('label فارغ = أيقونات فقط', Colors.teal.shade700),
        body: _pageBody('label: "" → أيقونات بدون نص\nمع showUnselectedLabels: false', Colors.teal.shade700, Icons.hide_source),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey,
          // إخفاء النصوص
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            // label: '' → بدون نص
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 18. mouseCursor
// ============================================================
class _MouseCursorPage extends StatefulWidget {
  const _MouseCursorPage();

  @override
  State<_MouseCursorPage> createState() => _MouseCursorPageState();
}

class _MouseCursorPageState extends State<_MouseCursorPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('mouseCursor', Colors.indigo.shade700),
        body: _pageBody('mouseCursor: شكل المؤشر عند التحويم\n(للـ Web و Desktop فقط)', Colors.indigo.shade700, Icons.mouse),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.indigo,
          unselectedItemColor: Colors.grey,
          // mouseCursor: شكل مؤشر الماوس عند التحويم (Web/Desktop)
          mouseCursor: SystemMouseCursors.click,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'بحث'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 19. enableFeedback
// ============================================================
class _EnableFeedbackPage extends StatefulWidget {
  const _EnableFeedbackPage();

  @override
  State<_EnableFeedbackPage> createState() => _EnableFeedbackPageState();
}

class _EnableFeedbackPageState extends State<_EnableFeedbackPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('enableFeedback', Colors.orange.shade700),
        body: _pageBody('enableFeedback: true\nصوت/اهتزاز عند الضغط', Colors.orange.shade700, Icons.vibration),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          // enableFeedback: true (افتراضي) → صوت/اهتزاز عند الضغط
          // enableFeedback: false → بدون ردود فعل
          enableFeedback: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'بحث'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 20. landscapeLayout
// ============================================================
class _LandscapeLayoutPage extends StatefulWidget {
  const _LandscapeLayoutPage();

  @override
  State<_LandscapeLayoutPage> createState() => _LandscapeLayoutPageState();
}

class _LandscapeLayoutPageState extends State<_LandscapeLayoutPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('landscapeLayout', Colors.red.shade700),
        body: _pageBody('اقلب الجهاز أفقياً\nلرؤية تأثير landscapeLayout', Colors.red.shade700, Icons.screen_rotation),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          // landscapeLayout: ترتيب العناصر في الوضع الأفقي
          // BottomNavigationBarLandscapeLayout.spread → يوزع العناصر أفقياً
          // BottomNavigationBarLandscapeLayout.centered → يمركزهم
          // BottomNavigationBarLandscapeLayout.linear → أيقونة + نص جنباً لجنب
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'بحث'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'المفضلة'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 21. Badge
// ============================================================
class _BadgePage extends StatefulWidget {
  const _BadgePage();

  @override
  State<_BadgePage> createState() => _BadgePage2State();
}

class _BadgePage2State extends State<_BadgePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('BottomNavigationBar مع Badge', Colors.pink.shade700),
        body: _pageBody('Badge على عناصر الـ BottomNavigationBar', Colors.pink.shade700, Icons.notification_important),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.grey,
          items: [
            const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            // Badge باستخدام Stack
            BottomNavigationBarItem(
              icon: Stack(clipBehavior: Clip.none, children: [
                const Icon(Icons.notifications),
                Positioned(
                  top: -4, left: -4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                    child: const Text('5', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                  ),
                ),
              ]),
              label: 'إشعارات',
            ),
            // Badge باستخدام Badge widget (Flutter 3.7+)
            BottomNavigationBarItem(
              icon: Badge(
                label: const Text('12'),
                backgroundColor: Colors.red,
                child: const Icon(Icons.message),
              ),
              label: 'رسائل',
            ),
            const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 22. مع PageView
// ============================================================
class _PageViewPage extends StatefulWidget {
  const _PageViewPage();

  @override
  State<_PageViewPage> createState() => _PageViewPageState();
}

class _PageViewPageState extends State<_PageViewPage> {
  int _index = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = [Colors.blue, Colors.green, Colors.orange, Colors.purple];
    final icons = [Icons.home, Icons.search, Icons.favorite, Icons.person];
    final labels = ['الرئيسية', 'بحث', 'المفضلة', 'حسابي'];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('مع PageView', Colors.blue.shade700),
        body: PageView(
          controller: _pageController,
          // مزامنة PageView مع BottomNavigationBar
          onPageChanged: (i) => setState(() => _index = i),
          children: List.generate(4, (i) => _pageBody(labels[i], colors[i], icons[i])),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: colors[_index],
          unselectedItemColor: Colors.grey,
          onTap: (i) {
            setState(() => _index = i);
            // مزامنة BottomNavigationBar مع PageView
            _pageController.animateToPage(i,
                duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
          },
          items: List.generate(4, (i) => BottomNavigationBarItem(icon: Icon(icons[i]), label: labels[i])),
        ),
      ),
    );
  }
}

// ============================================================
// 23. مع IndexedStack (حفظ الحالة)
// ============================================================
class _IndexedStackPage extends StatefulWidget {
  const _IndexedStackPage();

  @override
  State<_IndexedStackPage> createState() => _IndexedStackPageState();
}

class _IndexedStackPageState extends State<_IndexedStackPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('مع IndexedStack (حفظ الحالة)', Colors.green.shade800),
        body: IndexedStack(
          // IndexedStack: يُظهر فقط العنصر المحدد لكن يحافظ على حالة الباقين
          // على عكس if/else الذي يعيد بناء الصفحة كل مرة
          index: _index,
          children: [
            _CounterPage(color: Colors.blue, label: 'الرئيسية'),
            _CounterPage(color: Colors.green, label: 'بحث'),
            _CounterPage(color: Colors.orange, label: 'المفضلة'),
            _CounterPage(color: Colors.purple, label: 'حسابي'),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green.shade800,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'بحث'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'المفضلة'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}

class _CounterPage extends StatefulWidget {
  final Color color;
  final String label;
  const _CounterPage({required this.color, required this.label});

  @override
  State<_CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<_CounterPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(Icons.save, size: 48, color: widget.color),
      const SizedBox(height: 12),
      Text(widget.label, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: widget.color)),
      const SizedBox(height: 8),
      Text('العداد: $_count', style: const TextStyle(fontSize: 18)),
      const SizedBox(height: 8),
      const Text('الحالة محفوظة عند التبديل\n(IndexedStack)', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.grey)),
      const SizedBox(height: 16),
      ElevatedButton.icon(
        onPressed: () => setState(() => _count++),
        icon: const Icon(Icons.add),
        label: const Text('زيادة العداد'),
        style: ElevatedButton.styleFrom(backgroundColor: widget.color, foregroundColor: Colors.white),
      ),
    ]));
  }
}

// ============================================================
// 24. NavigationBar (Material 3)
// ============================================================
class _NavigationBarPage extends StatefulWidget {
  const _NavigationBarPage();

  @override
  State<_NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<_NavigationBarPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final labels = ['الرئيسية', 'بحث', 'المفضلة', 'حسابي'];
    final icons = [Icons.home_outlined, Icons.search_outlined, Icons.favorite_outline, Icons.person_outline];
    final activeIcons = [Icons.home, Icons.search, Icons.favorite, Icons.person];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('NavigationBar - Material 3', Colors.deepPurple.shade700),
        body: _pageBody(labels[_index], Colors.deepPurple, activeIcons[_index]),
        // NavigationBar: مكوّن Material 3 بديل عن BottomNavigationBar
        bottomNavigationBar: NavigationBar(
          // selectedIndex: العنصر المحدد
          selectedIndex: _index,
          // onDestinationSelected: عند الضغط
          onDestinationSelected: (i) => setState(() => _index = i),
          // destinations: قائمة NavigationDestination
          destinations: List.generate(4, (i) => NavigationDestination(
            icon: Icon(icons[i]),
            selectedIcon: Icon(activeIcons[i]),
            label: labels[i],
          )),
        ),
      ),
    );
  }
}

// ============================================================
// 25. NavigationBar: indicatorColor
// ============================================================
class _NavBarIndicatorPage extends StatefulWidget {
  const _NavBarIndicatorPage();

  @override
  State<_NavBarIndicatorPage> createState() => _NavBarIndicatorPageState();
}

class _NavBarIndicatorPageState extends State<_NavBarIndicatorPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('NavigationBar indicatorColor', Colors.cyan.shade800),
        body: _pageBody('indicatorColor: لون المستطيل خلف الأيقونة المحددة', Colors.cyan.shade800, Icons.radio_button_checked),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: (i) => setState(() => _index = i),
          // indicatorColor: لون مؤشر التحديد (المستطيل الدائري)
          indicatorColor: Colors.cyan.shade100,
          // backgroundColor: لون خلفية الـ NavigationBar
          backgroundColor: Colors.cyan.shade900,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined, color: Colors.white70), selectedIcon: Icon(Icons.home, color: Colors.cyan), label: 'الرئيسية'),
            NavigationDestination(icon: Icon(Icons.search_outlined, color: Colors.white70), selectedIcon: Icon(Icons.search, color: Colors.cyan), label: 'بحث'),
            NavigationDestination(icon: Icon(Icons.favorite_outline, color: Colors.white70), selectedIcon: Icon(Icons.favorite, color: Colors.cyan), label: 'المفضلة'),
            NavigationDestination(icon: Icon(Icons.person_outline, color: Colors.white70), selectedIcon: Icon(Icons.person, color: Colors.cyan), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 26. NavigationBar: labelBehavior
// ============================================================
class _LabelBehaviorPage extends StatefulWidget {
  const _LabelBehaviorPage();

  @override
  State<_LabelBehaviorPage> createState() => _LabelBehaviorPageState();
}

class _LabelBehaviorPageState extends State<_LabelBehaviorPage> {
  int _index = 0;
  NavigationDestinationLabelBehavior _behavior = NavigationDestinationLabelBehavior.alwaysShow;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('NavigationLabelBehavior', Colors.orange.shade800),
        body: Column(children: [
          const SizedBox(height: 16),
          ...NavigationDestinationLabelBehavior.values.map((b) => RadioListTile(
            title: Text(b.name, style: const TextStyle(fontSize: 13)),
            value: b, groupValue: _behavior,
            onChanged: (v) => setState(() => _behavior = v!),
            activeColor: Colors.orange,
          )),
        ]),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: (i) => setState(() => _index = i),
          // labelBehavior:
          // alwaysShow → نصوص ظاهرة دائماً (افتراضي)
          // alwaysHide → نصوص مخفية دائماً
          // onlyShowSelected → فقط المحدد يظهر نصه
          labelBehavior: _behavior,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'الرئيسية'),
            NavigationDestination(icon: Icon(Icons.search_outlined), selectedIcon: Icon(Icons.search), label: 'بحث'),
            NavigationDestination(icon: Icon(Icons.favorite_outline), selectedIcon: Icon(Icons.favorite), label: 'المفضلة'),
            NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 27. NavigationBar: elevation و shadowColor
// ============================================================
class _NavElevationPage extends StatefulWidget {
  const _NavElevationPage();

  @override
  State<_NavElevationPage> createState() => _NavElevationPageState();
}

class _NavElevationPageState extends State<_NavElevationPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('NavigationBar elevation + shadow', Colors.brown.shade700),
        body: _pageBody('elevation + shadowColor على NavigationBar', Colors.brown.shade700, Icons.layers),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: (i) => setState(() => _index = i),
          // elevation: ارتفاع الظل
          elevation: 16,
          // shadowColor: لون الظل
          shadowColor: Colors.brown,
          // surfaceTintColor: لون طبقة التلوين
          surfaceTintColor: Colors.brown.shade100,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'الرئيسية'),
            NavigationDestination(icon: Icon(Icons.search_outlined), selectedIcon: Icon(Icons.search), label: 'بحث'),
            NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 28. NavigationBar: overlayColor
// ============================================================
class _NavOverlayPage extends StatefulWidget {
  const _NavOverlayPage();

  @override
  State<_NavOverlayPage> createState() => _NavOverlayPageState();
}

class _NavOverlayPageState extends State<_NavOverlayPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('NavigationBar overlayColor', Colors.purple.shade800),
        body: _pageBody('overlayColor: تأثير اللون عند الضغط', Colors.purple.shade800, Icons.touch_app),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: (i) => setState(() => _index = i),
          // overlayColor: تأثير التحويم والضغط
          overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.pressed)) return Colors.purple.withOpacity(0.3);
            if (states.contains(WidgetState.hovered)) return Colors.purple.withOpacity(0.1);
            return null;
          }),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'الرئيسية'),
            NavigationDestination(icon: Icon(Icons.search_outlined), selectedIcon: Icon(Icons.search), label: 'بحث'),
            NavigationDestination(icon: Icon(Icons.favorite_outline), selectedIcon: Icon(Icons.favorite), label: 'المفضلة'),
            NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 29. مع FloatingActionButton
// ============================================================
class _FabPage extends StatefulWidget {
  const _FabPage();

  @override
  State<_FabPage> createState() => _FabPageState();
}

class _FabPageState extends State<_FabPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final labels = ['الرئيسية', 'بحث', 'حسابي'];
    final icons = [Icons.home, Icons.search, Icons.person];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('مع FAB في المنتصف', Colors.red.shade800),
        body: _pageBody(labels[_index], Colors.red.shade800, icons[_index]),
        // FloatingActionButton في المنتصف
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.red.shade800,
          child: const Icon(Icons.add, color: Colors.white),
        ),
        // floatingActionButtonLocation: مكان الـ FAB
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          // BottomAppBar: يدعم ثقب للـ FAB
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(icon: Icon(Icons.home, color: _index == 0 ? Colors.red : Colors.grey), onPressed: () => setState(() => _index = 0)),
              IconButton(icon: Icon(Icons.search, color: _index == 1 ? Colors.red : Colors.grey), onPressed: () => setState(() => _index = 1)),
              const SizedBox(width: 48), // مكان الـ FAB
              IconButton(icon: Icon(Icons.favorite, color: Colors.grey), onPressed: () {}),
              IconButton(icon: Icon(Icons.person, color: _index == 2 ? Colors.red : Colors.grey), onPressed: () => setState(() => _index = 2)),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// 30. تصميم احترافي كامل
// ============================================================
class _ProPage extends StatefulWidget {
  const _ProPage();

  @override
  State<_ProPage> createState() => _ProPageState();
}

class _ProPageState extends State<_ProPage> {
  int _index = 0;

  final List<Map<String, dynamic>> _tabs = [
    {'label': 'الرئيسية', 'icon': Icons.home_outlined, 'activeIcon': Icons.home, 'color': const Color(0xFF1565C0)},
    {'label': 'استكشاف', 'icon': Icons.explore_outlined, 'activeIcon': Icons.explore, 'color': Colors.green},
    {'label': 'إشعارات', 'icon': Icons.notifications_outlined, 'activeIcon': Icons.notifications, 'color': Colors.orange},
    {'label': 'الرسائل', 'icon': Icons.chat_bubble_outline, 'activeIcon': Icons.chat_bubble, 'color': Colors.purple},
    {'label': 'حسابي', 'icon': Icons.person_outline, 'activeIcon': Icons.person, 'color': Colors.red},
  ];

  final List<int> _badges = [0, 0, 3, 7, 0];

  @override
  Widget build(BuildContext context) {
    final tab = _tabs[_index];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          backgroundColor: tab['color'] as Color,
          foregroundColor: Colors.white,
          title: Text(tab['label'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {}), IconButton(icon: const Icon(Icons.more_vert), onPressed: () {})],
        ),
        body: IndexedStack(
          index: _index,
          children: _tabs.map((t) => _CounterPage(color: t['color'] as Color, label: t['label'] as String)).toList(),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, -4))],
          ),
          child: BottomNavigationBar(
            currentIndex: _index,
            onTap: (i) => setState(() {
              _index = i;
              if (_badges[i] > 0) _badges[i] = 0;
            }),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: tab['color'] as Color,
            unselectedItemColor: Colors.grey.shade400,
            selectedFontSize: 12,
            unselectedFontSize: 11,
            elevation: 0,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            items: List.generate(_tabs.length, (i) {
              final hasBadge = _badges[i] > 0;
              return BottomNavigationBarItem(
                icon: hasBadge
                    ? Badge(
                  label: Text('${_badges[i]}'),
                  backgroundColor: Colors.red,
                  child: Icon(_tabs[i]['icon'] as IconData),
                )
                    : Icon(_tabs[i]['icon'] as IconData),
                activeIcon: Icon(_tabs[i]['activeIcon'] as IconData),
                label: _tabs[i]['label'] as String,
              );
            }),
          ),
        ),
      ),
    );
  }
}