import 'dart:ui';

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
      home: const PageViewScreen(),
    );
  }
}

class PageViewScreen extends StatelessWidget {
  const PageViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('جميع مفاهيم PageView', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 32),
        children: [
          _sectionTitle('1️⃣  PageView الأساسي (children)'),
          _launchBtn(context, 'PageView الأساسي', Colors.blue, const _BasicPage()),

          _sectionTitle('2️⃣  PageView.builder'),
          _launchBtn(context, 'PageView.builder', Colors.green, const _BuilderPage()),

          _sectionTitle('3️⃣  PageView.custom (SliverChildDelegate)'),
          _launchBtn(context, 'PageView.custom', Colors.purple, const _CustomPage()),

          _sectionTitle('4️⃣  PageController الأساسي'),
          _launchBtn(context, 'PageController', Colors.orange, const _PageControllerPage()),

          _sectionTitle('5️⃣  PageController: initialPage'),
          _launchBtn(context, 'initialPage (ابدأ من صفحة معينة)', Colors.teal, const _InitialPage()),

          _sectionTitle('6️⃣  PageController: viewportFraction'),
          _launchBtn(context, 'viewportFraction (عرض الصفحة)', Colors.indigo, const _ViewportFractionPage()),

          _sectionTitle('7️⃣  PageController: keepPage'),
          _launchBtn(context, 'keepPage (حفظ موضع التمرير)', Colors.pink, const _KeepPagePage()),

          _sectionTitle('8️⃣  PageController.animateToPage'),
          _launchBtn(context, 'animateToPage (انتقال مع حركة)', Colors.red, const _AnimateToPagePage()),

          _sectionTitle('9️⃣  PageController.jumpToPage'),
          _launchBtn(context, 'jumpToPage (انتقال فوري)', Colors.cyan.shade700, const _JumpToPagePage()),

          _sectionTitle('🔟  PageController.nextPage و previousPage'),
          _launchBtn(context, 'nextPage + previousPage', Colors.deepOrange, const _NextPrevPage()),

          _sectionTitle('1️⃣1️⃣  PageController.page و offset'),
          _launchBtn(context, 'page + offset (قراءة الموضع)', Colors.brown, const _PageOffsetPage()),

          _sectionTitle('1️⃣2️⃣  scrollDirection: Axis.vertical'),
          _launchBtn(context, 'scrollDirection عمودي', Colors.blueGrey, const _VerticalPage()),

          _sectionTitle('1️⃣3️⃣  scrollDirection: Axis.horizontal'),
          _launchBtn(context, 'scrollDirection أفقي (افتراضي)', Colors.lime.shade700, const _HorizontalPage()),

          _sectionTitle('1️⃣4️⃣  reverse: true'),
          _launchBtn(context, 'reverse: true (اتجاه معكوس)', Colors.deepPurple, const _ReversePage()),

          _sectionTitle('1️⃣5️⃣  physics: BouncingScrollPhysics'),
          _launchBtn(context, 'physics: Bouncing (ارتداد)', Colors.green.shade700, const _BouncingPhysicsPage()),

          _sectionTitle('1️⃣6️⃣  physics: NeverScrollableScrollPhysics'),
          _launchBtn(context, 'physics: Never (بدون سحب يدوي)', Colors.red.shade700, const _NeverScrollPage()),

          _sectionTitle('1️⃣7️⃣  physics: ClampingScrollPhysics'),
          _launchBtn(context, 'physics: Clamping (بدون ارتداد)', Colors.teal.shade700, const _ClampingPage()),

          _sectionTitle('1️⃣8️⃣  onPageChanged'),
          _launchBtn(context, 'onPageChanged callback', Colors.orange.shade700, const _OnPageChangedPage()),

          _sectionTitle('1️⃣9️⃣  dragStartBehavior'),
          _launchBtn(context, 'dragStartBehavior', Colors.purple.shade700, const _DragBehaviorPage()),

          _sectionTitle('2️⃣0️⃣  clipBehavior'),
          _launchBtn(context, 'clipBehavior', Colors.cyan.shade800, const _ClipBehaviorPage()),

          _sectionTitle('2️⃣1️⃣  restorationId'),
          _launchBtn(context, 'restorationId (استعادة الحالة)', Colors.indigo.shade700, const _RestorationPage()),

          _sectionTitle('2️⃣2️⃣  scrollBehavior'),
          _launchBtn(context, 'scrollBehavior مخصص', Colors.pink.shade700, const _ScrollBehaviorPage()),

          _sectionTitle('2️⃣3️⃣  PageView مع مؤشر نقاط (Dots Indicator)'),
          _launchBtn(context, 'Dots Indicator', Colors.blue.shade700, const _DotsIndicatorPage()),

          _sectionTitle('2️⃣4️⃣  PageView مع مؤشر أرقام'),
          _launchBtn(context, 'مؤشر أرقام', Colors.green.shade800, const _NumberIndicatorPage()),

          _sectionTitle('2️⃣5️⃣  PageView مع مؤشر شريط تقدم'),
          _launchBtn(context, 'مؤشر شريط تقدم', Colors.orange.shade800, const _ProgressIndicatorPage()),

          _sectionTitle('2️⃣6️⃣  PageView مع KeepAlive (حفظ الحالة)'),
          _launchBtn(context, 'AutomaticKeepAliveClientMixin', Colors.purple.shade800, const _KeepAlivePage()),

          _sectionTitle('2️⃣7️⃣  PageView مع TabBar (مزامنة)'),
          _launchBtn(context, 'مزامنة PageView مع TabBar', Colors.teal.shade800, const _TabSyncPage()),

          _sectionTitle('2️⃣8️⃣  PageView مع BottomNavigationBar'),
          _launchBtn(context, 'مزامنة مع BottomNavigationBar', Colors.red.shade800, const _BottomNavSyncPage()),

          _sectionTitle('2️⃣9️⃣  PageView كـ Onboarding (شاشات ترحيب)'),
          _launchBtn(context, 'Onboarding Screens', Colors.deepPurple.shade700, const _OnboardingPage()),

          _sectionTitle('3️⃣0️⃣  PageView كـ Carousel (بطاقات)'),
          _launchBtn(context, 'Carousel مع viewportFraction', Colors.deepOrange.shade700, const _CarouselPage()),

          _sectionTitle('3️⃣1️⃣  PageView مع Transform (تأثيرات انتقال)'),
          _launchBtn(context, 'تأثيرات Zoom + Rotation', Colors.blue.shade800, const _TransformPage()),

          _sectionTitle('3️⃣2️⃣  PageView.builder مع قائمة لا نهائية'),
          _launchBtn(context, 'قائمة لا نهائية (infinity)', Colors.green.shade900, const _InfinityPage()),
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
// مكوّنات مساعدة
// ============================================================
List<Color> get _pageColors => [
  Colors.blue, Colors.green, Colors.orange, Colors.purple,
  Colors.red, Colors.teal, Colors.pink, Colors.indigo,
];

Widget _pageCard(int index, {String? extra, Color? forceColor}) {
  final color = forceColor ?? _pageColors[index % _pageColors.length];
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [color, color.withOpacity(0.7)],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ),
    ),
    child: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CircleAvatar(radius: 40, backgroundColor: Colors.white24,
            child: Text('${index + 1}', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white))),
        const SizedBox(height: 16),
        Text('صفحة ${index + 1}', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
        if (extra != null) ...[
          const SizedBox(height: 8),
          Text(extra, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14, color: Colors.white70)),
        ],
      ]),
    ),
  );
}

AppBar _appBar(String t, Color c) => AppBar(
  title: Text(t, style: const TextStyle(color: Colors.white, fontSize: 13)),
  backgroundColor: c, centerTitle: true,
);

// ============================================================
// 1. PageView الأساسي (children)
// ============================================================
class _BasicPage extends StatelessWidget {
  const _BasicPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('PageView الأساسي (children)', Colors.blue),
        body: PageView(
          // children: قائمة ثابتة من الصفحات - كلها تُبنى في الذاكرة
          children: [
            _pageCard(0, extra: 'اسحب يساراً للتالي'),
            _pageCard(1, extra: 'children[1]'),
            _pageCard(2, extra: 'children[2]'),
            _pageCard(3, extra: 'آخر صفحة'),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 2. PageView.builder
// ============================================================
class _BuilderPage extends StatelessWidget {
  const _BuilderPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('PageView.builder', Colors.green),
        body: PageView.builder(
          // itemCount: عدد الصفحات - null = لا نهائي
          itemCount: 10,
          // itemBuilder: يبني الصفحة عند الحاجة فقط (lazy) → أداء أفضل
          itemBuilder: (context, index) {
            return _pageCard(index, extra: 'builder - itemBuilder(ctx, $index)\nيُبنى عند الحاجة فقط\nاسحب للتنقل');
          },
        ),
      ),
    );
  }
}

// ============================================================
// 3. PageView.custom
// ============================================================
class _CustomPage extends StatelessWidget {
  const _CustomPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('PageView.custom', Colors.purple),
        body: PageView.custom(
          // childrenDelegate: SliverChildDelegate للتحكم الكامل في بناء الصفحات
          childrenDelegate: SliverChildBuilderDelegate(
                (context, index) {
              return _pageCard(index, extra: 'SliverChildBuilderDelegate\naddAutomaticKeepAlives: true\naddRepaintBoundaries: true\nاسحب للتنقل');
            },
            // childCount: عدد الصفحات
            childCount: 6,
            // addAutomaticKeepAlives: الحفاظ على حالة الصفحات
            addAutomaticKeepAlives: true,
            // addRepaintBoundaries: تحسين أداء إعادة الرسم
            addRepaintBoundaries: true,
          ),
        ),
      ),
    );
  }
}

// ============================================================
// 4. PageController الأساسي
// ============================================================
class _PageControllerPage extends StatefulWidget {
  const _PageControllerPage();

  @override
  State<_PageControllerPage> createState() => _PageControllerPageState();
}

class _PageControllerPageState extends State<_PageControllerPage> {
  // PageController: للتحكم في PageView برمجياً
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    // dispose: مهم جداً لتحرير الموارد
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('PageController', Colors.orange),
        body: Column(children: [
          Expanded(
            child: PageView.builder(
              // controller: ربط الـ PageController
              controller: _controller,
              itemCount: 5,
              onPageChanged: (i) => setState(() => _currentPage = i),
              itemBuilder: (_, i) => _pageCard(i, extra: 'controller مرتبط'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.orange.shade50,
            child: Column(children: [
              Text('الصفحة الحالية: $_currentPage', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ElevatedButton(onPressed: () => _controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut), style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white), child: const Text('السابق')),
                ElevatedButton(onPressed: () => _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut), style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white), child: const Text('التالي')),
              ]),
            ]),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 5. initialPage
// ============================================================
class _InitialPage extends StatefulWidget {
  const _InitialPage();

  @override
  State<_InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<_InitialPage> {
  // initialPage: الصفحة التي تُعرض عند أول فتح (الافتراضي: 0)
  final PageController _controller = PageController(initialPage: 3);

  @override
  void dispose() { _controller.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('initialPage: 3', Colors.teal),
        body: PageView.builder(
          controller: _controller,
          itemCount: 8,
          itemBuilder: (_, i) => _pageCard(i, extra: i == 3 ? '← هذه الصفحة تُفتح أولا\nاسحب للتنقلً\ninitialPage: 3' : 'اسحب للتنقل'),
        ),
      ),
    );
  }
}

// ============================================================
// 6. viewportFraction
// ============================================================
class _ViewportFractionPage extends StatefulWidget {
  const _ViewportFractionPage();

  @override
  State<_ViewportFractionPage> createState() => _ViewportFractionPageState();
}

class _ViewportFractionPageState extends State<_ViewportFractionPage> {
  double _fraction = 0.85;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: _fraction);
  }

  void _update(double val) {
    setState(() { _fraction = val; });
    _controller.dispose();
    _controller = PageController(viewportFraction: _fraction);
  }

  @override
  void dispose() { _controller.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('viewportFraction', Colors.indigo),
        body: Column(children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: 6,
              itemBuilder: (_, i) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                decoration: BoxDecoration(
                  color: _pageColors[i % _pageColors.length],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8, offset: const Offset(0, 4))],
                ),
                child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('صفحة ${i + 1}', style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('viewportFraction: ${_fraction.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white70, fontSize: 13)),
                ])),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(children: [
              Text('viewportFraction: ${_fraction.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
              // الافتراضي: 1.0 = ملء الشاشة
              // 0.8 = تظهر حواف الصفحات المجاورة
              Slider(value: _fraction, min: 0.5, max: 1.0, divisions: 10, label: _fraction.toStringAsFixed(2), onChanged: _update, activeColor: Colors.indigo),
              const Text('1.0 = ملء الشاشة | أقل = تظهر حواف المجاورة', style: TextStyle(fontSize: 11, color: Colors.grey)),
            ]),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 7. keepPage
// ============================================================
class _KeepPagePage extends StatelessWidget {
  const _KeepPagePage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('keepPage', Colors.pink),
        body: Column(children: [
          Expanded(
            child: PageView.builder(
              // keepPage: true (افتراضي) → يحفظ موضع التمرير عند العودة للصفحة
              // keepPage: false → يعود للـ initialPage عند إعادة البناء
              controller: PageController(keepPage: true, initialPage: 0),
              itemCount: 6,
              itemBuilder: (_, i) => _pageCard(i, extra: 'keepPage: true\nالموضع محفوظ عند إعادة البناء\nاسحب للتنقل'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.pink.shade50,
            child: const Column(children: [
              Icon(Icons.save, color: Colors.pink, size: 32),
              SizedBox(height: 4),
              Text('keepPage: true (افتراضي)', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('يحفظ الصفحة الحالية عند إعادة بناء الـ Widget', style: TextStyle(fontSize: 12, color: Colors.grey)),
              SizedBox(height: 4),
              Text('keepPage: false → يعود لـ initialPage دائماً', style: TextStyle(fontSize: 12, color: Colors.grey)),
            ]),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 8. animateToPage
// ============================================================
class _AnimateToPagePage extends StatefulWidget {
  const _AnimateToPagePage();

  @override
  State<_AnimateToPagePage> createState() => _AnimateToPagePageState();
}

class _AnimateToPagePageState extends State<_AnimateToPagePage> {
  final PageController _controller = PageController();
  int _current = 0;
  Curve _curve = Curves.easeInOut;

  final List<Curve> _curves = [Curves.easeInOut, Curves.bounceOut, Curves.elasticOut, Curves.linear];
  final List<String> _curveNames = ['easeInOut', 'bounceOut', 'elasticOut', 'linear'];

  @override
  void dispose() { _controller.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('animateToPage', Colors.red),
        body: Column(children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: 6,
              onPageChanged: (i) => setState(() => _current = i),
              itemBuilder: (_, i) => _pageCard(i, extra: 'animateToPage مع duration و curve'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.red.shade50,
            child: Column(children: [
              Text('الصفحة الحالية: $_current', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(height: 8),
              // أزرار الانتقال
              Wrap(
                spacing: 8, runSpacing: 8,
                children: List.generate(6, (i) => ElevatedButton(
                  onPressed: () => _controller.animateToPage(
                    i,
                    // duration: مدة الحركة
                    duration: const Duration(milliseconds: 500),
                    // curve: نوع الحركة
                    curve: _curve,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _current == i ? Colors.red : Colors.grey.shade300,
                    foregroundColor: _current == i ? Colors.white : Colors.black,
                    minimumSize: const Size(48, 36),
                    padding: EdgeInsets.zero,
                  ),
                  child: Text('$i'),
                )),
              ),
              const SizedBox(height: 8),
              // اختيار الـ Curve
              DropdownButton<Curve>(
                value: _curve,
                isExpanded: true,
                onChanged: (v) => setState(() => _curve = v!),
                items: List.generate(_curves.length, (i) => DropdownMenuItem(value: _curves[i], child: Text(_curveNames[i]))),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 9. jumpToPage
// ============================================================
class _JumpToPagePage extends StatefulWidget {
  const _JumpToPagePage();

  @override
  State<_JumpToPagePage> createState() => _JumpToPagePageState();
}

class _JumpToPagePageState extends State<_JumpToPagePage> {
  final PageController _controller = PageController();
  int _current = 0;

  @override
  void dispose() { _controller.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('jumpToPage (انتقال فوري)', Colors.cyan.shade700),
        body: Column(children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: 8,
              onPageChanged: (i) => setState(() => _current = i),
              itemBuilder: (_, i) => _pageCard(i, extra: 'jumpToPage: انتقال فوري بدون حركة'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.cyan.shade50,
            child: Column(children: [
              Text('الصفحة: $_current', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8, runSpacing: 8,
                children: List.generate(8, (i) => ElevatedButton(
                  // jumpToPage: ينتقل فوراً بدون أي حركة
                  onPressed: () => _controller.jumpToPage(i),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _current == i ? Colors.cyan.shade700 : Colors.grey.shade300,
                    foregroundColor: _current == i ? Colors.white : Colors.black,
                    minimumSize: const Size(44, 36),
                    padding: EdgeInsets.zero,
                  ),
                  child: Text('$i'),
                )),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text('jumpToPage vs animateToPage:\njumpToPage = فوري بدون حركة\nanimateToPage = مع حركة وcurve', style: TextStyle(fontSize: 11, color: Colors.grey), textAlign: TextAlign.center),
            ]),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 10. nextPage و previousPage
// ============================================================
class _NextPrevPage extends StatefulWidget {
  const _NextPrevPage();

  @override
  State<_NextPrevPage> createState() => _NextPrevPageState();
}

class _NextPrevPageState extends State<_NextPrevPage> {
  final PageController _controller = PageController();
  int _current = 0;

  @override
  void dispose() { _controller.dispose(); super.dispose(); }

  void _next() => _controller.nextPage(
    duration: const Duration(milliseconds: 400),
    curve: Curves.easeInOut,
  );

  void _prev() => _controller.previousPage(
    duration: const Duration(milliseconds: 400),
    curve: Curves.easeInOut,
  );

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('nextPage + previousPage', Colors.deepOrange),
        body: Column(children: [
          Expanded(
            child: Stack(children: [
              PageView.builder(
                controller: _controller,
                itemCount: 6,
                onPageChanged: (i) => setState(() => _current = i),
                itemBuilder: (_, i) => _pageCard(i, extra: 'nextPage() + previousPage()'),
              ),
              // أزرار التنقل فوق الصفحات
              Positioned(
                right: 8, top: 0, bottom: 0,
                child: Center(child: IconButton(
                  onPressed: _prev,
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.black38, shape: BoxShape.circle),
                    child: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
                  ),
                )),
              ),
              Positioned(
                left: 8, top: 0, bottom: 0,
                child: Center(child: IconButton(
                  onPressed: _next,
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.black38, shape: BoxShape.circle),
                    child: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
                  ),
                )),
              ),
            ]),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.deepOrange.shade50,
            child: Text(
              'الصفحة: $_current | nextPage() ← | → previousPage()',
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 11. page و offset
// ============================================================
class _PageOffsetPage extends StatefulWidget {
  const _PageOffsetPage();

  @override
  State<_PageOffsetPage> createState() => _PageOffsetPageState();
}

class _PageOffsetPageState extends State<_PageOffsetPage> {
  final PageController _controller = PageController();
  double _pageValue = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        // _controller.page: الصفحة الحالية (double - يتغير أثناء السحب)
        _pageValue = _controller.page ?? 0;
      });
    });
  }

  @override
  void dispose() { _controller.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('page + offset', Colors.brown),
        body: Column(children: [
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.brown.shade50,
            child: Column(children: [
              Text('controller.page: ${_pageValue.toStringAsFixed(3)}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Text('الصفحة الحالية: ${_pageValue.round()}', style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
              Text('offset: ${(_controller.hasClients ? _controller.offset : 0).toStringAsFixed(1)} px', style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
              const SizedBox(height: 4),
              LinearProgressIndicator(
                value: _pageValue / 4,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation(Colors.brown),
              ),
            ]),
          ),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: 5,
              itemBuilder: (_, i) => _pageCard(i, extra: 'اسحب لرؤية page و offset\nيتغيران أثناء السحب'),
            ),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 12. scrollDirection: Vertical
// ============================================================
class _VerticalPage extends StatefulWidget {
  const _VerticalPage();

  @override
  State<_VerticalPage> createState() => _VerticalPageState();
}

class _VerticalPageState extends State<_VerticalPage> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('scrollDirection: Axis.vertical', Colors.blueGrey),
        body: Stack(children: [
          PageView.builder(
            // scrollDirection: Axis.vertical → تمرير عمودي (للأعلى والأسفل)
            scrollDirection: Axis.vertical,
            itemCount: 6,
            onPageChanged: (i) => setState(() => _current = i),
            itemBuilder: (_, i) => _pageCard(i, extra: 'scrollDirection: Axis.vertical\nاسحب للأعلى/الأسفل'),
          ),
          Positioned(
            left: 16, top: 0, bottom: 0,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(6, (i) => Container(
                  width: 8, height: 8,
                  margin: const EdgeInsets.symmetric(vertical: 3),
                  decoration: BoxDecoration(
                    color: _current == i ? Colors.white : Colors.white38,
                    shape: BoxShape.circle,
                  ),
                )),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 13. scrollDirection: Horizontal (افتراضي)
// ============================================================
class _HorizontalPage extends StatefulWidget {
  const _HorizontalPage();

  @override
  State<_HorizontalPage> createState() => _HorizontalPageState();
}

class _HorizontalPageState extends State<_HorizontalPage> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('scrollDirection: Axis.horizontal', Colors.lime.shade700),
        body: Stack(children: [
          PageView.builder(
            // scrollDirection: Axis.horizontal (الافتراضي) → تمرير أفقي
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            onPageChanged: (i) => setState(() => _current = i),
            itemBuilder: (_, i) => _pageCard(i, extra: 'scrollDirection: Axis.horizontal (افتراضي)'),
          ),
          Positioned(
            bottom: 16, left: 0, right: 0,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(5, (i) => Container(
              width: _current == i ? 20 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(color: _current == i ? Colors.white : Colors.white54, borderRadius: BorderRadius.circular(4)),
            ))),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 14. reverse: true
// ============================================================
class _ReversePage extends StatefulWidget {
  const _ReversePage();

  @override
  State<_ReversePage> createState() => _ReversePageState();
}

class _ReversePageState extends State<_ReversePage> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('reverse: true', Colors.deepPurple),
        body: PageView.builder(
          // reverse: true → يعكس اتجاه التمرير
          // السحب يساراً → يذهب للصفحات الأولى
          reverse: true,
          itemCount: 5,
          onPageChanged: (i) => setState(() => _current = i),
          itemBuilder: (_, i) => _pageCard(i, extra: 'reverse: true\nالاتجاه معكوس\nالصفحة $_current محددة\nاسحب للتنقل'),
        ),
      ),
    );
  }
}

// ============================================================
// 15. physics: Bouncing
// ============================================================
class _BouncingPhysicsPage extends StatelessWidget {
  const _BouncingPhysicsPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('physics: BouncingScrollPhysics', Colors.green.shade700),
        body: PageView.builder(
          // BouncingScrollPhysics: ارتداد عند الوصول لأول/آخر صفحة (سلوك iOS)
          physics: const BouncingScrollPhysics(),
          itemCount: 4,
          itemBuilder: (_, i) => _pageCard(i, extra: 'BouncingScrollPhysics\nارتداد عند الحافة (iOS)\nاسحب للتنقل'),
        ),
      ),
    );
  }
}

// ============================================================
// 16. physics: NeverScrollable
// ============================================================
class _NeverScrollPage extends StatefulWidget {
  const _NeverScrollPage();

  @override
  State<_NeverScrollPage> createState() => _NeverScrollPageState();
}

class _NeverScrollPageState extends State<_NeverScrollPage> {
  final PageController _controller = PageController();
  int _current = 0;

  @override
  void dispose() { _controller.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('physics: NeverScrollable', Colors.red.shade700),
        body: Column(children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              // NeverScrollableScrollPhysics: يمنع السحب اليدوي
              // التنقل يكون برمجياً فقط عبر الأزرار
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              onPageChanged: (i) => setState(() => _current = i),
              itemBuilder: (_, i) => _pageCard(i, extra: 'NeverScrollableScrollPhysics\nلا يمكن السحب يدوياً\nاستخدم الأزرار فقط'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.red.shade50,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ElevatedButton.icon(
                onPressed: () => _controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut),
                icon: const Icon(Icons.arrow_back_ios),
                label: const Text('السابق'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
              ),
              Text('$_current', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ElevatedButton.icon(
                onPressed: () => _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut),
                icon: const Icon(Icons.arrow_forward_ios),
                label: const Text('التالي'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 17. physics: Clamping
// ============================================================
class _ClampingPage extends StatelessWidget {
  const _ClampingPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('physics: ClampingScrollPhysics', Colors.teal.shade700),
        body: PageView.builder(
          // ClampingScrollPhysics: بدون ارتداد عند الحافة (سلوك Android)
          physics: const ClampingScrollPhysics(),
          itemCount: 4,
          itemBuilder: (_, i) => _pageCard(i, extra: 'ClampingScrollPhysics\nبدون ارتداد عند الحافة (Android)\nاسحب للتنقل'),
        ),
      ),
    );
  }
}

// ============================================================
// 18. onPageChanged
// ============================================================
class _OnPageChangedPage extends StatefulWidget {
  const _OnPageChangedPage();

  @override
  State<_OnPageChangedPage> createState() => _OnPageChangedPageState();
}

class _OnPageChangedPageState extends State<_OnPageChangedPage> {
  int _current = 0;
  int _changeCount = 0;
  int _previous = -1;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('onPageChanged', Colors.orange.shade700),
        body: Column(children: [
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.orange.shade50,
            child: Column(children: [
              Text('الصفحة الحالية: $_current', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('الصفحة السابقة: $_previous', style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
              Text('عدد مرات التغيير: $_changeCount', style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
            ]),
          ),
          Expanded(
            child: PageView.builder(
              // onPageChanged: يُستدعى عند الوصول لصفحة جديدة
              // يعطيك index الصفحة الجديدة
              onPageChanged: (index) {
                setState(() {
                  _previous = _current;
                  _current = index;
                  _changeCount++;
                });
              },
              itemCount: 6,
              itemBuilder: (_, i) => _pageCard(i, extra: 'onPageChanged(index)\nيُستدعى عند الوصول للصفحة\nاسحب للتنقل'),
            ),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 19. dragStartBehavior
// ============================================================
class _DragBehaviorPage extends StatelessWidget {
  const _DragBehaviorPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('dragStartBehavior', Colors.purple.shade700),
        body: PageView.builder(
          // dragStartBehavior: متى يبدأ تتبع السحب
          // DragStartBehavior.down → عند لمس الشاشة (استجابة أسرع)
          // DragStartBehavior.start → عند بدء الحركة الفعلية (أكثر دقة)
          dragStartBehavior: DragStartBehavior.start,
          itemCount: 4,
          itemBuilder: (_, i) => _pageCard(i, extra: 'dragStartBehavior: start\nيبدأ التتبع عند بدء الحركة الفعلية\nاسحب للتنقل'),
        ),
      ),
    );
  }
}

// ============================================================
// 20. clipBehavior
// ============================================================
class _ClipBehaviorPage extends StatelessWidget {
  const _ClipBehaviorPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('clipBehavior', Colors.cyan.shade800),
        body: PageView.builder(
          // clipBehavior: تحديد كيفية قص المحتوى
          // Clip.hardEdge (افتراضي) → قص بدون anti-aliasing
          // Clip.antiAlias → قص مع anti-aliasing
          // Clip.antiAliasWithSaveLayer → أعلى جودة
          // Clip.none → بدون قص (المحتوى يظهر خارج الحدود)
          clipBehavior: Clip.antiAlias,
          itemCount: 4,
          itemBuilder: (_, i) => Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _pageColors[i],
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('صفحة ${i + 1}', style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('clipBehavior: Clip.antiAlias\nزوايا دائرية مع anti-aliasing\nاسحب للتنقل', style: TextStyle(color: Colors.white70, fontSize: 13), textAlign: TextAlign.center),
            ])),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// 21. restorationId
// ============================================================
class _RestorationPage extends StatelessWidget {
  const _RestorationPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('restorationId', Colors.indigo.shade700),
        body: PageView.builder(
          // restorationId: معرّف لاستعادة حالة التمرير
          // عند إغلاق التطبيق وإعادة فتحه يعود لنفس الصفحة
          // يعمل مع RestorationScope
          restorationId: 'my_page_view_restoration',
          itemCount: 5,
          itemBuilder: (_, i) => _pageCard(i, extra: 'restorationId: my_page_view_restoration\nيحفظ الصفحة عند إعادة فتح التطبيق\nاسحب للتنقل'),
        ),
      ),
    );
  }
}

// ============================================================
// 22. scrollBehavior
// ============================================================
class _ScrollBehaviorPage extends StatelessWidget {
  const _ScrollBehaviorPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('scrollBehavior مخصص', Colors.pink.shade700),
        body: PageView.builder(
          // scrollBehavior: تخصيص سلوك التمرير
          // يمكن استخدامه لتفعيل السحب بالماوس على الـ Web/Desktop
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse, // السحب بالماوس (Web/Desktop)
              PointerDeviceKind.trackpad,
            },
          ),
          itemCount: 4,
          itemBuilder: (_, i) => _pageCard(i, extra: 'scrollBehavior مخصص\nيدعم السحب بالماوس والـ trackpad\nاسحب للتنقل'),
        ),
      ),
    );
  }
}

// ============================================================
// 23. Dots Indicator
// ============================================================
class _DotsIndicatorPage extends StatefulWidget {
  const _DotsIndicatorPage();

  @override
  State<_DotsIndicatorPage> createState() => _DotsIndicatorPageState();
}

class _DotsIndicatorPageState extends State<_DotsIndicatorPage> {
  int _current = 0;
  final int _count = 5;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('مؤشر نقاط (Dots Indicator)', Colors.blue.shade700),
        body: Stack(children: [
          PageView.builder(
            itemCount: _count,
            onPageChanged: (i) => setState(() => _current = i),
            itemBuilder: (_, i) => _pageCard(i, extra: 'Dots Indicator أسفل الشاشة'),
          ),
          // مؤشر النقاط
          Positioned(
            bottom: 20, left: 0, right: 0,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(_count, (i) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _current == i ? 24 : 10,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: _current == i ? Colors.white : Colors.white54,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
                ),
              );
            })),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 24. مؤشر أرقام
// ============================================================
class _NumberIndicatorPage extends StatefulWidget {
  const _NumberIndicatorPage();

  @override
  State<_NumberIndicatorPage> createState() => _NumberIndicatorPageState();
}

class _NumberIndicatorPageState extends State<_NumberIndicatorPage> {
  int _current = 0;
  final int _count = 8;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('مؤشر أرقام', Colors.green.shade800),
        body: Stack(children: [
          PageView.builder(
            itemCount: _count,
            onPageChanged: (i) => setState(() => _current = i),
            itemBuilder: (_, i) => _pageCard(i),
          ),
          // مؤشر أرقام في الزاوية
          Positioned(
            top: 16, left: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${_current + 1} / $_count',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 25. مؤشر شريط تقدم
// ============================================================
class _ProgressIndicatorPage extends StatefulWidget {
  const _ProgressIndicatorPage();

  @override
  State<_ProgressIndicatorPage> createState() => _ProgressIndicatorPageState();
}

class _ProgressIndicatorPageState extends State<_ProgressIndicatorPage> {
  int _current = 0;
  final int _count = 6;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 4),
          child: Column(children: [
            AppBar(
              title: Text('${_current + 1} من $_count', style: const TextStyle(color: Colors.white)),
              backgroundColor: Colors.orange.shade800,
              centerTitle: true,
            ),
            // شريط التقدم في AppBar
            LinearProgressIndicator(
              value: (_current + 1) / _count,
              backgroundColor: Colors.orange.shade200,
              valueColor: AlwaysStoppedAnimation(Colors.white),
              minHeight: 4,
            ),
          ]),
        ),
        body: PageView.builder(
          itemCount: _count,
          onPageChanged: (i) => setState(() => _current = i),
          itemBuilder: (_, i) => _pageCard(i, extra: 'شريط التقدم في الأعلى\nيُحدَّث تلقائياً'),
        ),
      ),
    );
  }
}

// ============================================================
// 26. KeepAlive
// ============================================================
class _KeepAlivePage extends StatelessWidget {
  const _KeepAlivePage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('AutomaticKeepAliveClientMixin', Colors.purple.shade800),
        body: PageView(
          children: List.generate(4, (i) => _KeepAlivePageWidget(index: i)),
        ),
      ),
    );
  }
}

class _KeepAlivePageWidget extends StatefulWidget {
  final int index;
  const _KeepAlivePageWidget({required this.index});

  @override
  State<_KeepAlivePageWidget> createState() => _KeepAlivePageWidgetState();
}

class _KeepAlivePageWidgetState extends State<_KeepAlivePageWidget>
    with AutomaticKeepAliveClientMixin {
  int _counter = 0;

  // wantKeepAlive: true → يحفظ حالة الصفحة عند التنقل بينها
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // مطلوب مع AutomaticKeepAliveClientMixin
    final color = _pageColors[widget.index];
    return Container(
      color: color,
      child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(Icons.save, color: Colors.white, size: 48),
        const SizedBox(height: 12),
        Text('صفحة ${widget.index + 1}', style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text('العداد: $_counter', style: const TextStyle(color: Colors.white, fontSize: 20)),
        const SizedBox(height: 4),
        const Text('wantKeepAlive: true\nالحالة محفوظة عند التنقل\nاسحب للتنقل', style: TextStyle(color: Colors.white70, fontSize: 12), textAlign: TextAlign.center),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: () => setState(() => _counter++),
          icon: const Icon(Icons.add),
          label: const Text('زيادة العداد'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: color),
        ),
      ])),
    );
  }
}

// ============================================================
// 27. مزامنة مع TabBar
// ============================================================
class _TabSyncPage extends StatefulWidget {
  const _TabSyncPage();

  @override
  State<_TabSyncPage> createState() => _TabSyncPageState();
}

class _TabSyncPageState extends State<_TabSyncPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final PageController _pageController = PageController();
  final List<String> _tabs = ['الرئيسية', 'بحث', 'المفضلة', 'حسابي'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('مزامنة PageView + TabBar', style: TextStyle(color: Colors.white, fontSize: 12)),
          backgroundColor: Colors.teal.shade800,
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            indicatorColor: Colors.amber,
            // عند الضغط على TabBar → انتقال PageView
            onTap: (i) => _pageController.animateToPage(i, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut),
            tabs: _tabs.map((t) => Tab(text: t)).toList(),
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: 4,
          // عند التمرير في PageView → تحديث TabBar
          onPageChanged: (i) => _tabController.animateTo(i),
          itemBuilder: (_, i) => _pageCard(i, extra: 'مزامنة PageView ↔ TabBar\nالسحب يُحدّث الـ TabBar'),
        ),
      ),
    );
  }
}

// ============================================================
// 28. مزامنة مع BottomNavigationBar
// ============================================================
class _BottomNavSyncPage extends StatefulWidget {
  const _BottomNavSyncPage();

  @override
  State<_BottomNavSyncPage> createState() => _BottomNavSyncPageState();
}

class _BottomNavSyncPageState extends State<_BottomNavSyncPage> {
  final PageController _controller = PageController();
  int _current = 0;
  final List<Map<String, dynamic>> _items = [
    {'icon': Icons.home, 'label': 'الرئيسية'},
    {'icon': Icons.search, 'label': 'بحث'},
    {'icon': Icons.favorite, 'label': 'المفضلة'},
    {'icon': Icons.person, 'label': 'حسابي'},
  ];

  @override
  void dispose() { _controller.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('مزامنة PageView + BottomNavBar', Colors.red.shade800),
        body: PageView.builder(
          controller: _controller,
          itemCount: 4,
          onPageChanged: (i) => setState(() => _current = i),
          itemBuilder: (_, i) => _pageCard(i, extra: 'مزامنة PageView ↔ BottomNavigationBar'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _current,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red.shade800,
          onTap: (i) {
            setState(() => _current = i);
            _controller.animateToPage(i, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
          },
          items: _items.map((item) => BottomNavigationBarItem(icon: Icon(item['icon'] as IconData), label: item['label'] as String)).toList(),
        ),
      ),
    );
  }
}

// ============================================================
// 29. Onboarding
// ============================================================
class _OnboardingPage extends StatefulWidget {
  const _OnboardingPage();

  @override
  State<_OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<_OnboardingPage> {
  final PageController _controller = PageController();
  int _current = 0;

  final List<Map<String, dynamic>> _pages = [
    {'icon': Icons.rocket_launch, 'title': 'مرحباً بك!', 'desc': 'اكتشف تجربة رائعة مع تطبيقنا المميز', 'color': const Color(0xFF1565C0)},
    {'icon': Icons.stars, 'title': 'ميزات رائعة', 'desc': 'استمتع بمئات الميزات المصممة خصيصاً لراحتك', 'color': const Color(0xFF6A1B9A)},
    {'icon': Icons.security, 'title': 'آمن وموثوق', 'desc': 'بياناتك محمية بأعلى معايير الأمان العالمية', 'color': const Color(0xFF00695C)},
    {'icon': Icons.celebration, 'title': 'ابدأ الآن!', 'desc': 'انضم لملايين المستخدمين حول العالم', 'color': const Color(0xFFAD1457)},
  ];

  @override
  void dispose() { _controller.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(children: [
          PageView.builder(
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: (i) => setState(() => _current = i),
            itemBuilder: (_, i) {
              final page = _pages[i];
              return Container(
                color: page['color'] as Color,
                child: SafeArea(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(page['icon'] as IconData, size: 100, color: Colors.white),
                    const SizedBox(height: 32),
                    Text(page['title'] as String, style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(page['desc'] as String, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white70, fontSize: 16, height: 1.5)),
                    ),
                  ]),
                ),
              );
            },
          ),
          // مؤشر نقاط
          Positioned(
            bottom: 100, left: 0, right: 0,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(_pages.length, (i) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _current == i ? 24 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(color: _current == i ? Colors.white : Colors.white38, borderRadius: BorderRadius.circular(4)),
            ))),
          ),
          // أزرار التنقل
          Positioned(
            bottom: 32, left: 24, right: 24,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('تخطي', style: TextStyle(color: Colors.white70, fontSize: 16)),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_current < _pages.length - 1) {
                    _controller.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                  } else {
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black87, padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
                child: Text(_current == _pages.length - 1 ? 'ابدأ الآن 🚀' : 'التالي →', style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 30. Carousel
// ============================================================
class _CarouselPage extends StatefulWidget {
  const _CarouselPage();

  @override
  State<_CarouselPage> createState() => _CarouselPageState();
}

class _CarouselPageState extends State<_CarouselPage> {
  int _current = 0;
  final PageController _controller = PageController(viewportFraction: 0.82);

  @override
  void dispose() { _controller.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('Carousel مع viewportFraction: 0.82', Colors.deepOrange.shade700),
        backgroundColor: Colors.grey.shade100,
        body: Column(children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 280,
            child: PageView.builder(
              controller: _controller,
              itemCount: 6,
              onPageChanged: (i) => setState(() => _current = i),
              itemBuilder: (_, i) {
                final isActive = _current == i;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: isActive ? 0 : 16),
                  decoration: BoxDecoration(
                    color: _pageColors[i],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: isActive ? [BoxShadow(color: _pageColors[i].withOpacity(0.5), blurRadius: 16, offset: const Offset(0, 8))] : [],
                  ),
                  child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text('بطاقة ${i + 1}', style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(isActive ? '← محدد →' : 'اسحب للتحديد', style: const TextStyle(color: Colors.white70, fontSize: 14)),
                  ])),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(6, (i) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _current == i ? 20 : 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(color: _current == i ? _pageColors[_current] : Colors.grey.shade400, borderRadius: BorderRadius.circular(4)),
          ))),
        ]),
      ),
    );
  }
}

// ============================================================
// 31. Transform (تأثيرات انتقال)
// ============================================================
class _TransformPage extends StatefulWidget {
  const _TransformPage();

  @override
  State<_TransformPage> createState() => _TransformPageState();
}

class _TransformPageState extends State<_TransformPage> {
  final PageController _controller = PageController(viewportFraction: 0.88);
  double _page = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => setState(() => _page = _controller.page ?? 0));
  }

  @override
  void dispose() { _controller.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('تأثيرات Zoom + Rotation', Colors.blue.shade800),
        backgroundColor: Colors.black87,
        body: Center(
          child: SizedBox(
            height: 320,
            child: PageView.builder(
              controller: _controller,
              itemCount: 6,
              itemBuilder: (_, i) {
                // حساب مقدار الابتعاد عن الصفحة الحالية
                final diff = (_page - i).abs();
                // تأثير Zoom
                final scale = (1 - diff * 0.15).clamp(0.8, 1.0);
                // تأثير Rotation
                final angle = diff * 0.1 * (i < _page ? 1 : -1);

                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..scale(scale)
                    ..rotateY(angle),
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    decoration: BoxDecoration(
                      color: _pageColors[i],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 12, offset: const Offset(0, 6))],
                    ),
                    child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text('${i + 1}', style: const TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold)),
                      const Text('Zoom + Rotation\nTransform.scale + rotateY\nاسحب للتنقل', style: TextStyle(color: Colors.white70, fontSize: 12), textAlign: TextAlign.center),
                    ])),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// 32. قائمة لا نهائية
// ============================================================
class _InfinityPage extends StatefulWidget {
  const _InfinityPage();

  @override
  State<_InfinityPage> createState() => _InfinityPageState();
}

class _InfinityPageState extends State<_InfinityPage> {
  // نبدأ من منتصف رقم كبير لتجنب الوصول للحدود
  static const int _virtualStart = 10000;
  final PageController _controller = PageController(initialPage: _virtualStart);
  int _current = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final page = _controller.page?.round() ?? _virtualStart;
      setState(() => _current = page - _virtualStart);
    });
  }

  @override
  void dispose() { _controller.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('قائمة لا نهائية (infinity)', Colors.green.shade900),
        body: Stack(children: [
          PageView.builder(
            controller: _controller,
            // itemCount: null → لا نهائي
            // أو رقم كبير جداً كـ 999999
            itemCount: null,
            itemBuilder: (_, virtualIndex) {
              // تحويل الـ index الافتراضي للـ index الحقيقي
              final realIndex = (virtualIndex - _virtualStart) % 5;
              final display = virtualIndex - _virtualStart;
              return Container(
                color: _pageColors[realIndex.abs() % _pageColors.length],
                child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CircleAvatar(radius: 40, backgroundColor: Colors.white24,
                      child: Text('${realIndex.abs() + 1}', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white))),
                  const SizedBox(height: 16),
                  Text('الرقم الكلي: $display', style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('itemCount: null → لا نهائي\nاسحب للأمام والخلف إلى الأبد', style: TextStyle(color: Colors.white70, fontSize: 13), textAlign: TextAlign.center),
                ])),
              );
            },
          ),
          Positioned(
            top: 16, left: 0, right: 0,
            child: Center(child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(color: Colors.black45, borderRadius: BorderRadius.circular(20)),
              child: Text('الموضع: $_current', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            )),
          ),
        ]),
      ),
    );
  }
}