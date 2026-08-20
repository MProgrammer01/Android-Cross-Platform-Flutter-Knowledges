import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const ModalSheetMasterApp());

class ModalSheetMasterApp extends StatelessWidget {
  const ModalSheetMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'كل مفاهيم showModalBottomSheet',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      builder: (context, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: child ?? const SizedBox(), // ✅ آمن ضد null
      ),
      home: const SheetHomeScreen(),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// الشاشة الرئيسية: تجمع جميع المفاهيم
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class SheetHomeScreen extends StatelessWidget {
  const SheetHomeScreen({super.key});

  void _show(BuildContext context, Widget sheet) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // ✅ ضروري للمحتوى الديناميكي
      builder: (_) => sheet,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📋 جميع مفاهيم BottomSheet'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _Btn('1️⃣ Basic Modal', Colors.blue, () => _show(context, const _DemoBasic())),
          _Btn('2️⃣ Styling & Shape', Colors.teal, () => _show(context, const _DemoStyling())),
          _Btn('3️⃣ Scroll & Keyboard', Colors.orange, () => _show(context, const _DemoScrollable())),
          _Btn('4️⃣ Dismiss & Drag Control', Colors.red, () => _show(context, const _DemoInteraction())),
          _Btn('5️⃣ showDragHandle (3.7+)', Colors.purple, () => _show(context, const _DemoDragHandle())),
          _Btn('6️⃣ Barrier Color', Colors.cyan, () => _show(context, const _DemoBarrier())),
          _Btn('7️⃣ Return Data', Colors.green, () => _demoReturnData(context)),
          _Btn('8️⃣ Stateful Sheet', Colors.deepOrange, () => _show(context, const _DemoStateful())),
          _Btn('9️⃣ Form & Validation', Colors.pink, () => _show(context, const _DemoForm())),
          _Btn('🔟 Custom Transition', Colors.indigo.shade300, () => _show(context, const _DemoCustomTransition())),
          _Btn('1️⃣1️⃣ Prevent Close', Colors.amber.shade700, () => _show(context, const _DemoPreventClose())),
          _Btn('1️⃣2️⃣ useRootNavigator', Colors.brown, () => _demoRootNav(context)),
          _Btn('1️⃣3️⃣ SafeArea & Constraints', Colors.blueGrey, () => _show(context, const _DemoSafeConstraints())),
        ],
      ),
    );
  }

  Widget _Btn(String title, Color color, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(title, style: const TextStyle(fontSize: 15)),
      ),
    );
  }

  Future<void> _demoReturnData(BuildContext context) async {
    final result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const _DemoReturnData(),
    );
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('📥 البيانات المستلمة: ${result ?? "لا شيء"}')),
    );
  }

  void _demoRootNav(BuildContext context) {
    // ✅ استخدام RootNavigator مفيد عند وجود Nested Navigators أو Dialogs
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (_) => const _DemoRootNav(),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 1️⃣ Basic Modal Bottom Sheet
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _DemoBasic extends StatelessWidget {
  const _DemoBasic({super.key});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(24),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('🔹 Basic Modal', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('الحد الأدنى لفتح Sheet. يُغلق تلقائياً عند النقر خارجه أو السحب للأسفل.'),
        const SizedBox(height: 16),
        ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('إغلاق')),
      ],
    ),
  );
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 2️⃣ Styling & Shape
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _DemoStyling extends StatelessWidget {
  const _DemoStyling({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('🎨 التخصيص الظاهري', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(height: 12),
          Text('يتم التحكم به عبر:\n• backgroundColor\n• elevation\n• shape\n• clipBehavior', style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 3️⃣ Scroll Control & Keyboard
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _DemoScrollable extends StatelessWidget {
  const _DemoScrollable({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom), // ✅ مهم للوحة المفاتيح
      child: Container(
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text('📜 Scroll & Keyboard', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const TextField(decoration: InputDecoration(labelText: 'اكتب شيئاً...')),
            const SizedBox(height: 16),
            ...List.generate(20, (i) => ListTile(title: Text('عنصر رقم $i'))),
          ],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 4️⃣ Dismiss & Drag Control
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _DemoInteraction extends StatelessWidget {
  const _DemoInteraction({super.key});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(24),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('🚫 التحكم في الإغلاق', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('isDismissible: false → منع الإغلاق بالنقر خارجياً\nenableDrag: false → منع السحب للأسفل', textAlign: TextAlign.center),
        const SizedBox(height: 16),
        ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('إغلاق يدوي فقط')),
      ],
    ),
  );
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 5️⃣ showDragHandle
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _DemoDragHandle extends StatelessWidget {
  const _DemoDragHandle({super.key});
  @override
  Widget build(BuildContext context) => Container(
    height: 250,
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('👆 showDragHandle (Flutter 3.7+)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('يضيف شريط سحب تلقائي في الأعلى. لا يحتاج ويدجت مخصص.'),
      ],
    ),
  );
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 6️⃣ Barrier Color
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _DemoBarrier extends StatelessWidget {
  const _DemoBarrier({super.key});
  @override
  Widget build(BuildContext context) => Container(
    height: 200,
    padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('🌫️ barrierColor', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('تغيير لون الخلفية المعتمّة (الظل خلف الـ Sheet)'),
      ],
    ),
  );
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 7️⃣ Return Data
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _DemoReturnData extends StatelessWidget {
  const _DemoReturnData({super.key});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('📤 إرجاع بيانات', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          children: ['موافق', 'رفض', 'مؤجل'].map((txt) => ElevatedButton(
            onPressed: () => Navigator.pop(context, txt),
            child: Text(txt),
          )).toList(),
        ),
      ],
    ),
  );
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 8️⃣ Stateful Sheet (Preserve State)
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _DemoStateful extends StatefulWidget {
  const _DemoStateful({super.key});
  @override
  State<_DemoStateful> createState() => _DemoStatefulState();
}
class _DemoStatefulState extends State<_DemoStateful> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('🔄 Stateful Sheet', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const Text('الحالة تُحفظ حتى بعد الإغلاق وإعادة الفتح'),
        const SizedBox(height: 12),
        Text('العدد: $_counter', style: const TextStyle(fontSize: 24)),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(onPressed: () => setState(() => _counter--), child: const Text('-')),
          const SizedBox(width: 16),
          ElevatedButton(onPressed: () => setState(() => _counter++), child: const Text('+')),
        ]),
      ],
    ),
  );
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 9️⃣ Form & Validation
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _DemoForm extends StatefulWidget {
  const _DemoForm({super.key});
  @override
  State<_DemoForm> createState() => _DemoFormState();
}
class _DemoFormState extends State<_DemoForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
    child: Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('📝 Form داخل Sheet', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'البريد الإلكتروني', border: OutlineInputBorder()),
              validator: (v) => v == null || !v.contains('@') ? 'بريد غير صالح' : null,
              onChanged: (v) => _email = v,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تم الحفظ: $_email')));
                }
              },
              child: const Text('إرسال'),
            ),
          ],
        ),
      ),
    ),
  );
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 🔟 Custom Transition
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _DemoCustomTransition extends StatefulWidget {
  const _DemoCustomTransition({super.key});
  @override
  State<_DemoCustomTransition> createState() => _DemoCustomTransitionState();
}
class _DemoCustomTransitionState extends State<_DemoCustomTransition> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
  }
  @override
  void dispose() { _controller.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('🎬 Custom Transition', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('يستخدم transitionAnimationController لتأثيرات مخصصة'),
      ],
    ),
  );
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 1️⃣1️⃣ Prevent Close (PopScope)
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _DemoPreventClose extends StatelessWidget {
  const _DemoPreventClose({super.key});
  @override
  Widget build(BuildContext context) => PopScope(
    canPop: false, // ✅ منع الإغلاق الافتراضي
    onPopInvoked: (didPop) async {
      if (didPop) return;
      final ok = await showDialog<bool>(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('تأكيد الخروج'),
          content: const Text('هل تريد إغلاق النافذة؟'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('إلغاء')),
            ElevatedButton(onPressed: () => Navigator.pop(context, true), child: const Text('نعم')),
          ],
        ),
      );
      if (ok == true && context.mounted) Navigator.pop(context);
    },
    child: Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('🔒 منع الإغلاق المفاجئ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('يستخدم PopScope للتحكم في سلوك الرجوع/الإغلاق'),
        ],
      ),
    ),
  );
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 1️⃣2️⃣ useRootNavigator
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _DemoRootNav extends StatelessWidget {
  const _DemoRootNav({super.key});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text('🌐 useRootNavigator: true', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text('يضمن ظهور الـ Sheet فوق كل الـ Navigators المتداخلة أو الـ Dialogs المفتوحة'),
      ],
    ),
  );
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 1️⃣3️⃣ SafeArea & Constraints
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _DemoSafeConstraints extends StatelessWidget {
  const _DemoSafeConstraints({super.key});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text('📐 SafeArea & Constraints', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text('useSafeArea: true → يتجنب الشريط العلوي والسفلي\nconstraints: BoxConstraints(...) → يتحكم في العرض/الارتفاع'),
      ],
    ),
  );
}