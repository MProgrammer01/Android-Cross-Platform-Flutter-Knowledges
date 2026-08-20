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
      title: 'مفاهيم Navigation',

      builder: (context, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: child ?? const SizedBox(),
      ),

      navigatorKey: _globalNavKey,

      // ── 22: Named Routes
      initialRoute: '/',
      routes: {
        '/': (ctx) => const NavHomeScreen(),
        '/details': (ctx) => const _NamedRoutePage(),
        '/profile': (ctx) => const _ProfileNamedPage(),
        '/settings': (ctx) => const _SettingsNamedPage(),
      },

      // ── 23: onGenerateRoute
      onGenerateRoute: (settings) {
        if (settings.name == '/dynamic') {
          final args = settings.arguments as Map<String, dynamic>?;
          return MaterialPageRoute(builder: (_) => _DynamicRoutePage(args: args));
        }
        if (settings.name != null && settings.name!.startsWith('/product/')) {
          final id = settings.name!.split('/').last;
          return MaterialPageRoute(builder: (_) => _ProductPage(id: id));
        }
        return null;
      },

      // ── 24: onUnknownRoute
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (_) => const _UnknownPage(),
      ),
    );
  }
}

// ============================================================
// مساعدات
// ============================================================
AppBar _appBar(String t, Color c) => AppBar(
  title: Text(t, style: const TextStyle(color: Colors.white, fontSize: 13)),
  backgroundColor: c,
  centerTitle: true,
);

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

Widget _infoBox(String text, Color color) => Container(
  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
  padding: const EdgeInsets.all(12),
  decoration: BoxDecoration(
    color: color.withOpacity(0.08),
    border: Border.all(color: color.withOpacity(0.3)),
    borderRadius: BorderRadius.circular(10),
  ),
  child: Text(text, style: const TextStyle(fontSize: 12, height: 1.6)),
);

// ============================================================
// الشاشة الرئيسية
// ============================================================
class NavHomeScreen extends StatelessWidget {
  const NavHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('جميع مفاهيم Navigation', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 32),
        children: [
          // ── 1
          _sectionTitle('1️⃣  Navigator.push (انتقال لصفحة جديدة)'),
          _launchBtn(context, 'Navigator.push', Colors.blue, const _PushPage()),

          // ── 2
          _sectionTitle('2️⃣  Navigator.pop (الرجوع للصفحة السابقة)'),
          _launchBtn(context, 'Navigator.pop', Colors.green, const _PopPage()),

          // ── 3
          _sectionTitle('3️⃣  Navigator.pushReplacement (استبدال الصفحة)'),
          _launchBtn(context, 'Navigator.pushReplacement', Colors.orange, const _PushReplacementPage()),

          // ── 4
          _sectionTitle('4️⃣  Navigator.pushAndRemoveUntil (حذف المكدس)'),
          _launchBtn(context, 'Navigator.pushAndRemoveUntil', Colors.red, const _PushAndRemoveUntilPage()),

          // ── 5
          _sectionTitle('5️⃣  Navigator.popUntil (الرجوع لصفحة معينة)'),
          _launchBtn(context, 'Navigator.popUntil', Colors.purple, const _PopUntilPage()),

          // ── 6
          _sectionTitle('6️⃣  Navigator.pushNamed (اسم المسار)'),
          _launchBtn(context, 'Navigator.pushNamed', Colors.teal, const _PushNamedPage()),

          // ── 7
          _sectionTitle('7️⃣  Navigator.pushReplacementNamed'),
          _launchBtn(context, 'pushReplacementNamed', Colors.indigo, const _PushReplacementNamedPage()),

          // ── 8
          _sectionTitle('8️⃣  Navigator.pushNamedAndRemoveUntil'),
          _launchBtn(context, 'pushNamedAndRemoveUntil', Colors.pink, const _PushNamedRemovePage()),

          // ── 9
          _sectionTitle('9️⃣  تمرير البيانات للأمام (Arguments)'),
          _launchBtn(context, 'تمرير arguments للصفحة التالية', Colors.cyan.shade700, const _PassDataPage()),

          // ── 10
          _sectionTitle('🔟  استقبال البيانات من pop (Result)'),
          _launchBtn(context, 'استقبال result من pop', Colors.deepOrange, const _ReceiveResultPage()),

          // ── 11
          _sectionTitle('1️⃣1️⃣  MaterialPageRoute'),
          _launchBtn(context, 'MaterialPageRoute + خصائصه', Colors.brown, const _MaterialRoutePage()),

          // ── 12
          _sectionTitle('1️⃣2️⃣  CupertinoPageRoute (iOS style)'),
          _launchBtn(context, 'CupertinoPageRoute', Colors.blueGrey, const _CupertinoRoutePage()),

          // ── 13
          _sectionTitle('1️⃣3️⃣  PageRouteBuilder (انتقال مخصص)'),
          _launchBtn(context, 'PageRouteBuilder + تأثيرات', Colors.lime.shade700, const _PageRouteBuilderPage()),

          // ── 14
          _sectionTitle('1️⃣4️⃣  FadeTransition'),
          _launchBtn(context, 'FadeTransition انتقال', Colors.blue.shade700, const _FadeTransitionPage()),

          // ── 15
          _sectionTitle('1️⃣5️⃣  SlideTransition'),
          _launchBtn(context, 'SlideTransition انتقال', Colors.green.shade700, const _SlideTransitionPage()),

          // ── 16
          _sectionTitle('1️⃣6️⃣  ScaleTransition'),
          _launchBtn(context, 'ScaleTransition انتقال', Colors.purple.shade700, const _ScaleTransitionPage()),

          // ── 17
          _sectionTitle('1️⃣7️⃣  RotationTransition'),
          _launchBtn(context, 'RotationTransition انتقال', Colors.orange.shade700, const _RotationTransitionPage()),

          // ── 18
          _sectionTitle('1️⃣8️⃣  Navigator.canPop'),
          _launchBtn(context, 'canPop + maybePop', Colors.red.shade700, const _CanPopPage()),

          // ── 19
          _sectionTitle('1️⃣9️⃣  WillPopScope / PopScope'),
          _launchBtn(context, 'WillPopScope (منع الرجوع)', Colors.teal.shade700, const _WillPopPage()),

          // ── 20
          _sectionTitle('2️⃣0️⃣  Navigator.of(context) و context.mounted'),
          _launchBtn(context, 'Navigator.of + context.mounted', Colors.indigo.shade700, const _NavigatorOfPage()),

          // ── 21
          _sectionTitle('2️⃣1️⃣  GlobalKey<NavigatorState>'),
          _launchBtn(context, 'GlobalKey<NavigatorState>', Colors.pink.shade700, const _GlobalKeyNavPage()),

          // ── 22
          _sectionTitle('2️⃣2️⃣  Named Routes + initialRoute'),
          _launchBtn(context, 'Named Routes مع routes: {}', Colors.deepPurple, const _NamedRoutesInfoPage()),

          // ── 23
          _sectionTitle('2️⃣3️⃣  onGenerateRoute'),
          _launchBtn(context, 'onGenerateRoute (مسارات ديناميكية)', Colors.deepOrange, const _OnGenerateRoutePage()),

          // ── 24
          _sectionTitle('2️⃣4️⃣  onUnknownRoute'),
          _launchBtn(context, 'onUnknownRoute (صفحة 404)', Colors.brown.shade700, const _OnUnknownRoutePage()),

          // ── 25
          _sectionTitle('2️⃣5️⃣  RouteSettings و ModalRoute'),
          _launchBtn(context, 'RouteSettings + ModalRoute.of', Colors.cyan.shade800, const _RouteSettingsPage()),

          // ── 26
          _sectionTitle('2️⃣6️⃣  Nested Navigation (Navigator متداخل)'),
          _launchBtn(context, 'Nested Navigator', Colors.green.shade800, const _NestedNavPage()),

          // ── 27
          _sectionTitle('2️⃣7️⃣  NavigatorObserver'),
          _launchBtn(context, 'NavigatorObserver (مراقبة التنقل)', Colors.purple.shade800, const _ObserverPage()),

          // ── 28
          _sectionTitle('2️⃣8️⃣  Hero Animation'),
          _launchBtn(context, 'Hero Animation بين الصفحات', Colors.red.shade800, const _HeroPage()),

          // ── 29
          _sectionTitle('2️⃣9️⃣  Navigator 2.0 - Router + RouterDelegate'),
          _launchBtn(context, 'Navigator 2.0 مقدمة', Colors.blue.shade800, const _Navigator2Page()),

          // ── 30
          _sectionTitle('3️⃣0️⃣  GoRouter (مكتبة خارجية)'),
          _launchBtn(context, 'GoRouter مقدمة وشرح', Colors.orange.shade800, const _GoRouterInfoPage()),
        ],
      ),
    );
  }
}

// ============================================================
// 1. Navigator.push
// ============================================================
class _PushPage extends StatelessWidget {
  const _PushPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('Navigator.push', Colors.blue),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(Icons.arrow_forward, size: 64, color: Colors.blue),
            const SizedBox(height: 16),
            const Text('Navigator.push', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _infoBox(
              '• يُضيف صفحة جديدة فوق المكدس\n'
                  '• يمكن الرجوع بزر الرجوع\n'
                  '• يُعيد Future يُكتمل عند pop',
              Colors.blue,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const _SecondPage(title: 'الصفحة الثانية', color: Colors.blue)),
              ),
              icon: const Icon(Icons.arrow_forward),
              label: const Text('push → الصفحة الثانية'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
            ),
          ]),
        ),
      ),
    );
  }
}

// ============================================================
// 2. Navigator.pop
// ============================================================
class _PopPage extends StatelessWidget {
  const _PopPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('Navigator.pop', Colors.green),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(Icons.arrow_back, size: 64, color: Colors.green),
            const SizedBox(height: 16),
            const Text('Navigator.pop', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            _infoBox(
              '• يُزيل الصفحة الحالية من المكدس\n'
                  '• يمكن إرسال result للصفحة السابقة\n'
                  '• Navigator.pop(context, "النتيجة")',
              Colors.green,
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _PopDemoPage())),
              icon: const Icon(Icons.open_in_new),
              label: const Text('افتح صفحة مع pop'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
            ),
          ]),
        ),
      ),
    );
  }
}

class _PopDemoPage extends StatelessWidget {
  const _PopDemoPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('صفحة مع pop', Colors.green),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(onPressed: () => Navigator.pop(context), style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white), child: const Text('pop() ← الرجوع')),
          const SizedBox(height: 8),
          ElevatedButton(onPressed: () => Navigator.pop(context, 'تم الإرسال ✅'), style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, foregroundColor: Colors.white), child: const Text('pop(context, result) مع نتيجة')),
        ])),
      ),
    );
  }
}

// ============================================================
// 3. Navigator.pushReplacement
// ============================================================
class _PushReplacementPage extends StatelessWidget {
  const _PushReplacementPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('Navigator.pushReplacement', Colors.orange),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.swap_horiz, size: 64, color: Colors.orange),
          const SizedBox(height: 16),
          const Text('pushReplacement', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          _infoBox(
            '• يستبدل الصفحة الحالية بصفحة جديدة\n'
                '• لا يمكن الرجوع للصفحة السابقة\n'
                '• مثالي لشاشات: تسجيل الدخول → الرئيسية',
            Colors.orange,
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const _SecondPage(title: 'استُبدلت هذه الصفحة', color: Colors.orange)),
            ),
            icon: const Icon(Icons.swap_horiz),
            label: const Text('pushReplacement (لا رجوع)'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
          ),
        ])),
      ),
    );
  }
}

// ============================================================
// 4. Navigator.pushAndRemoveUntil
// ============================================================
class _PushAndRemoveUntilPage extends StatelessWidget {
  const _PushAndRemoveUntilPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('pushAndRemoveUntil', Colors.red),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.clear_all, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          const Text('pushAndRemoveUntil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          _infoBox(
            '• يُضيف صفحة جديدة ويحذف المكدس كله\n'
                '• (route) => false → يحذف كل الصفحات\n'
                '• (route) => route.isFirst → يبقي الأولى فقط\n'
                '• مثالي: بعد تسجيل الخروج',
            Colors.red,
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const _SecondPage(title: 'المكدس مُعاد تعيينه!', color: Colors.red)),
                  (route) => false,
            ),
            icon: const Icon(Icons.delete_sweep),
            label: const Text('حذف كل المكدس'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
          ),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const _SecondPage(title: 'أُبقيت الصفحة الأولى', color: Colors.red)),
                  (route) => route.isFirst,
            ),
            icon: const Icon(Icons.first_page),
            label: const Text('إبقاء الصفحة الأولى'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade700, foregroundColor: Colors.white),
          ),
        ])),
      ),
    );
  }
}

// ============================================================
// 5. Navigator.popUntil
// ============================================================
class _PopUntilPage extends StatelessWidget {
  const _PopUntilPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('Navigator.popUntil', Colors.purple),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.fast_rewind, size: 64, color: Colors.purple),
          const SizedBox(height: 16),
          const Text('Navigator.popUntil', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          _infoBox(
            '• يرجع لعدة صفحات دفعة واحدة\n'
                '• يتوقف عند أول route يُحقق الشرط\n'
                '• (route) => route.isFirst → للصفحة الأولى\n'
                '• مثالي: إلغاء عملية متعددة الخطوات',
            Colors.purple,
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _PopUntilLevel2())),
            icon: const Icon(Icons.arrow_forward),
            label: const Text('ادخل في عدة صفحات'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple, foregroundColor: Colors.white),
          ),
        ])),
      ),
    );
  }
}

class _PopUntilLevel2 extends StatelessWidget {
  const _PopUntilLevel2();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('المستوى 2', Colors.purple),
        body: Center(child: ElevatedButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _PopUntilLevel3())),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.purple, foregroundColor: Colors.white),
          child: const Text('المستوى 3 ←'),
        )),
      ),
    );
  }
}

class _PopUntilLevel3 extends StatelessWidget {
  const _PopUntilLevel3();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('المستوى 3', Colors.purple),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('أنت في المستوى 3', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple, foregroundColor: Colors.white),
            child: const Text('popUntil → الصفحة الأولى مباشرة!'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey, foregroundColor: Colors.white),
            child: const Text('pop عادي (للمستوى 2)'),
          ),
        ])),
      ),
    );
  }
}

// ============================================================
// 6. Navigator.pushNamed
// ============================================================
class _PushNamedPage extends StatelessWidget {
  const _PushNamedPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('Navigator.pushNamed', Colors.teal),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.route, size: 64, color: Colors.teal),
          const SizedBox(height: 16),
          const Text('pushNamed', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          _infoBox(
            '• يستخدم اسم المسار بدلاً من الـ Widget\n'
                '• يجب تعريف المسار في routes: {}\n'
                '• يمكن تمرير arguments',
            Colors.teal,
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () => Navigator.pushNamed(context, '/details'),
            icon: const Icon(Icons.arrow_forward),
            label: const Text("pushNamed('/details')"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, foregroundColor: Colors.white),
          ),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: () => Navigator.pushNamed(context, '/profile', arguments: {'name': 'User', 'age': 22}),
            icon: const Icon(Icons.person),
            label: const Text("pushNamed مع arguments"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal.shade700, foregroundColor: Colors.white),
          ),
        ])),
      ),
    );
  }
}

// ============================================================
// 7. pushReplacementNamed
// ============================================================
class _PushReplacementNamedPage extends StatelessWidget {
  const _PushReplacementNamedPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('pushReplacementNamed', Colors.indigo),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.swap_horiz, size: 64, color: Colors.indigo),
          _infoBox('pushReplacementNamed = pushNamed + استبدال\nيستبدل الصفحة الحالية بالمسار المحدد', Colors.indigo),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/settings'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, foregroundColor: Colors.white),
            child: const Text("pushReplacementNamed('/settings')"),
          ),
        ])),
      ),
    );
  }
}

// ============================================================
// 8. pushNamedAndRemoveUntil
// ============================================================
class _PushNamedRemovePage extends StatelessWidget {
  const _PushNamedRemovePage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('pushNamedAndRemoveUntil', Colors.pink),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.delete_forever, size: 64, color: Colors.pink),
          _infoBox('pushNamedAndRemoveUntil = Named + حذف المكدس\nيُستخدم كثيراً بعد تسجيل الدخول', Colors.pink),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.pink, foregroundColor: Colors.white),
            child: const Text("pushNamedAndRemoveUntil('/home')"),
          ),
        ])),
      ),
    );
  }
}

// ============================================================
// 9. تمرير البيانات
// ============================================================
class _PassDataPage extends StatelessWidget {
  const _PassDataPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('تمرير البيانات (Arguments)', Colors.cyan.shade700),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.send, size: 64, color: Colors.cyan),
          _infoBox(
            'طرق تمرير البيانات:\n'
                '1. عبر constructor: أسهل وأوضح\n'
                '2. عبر arguments (Named Routes)\n'
                '3. عبر RouteSettings\n'
                '4. عبر InheritedWidget / Provider',
            Colors.cyan.shade700,
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () => Navigator.push(context, MaterialPageRoute(
              builder: (_) => const _ReceiveDataPage(
                name: 'User',
                age: 25,
                data: {'city': '???', 'job': 'Flutter Dev'},
              ),
            )),
            icon: const Icon(Icons.arrow_forward),
            label: const Text('تمرير عبر constructor'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan.shade700, foregroundColor: Colors.white),
          ),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: () => Navigator.push(context, MaterialPageRoute(
              settings: const RouteSettings(name: '/data', arguments: {'key': 'value', 'number': 42}),
              builder: (_) => const _RouteSettingsReceivePage(),
            )),
            icon: const Icon(Icons.settings),
            label: const Text('تمرير عبر RouteSettings'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan.shade800, foregroundColor: Colors.white),
          ),
        ])),
      ),
    );
  }
}

class _ReceiveDataPage extends StatelessWidget {
  final String name;
  final int age;
  final Map<String, dynamic> data;
  const _ReceiveDataPage({required this.name, required this.age, required this.data});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('استقبال البيانات', Colors.cyan.shade700),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.download, size: 48, color: Colors.cyan),
          const SizedBox(height: 12),
          Text('الاسم: $name', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text('العمر: $age', style: const TextStyle(fontSize: 16)),
          ...data.entries.map((e) => Text('${e.key}: ${e.value}', style: const TextStyle(fontSize: 14))),
        ])),
      ),
    );
  }
}

// ============================================================
// 10. استقبال النتيجة
// ============================================================
class _ReceiveResultPage extends StatefulWidget {
  const _ReceiveResultPage();
  @override
  State<_ReceiveResultPage> createState() => _ReceiveResultPageState();
}

class _ReceiveResultPageState extends State<_ReceiveResultPage> {
  String _result = 'لا يوجد نتيجة بعد';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('استقبال Result من pop', Colors.deepOrange),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.call_received, size: 64, color: Colors.deepOrange),
          const SizedBox(height: 16),
          Text('النتيجة: "$_result"', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          _infoBox('• push يُعيد Future\n• await على النتيجة\n• pop(context, value) يُرسل القيمة', Colors.deepOrange),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () async {
              final result = await Navigator.push<String>(
                context,
                MaterialPageRoute(builder: (_) => const _SendResultPage()),
              );
              if (!context.mounted) return;
              if (result != null) setState(() => _result = result);
            },
            icon: const Icon(Icons.arrow_forward),
            label: const Text('انتقل وانتظر النتيجة'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange, foregroundColor: Colors.white),
          ),
        ])),
      ),
    );
  }
}

class _SendResultPage extends StatelessWidget {
  const _SendResultPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('إرسال النتيجة', Colors.deepOrange),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('اختر نتيجة لإرسالها:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ...['✅ تم القبول', '❌ تم الرفض', '⏳ لاحقاً', '📝 تم الحفظ'].map((r) =>
              Padding(padding: const EdgeInsets.only(bottom: 8), child: ElevatedButton(
                onPressed: () => Navigator.pop(context, r),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange, foregroundColor: Colors.white, minimumSize: const Size(200, 44)),
                child: Text(r),
              ))),
          ElevatedButton(onPressed: () => Navigator.pop(context), style: ElevatedButton.styleFrom(backgroundColor: Colors.grey, foregroundColor: Colors.white), child: const Text('إلغاء (بدون نتيجة)')),
        ])),
      ),
    );
  }
}

// ============================================================
// 11. MaterialPageRoute
// ============================================================
class _MaterialRoutePage extends StatelessWidget {
  const _MaterialRoutePage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('MaterialPageRoute', Colors.brown),
        body: SingleChildScrollView(padding: const EdgeInsets.all(16), child: Column(children: [
          _infoBox(
            'MaterialPageRoute خصائصه:\n'
                '• builder: (ctx) => Widget → الصفحة\n'
                '• settings: RouteSettings → الاسم والـ arguments\n'
                '• fullscreenDialog: true → كـ Dialog من الأسفل\n'
                '• maintainState: true → يحافظ على حالة الصفحة\n'
                '• allowSnapshotting: true → للأداء',
            Colors.brown,
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _SecondPage(title: 'MaterialPageRoute عادي', color: Colors.brown))),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.brown, foregroundColor: Colors.white, minimumSize: const Size.fromHeight(44)),
            child: const Text('MaterialPageRoute عادي'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(
              fullscreenDialog: true,
              builder: (_) => const _SecondPage(title: 'fullscreenDialog: true', color: Colors.brown),
            )),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.brown.shade700, foregroundColor: Colors.white, minimumSize: const Size.fromHeight(44)),
            child: const Text('fullscreenDialog: true'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(
              maintainState: false,
              builder: (_) => const _SecondPage(title: 'maintainState: false', color: Colors.brown),
            )),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.brown.shade900, foregroundColor: Colors.white, minimumSize: const Size.fromHeight(44)),
            child: const Text('maintainState: false'),
          ),
        ])),
      ),
    );
  }
}

// ============================================================
// 12. CupertinoPageRoute
// ============================================================
class _CupertinoRoutePage extends StatelessWidget {
  const _CupertinoRoutePage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('CupertinoPageRoute', Colors.blueGrey),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.apple, size: 64, color: Colors.blueGrey),
          _infoBox('CupertinoPageRoute:\n• انتقال من اليمين (iOS style)\n• يدعم السحب من الحافة للرجوع\n• مثالي للتوافق مع iOS', Colors.blueGrey),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () => Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const _SecondPage(title: 'iOS Style Animation', color: Colors.blueGrey),
                transitionsBuilder: (_, animation, __, child) {
                  return SlideTransition(
                    position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                        .animate(CurvedAnimation(parent: animation, curve: Curves.linearToEaseOut)),
                    child: child,
                  );
                },
              ),
            ),
            icon: const Icon(Icons.arrow_forward),
            label: const Text('انتقال iOS من اليمين'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey, foregroundColor: Colors.white),
          ),
        ])),
      ),
    );
  }
}

// ============================================================
// 13. PageRouteBuilder
// ============================================================
class _PageRouteBuilderPage extends StatelessWidget {
  const _PageRouteBuilderPage();

  Route _buildRoute(Widget page, {Duration duration = const Duration(milliseconds: 500)}) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (_, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('PageRouteBuilder', Colors.lime.shade700),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _infoBox(
            'PageRouteBuilder:\n'
                '• pageBuilder → الصفحة\n'
                '• transitionsBuilder → تأثير الانتقال\n'
                '• transitionDuration → مدة الانتقال\n'
                '• animation → CurvedAnimation للتأثير',
            Colors.lime.shade700,
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => Navigator.push(context, _buildRoute(const _SecondPage(title: 'Fade - 500ms', color: Colors.lime))),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.lime.shade700, foregroundColor: Colors.white, minimumSize: const Size.fromHeight(44)),
            child: const Text('Fade 500ms'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => Navigator.push(context, _buildRoute(const _SecondPage(title: 'Fade - 1000ms', color: Colors.lime), duration: const Duration(milliseconds: 1000))),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.lime.shade800, foregroundColor: Colors.white, minimumSize: const Size.fromHeight(44)),
            child: const Text('Fade 1000ms (بطيء)'),
          ),
        ])),
      ),
    );
  }
}

// ============================================================
// 14. FadeTransition
// ============================================================
class _FadeTransitionPage extends StatelessWidget {
  const _FadeTransitionPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('FadeTransition', Colors.blue.shade700),
        body: Center(child: ElevatedButton.icon(
          onPressed: () => Navigator.push(context, PageRouteBuilder(
            pageBuilder: (_, __, ___) => const _SecondPage(title: 'FadeTransition ✨', color: Colors.blue),
            transitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder: (_, animation, __, child) => FadeTransition(
              opacity: CurvedAnimation(parent: animation, curve: Curves.easeIn),
              child: child,
            ),
          )),
          icon: const Icon(Icons.blur_on),
          label: const Text('FadeTransition'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade700, foregroundColor: Colors.white),
        )),
      ),
    );
  }
}

// ============================================================
// 15. SlideTransition
// ============================================================
class _SlideTransitionPage extends StatelessWidget {
  const _SlideTransitionPage();

  Route _slide(Offset begin) => PageRouteBuilder(
    pageBuilder: (_, __, ___) => _SecondPage(title: 'Slide من $begin', color: Colors.green),
    transitionDuration: const Duration(milliseconds: 400),
    transitionsBuilder: (_, animation, __, child) => SlideTransition(
      position: Tween<Offset>(begin: begin, end: Offset.zero)
          .animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
      child: child,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('SlideTransition', Colors.green.shade700),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _infoBox('SlideTransition من اتجاهات مختلفة:\nOffset(1,0) = من اليمين\nOffset(-1,0) = من اليسار\nOffset(0,1) = من الأسفل\nOffset(0,-1) = من الأعلى', Colors.green),
          const SizedBox(height: 12),
          ...[(const Offset(1, 0), 'من اليمين'), (const Offset(-1, 0), 'من اليسار'), (const Offset(0, 1), 'من الأسفل'), (const Offset(0, -1), 'من الأعلى')].map((pair) =>
              Padding(padding: const EdgeInsets.only(bottom: 8), child: ElevatedButton(
                onPressed: () => Navigator.push(context, _slide(pair.$1)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700, foregroundColor: Colors.white, minimumSize: const Size(200, 44)),
                child: Text('Slide ${pair.$2}'),
              ))),
        ])),
      ),
    );
  }
}

// ============================================================
// 16. ScaleTransition
// ============================================================
class _ScaleTransitionPage extends StatelessWidget {
  const _ScaleTransitionPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('ScaleTransition', Colors.purple.shade700),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _infoBox('ScaleTransition: تكبير/تصغير\nalignment: مركز التكبير', Colors.purple),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => Navigator.push(context, PageRouteBuilder(
              pageBuilder: (_, __, ___) => const _SecondPage(title: 'ScaleTransition 🔍', color: Colors.purple),
              transitionDuration: const Duration(milliseconds: 500),
              transitionsBuilder: (_, animation, __, child) => ScaleTransition(
                scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
                alignment: Alignment.center,
                child: FadeTransition(opacity: animation, child: child),
              ),
            )),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple.shade700, foregroundColor: Colors.white),
            child: const Text('ScaleTransition من المركز'),
          ),
        ])),
      ),
    );
  }
}

// ============================================================
// 17. RotationTransition
// ============================================================
class _RotationTransitionPage extends StatelessWidget {
  const _RotationTransitionPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('RotationTransition', Colors.orange.shade700),
        body: Center(child: ElevatedButton.icon(
          onPressed: () => Navigator.push(context, PageRouteBuilder(
            pageBuilder: (_, __, ___) => const _SecondPage(title: 'RotationTransition 🌀', color: Colors.orange),
            transitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder: (_, animation, __, child) => RotationTransition(
              turns: Tween<double>(begin: 0.5, end: 1.0)
                  .animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
              child: FadeTransition(opacity: animation, child: child),
            ),
          )),
          icon: const Icon(Icons.rotate_right),
          label: const Text('RotationTransition'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade700, foregroundColor: Colors.white),
        )),
      ),
    );
  }
}

// ============================================================
// 18. canPop و maybePop
// ============================================================
class _CanPopPage extends StatelessWidget {
  const _CanPopPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('canPop + maybePop', Colors.red.shade700),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _infoBox(
            '• canPop(): هل يمكن الرجوع؟ (bool)\n'
                '• maybePop(): يرجع إذا أمكن\n'
                '• إذا كانت الصفحة الأولى: canPop() = false',
            Colors.red,
          ),
          const SizedBox(height: 12),
          Text(
            'canPop: ${Navigator.canPop(context)}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () async {
              final didPop = await Navigator.maybePop(context);
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('maybePop نتيجة: $didPop'), backgroundColor: Colors.red),
              );
            },
            icon: const Icon(Icons.help),
            label: const Text('maybePop()'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade700, foregroundColor: Colors.white),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _CanPopChildPage())),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            child: const Text('انتقل لصفحة فرعية'),
          ),
        ])),
      ),
    );
  }
}

class _CanPopChildPage extends StatelessWidget {
  const _CanPopChildPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('صفحة فرعية', Colors.red),
        body: Center(child: Text('canPop هنا: ${Navigator.canPop(context)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
      ),
    );
  }
}

// ============================================================
// 19. WillPopScope / PopScope
// ============================================================
class _WillPopPage extends StatelessWidget {
  const _WillPopPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('WillPopScope / PopScope', Colors.teal.shade700),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _infoBox('WillPopScope / PopScope: يتحكم في سلوك الرجوع\n• canPop: false → يمنع الرجوع\n• onPopInvoked → عند محاولة الرجوع', Colors.teal),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _PopScopePage())),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal.shade700, foregroundColor: Colors.white),
            child: const Text('صفحة مع PopScope'),
          ),
        ])),
      ),
    );
  }
}

class _PopScopePage extends StatefulWidget {
  const _PopScopePage();
  @override
  State<_PopScopePage> createState() => _PopScopePageState();
}

class _PopScopePageState extends State<_PopScopePage> {
  bool _canPop = false;
  bool _formSaved = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: PopScope(
        canPop: _canPop,
        onPopInvoked: (didPop) async {
          if (didPop) return;
          final shouldPop = await showDialog<bool>(
            context: context,
            builder: (_) => Directionality(
              textDirection: TextDirection.rtl,
              child: AlertDialog(
                title: const Text('تأكيد الخروج'),
                content: const Text('هل أنت متأكد من الخروج؟ التغييرات ستُفقد'),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('إلغاء')),
                  ElevatedButton(onPressed: () => Navigator.pop(context, true), style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white), child: const Text('خروج')),
                ],
              ),
            ),
          );
          if (shouldPop == true && context.mounted) Navigator.pop(context);
        },
        child: Scaffold(
          appBar: _appBar('PopScope Demo', Colors.teal),
          body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(Icons.lock, size: 48, color: Colors.teal),
            const SizedBox(height: 12),
            Text('canPop: $_canPop', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('اضغط الرجوع لرؤية التأثير', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('السماح بالرجوع'),
              value: _canPop,
              onChanged: (v) => setState(() => _canPop = v),
              activeColor: Colors.teal,
            ),
            CheckboxListTile(
              title: const Text('تم حفظ النموذج'),
              value: _formSaved,
              onChanged: (v) => setState(() { _formSaved = v!; _canPop = v; }),
              activeColor: Colors.teal,
            ),
          ])),
        ),
      ),
    );
  }
}

// ============================================================
// 20. Navigator.of(context)
// ============================================================
class _NavigatorOfPage extends StatelessWidget {
  const _NavigatorOfPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('Navigator.of + context.mounted', Colors.indigo.shade700),
        body: SingleChildScrollView(padding: const EdgeInsets.all(16), child: Column(children: [
          _infoBox(
            'Navigator.of(context):\n'
                '• مثل Navigator.push(context, ...) لكن أكثر مرونة\n'
                '• rootNavigator: true → يستخدم أعلى Navigator\n'
                '• context.mounted: تحقق قبل استخدام context بعد async',
            Colors.indigo,
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const _SecondPage(title: 'Navigator.of(context)', color: Colors.indigo))),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, foregroundColor: Colors.white, minimumSize: const Size.fromHeight(44)),
            child: const Text('Navigator.of(context).push'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () async {
              await Future.delayed(const Duration(seconds: 1));
              if (!context.mounted) return;
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const _SecondPage(title: 'context.mounted ✅', color: Colors.indigo)));
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo.shade700, foregroundColor: Colors.white, minimumSize: const Size.fromHeight(44)),
            child: const Text('مع context.mounted (بعد async)'),
          ),
          const SizedBox(height: 8),
          _infoBox(
            '// الطريقة الصحيحة بعد await:\n'
                'final result = await someAsyncOperation();\n'
                'if (!context.mounted) return; // ✅ مهم\n'
                'Navigator.of(context).push(...);',
            Colors.indigo,
          ),
        ])),
      ),
    );
  }
}

// ============================================================
// 21. GlobalKey<NavigatorState>
// ============================================================
// ✅ تم تعريف المفتاح العالمي
final GlobalKey<NavigatorState> _globalNavKey = GlobalKey<NavigatorState>();

class _GlobalKeyNavPage extends StatelessWidget {
  const _GlobalKeyNavPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('GlobalKey<NavigatorState>', Colors.pink.shade700),
        body: SingleChildScrollView(padding: const EdgeInsets.all(16), child: Column(children: [
          _infoBox(
            'GlobalKey<NavigatorState>:\n'
                '• يسمح بالتنقل بدون BuildContext\n'
                '• مفيد في: services, blocs, notifications\n'
                '• يُعرَّف خارج الـ Widget\n'
                '• يُمرَّر لـ MaterialApp كـ navigatorKey',
            Colors.pink,
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade900,
            ),
            child: const Text(
              '// التعريف (خارج الـ Widget):\n'
                  'final navKey = GlobalKey<NavigatorState>();\n\n'
                  '// في MaterialApp:\n'
                  'MaterialApp(navigatorKey: navKey, ...)\n\n'
                  '// الاستخدام بدون context:\n'
                  'navKey.currentState?.push(...)',
              style: TextStyle(color: Colors.greenAccent, fontSize: 11, fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => _globalNavKey.currentState?.push(
              MaterialPageRoute(builder: (_) => const _SecondPage(title: 'تنقل عبر GlobalKey', color: Colors.pink)),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.pink.shade700, foregroundColor: Colors.white, minimumSize: const Size.fromHeight(44)),
            child: const Text('تنقل عبر _globalNavKey'),
          ),
        ])),
      ),
    );
  }
}

// ============================================================
// 22. Named Routes Info
// ============================================================
class _NamedRoutesInfoPage extends StatelessWidget {
  const _NamedRoutesInfoPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('Named Routes', Colors.deepPurple),
        body: SingleChildScrollView(padding: const EdgeInsets.all(16), child: Column(children: [
          _infoBox(
            'Named Routes:\n'
                '• تُعرَّف في MaterialApp.routes: {}\n'
                '• initialRoute: الصفحة الأولى\n'
                '• مثالي للمشاريع الصغيرة\n'
                '• للمشاريع الكبيرة: GoRouter أفضل',
            Colors.deepPurple,
          ),
          const SizedBox(height: 12),
          ...{
            '/': 'الصفحة الرئيسية',
            '/details': 'صفحة التفاصيل',
            '/profile': 'الملف الشخصي',
            '/settings': 'الإعدادات',
          }.entries.map((e) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, e.key),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple, foregroundColor: Colors.white, minimumSize: const Size.fromHeight(44)),
              child: Text("pushNamed('${e.key}') → ${e.value}"),
            ),
          )),
        ])),
      ),
    );
  }
}

// ============================================================
// 23. onGenerateRoute
// ============================================================
class _OnGenerateRoutePage extends StatelessWidget {
  const _OnGenerateRoutePage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('onGenerateRoute', Colors.deepOrange),
        body: SingleChildScrollView(padding: const EdgeInsets.all(16), child: Column(children: [
          _infoBox(
            'onGenerateRoute:\n'
                '• يُعالج المسارات الديناميكية\n'
                '• يُستدعى عندما لا يجد routes: {} المسار\n'
                '• يمكن parse المسارات مثل: /product/123',
            Colors.deepOrange,
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/dynamic', arguments: {'from': 'GenerateRoute', 'id': 42}),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange, foregroundColor: Colors.white, minimumSize: const Size.fromHeight(44)),
            child: const Text("pushNamed('/dynamic') مع arguments"),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/product/PRD-2024'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange.shade700, foregroundColor: Colors.white, minimumSize: const Size.fromHeight(44)),
            child: const Text("pushNamed('/product/PRD-2024') - مسار ديناميكي"),
          ),
        ])),
      ),
    );
  }
}

// ============================================================
// 24. onUnknownRoute
// ============================================================
class _OnUnknownRoutePage extends StatelessWidget {
  const _OnUnknownRoutePage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('onUnknownRoute', Colors.brown.shade700),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _infoBox('onUnknownRoute:\n• يُستدعى عند مسار غير موجود\n• مثل صفحة 404 في الويب\n• الأخير في سلسلة: routes → onGenerateRoute → onUnknownRoute', Colors.brown),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/nonexistent-page-404'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.brown.shade700, foregroundColor: Colors.white),
            child: const Text("pushNamed('/nonexistent') → onUnknownRoute"),
          ),
        ])),
      ),
    );
  }
}

// ============================================================
// 25. RouteSettings
// ============================================================
class _RouteSettingsPage extends StatelessWidget {
  const _RouteSettingsPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('RouteSettings + ModalRoute.of', Colors.cyan.shade800),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _infoBox('RouteSettings:\n• name: اسم المسار\n• arguments: البيانات\n\nModalRoute.of(context):\n• يقرأ RouteSettings من أي Widget', Colors.cyan),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(
              settings: const RouteSettings(name: '/custom', arguments: {'key': 'value', 'number': 99}),
              builder: (_) => const _RouteSettingsReceivePage(),
            )),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan.shade800, foregroundColor: Colors.white),
            child: const Text('push مع RouteSettings مخصص'),
          ),
        ])),
      ),
    );
  }
}

class _RouteSettingsReceivePage extends StatelessWidget {
  const _RouteSettingsReceivePage();
  @override
  Widget build(BuildContext context) {
    final settings = ModalRoute.of(context)?.settings;
    final args = settings?.arguments as Map<String, dynamic>?;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('RouteSettings المستقبَلة', Colors.cyan.shade800),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.receipt, size: 48, color: Colors.cyan),
          const SizedBox(height: 12),
          Text('name: ${settings?.name ?? "غير معروف"}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('arguments:', style: TextStyle(fontWeight: FontWeight.bold)),
          ...(args?.entries ?? []).map((e) => Text('${e.key}: ${e.value}')),
        ])),
      ),
    );
  }
}

// ============================================================
// 26. Nested Navigation
// ============================================================
class _NestedNavPage extends StatefulWidget {
  const _NestedNavPage();
  @override
  State<_NestedNavPage> createState() => _NestedNavPageState();
}

class _NestedNavPageState extends State<_NestedNavPage> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('Nested Navigator', Colors.green.shade800),
        body: IndexedStack(
          index: _tab,
          children: [
            Navigator(
              onGenerateRoute: (_) => MaterialPageRoute(builder: (_) => const _NestedTab(tab: 0, label: 'الرئيسية', color: Colors.blue)),
            ),
            Navigator(
              onGenerateRoute: (_) => MaterialPageRoute(builder: (_) => const _NestedTab(tab: 1, label: 'البحث', color: Colors.green)),
            ),
            Navigator(
              onGenerateRoute: (_) => MaterialPageRoute(builder: (_) => const _NestedTab(tab: 2, label: 'الإعدادات', color: Colors.orange)),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _tab,
          onTap: (i) => setState(() => _tab = i),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'بحث'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'إعدادات'),
          ],
        ),
      ),
    );
  }
}

class _NestedTab extends StatelessWidget {
  final int tab;
  final String label;
  final Color color;
  const _NestedTab({required this.tab, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.withOpacity(0.05),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(label, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
        const SizedBox(height: 12),
        const Text('Navigator مستقل لكل تبويب\nالتنقل لا يؤثر على التبويبات الأخرى', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => _SecondPage(title: 'صفحة فرعية في $label', color: color))),
          style: ElevatedButton.styleFrom(backgroundColor: color, foregroundColor: Colors.white),
          child: Text('push داخل $label'),
        ),
      ])),
    );
  }
}

// ============================================================
// 27. NavigatorObserver
// ============================================================
class _AppNavigatorObserver extends NavigatorObserver {
  final List<String> log;
  _AppNavigatorObserver(this.log);

  @override
  void didPush(Route route, Route? previousRoute) {
    log.add('push → ${route.settings.name ?? 'unnamed'}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    log.add('pop ← ${route.settings.name ?? 'unnamed'}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    log.add('replace: ${oldRoute?.settings.name} → ${newRoute?.settings.name}');
  }
}

class _ObserverPage extends StatefulWidget {
  const _ObserverPage();
  @override
  State<_ObserverPage> createState() => _ObserverPageState();
}

class _ObserverPageState extends State<_ObserverPage> {
  final List<String> _log = [];
  late final _AppNavigatorObserver _observer;

  @override
  void initState() {
    super.initState();
    _observer = _AppNavigatorObserver(_log);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('NavigatorObserver', Colors.purple.shade800),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(children: [
              _infoBox('NavigatorObserver:\n• يراقب كل عمليات التنقل\n• didPush / didPop / didReplace / didRemove\n• يُمرَّر لـ MaterialApp.navigatorObservers', Colors.purple),
              const SizedBox(height: 8),
              Row(children: [
                Expanded(child: ElevatedButton(
                  onPressed: () {
                    final newRoute = MaterialPageRoute(
                      settings: const RouteSettings(name: '/observed'),
                      builder: (_) => const _SecondPage(title: 'صفحة مُراقَبة', color: Colors.purple),
                    );
                    _observer.didPush(newRoute, null);
                    setState(() {});
                    Navigator.push(context, newRoute).then((_) {
                      _observer.didPop(newRoute, null);
                      setState(() {});
                    });
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.purple, foregroundColor: Colors.white),
                  child: const Text('push مُراقَب'),
                )),
                const SizedBox(width: 8),
                ElevatedButton(onPressed: () => setState(() => _log.clear()), style: ElevatedButton.styleFrom(backgroundColor: Colors.grey, foregroundColor: Colors.white), child: const Text('مسح')),
              ]),
            ]),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _log.length,
              itemBuilder: (_, i) => Container(
                margin: const EdgeInsets.only(bottom: 4),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(color: Colors.purple.shade50, borderRadius: BorderRadius.circular(8)),
                child: Text('${_log.length - i}. ${_log[_log.length - 1 - i]}', style: TextStyle(color: Colors.purple.shade700, fontSize: 13)),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 28. Hero Animation
// ============================================================
class _HeroPage extends StatelessWidget {
  const _HeroPage();

  final List<Map<String, dynamic>> _items = const [
    {'tag': 'hero_1', 'color': Colors.blue, 'icon': Icons.star, 'title': 'النجم'},
    {'tag': 'hero_2', 'color': Colors.green, 'icon': Icons.favorite, 'title': 'المفضلة'},
    {'tag': 'hero_3', 'color': Colors.orange, 'icon': Icons.diamond, 'title': 'الماسة'},
    {'tag': 'hero_4', 'color': Colors.purple, 'icon': Icons.rocket_launch, 'title': 'الصاروخ'},
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('Hero Animation 🦸', Colors.red.shade800),
        body: Column(children: [
          _infoBox('Hero Animation:\n• يُنشئ انتقالاً سلساً للـ Widget بين صفحتين\n• يجب أن يكون لهما نفس tag\n• يعمل تلقائياً مع Navigator.push', Colors.red),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
              itemCount: _items.length,
              itemBuilder: (_, i) {
                final item = _items[i];
                return GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => _HeroDetailPage(item: item))),
                  child: Hero(
                    tag: item['tag'] as String,
                    child: Card(
                      elevation: 4,
                      color: (item['color'] as Color).withOpacity(0.15),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Icon(item['icon'] as IconData, size: 48, color: item['color'] as Color),
                        const SizedBox(height: 8),
                        Text(item['title'] as String, style: TextStyle(fontWeight: FontWeight.bold, color: item['color'] as Color)),
                      ]),
                    ),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}

class _HeroDetailPage extends StatelessWidget {
  final Map<String, dynamic> item;
  const _HeroDetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar(item['title'] as String, item['color'] as Color),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Hero(
            tag: item['tag'] as String,
            child: Container(
              width: 180, height: 180,
              decoration: BoxDecoration(color: (item['color'] as Color).withOpacity(0.15), shape: BoxShape.circle),
              child: Icon(item['icon'] as IconData, size: 90, color: item['color'] as Color),
            ),
          ),
          const SizedBox(height: 24),
          Text(item['title'] as String, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: item['color'] as Color)),
          const SizedBox(height: 8),
          const Text('Hero Animation يربط العنصرين\nبين صفحتين بنفس الـ tag', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
        ])),
      ),
    );
  }
}

// ============================================================
// 29. Navigator 2.0
// ============================================================
class _Navigator2Page extends StatelessWidget {
  const _Navigator2Page();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('Navigator 2.0', Colors.blue.shade800),
        body: SingleChildScrollView(padding: const EdgeInsets.all(16), child: Column(children: [
          _infoBox(
            'Navigator 2.0 - المفاهيم الأساسية:\n\n'
                '1. Router Widget: يستبدل MaterialApp\n'
                '2. RouterDelegate: يُبني المكدس\n'
                '3. RouteInformationParser: يُحلل URL\n'
                '4. RouteInformationProvider: مصدر URL\n\n'
                'متى تستخدمه؟\n'
                '• Flutter Web (URL في المتصفح)\n'
                '• Deep Links المعقدة\n'
                '• للمشاريع الكبيرة: GoRouter أسهل',
            Colors.blue,
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade900,
            ),
            child: const Text(
              '// Navigator 2.0 هيكل بسيط:\n'
                  'MaterialApp.router(\n'
                  '  routerDelegate: MyDelegate(),\n'
                  '  routeInformationParser: MyParser(),\n'
                  ')\n\n'
                  '// RouterDelegate:\n'
                  'class MyDelegate extends RouterDelegate {\n'
                  '  @override\n'
                  '  Widget build(context) => Navigator(\n'
                  '    pages: [...], // قائمة الصفحات\n'
                  '    onPopPage: (route, result) {...},\n'
                  '  );\n'
                  '}',
              style: TextStyle(color: Colors.greenAccent, fontSize: 11, fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 8),
          _infoBox('💡 نصيحة: للمشاريع الجديدة استخدم\nGoRouter أو AutoRoute بدلاً من Navigator 2.0 مباشرةً', Colors.amber),
        ])),
      ),
    );
  }
}

// ============================================================
// 30. GoRouter Info
// ============================================================
class _GoRouterInfoPage extends StatelessWidget {
  const _GoRouterInfoPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('GoRouter', Colors.orange.shade800),
        body: SingleChildScrollView(padding: const EdgeInsets.all(16), child: Column(children: [
          _infoBox(
            'GoRouter - مكتبة Google الرسمية:\n'
                '• تعتمد على Navigator 2.0\n'
                '• دعم Deep Links\n'
                '• URL-based routing\n'
                '• Redirect (إعادة التوجيه)\n'
                '• ShellRoute (Bottom Navigation)\n'
                '• GoRouterObserver\n\n'
                'التثبيت:\ngo_router: ^latest',
            Colors.orange,
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade900,
            ),
            child: const Text(
              '// إعداد GoRouter:\n'
                  'final router = GoRouter(\n'
                  '  initialLocation: "/",\n'
                  '  routes: [\n'
                  '    GoRoute(\n'
                  '      path: "/",\n'
                  '      builder: (ctx, state) => HomePage(),\n'
                  '    ),\n'
                  '    GoRoute(\n'
                  '      path: "/profile/:id",\n'
                  '      builder: (ctx, state) =>\n'
                  '        ProfilePage(id: state.pathParameters["id"]),\n'
                  '    ),\n'
                  '  ],\n'
                  '  redirect: (ctx, state) {\n'
                  '    if (!isLoggedIn) return "/login";\n'
                  '    return null;\n'
                  '  },\n'
                  ');\n\n'
                  '// الاستخدام:\n'
                  'context.go("/profile/123");\n'
                  'context.push("/details");\n'
                  'context.pop();\n'
                  'context.goNamed("profile", pathParameters: {"id": "1"});',
              style: TextStyle(color: Colors.greenAccent, fontSize: 10, fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 8),
          _infoBox(
            'GoRoute vs Named Routes:\n'
                '• GoRoute: URL، Deep links، Web ✅\n'
                '• Named Routes: بسيط، صغير ✅\n\n'
                'الدوال:\n'
                '• go(): يستبدل المكدس\n'
                '• push(): يُضيف للمكدس\n'
                '• pop(): يرجع\n'
                '• replace(): يستبدل الصفحة الحالية',
            Colors.orange,
          ),
        ])),
      ),
    );
  }
}

// ============================================================
// صفحات Named Routes
// ============================================================
class _NamedRoutePage extends StatelessWidget {
  const _NamedRoutePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('/details - Named Route', Colors.teal),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.route, size: 64, color: Colors.teal),
          const Text('/details', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const Text('Named Route من routes: {}', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: () => Navigator.pop(context), style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, foregroundColor: Colors.white), child: const Text('pop ←')),
        ])),
      ),
    );
  }
}

class _ProfileNamedPage extends StatelessWidget {
  const _ProfileNamedPage({super.key});
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('/profile - Named Route', Colors.teal),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.person, size: 64, color: Colors.teal),
          const Text('/profile', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          if (args != null) ...args.entries.map((e) => Text('${e.key}: ${e.value}')),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: () => Navigator.pop(context), style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, foregroundColor: Colors.white), child: const Text('pop ←')),
        ])),
      ),
    );
  }
}

class _SettingsNamedPage extends StatelessWidget {
  const _SettingsNamedPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('/settings', Colors.indigo),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.settings, size: 64, color: Colors.indigo),
          const Text('/settings', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: () => Navigator.pop(context), style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, foregroundColor: Colors.white), child: const Text('pop ←')),
        ])),
      ),
    );
  }
}

class _DynamicRoutePage extends StatelessWidget {
  final Map<String, dynamic>? args;
  const _DynamicRoutePage({this.args});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('/dynamic - onGenerateRoute', Colors.deepOrange),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.dynamic_form, size: 64, color: Colors.deepOrange),
          const Text('مسار ديناميكي', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          if (args != null) ...args!.entries.map((e) => Text('${e.key}: ${e.value}')),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: () => Navigator.pop(context), style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange, foregroundColor: Colors.white), child: const Text('pop ←')),
        ])),
      ),
    );
  }
}

class _ProductPage extends StatelessWidget {
  final String id;
  const _ProductPage({required this.id});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('/product/$id', Colors.deepOrange),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.shopping_bag, size: 64, color: Colors.deepOrange),
          Text('المنتج: $id', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const Text('مسار ديناميكي /product/:id', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: () => Navigator.pop(context), style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange, foregroundColor: Colors.white), child: const Text('pop ←')),
        ])),
      ),
    );
  }
}

class _UnknownPage extends StatelessWidget {
  const _UnknownPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('404 - صفحة غير موجودة', Colors.brown),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.error_outline, size: 80, color: Colors.brown),
          const Text('404', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.brown)),
          const Text('الصفحة غير موجودة!', style: TextStyle(fontSize: 18)),
          const Text('onUnknownRoute يُعالج هذه الحالة', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),
          ElevatedButton.icon(onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false), icon: const Icon(Icons.home), label: const Text('الرئيسية'), style: ElevatedButton.styleFrom(backgroundColor: Colors.brown, foregroundColor: Colors.white)),
        ])),
      ),
    );
  }
}

// ============================================================
// صفحة ثانية مساعدة
// ============================================================
class _SecondPage extends StatelessWidget {
  final String title;
  final Color color;
  const _SecondPage({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 13)),
          backgroundColor: color,
          centerTitle: true,
        ),
        backgroundColor: color.withOpacity(0.05),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.check_circle, size: 80, color: color),
          const SizedBox(height: 16),
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color), textAlign: TextAlign.center),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            label: const Text('Navigator.pop ←'),
            style: ElevatedButton.styleFrom(backgroundColor: color, foregroundColor: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            'canPop: ${Navigator.canPop(context)}',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
        ])),
      ),
    );
  }
}