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
      home: const TextFormFieldScreen(),
    );
  }
}

class TextFormFieldScreen extends StatelessWidget {
  const TextFormFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('جميع مفاهيم TextFormField', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 32),
        children: [
          _sectionTitle('1️⃣  TextFormField الأساسي'),
          _launchBtn(context, 'TextFormField الأساسي', Colors.blue, const _BasicPage()),

          _sectionTitle('2️⃣  controller (TextEditingController)'),
          _launchBtn(context, 'TextEditingController', Colors.green, const _ControllerPage()),

          _sectionTitle('3️⃣  initialValue'),
          _launchBtn(context, 'initialValue (قيمة ابتدائية)', Colors.teal, const _InitialValuePage()),

          _sectionTitle('4️⃣  validator (التحقق من الإدخال)'),
          _launchBtn(context, 'validator + Form + GlobalKey', Colors.red, const _ValidatorPage()),

          _sectionTitle('5️⃣  onSaved'),
          _launchBtn(context, 'onSaved (حفظ القيمة)', Colors.purple, const _OnSavedPage()),

          _sectionTitle('6️⃣  onChanged'),
          _launchBtn(context, 'onChanged (تغيير فوري)', Colors.orange, const _OnChangedPage()),

          _sectionTitle('7️⃣  onFieldSubmitted'),
          _launchBtn(context, 'onFieldSubmitted (عند الضغط Enter)', Colors.indigo, const _OnSubmittedPage()),

          _sectionTitle('8️⃣  onEditingComplete'),
          _launchBtn(context, 'onEditingComplete', Colors.brown, const _OnEditingCompletePage()),

          _sectionTitle('9️⃣  onTap و onTapOutside'),
          _launchBtn(context, 'onTap + onTapOutside', Colors.cyan.shade700, const _OnTapPage()),

          _sectionTitle('🔟  decoration: InputDecoration كاملة'),
          _launchBtn(context, 'InputDecoration كاملة', Colors.pink, const _DecorationPage()),

          _sectionTitle('1️⃣1️⃣  labelText و hintText و helperText'),
          _launchBtn(context, 'label + hint + helper', Colors.green.shade700, const _LabelsPage()),

          _sectionTitle('1️⃣2️⃣  prefixIcon و suffixIcon'),
          _launchBtn(context, 'prefixIcon + suffixIcon', Colors.deepPurple, const _IconsPage()),

          _sectionTitle('1️⃣3️⃣  prefix و suffix (Widgets)'),
          _launchBtn(context, 'prefix + suffix كـ Widgets', Colors.deepOrange, const _PrefixSuffixPage()),

          _sectionTitle('1️⃣4️⃣  prefixText و suffixText'),
          _launchBtn(context, 'prefixText + suffixText', Colors.blueGrey, const _PrefixSuffixTextPage()),

          _sectionTitle('1️⃣5️⃣  errorText و errorStyle'),
          _launchBtn(context, 'errorText + errorStyle', Colors.red.shade700, const _ErrorPage()),

          _sectionTitle('1️⃣6️⃣  counterText و counter'),
          _launchBtn(context, 'counterText + counter', Colors.amber.shade700, const _CounterPage()),

          _sectionTitle('1️⃣7️⃣  border: OutlineInputBorder'),
          _launchBtn(context, 'OutlineInputBorder', Colors.blue.shade700, const _OutlineBorderPage()),

          _sectionTitle('1️⃣8️⃣  border: UnderlineInputBorder'),
          _launchBtn(context, 'UnderlineInputBorder', Colors.teal.shade700, const _UnderlineBorderPage()),

          _sectionTitle('1️⃣9️⃣  filled و fillColor'),
          _launchBtn(context, 'filled + fillColor', Colors.purple.shade700, const _FilledPage()),

          _sectionTitle('2️⃣0️⃣  focusedBorder و enabledBorder و errorBorder'),
          _launchBtn(context, 'focusedBorder + enabledBorder + errorBorder', Colors.orange.shade700, const _BorderStatesPage()),

          _sectionTitle('2️⃣1️⃣  isDense و contentPadding'),
          _launchBtn(context, 'isDense + contentPadding', Colors.green.shade800, const _DensePaddingPage()),

          _sectionTitle('2️⃣2️⃣  floatingLabelBehavior'),
          _launchBtn(context, 'FloatingLabelBehavior', Colors.indigo.shade700, const _FloatingLabelPage()),

          _sectionTitle('2️⃣3️⃣  floatingLabelStyle و labelStyle'),
          _launchBtn(context, 'floatingLabelStyle + labelStyle', Colors.pink.shade700, const _LabelStylePage()),

          _sectionTitle('2️⃣4️⃣  obscureText (كلمة المرور)'),
          _launchBtn(context, 'obscureText + عرض/إخفاء', Colors.red.shade800, const _ObscurePage()),

          _sectionTitle('2️⃣5️⃣  keyboardType'),
          _launchBtn(context, 'TextInputType المختلفة', Colors.cyan.shade800, const _KeyboardTypePage()),

          _sectionTitle('2️⃣6️⃣  textInputAction'),
          _launchBtn(context, 'TextInputAction (زر لوحة المفاتيح)', Colors.purple.shade800, const _InputActionPage()),

          _sectionTitle('2️⃣7️⃣  inputFormatters'),
          _launchBtn(context, 'inputFormatters (تقييد الإدخال)', Colors.brown.shade700, const _InputFormattersPage()),

          _sectionTitle('2️⃣8️⃣  textCapitalization'),
          _launchBtn(context, 'textCapitalization', Colors.lime.shade700, const _CapitalizationPage()),

          _sectionTitle('2️⃣9️⃣  textAlign و textAlignVertical'),
          _launchBtn(context, 'textAlign + textAlignVertical', Colors.orange.shade800, const _TextAlignPage()),

          _sectionTitle('3️⃣0️⃣  textDirection'),
          _launchBtn(context, 'textDirection: RTL + LTR', Colors.teal.shade800, const _TextDirectionPage()),

          _sectionTitle('3️⃣1️⃣  maxLines و minLines'),
          _launchBtn(context, 'maxLines + minLines', Colors.deepPurple.shade700, const _LinesPage()),

          _sectionTitle('3️⃣2️⃣  maxLength و maxLengthEnforcement'),
          _launchBtn(context, 'maxLength + Enforcement', Colors.red.shade900, const _MaxLengthPage()),

          _sectionTitle('3️⃣3️⃣  expands: true'),
          _launchBtn(context, 'expands: true (يملأ المساحة)', Colors.blue.shade900, const _ExpandsPage()),

          _sectionTitle('3️⃣4️⃣  readOnly و enabled'),
          _launchBtn(context, 'readOnly + enabled', Colors.grey.shade700, const _ReadOnlyPage()),

          _sectionTitle('3️⃣5️⃣  autofocus'),
          _launchBtn(context, 'autofocus (فتح الكيبورد تلقائياً)', Colors.green.shade900, const _AutofocusPage()),

          _sectionTitle('3️⃣6️⃣  FocusNode'),
          _launchBtn(context, 'FocusNode (التحكم في التركيز)', Colors.purple.shade900, const _FocusNodePage()),

          _sectionTitle('3️⃣7️⃣  autocorrect و enableSuggestions'),
          _launchBtn(context, 'autocorrect + enableSuggestions', Colors.orange.shade900, const _AutocorrectPage()),

          _sectionTitle('3️⃣8️⃣  enableInteractiveSelection'),
          _launchBtn(context, 'enableInteractiveSelection (نسخ/لصق)', Colors.cyan.shade900, const _SelectionPage()),

          _sectionTitle('3️⃣9️⃣  style (تنسيق النص)'),
          _launchBtn(context, 'style: TextStyle مخصص', Colors.pink.shade900, const _StylePage()),

          _sectionTitle('4️⃣0️⃣  cursorColor و cursorWidth و cursorRadius'),
          _launchBtn(context, 'cursor مخصص', Colors.indigo.shade900, const _CursorPage()),

          _sectionTitle('4️⃣1️⃣  selectionControls و contextMenuBuilder'),
          _launchBtn(context, 'selectionControls مخصص', Colors.brown.shade800, const _SelectionControlsPage()),

          _sectionTitle('4️⃣2️⃣  strutStyle'),
          _launchBtn(context, 'strutStyle (ارتفاع الأسطر)', Colors.teal.shade900, const _StrutStylePage()),

          _sectionTitle('4️⃣3️⃣  scrollController و scrollPhysics'),
          _launchBtn(context, 'scrollController + scrollPhysics', Colors.deepOrange.shade800, const _ScrollPage()),

          _sectionTitle('4️⃣4️⃣  autovalidateMode'),
          _launchBtn(context, 'AutovalidateMode (وقت التحقق)', Colors.blue.shade800, const _AutovalidatePage()),

          _sectionTitle('4️⃣5️⃣  نموذج تسجيل دخول كامل احترافي'),
          _launchBtn(context, 'نموذج احترافي كامل', Colors.deepPurple.shade800, const _ProFormPage()),
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
            backgroundColor: color, foregroundColor: Colors.white,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      );
}

// ============================================================
// مساعدات
// ============================================================
AppBar _appBar(String t, Color c) => AppBar(
  title: Text(t, style: const TextStyle(color: Colors.white, fontSize: 13)),
  backgroundColor: c, centerTitle: true,
);

Widget _wrap(List<Widget> children) => SingleChildScrollView(
  padding: const EdgeInsets.all(16),
  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: children),
);

Widget _label(String t) => Padding(
  padding: const EdgeInsets.only(top: 16, bottom: 6),
  child: Text(t, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
);

// ============================================================
// 1. الأساسي
// ============================================================
class _BasicPage extends StatelessWidget {
  const _BasicPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('TextFormField الأساسي', Colors.blue),
        body: _wrap([
          _label('TextFormField أبسط شكل:'),
          // TextFormField: نسخة Form-aware من TextField
          // الفرق: يدعم validator + onSaved + autovalidateMode
          TextFormField(),
          _label('مع decoration بسيطة:'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'الاسم',
              hintText: 'أدخل اسمك هنا',
            ),
          ),
          _label('ملاحظة: TextFormField vs TextField'),
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.blue.shade50,
            child: const Text(
              '• TextFormField = TextField + Form support\n'
                  '• يجب وضعه داخل Form widget للاستفادة من validator\n'
                  '• يمكن استخدامه بدون Form كـ TextField عادي',
              style: TextStyle(fontSize: 13, height: 1.6),
            ),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 2. TextEditingController
// ============================================================
class _ControllerPage extends StatefulWidget {
  const _ControllerPage();
  @override
  State<_ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<_ControllerPage> {
  // TextEditingController: للتحكم في النص برمجياً
  final TextEditingController _controller = TextEditingController();
  String _currentText = '';

  @override
  void initState() {
    super.initState();
    // addListener: مراقبة التغييرات
    _controller.addListener(() => setState(() => _currentText = _controller.text));
  }

  @override
  void dispose() {
    // dispose: مهم جداً لتجنب memory leak
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('TextEditingController', Colors.green),
        body: _wrap([
          TextFormField(
            controller: _controller,
            decoration: const InputDecoration(labelText: 'اكتب هنا', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 12),
          Text('النص الحالي: "$_currentText"', style: const TextStyle(fontSize: 14)),
          Text('عدد الأحرف: ${_currentText.length}', style: const TextStyle(fontSize: 13, color: Colors.grey)),
          const SizedBox(height: 12),
          Wrap(spacing: 8, runSpacing: 8, children: [
            ElevatedButton(onPressed: () => _controller.clear(), style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white), child: const Text('مسح clear()')),
            ElevatedButton(
              onPressed: () => _controller.text = 'نص جديد',
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
              child: const Text('تعيين .text='),
            ),
            ElevatedButton(
              // تحديد كل النص
              onPressed: () => _controller.selection = TextSelection(baseOffset: 0, extentOffset: _controller.text.length),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
              child: const Text('تحديد selection'),
            ),
            ElevatedButton(
              // نقل المؤشر لنهاية النص
              onPressed: () => _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple, foregroundColor: Colors.white),
              child: const Text('نهاية النص'),
            ),
          ]),
          const SizedBox(height: 8),
          Container(padding: const EdgeInsets.all(10), color: Colors.green.shade50,
            child: const Text('• _controller.text → قراءة النص\n• _controller.clear() → مسح النص\n• _controller.text = "..." → تعيين النص\n• _controller.selection → موضع المؤشر\n• _controller.value → TextEditingValue', style: TextStyle(fontSize: 12, height: 1.6)),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 3. initialValue
// ============================================================
class _InitialValuePage extends StatelessWidget {
  const _InitialValuePage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('initialValue', Colors.teal),
        body: _wrap([
          _label('initialValue: قيمة ابتدائية في الحقل'),
          TextFormField(
            // initialValue: النص الذي يظهر عند أول فتح الحقل
            // لا يمكن استخدامه مع controller في نفس الوقت
            initialValue: 'MProgrammer01',
            decoration: InputDecoration(labelText: 'الاسم', border: OutlineInputBorder()),
          ),
          _label('initialValue مع بريد إلكتروني:'),
          TextFormField(
            initialValue: 'exemple@example.com',
            decoration: InputDecoration(labelText: 'البريد الإلكتروني', border: OutlineInputBorder(), prefixIcon: Icon(Icons.email)),
          ),
          const SizedBox(height: 12),
          Container(padding: const EdgeInsets.all(10), color: Colors.teal.shade50,
            child: const Text('⚠️ تنبيه:\n• initialValue لا يمكن استخدامه مع controller\n• استخدم controller.text = "..." بدلاً منه إذا أردت التحكم لاحقاً\n• initialValue يُعيَّن مرة واحدة فقط عند البناء', style: TextStyle(fontSize: 12, height: 1.6)),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 4. validator
// ============================================================
class _ValidatorPage extends StatefulWidget {
  const _ValidatorPage();
  @override
  State<_ValidatorPage> createState() => _ValidatorPageState();
}

class _ValidatorPageState extends State<_ValidatorPage> {
  // GlobalKey<FormState>: للتحكم في الـ Form
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  @override
  void dispose() { _nameCtrl.dispose(); _emailCtrl.dispose(); _phoneCtrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('validator + Form + GlobalKey', Colors.red),
        body: Form(
          key: _formKey,
          child: _wrap([
            TextFormField(
              controller: _nameCtrl,
              decoration: const InputDecoration(labelText: 'الاسم الكامل *', border: OutlineInputBorder(), prefixIcon: Icon(Icons.person)),
              // validator: يُستدعى عند form.validate()
              // إذا رجع null = صحيح ✅
              // إذا رجع String = خطأ ❌
              validator: (value) {
                if (value == null || value.trim().isEmpty) return 'الاسم مطلوب';
                if (value.trim().length < 3) return 'الاسم يجب أن يكون 3 أحرف على الأقل';
                return null; // صحيح ✅
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _emailCtrl,
              decoration: const InputDecoration(labelText: 'البريد الإلكتروني *', border: OutlineInputBorder(), prefixIcon: Icon(Icons.email)),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) return 'البريد الإلكتروني مطلوب';
                final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegex.hasMatch(value)) return 'صيغة البريد الإلكتروني غير صحيحة';
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _phoneCtrl,
              decoration: const InputDecoration(labelText: 'رقم الهاتف *', border: OutlineInputBorder(), prefixIcon: Icon(Icons.phone)),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) return 'رقم الهاتف مطلوب';
                if (value.length < 10) return 'الرقم يجب أن يكون 10 أرقام على الأقل';
                return null;
              },
            ),
            const SizedBox(height: 16),
            Row(children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // validate(): يُشغّل كل الـ validators ويُعيد true/false
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('✅ النموذج صحيح!'), backgroundColor: Colors.green));
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14)),
                  child: const Text('تحقق validate()'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // reset(): يمسح الأخطاء ويُعيد القيم الافتراضية
                    _formKey.currentState!.reset();
                    _nameCtrl.clear(); _emailCtrl.clear(); _phoneCtrl.clear();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14)),
                  child: const Text('إعادة تعيين reset()'),
                ),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}

// ============================================================
// 5. onSaved
// ============================================================
class _OnSavedPage extends StatefulWidget {
  const _OnSavedPage();
  @override
  State<_OnSavedPage> createState() => _OnSavedPageState();
}

class _OnSavedPageState extends State<_OnSavedPage> {
  final _formKey = GlobalKey<FormState>();
  String? _savedName, _savedEmail;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('onSaved', Colors.purple),
        body: Form(
          key: _formKey,
          child: _wrap([
            TextFormField(
              decoration: const InputDecoration(labelText: 'الاسم', border: OutlineInputBorder()),
              validator: (v) => v!.isEmpty ? 'مطلوب' : null,
              // onSaved: يُستدعى عند form.save()
              // يُستخدم لحفظ القيمة في متغير
              onSaved: (value) => _savedName = value,
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: const InputDecoration(labelText: 'البريد الإلكتروني', border: OutlineInputBorder()),
              validator: (v) => v!.isEmpty ? 'مطلوب' : null,
              onSaved: (value) => _savedEmail = value,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // save(): يُشغّل كل دوال onSaved
                  _formKey.currentState!.save();
                  setState(() {});
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تم الحفظ: $_savedName - $_savedEmail'), backgroundColor: Colors.purple));
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple, foregroundColor: Colors.white, minimumSize: const Size.fromHeight(48)),
              child: const Text('حفظ form.save()'),
            ),
            if (_savedName != null) ...[
              const SizedBox(height: 12),
              Container(padding: const EdgeInsets.all(12), color: Colors.purple.shade50,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text('القيم المحفوظة:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('الاسم: $_savedName'),
                    Text('البريد: $_savedEmail'),
                  ])),
            ],
          ]),
        ),
      ),
    );
  }
}

// ============================================================
// 6. onChanged
// ============================================================
class _OnChangedPage extends StatefulWidget {
  const _OnChangedPage();
  @override
  State<_OnChangedPage> createState() => _OnChangedPageState();
}

class _OnChangedPageState extends State<_OnChangedPage> {
  String _value = '';
  int _changeCount = 0;
  List<String> _history = [];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('onChanged', Colors.orange),
        body: _wrap([
          TextFormField(
            decoration: const InputDecoration(labelText: 'اكتب شيئاً', border: OutlineInputBorder()),
            // onChanged: يُستدعى عند كل تغيير في النص (كل حرف)
            onChanged: (value) {
              setState(() {
                _value = value;
                _changeCount++;
                if (_history.length > 5) _history.removeAt(0);
                _history.add(value);
              });
            },
          ),
          const SizedBox(height: 12),
          Container(padding: const EdgeInsets.all(12), color: Colors.orange.shade50,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('القيمة الحالية: "$_value"', style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('عدد مرات التغيير: $_changeCount'),
                const SizedBox(height: 8),
                const Text('آخر 5 قيم:', style: TextStyle(fontWeight: FontWeight.bold)),
                ..._history.reversed.map((h) => Text('• "$h"', style: const TextStyle(fontSize: 12))),
              ])),
          const SizedBox(height: 8),
          Container(padding: const EdgeInsets.all(10), color: Colors.orange.shade100,
            child: const Text('onChanged vs controller.addListener:\n• onChanged = أسهل وأبسط\n• controller.addListener = أكثر مرونة\n• كلاهما يُستدعى عند كل تغيير', style: TextStyle(fontSize: 12, height: 1.5)),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 7. onFieldSubmitted
// ============================================================
class _OnSubmittedPage extends StatefulWidget {
  const _OnSubmittedPage();
  @override
  State<_OnSubmittedPage> createState() => _OnSubmittedPageState();
}

class _OnSubmittedPageState extends State<_OnSubmittedPage> {
  final List<String> _submitted = [];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('onFieldSubmitted', Colors.indigo),
        body: _wrap([
          TextFormField(
            decoration: const InputDecoration(labelText: 'اضغط Enter بعد الكتابة', border: OutlineInputBorder(), suffixIcon: Icon(Icons.keyboard_return)),
            textInputAction: TextInputAction.done,
            // onFieldSubmitted: يُستدعى عند الضغط على Enter أو زر لوحة المفاتيح
            onFieldSubmitted: (value) {
              if (value.isNotEmpty) setState(() => _submitted.add(value));
            },
          ),
          const SizedBox(height: 12),
          if (_submitted.isNotEmpty) ...[
            const Text('القيم المُرسَلة:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ..._submitted.reversed.map((s) => Container(
              margin: const EdgeInsets.only(bottom: 6),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.indigo.shade50, borderRadius: BorderRadius.circular(8)),
              child: Row(children: [
                const Icon(Icons.check_circle, color: Colors.indigo, size: 16),
                const SizedBox(width: 8),
                Text(s, style: const TextStyle(fontSize: 14)),
              ]),
            )),
          ],
        ]),
      ),
    );
  }
}

// ============================================================
// 8. onEditingComplete
// ============================================================
class _OnEditingCompletePage extends StatefulWidget {
  const _OnEditingCompletePage();
  @override
  State<_OnEditingCompletePage> createState() => _OnEditingCompletePageState();
}

class _OnEditingCompletePageState extends State<_OnEditingCompletePage> {
  int _editingCompleteCount = 0;
  int _submittedCount = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('onEditingComplete', Colors.brown),
        body: _wrap([
          TextFormField(
            decoration: const InputDecoration(labelText: 'حقل الاختبار', border: OutlineInputBorder()),
            // onEditingComplete: يُستدعى عند انتهاء التحرير
            // الفرق عن onFieldSubmitted:
            // • onEditingComplete لا يعطيك القيمة
            // • onEditingComplete يُستدعى قبل onFieldSubmitted
            // • يُستخدم لتنفيذ إجراء مخصص (مثل إغلاق الكيبورد)
            onEditingComplete: () {
              setState(() => _editingCompleteCount++);
              FocusScope.of(context).unfocus(); // إغلاق الكيبورد
            },
            onFieldSubmitted: (_) => setState(() => _submittedCount++),
          ),
          const SizedBox(height: 16),
          Container(padding: const EdgeInsets.all(12), color: Colors.brown.shade50,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('onEditingComplete استُدعي: $_editingCompleteCount مرة'),
                Text('onFieldSubmitted استُدعي: $_submittedCount مرة'),
                const SizedBox(height: 8),
                const Text('الترتيب: onEditingComplete → onFieldSubmitted', style: TextStyle(fontSize: 12, color: Colors.grey)),
              ])),
        ]),
      ),
    );
  }
}

// ============================================================
// 9. onTap و onTapOutside
// ============================================================
class _OnTapPage extends StatefulWidget {
  const _OnTapPage();
  @override
  State<_OnTapPage> createState() => _OnTapPageState();
}

class _OnTapPageState extends State<_OnTapPage> {
  int _tapCount = 0;
  int _outsideTapCount = 0;
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('onTap + onTapOutside', Colors.cyan.shade700),
        body: _wrap([
          TextFormField(
            decoration: InputDecoration(
              labelText: 'اضغط داخل وخارج الحقل',
              border: const OutlineInputBorder(),
              filled: true,
              fillColor: _isFocused ? Colors.cyan.shade50 : Colors.white,
            ),
            // onTap: يُستدعى عند الضغط على الحقل
            onTap: () => setState(() { _tapCount++; _isFocused = true; }),
            // onTapOutside: يُستدعى عند الضغط خارج الحقل
            onTapOutside: (_) => setState(() { _outsideTapCount++; _isFocused = false; FocusScope.of(context).unfocus(); }),
          ),
          const SizedBox(height: 16),
          Container(padding: const EdgeInsets.all(12), color: Colors.cyan.shade50,
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                  Column(children: [const Icon(Icons.touch_app, color: Colors.cyan), Text('$_tapCount', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)), const Text('onTap')]),
                  Column(children: [const Icon(Icons.touch_app_outlined, color: Colors.grey), Text('$_outsideTapCount', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)), const Text('onTapOutside')]),
                  Column(children: [Icon(_isFocused ? Icons.radio_button_checked : Icons.radio_button_unchecked, color: _isFocused ? Colors.green : Colors.grey), Text(_isFocused ? 'مُركَّز' : 'غير مُركَّز'), const Text('Focus')]),
                ]),
              ])),
        ]),
      ),
    );
  }
}

// ============================================================
// 10. InputDecoration كاملة
// ============================================================
class _DecorationPage extends StatelessWidget {
  const _DecorationPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('InputDecoration كاملة', Colors.pink),
        body: _wrap([
          _label('InputDecoration بجميع الخصائص:'),
          TextFormField(
            decoration: InputDecoration(
              // النصوص
              labelText: 'labelText: العنوان',
              hintText: 'hintText: نص التلميح',
              helperText: 'helperText: نص المساعدة',
              counterText: 'counterText: عداد',
              // الأيقونات
              prefixIcon: const Icon(Icons.person),
              suffixIcon: const Icon(Icons.check_circle, color: Colors.green),
              // الحدود
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              // الألوان
              filled: true,
              fillColor: Colors.pink.shade50,
              // المسافات
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              // تعطيل/تفعيل
              enabled: true,
            ),
          ),
          _label('مع icon (خارج الحقل):'),
          TextFormField(
            decoration: InputDecoration(
              // icon: يظهر خارج الحقل على اليمين (RTL)
              icon: Icon(Icons.star, color: Colors.pink),
              labelText: 'icon: خارج الحقل',
              border: OutlineInputBorder(),
            ),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 11. labelText و hintText و helperText
// ============================================================
class _LabelsPage extends StatelessWidget {
  const _LabelsPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('label + hint + helper', Colors.green.shade700),
        body: _wrap([
          _label('labelText: يطفو للأعلى عند التركيز'),
          TextFormField(
            decoration: InputDecoration(
              // labelText: يظهر داخل الحقل ويطفو للأعلى عند الكتابة
              labelText: 'الاسم الكامل',
              border: OutlineInputBorder(),
            ),
          ),
          _label('hintText: نص رمادي كتلميح'),
          TextFormField(
            decoration: InputDecoration(
              // hintText: يظهر عندما الحقل فارغ كتلميح
              hintText: 'مثال: أحمد محمد',
              border: OutlineInputBorder(),
            ),
          ),
          _label('helperText: نص مساعدة أسفل الحقل'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'كلمة المرور',
              // helperText: نص أسفل الحقل (يختفي عند وجود errorText)
              helperText: 'يجب أن تكون 8 أحرف على الأقل',
              border: OutlineInputBorder(),
            ),
          ),
          _label('الثلاثة معاً:'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'البريد الإلكتروني',
              hintText: 'user@example.com',
              helperText: 'سنرسل رسالة تأكيد على هذا البريد',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 12. prefixIcon و suffixIcon
// ============================================================
class _IconsPage extends StatefulWidget {
  const _IconsPage();
  @override
  State<_IconsPage> createState() => _IconsPageState();
}

class _IconsPageState extends State<_IconsPage> {
  final _ctrl = TextEditingController();

  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('prefixIcon + suffixIcon', Colors.deepPurple),
        body: _wrap([
          _label('prefixIcon: أيقونة في بداية الحقل'),
          TextFormField(
            decoration: InputDecoration(
              // prefixIcon: أيقونة ثابتة في بداية الحقل (يمين في RTL)
              prefixIcon: Icon(Icons.search),
              labelText: 'بحث',
              border: OutlineInputBorder(),
            ),
          ),
          _label('suffixIcon: أيقونة في نهاية الحقل'),
          TextFormField(
            controller: _ctrl,
            decoration: InputDecoration(
              labelText: 'اكتب شيئاً',
              border: const OutlineInputBorder(),
              // suffixIcon: أيقونة تفاعلية في نهاية الحقل
              suffixIcon: _ctrl.text.isNotEmpty
                  ? IconButton(icon: const Icon(Icons.clear), onPressed: () => setState(() => _ctrl.clear()))
                  : null,
            ),
            onChanged: (_) => setState(() {}),
          ),
          _label('prefixIcon + suffixIcon معاً:'),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock, color: Colors.deepPurple),
              suffixIcon: Icon(Icons.visibility, color: Colors.grey),
              labelText: 'كلمة المرور',
              border: OutlineInputBorder(),
            ),
          ),
          _label('suffixIcon مع Badge:'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'الرسائل',
              border: const OutlineInputBorder(),
              suffixIcon: const Icon(Icons.notifications),
            ),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 13. prefix و suffix (Widgets)
// ============================================================
class _PrefixSuffixPage extends StatelessWidget {
  const _PrefixSuffixPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('prefix + suffix كـ Widgets', Colors.deepOrange),
        body: _wrap([
          _label('prefix: Widget في بداية حقل الإدخال'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'رقم الهاتف',
              border: const OutlineInputBorder(),
              // prefix: Widget يظهر داخل حقل الإدخال في البداية
              prefix: Container(
                margin: const EdgeInsets.only(left: 8),
                child: const Text('+212', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange)),
              ),
            ),
            keyboardType: TextInputType.phone,
          ),
          _label('suffix: Widget في نهاية حقل الإدخال'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'السعر',
              border: OutlineInputBorder(),
              // suffix: Widget يظهر داخل حقل الإدخال في النهاية
              suffix: Text('درهم', style: TextStyle(color: Colors.grey, fontSize: 13)),
            ),
            keyboardType: TextInputType.number,
          ),
          _label('prefix vs prefixIcon:'),
          Container(padding: const EdgeInsets.all(10), color: Colors.deepOrange.shade50,
            child: const Text('• prefix: Widget داخل منطقة النص\n• prefixIcon: Widget مُحاذٍ مع الحقل كاملاً\n• suffix: Widget داخل منطقة النص\n• suffixIcon: Widget مُحاذٍ مع الحقل كاملاً', style: TextStyle(fontSize: 12, height: 1.6)),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 14. prefixText و suffixText
// ============================================================
class _PrefixSuffixTextPage extends StatelessWidget {
  const _PrefixSuffixTextPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('prefixText + suffixText', Colors.blueGrey),
        body: _wrap([
          _label('prefixText: نص ثابت في بداية الحقل'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'رقم الهاتف',
              border: const OutlineInputBorder(),
              // prefixText: نص يظهر قبل الإدخال
              prefixText: '+212 ',
              prefixStyle: TextStyle(color: Colors.blueGrey.shade700, fontWeight: FontWeight.bold),
            ),
            keyboardType: TextInputType.phone,
          ),
          _label('suffixText: نص ثابت في نهاية الحقل'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'الوزن',
              border: const OutlineInputBorder(),
              // suffixText: نص يظهر بعد الإدخال
              suffixText: 'كغ',
              suffixStyle: TextStyle(color: Colors.blueGrey.shade700, fontWeight: FontWeight.bold),
            ),
            keyboardType: TextInputType.number,
          ),
          _label('prefixText + suffixText معاً:'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'المبلغ',
              border: const OutlineInputBorder(),
              prefixText: 'MAD ',
              suffixText: '.00',
              prefixStyle: TextStyle(color: Colors.green.shade700),
              suffixStyle: TextStyle(color: Colors.grey.shade600),
            ),
            keyboardType: TextInputType.number,
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 15. errorText و errorStyle
// ============================================================
class _ErrorPage extends StatefulWidget {
  const _ErrorPage();
  @override
  State<_ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<_ErrorPage> {
  String? _errorMsg;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('errorText + errorStyle', Colors.red.shade700),
        body: _wrap([
          _label('errorText: رسالة خطأ أسفل الحقل'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'البريد الإلكتروني',
              border: const OutlineInputBorder(),
              // errorText: يُظهر رسالة الخطأ ويُلوّن الحدود بالأحمر
              errorText: _errorMsg,
              // errorStyle: تنسيق نص الخطأ
              errorStyle: const TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold),
              // errorMaxLines: عدد أسطر رسالة الخطأ
              errorMaxLines: 2,
            ),
            onChanged: (v) {
              setState(() {
                if (v.isEmpty) {
                  _errorMsg = 'البريد الإلكتروني مطلوب';
                } else if (!v.contains('@')) {
                  _errorMsg = 'صيغة البريد الإلكتروني غير صحيحة، يجب أن تحتوي على @';
                }
                else {
                  _errorMsg = null;
                }
              });
            },
          ),
          const SizedBox(height: 8),
          Container(padding: const EdgeInsets.all(10), color: Colors.red.shade50,
            child: const Text('ملاحظة:\n• errorText يتجاوز helperText (يختفي الـ helper)\n• يُلوّن الحدود والـ label بالأحمر تلقائياً\n• errorBorder يُستخدم عند وجود errorText', style: TextStyle(fontSize: 12, height: 1.6)),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 16. counterText و counter
// ============================================================
class _CounterPage extends StatefulWidget {
  const _CounterPage();
  @override
  State<_CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<_CounterPage> {
  int _length1 = 0;
  int _length2 = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('counterText + counter', Colors.amber.shade700),
        body: _wrap([
          _label('counterText: نص عداد مخصص'),
          TextFormField(
            maxLength: 50,
            decoration: InputDecoration(
              labelText: 'مع counterText',
              border: const OutlineInputBorder(),
              // counterText: يستبدل العداد الافتراضي بنص مخصص
              counterText: '$_length1 / 50 حرف',
            ),
            onChanged: (v) => setState(() => _length1 = v.length),
          ),
          _label('counter: Widget مخصص للعداد'),
          TextFormField(
            maxLength: 100,
            decoration: InputDecoration(
              labelText: 'مع counter Widget',
              border: const OutlineInputBorder(),
              // counter: Widget مخصص يستبدل العداد الافتراضي
              counter: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: _length2 > 80 ? Colors.red : Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('$_length2/100', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
              ),
            ),
            onChanged: (v) => setState(() => _length2 = v.length),
          ),
          _label('counterText: "" لإخفاء العداد'),
          TextFormField(
            maxLength: 20,
            decoration: InputDecoration(
              labelText: 'بدون عداد',
              border: OutlineInputBorder(),
              // counterText: '' → يخفي العداد تماماً
              counterText: '',
            ),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 17. OutlineInputBorder
// ============================================================
class _OutlineBorderPage extends StatelessWidget {
  const _OutlineBorderPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('OutlineInputBorder', Colors.blue.shade700),
        body: _wrap([
          _label('OutlineInputBorder الافتراضي:'),
          TextFormField(
            decoration: InputDecoration(labelText: 'افتراضي', border: OutlineInputBorder()),
          ),
          _label('مع borderRadius مخصص:'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'زوايا دائرية',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
            ),
          ),
          _label('مع borderSide مخصص:'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'حدود ملونة سميكة',
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          _label('بدون حدود:'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'InputBorder.none',
              border: InputBorder.none,
              filled: true,
              fillColor: Color(0xFFEEF2FF),
            ),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 18. UnderlineInputBorder
// ============================================================
class _UnderlineBorderPage extends StatelessWidget {
  const _UnderlineBorderPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('UnderlineInputBorder', Colors.teal.shade700),
        body: _wrap([
          _label('UnderlineInputBorder الافتراضي (خط سفلي فقط):'),
          TextFormField(
            decoration: InputDecoration(labelText: 'خط سفلي', border: UnderlineInputBorder()),
          ),
          _label('مع borderSide ملون:'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'خط سفلي ملون',
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.teal.shade700, width: 2),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.teal.shade900, width: 3),
              ),
            ),
          ),
          _label('المقارنة:'),
          Container(padding: const EdgeInsets.all(10), color: Colors.teal.shade50,
            child: const Text('OutlineInputBorder → حدود مستطيل كامل\nUnderlineInputBorder → خط سفلي فقط (Material افتراضي)\nInputBorder.none → بدون حدود', style: TextStyle(fontSize: 12, height: 1.6)),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 19. filled و fillColor
// ============================================================
class _FilledPage extends StatelessWidget {
  const _FilledPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('filled + fillColor', Colors.purple.shade700),
        body: _wrap([
          _label('filled: true مع fillColor:'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'خلفية ملونة',
              // filled: true → تفعيل لون الخلفية
              filled: true,
              // fillColor: لون خلفية الحقل
              fillColor: Colors.purple.shade50,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            ),
          ),
          _label('ألوان مختلفة:'),
          ...[ [Colors.blue.shade50, 'أزرق فاتح'], [Colors.green.shade50, 'أخضر فاتح'], [Colors.grey.shade100, 'رمادي فاتح'] ].map((pair) =>
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: pair[1] as String,
                    filled: true,
                    fillColor: pair[0] as Color,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                  ),
                ),
              ),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 20. حالات الـ Border
// ============================================================
class _BorderStatesPage extends StatelessWidget {
  const _BorderStatesPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('focusedBorder + enabledBorder + errorBorder', Colors.orange.shade700),
        body: _wrap([
          _label('تخصيص حالات الـ Border:'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'اضغط للتركيز وجرب',
              // enabledBorder: الحدود في الحالة العادية
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              // focusedBorder: الحدود عند التركيز
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange.shade700, width: 2.5),
                borderRadius: BorderRadius.circular(12),
              ),
              // errorBorder: الحدود عند وجود خطأ
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              // focusedErrorBorder: الحدود عند التركيز مع وجود خطأ
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 3),
                borderRadius: BorderRadius.circular(12),
              ),
              // disabledBorder: الحدود عند التعطيل
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            validator: (v) => v != null && v.length < 3 ? 'أقل من 3 أحرف' : null,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 21. isDense و contentPadding
// ============================================================
class _DensePaddingPage extends StatelessWidget {
  const _DensePaddingPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('isDense + contentPadding', Colors.green.shade800),
        body: _wrap([
          _label('isDense: false (الارتفاع الافتراضي):'),
          TextFormField(
            decoration: InputDecoration(labelText: 'isDense: false', border: OutlineInputBorder(), isDense: false),
          ),
          _label('isDense: true (ارتفاع أقل):'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'isDense: true',
              border: OutlineInputBorder(),
              // isDense: true → يُقلل ارتفاع الحقل
              isDense: true,
            ),
          ),
          _label('contentPadding مخصص:'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'contentPadding كبير',
              border: OutlineInputBorder(),
              // contentPadding: المسافة الداخلية للنص
              contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'contentPadding صغير',
              border: OutlineInputBorder(),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            ),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 22. floatingLabelBehavior
// ============================================================
class _FloatingLabelPage extends StatelessWidget {
  const _FloatingLabelPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('FloatingLabelBehavior', Colors.indigo.shade700),
        body: _wrap([
          _label('auto (افتراضي): يطفو عند التركيز أو الكتابة'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'floatingLabelBehavior: auto',
              border: OutlineInputBorder(),
              // auto: يطفو تلقائياً عند التركيز أو وجود نص
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
          ),
          _label('always: يطفو دائماً'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'floatingLabelBehavior: always',
              hintText: 'hintText يظهر دائماً',
              border: OutlineInputBorder(),
              // always: الـ label يطفو دائماً (مثالي لإظهار hint دائماً)
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          _label('never: لا يطفو أبداً'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'floatingLabelBehavior: never',
              border: OutlineInputBorder(),
              // never: الـ label لا يطفو (مثل placeholder)
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 23. floatingLabelStyle و labelStyle
// ============================================================
class _LabelStylePage extends StatelessWidget {
  const _LabelStylePage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('floatingLabelStyle + labelStyle', Colors.pink.shade700),
        body: _wrap([
          _label('labelStyle: تنسيق الـ label في الحالة العادية'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'labelStyle مخصص',
              border: const OutlineInputBorder(),
              // labelStyle: تنسيق الـ label عندما لا يطفو
              labelStyle: TextStyle(color: Colors.pink.shade700, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          _label('floatingLabelStyle: تنسيق الـ label عند الطفو'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'floatingLabelStyle مخصص',
              border: const OutlineInputBorder(),
              labelStyle: const TextStyle(color: Colors.grey),
              // floatingLabelStyle: تنسيق الـ label عند الطفو
              floatingLabelStyle: const TextStyle(color: Colors.purple, fontSize: 14, fontWeight: FontWeight.w900, letterSpacing: 1),
            ),
          ),
          _label('floatingLabelAlignment: محاذاة الـ label العائم'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'في المنتصف',
              border: const OutlineInputBorder(),
              // floatingLabelAlignment: محاذاة الـ label عند الطفو
              floatingLabelAlignment: FloatingLabelAlignment.center,
            ),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 24. obscureText
// ============================================================
class _ObscurePage extends StatefulWidget {
  const _ObscurePage();
  @override
  State<_ObscurePage> createState() => _ObscurePageState();
}

class _ObscurePageState extends State<_ObscurePage> {
  bool _obscure1 = true;
  bool _obscure2 = true;
  final _pass1 = TextEditingController();
  final _pass2 = TextEditingController();

  @override
  void dispose() { _pass1.dispose(); _pass2.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('obscureText', Colors.red.shade800),
        body: _wrap([
          _label('obscureText: true (إخفاء النص)'),
          TextFormField(
            controller: _pass1,
            // obscureText: true → يُخفي النص بنقاط •••
            obscureText: _obscure1,
            decoration: InputDecoration(
              labelText: 'كلمة المرور',
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(_obscure1 ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => _obscure1 = !_obscure1),
              ),
            ),
          ),
          _label('obscuringCharacter: تغيير رمز الإخفاء'),
          TextFormField(
            controller: _pass2,
            obscureText: _obscure2,
            // obscuringCharacter: الرمز المستخدم للإخفاء (الافتراضي: •)
            obscuringCharacter: '★',
            decoration: InputDecoration(
              labelText: 'كلمة المرور (رمز ★)',
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(_obscure2 ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => _obscure2 = !_obscure2),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 25. keyboardType
// ============================================================
class _KeyboardTypePage extends StatelessWidget {
  const _KeyboardTypePage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('TextInputType المختلفة', Colors.cyan.shade800),
        body: _wrap([
          ...([
            [TextInputType.text, 'text (نص عادي)', Icons.text_fields],
            [TextInputType.number, 'number (أرقام)', Icons.onetwothree],
            [TextInputType.phone, 'phone (هاتف)', Icons.phone],
            [TextInputType.emailAddress, 'emailAddress (بريد)', Icons.email],
            [TextInputType.url, 'url (رابط)', Icons.link],
            [TextInputType.multiline, 'multiline (متعدد الأسطر)', Icons.wrap_text],
            [TextInputType.datetime, 'datetime (تاريخ ووقت)', Icons.calendar_today],
            [TextInputType.streetAddress, 'streetAddress (عنوان)', Icons.location_on],
            [TextInputType.name, 'name (اسم)', Icons.person],
            [TextInputType.visiblePassword, 'visiblePassword (كلمة مرور)', Icons.lock_open],
          ] as List<List<dynamic>>).map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: TextFormField(
              keyboardType: item[0] as TextInputType,
              decoration: InputDecoration(
                labelText: item[1] as String,
                border: const OutlineInputBorder(),
                isDense: true,
                prefixIcon: Icon(item[2] as IconData, size: 20),
              ),
            ),
          )),
        ]),
      ),
    );
  }
}

// ============================================================
// 26. textInputAction
// ============================================================
class _InputActionPage extends StatefulWidget {
  const _InputActionPage();
  @override
  State<_InputActionPage> createState() => _InputActionPageState();
}

class _InputActionPageState extends State<_InputActionPage> {
  final _f1 = FocusNode(), _f2 = FocusNode(), _f3 = FocusNode();

  @override
  void dispose() { _f1.dispose(); _f2.dispose(); _f3.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('TextInputAction', Colors.purple.shade800),
        body: _wrap([
          _label('next: ينتقل للحقل التالي'),
          TextFormField(
            focusNode: _f1,
            // textInputAction: يُحدد زر الإجراء في لوحة المفاتيح
            // next → زر "التالي"
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: 'الاسم (next)', border: OutlineInputBorder()),
            onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_f2),
          ),
          const SizedBox(height: 10),
          TextFormField(
            focusNode: _f2,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: 'البريد (next)', border: OutlineInputBorder()),
            onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_f3),
          ),
          const SizedBox(height: 10),
          TextFormField(
            focusNode: _f3,
            // done → زر "تم" / "إنهاء"
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(labelText: 'كلمة المرور (done)', border: OutlineInputBorder()),
            onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
          ),
          const SizedBox(height: 8),
          Container(padding: const EdgeInsets.all(10), color: Colors.purple.shade50,
            child: const Text('TextInputAction القيم المهمة:\n• next → "التالي"\n• done → "تم"\n• search → "بحث"\n• send → "إرسال"\n• go → "انتقال"\n• newline → "سطر جديد"', style: TextStyle(fontSize: 12, height: 1.6)),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 27. inputFormatters
// ============================================================
class _InputFormattersPage extends StatefulWidget {
  const _InputFormattersPage();
  @override
  State<_InputFormattersPage> createState() => _InputFormattersPageState();
}

class _InputFormattersPageState extends State<_InputFormattersPage> {
  String _formatted = '';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('inputFormatters', Colors.brown.shade700),
        body: _wrap([
          _label('أرقام فقط:'),
          TextFormField(
            decoration: const InputDecoration(labelText: 'أرقام فقط', border: OutlineInputBorder()),
            // FilteringTextInputFormatter: يُرشّح الأحرف المدخلة
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
          ),
          _label('حروف فقط (بدون أرقام):'),
          TextFormField(
            decoration: const InputDecoration(labelText: 'حروف فقط', border: OutlineInputBorder()),
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Zء-ي ]'))],
          ),
          _label('LengthLimitingTextInputFormatter: حد الأحرف'),
          TextFormField(
            decoration: const InputDecoration(labelText: 'حد 10 أحرف', border: OutlineInputBorder()),
            // LengthLimitingTextInputFormatter: يُحدد عدد الأحرف المسموح به
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
          ),
          _label('تنسيق رقم الهاتف تلقائياً:'),
          TextFormField(
            decoration: InputDecoration(labelText: 'هاتف: 06-XX-XX-XX-XX', border: const OutlineInputBorder(), helperText: _formatted),
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
              // TextInputFormatter مخصص
              _PhoneFormatter(),
            ],
            onChanged: (v) => setState(() => _formatted = v),
          ),
        ]),
      ),
    );
  }
}

class _PhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue old, TextEditingValue newVal) {
    final digits = newVal.text.replaceAll('-', '');
    final buffer = StringBuffer();
    for (int i = 0; i < digits.length && i < 10; i++) {
      if (i == 2 || i == 4 || i == 6 || i == 8) buffer.write('-');
      buffer.write(digits[i]);
    }
    final str = buffer.toString();
    return newVal.copyWith(text: str, selection: TextSelection.collapsed(offset: str.length));
  }
}

// ============================================================
// 28. textCapitalization
// ============================================================
class _CapitalizationPage extends StatelessWidget {
  const _CapitalizationPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('textCapitalization', Colors.lime.shade700),
        body: _wrap([
          _label('none: بدون تكبير (افتراضي)'),
          TextFormField(
            textCapitalization: TextCapitalization.none,
            decoration: InputDecoration(labelText: 'none', border: OutlineInputBorder()),
          ),
          _label('words: أول حرف من كل كلمة كبير'),
          TextFormField(
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(labelText: 'words: Hello World', border: OutlineInputBorder()),
          ),
          _label('sentences: أول حرف من كل جملة كبير'),
          TextFormField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(labelText: 'sentences', border: OutlineInputBorder()),
          ),
          _label('characters: كل الأحرف كبيرة'),
          TextFormField(
            textCapitalization: TextCapitalization.characters,
            decoration: InputDecoration(labelText: 'CHARACTERS', border: OutlineInputBorder()),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 29. textAlign و textAlignVertical
// ============================================================
class _TextAlignPage extends StatelessWidget {
  const _TextAlignPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('textAlign + textAlignVertical', Colors.orange.shade800),
        body: _wrap([
          ...([['right', TextAlign.right], ['left', TextAlign.left], ['center', TextAlign.center], ['justify', TextAlign.justify]]).map((item) =>
              Padding(padding: const EdgeInsets.only(bottom: 8), child: TextFormField(
                textAlign: item[1] as TextAlign,
                initialValue: 'textAlign: ${item[0]}',
                decoration: InputDecoration(labelText: 'textAlign.${item[0]}', border: const OutlineInputBorder()),
              ))),
          _label('textAlignVertical:'),
          SizedBox(height: 80, child: TextFormField(
            textAlignVertical: TextAlignVertical.top,
            maxLines: 3,
            initialValue: 'textAlignVertical: top\nالنص في الأعلى',
            decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'top'),
          )),
          const SizedBox(height: 8),
          SizedBox(height: 80, child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            maxLines: 3,
            initialValue: 'center',
            decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'center'),
          )),
        ]),
      ),
    );
  }
}

// ============================================================
// 30. textDirection
// ============================================================
class _TextDirectionPage extends StatelessWidget {
  const _TextDirectionPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('textDirection', Colors.teal.shade800),
        body: _wrap([
          _label('textDirection: rtl (من اليمين)'),
          TextFormField(
            textDirection: TextDirection.rtl,
            initialValue: 'نص عربي من اليمين',
            decoration: InputDecoration(labelText: 'RTL', border: OutlineInputBorder()),
          ),
          _label('textDirection: ltr (من اليسار)'),
          TextFormField(
            textDirection: TextDirection.ltr,
            initialValue: 'English text LTR',
            decoration: InputDecoration(labelText: 'LTR', border: OutlineInputBorder()),
          ),
          _label('بدون textDirection (يرث من Directionality):'),
          TextFormField(
            initialValue: 'يرث الاتجاه من الـ Directionality',
            decoration: InputDecoration(labelText: 'Inherited', border: OutlineInputBorder()),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 31. maxLines و minLines
// ============================================================
class _LinesPage extends StatelessWidget {
  const _LinesPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('maxLines + minLines', Colors.deepPurple.shade700),
        body: _wrap([
          _label('maxLines: 1 (سطر واحد - افتراضي):'),
          TextFormField(maxLines: 1, decoration: InputDecoration(labelText: 'maxLines: 1', border: OutlineInputBorder())),
          _label('maxLines: 3 (3 أسطر كحد أقصى):'),
          TextFormField(maxLines: 3, decoration: InputDecoration(labelText: 'maxLines: 3', border: OutlineInputBorder())),
          _label('minLines: 3, maxLines: 6 (يتوسع):'),
          TextFormField(
            minLines: 3,
            maxLines: 6,
            decoration: InputDecoration(labelText: 'minLines: 3 maxLines: 6', border: OutlineInputBorder(), alignLabelWithHint: true),
          ),
          _label('maxLines: null (لا نهائي):'),
          TextFormField(
            maxLines: null,
            decoration: InputDecoration(labelText: 'maxLines: null', border: OutlineInputBorder(), alignLabelWithHint: true),
          ),
          Container(padding: const EdgeInsets.all(10), color: Colors.deepPurple.shade50,
            child: const Text('• maxLines: 1 = TextField عادي\n• maxLines: null = لا حد للأسطر\n• minLines + maxLines = يتوسع تلقائياً\n• alignLabelWithHint: true → الـ label في الأعلى', style: TextStyle(fontSize: 12, height: 1.6)),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 32. maxLength
// ============================================================
class _MaxLengthPage extends StatefulWidget {
  const _MaxLengthPage();
  @override
  State<_MaxLengthPage> createState() => _MaxLengthPageState();
}

class _MaxLengthPageState extends State<_MaxLengthPage> {
  int _len = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('maxLength + Enforcement', Colors.red.shade900),
        body: _wrap([
          _label('maxLength: 20 (مع عداد):'),
          TextFormField(
            maxLength: 20,
            decoration: const InputDecoration(labelText: 'maxLength: 20', border: OutlineInputBorder()),
            onChanged: (v) => setState(() => _len = v.length),
          ),
          _label('MaxLengthEnforcement.enforced (يمنع الزيادة):'),
          TextFormField(
            maxLength: 10,
            // enforced: يمنع إدخال أحرف أكثر من الحد
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            decoration: InputDecoration(labelText: 'enforced: حد 10', border: OutlineInputBorder()),
          ),
          _label('MaxLengthEnforcement.none (يسمح بالتجاوز):'),
          TextFormField(
            maxLength: 10,
            // none: يسمح بالكتابة بعد الحد (يُلوّن العداد فقط)
            maxLengthEnforcement: MaxLengthEnforcement.none,
            decoration: InputDecoration(labelText: 'none: يمكن التجاوز', border: OutlineInputBorder()),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 33. expands
// ============================================================
class _ExpandsPage extends StatelessWidget {
  const _ExpandsPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('expands: true', Colors.blue.shade900),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            const Text('expands: true يملأ المساحة المتبقية:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
              child: TextFormField(
                // expands: true → يمتد ليملأ الـ parent تماماً
                // يجب استخدامه مع maxLines: null و minLines: null
                expands: true,
                maxLines: null,
                minLines: null,
                textAlignVertical: TextAlignVertical.top,
                decoration: const InputDecoration(
                  labelText: 'expands: true',
                  hintText: 'هذا الحقل يملأ المساحة كاملاً...',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

// ============================================================
// 34. readOnly و enabled
// ============================================================
class _ReadOnlyPage extends StatelessWidget {
  const _ReadOnlyPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('readOnly + enabled', Colors.grey.shade700),
        body: _wrap([
          _label('readOnly: true (قراءة فقط - يمكن النسخ):'),
          TextFormField(
            // readOnly: true → يمنع التعديل لكن يسمح بالنسخ والتحديد
            readOnly: true,
            initialValue: 'هذا النص لا يمكن تعديله لكن يمكن نسخه',
            decoration: InputDecoration(labelText: 'readOnly: true', border: OutlineInputBorder(), suffixIcon: Icon(Icons.lock, color: Colors.orange)),
          ),
          _label('enabled: false (معطّل كلياً):'),
          TextFormField(
            // enabled: false → يعطّل الحقل كلياً (لا تعديل ولا نسخ)
            enabled: false,
            initialValue: 'حقل معطّل تماماً',
            decoration: InputDecoration(labelText: 'enabled: false', border: OutlineInputBorder()),
          ),
          _label('enabled: true (مفعّل - افتراضي):'),
          TextFormField(
            enabled: true,
            decoration: InputDecoration(labelText: 'enabled: true (افتراضي)', border: OutlineInputBorder()),
          ),
          Container(padding: const EdgeInsets.all(10), color: Colors.grey.shade100,
            child: const Text('الفرق:\n• readOnly: true → يمنع الكتابة لكن يسمح بالنسخ والتركيز\n• enabled: false → يعطّل كل شيء (يُغيّر المظهر ويمنع التفاعل)', style: TextStyle(fontSize: 12, height: 1.6)),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 35. autofocus
// ============================================================
class _AutofocusPage extends StatelessWidget {
  const _AutofocusPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('autofocus', Colors.green.shade900),
        body: _wrap([
          _label('autofocus: true (يفتح الكيبورد تلقائياً):'),
          TextFormField(
            // autofocus: true → يُركّز على الحقل ويفتح الكيبورد عند بناء الصفحة
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'autofocus: true',
              hintText: 'الكيبورد يفتح تلقائياً',
              border: OutlineInputBorder(),
            ),
          ),
          _label('autofocus: false (افتراضي):'),
          TextFormField(
            autofocus: false,
            decoration: InputDecoration(labelText: 'autofocus: false', border: OutlineInputBorder()),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 36. FocusNode
// ============================================================
class _FocusNodePage extends StatefulWidget {
  const _FocusNodePage();
  @override
  State<_FocusNodePage> createState() => _FocusNodePageState();
}

class _FocusNodePageState extends State<_FocusNodePage> {
  final FocusNode _focus1 = FocusNode();
  final FocusNode _focus2 = FocusNode();
  final FocusNode _focus3 = FocusNode();

  @override
  void initState() {
    super.initState();
    _focus1.addListener(() => setState(() {}));
    _focus2.addListener(() => setState(() {}));
    _focus3.addListener(() => setState(() {}));
  }

  @override
  void dispose() { _focus1.dispose(); _focus2.dispose(); _focus3.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('FocusNode', Colors.purple.shade900),
        body: _wrap([
          _focusField('حقل 1', _focus1, Colors.blue),
          const SizedBox(height: 10),
          _focusField('حقل 2', _focus2, Colors.green),
          const SizedBox(height: 10),
          _focusField('حقل 3', _focus3, Colors.orange),
          const SizedBox(height: 16),
          Wrap(spacing: 8, runSpacing: 8, children: [
            ElevatedButton(onPressed: () => FocusScope.of(context).requestFocus(_focus1), style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white), child: const Text('تركيز 1')),
            ElevatedButton(onPressed: () => FocusScope.of(context).requestFocus(_focus2), style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white), child: const Text('تركيز 2')),
            ElevatedButton(onPressed: () => FocusScope.of(context).requestFocus(_focus3), style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white), child: const Text('تركيز 3')),
            ElevatedButton(onPressed: () => FocusScope.of(context).unfocus(), style: ElevatedButton.styleFrom(backgroundColor: Colors.grey, foregroundColor: Colors.white), child: const Text('إلغاء التركيز')),
          ]),
          const SizedBox(height: 8),
          Container(padding: const EdgeInsets.all(10), color: Colors.purple.shade50,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('حقل 1 مُركَّز: ${_focus1.hasFocus}'),
                Text('حقل 2 مُركَّز: ${_focus2.hasFocus}'),
                Text('حقل 3 مُركَّز: ${_focus3.hasFocus}'),
              ])),
        ]),
      ),
    );
  }

  Widget _focusField(String label, FocusNode node, Color color) {
    return TextFormField(
      focusNode: node,
      decoration: InputDecoration(
        labelText: '$label ${node.hasFocus ? "🟢 مُركَّز" : "⚪ غير مُركَّز"}',
        border: OutlineInputBorder(borderSide: BorderSide(color: node.hasFocus ? color : Colors.grey)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: color, width: 2)),
        filled: node.hasFocus,
        fillColor: color.withOpacity(0.08),
      ),
    );
  }
}

// ============================================================
// 37. autocorrect و enableSuggestions
// ============================================================
class _AutocorrectPage extends StatelessWidget {
  const _AutocorrectPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('autocorrect + enableSuggestions', Colors.orange.shade900),
        body: _wrap([
          _label('autocorrect: true (افتراضي):'),
          TextFormField(
            autocorrect: true,
            decoration: InputDecoration(labelText: 'autocorrect: true', border: OutlineInputBorder()),
          ),
          _label('autocorrect: false (لكلمات المرور والرموز):'),
          TextFormField(
            // autocorrect: false → يُعطّل التصحيح التلقائي
            autocorrect: false,
            decoration: InputDecoration(labelText: 'autocorrect: false', border: OutlineInputBorder()),
          ),
          _label('enableSuggestions: false:'),
          TextFormField(
            // enableSuggestions: false → يُعطّل اقتراحات الكلمات
            enableSuggestions: false,
            decoration: InputDecoration(labelText: 'enableSuggestions: false', border: OutlineInputBorder()),
          ),
          Container(padding: const EdgeInsets.all(10), color: Colors.orange.shade50,
            child: const Text('للحقول الحساسة (كلمة المرور، رمز التحقق):\nautocorrect: false\nenableSuggestions: false\nobscureText: true', style: TextStyle(fontSize: 12, height: 1.6)),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 38. enableInteractiveSelection
// ============================================================
class _SelectionPage extends StatelessWidget {
  const _SelectionPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('enableInteractiveSelection', Colors.cyan.shade900),
        body: _wrap([
          _label('enableInteractiveSelection: true (افتراضي):'),
          TextFormField(
            initialValue: 'يمكن تحديد هذا النص ونسخه',
            // enableInteractiveSelection: true → يسمح بتحديد النص ونسخه ولصقه
            enableInteractiveSelection: true,
            decoration: InputDecoration(labelText: 'تحديد مسموح', border: OutlineInputBorder()),
          ),
          _label('enableInteractiveSelection: false:'),
          TextFormField(
            initialValue: 'لا يمكن تحديد هذا النص',
            // enableInteractiveSelection: false → يمنع تحديد النص والقوائم
            enableInteractiveSelection: false,
            decoration: InputDecoration(labelText: 'تحديد ممنوع', border: OutlineInputBorder()),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 39. style
// ============================================================
class _StylePage extends StatelessWidget {
  const _StylePage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('style: TextStyle مخصص', Colors.pink.shade900),
        body: _wrap([
          _label('style: تنسيق النص المدخل:'),
          TextFormField(
            initialValue: 'نص كبير غامق',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink),
            decoration: const InputDecoration(labelText: 'fontSize: 20 bold', border: OutlineInputBorder()),
          ),
          TextFormField(
            initialValue: 'نص مائل ملون',
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.blue.shade700, letterSpacing: 2),
            decoration: const InputDecoration(labelText: 'italic + letterSpacing', border: OutlineInputBorder()),
          ),
          TextFormField(
            initialValue: 'نص أحادي العرض',
            style: const TextStyle(fontFamily: 'monospace', fontSize: 14),
            decoration: const InputDecoration(labelText: 'monospace font', border: OutlineInputBorder()),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 40. cursor
// ============================================================
class _CursorPage extends StatelessWidget {
  const _CursorPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('cursor مخصص', Colors.indigo.shade900),
        body: _wrap([
          _label('cursorColor مخصص:'),
          TextFormField(
            // cursorColor: لون مؤشر الكتابة
            cursorColor: Colors.red,
            autofocus: false,
            decoration: const InputDecoration(labelText: 'cursorColor: red', border: OutlineInputBorder()),
          ),
          _label('cursorWidth مخصص:'),
          TextFormField(
            // cursorWidth: عرض مؤشر الكتابة (الافتراضي: 2)
            cursorWidth: 4,
            cursorColor: Colors.blue,
            decoration: InputDecoration(labelText: 'cursorWidth: 4', border: OutlineInputBorder()),
          ),
          _label('cursorRadius مخصص:'),
          TextFormField(
            // cursorRadius: زوايا مؤشر الكتابة
            cursorRadius: Radius.circular(8),
            cursorWidth: 4,
            cursorColor: Colors.green,
            decoration: InputDecoration(labelText: 'cursorRadius: 8', border: OutlineInputBorder()),
          ),
          _label('cursorHeight مخصص:'),
          TextFormField(
            // cursorHeight: ارتفاع مؤشر الكتابة
            cursorHeight: 30,
            cursorColor: Colors.purple,
            decoration: InputDecoration(labelText: 'cursorHeight: 30', border: OutlineInputBorder()),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 41. selectionControls و contextMenuBuilder
// ============================================================
class _SelectionControlsPage extends StatelessWidget {
  const _SelectionControlsPage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('contextMenuBuilder مخصص', Colors.brown.shade800),
        body: _wrap([
          _label('contextMenuBuilder: قائمة سياق مخصصة'),
          TextFormField(
            initialValue: 'حدد هذا النص لرؤية القائمة المخصصة',
            decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'قائمة مخصصة'),
            // contextMenuBuilder: يُخصّص قائمة النسخ/اللصق
            contextMenuBuilder: (context, editableTextState) {
              return AdaptiveTextSelectionToolbar(
                anchors: editableTextState.contextMenuAnchors,
                children: [
                  TextButton(onPressed: () { editableTextState.copySelection(SelectionChangedCause.toolbar); }, child: const Text('نسخ', style: TextStyle(color: Colors.blue))),
                  TextButton(onPressed: () { editableTextState.selectAll(SelectionChangedCause.toolbar); }, child: const Text('تحديد الكل', style: TextStyle(color: Colors.green))),
                  TextButton(onPressed: () { editableTextState.cutSelection(SelectionChangedCause.toolbar); }, child: const Text('قص', style: TextStyle(color: Colors.orange))),
                ],
              );
            },
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 42. strutStyle
// ============================================================
class _StrutStylePage extends StatelessWidget {
  const _StrutStylePage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('strutStyle', Colors.teal.shade900),
        body: _wrap([
          _label('strutStyle الافتراضي:'),
          TextFormField(
            maxLines: 3,
            decoration: InputDecoration(labelText: 'بدون strutStyle', border: OutlineInputBorder()),
          ),
          _label('strutStyle مع ارتفاع أسطر مخصص:'),
          TextFormField(
            maxLines: 3,
            // strutStyle: يُحدد ارتفاع الأسطر الأدنى
            strutStyle: StrutStyle(
              fontSize: 16,
              // height: مضاعف ارتفاع السطر
              height: 2.0,
              // leading: المسافة بين الأسطر
              leading: 0.5,
              // forceStrutHeight: true → يُجبر الارتفاع حتى مع خطوط مختلفة
              forceStrutHeight: true,
            ),
            decoration: InputDecoration(labelText: 'height: 2.0 leading: 0.5', border: OutlineInputBorder(), alignLabelWithHint: true),
          ),
        ]),
      ),
    );
  }
}

// ============================================================
// 43. scrollController و scrollPhysics
// ============================================================
class _ScrollPage extends StatefulWidget {
  const _ScrollPage();
  @override
  State<_ScrollPage> createState() => _ScrollPageState();
}

class _ScrollPageState extends State<_ScrollPage> {
  final ScrollController _scrollCtrl = ScrollController();

  @override
  void dispose() { _scrollCtrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('scrollController + scrollPhysics', Colors.deepOrange.shade800),
        body: _wrap([
          _label('scrollController: للتحكم في تمرير النص الطويل'),
          SizedBox(
            height: 100,
            child: TextFormField(
              // scrollController: للتحكم في التمرير داخل الحقل
              scrollController: _scrollCtrl,
              maxLines: 4,
              initialValue: 'هذا نص طويل جداً يمكن التمرير فيه...\nسطر ثانٍ\nسطر ثالث\nسطر رابع\nسطر خامس',
              decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'scrollController', alignLabelWithHint: true),
            ),
          ),
          const SizedBox(height: 8),
          Row(children: [
            ElevatedButton(onPressed: () => _scrollCtrl.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.easeOut), style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange, foregroundColor: Colors.white), child: const Text('للأعلى')),
            const SizedBox(width: 8),
            ElevatedButton(onPressed: () => _scrollCtrl.animateTo(_scrollCtrl.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut), style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange, foregroundColor: Colors.white), child: const Text('للأسفل')),
          ]),
          _label('scrollPhysics: سلوك التمرير:'),
          SizedBox(height: 80, child: TextFormField(
            maxLines: 4,
            // scrollPhysics: سلوك التمرير داخل الحقل
            scrollPhysics: const BouncingScrollPhysics(),
            initialValue: 'BouncingScrollPhysics\nسطر 2\nسطر 3\nسطر 4',
            decoration: const InputDecoration(labelText: 'BouncingScrollPhysics', border: OutlineInputBorder(), alignLabelWithHint: true, isDense: true),
          )),
        ]),
      ),
    );
  }
}

// ============================================================
// 44. autovalidateMode
// ============================================================
class _AutovalidatePage extends StatefulWidget {
  const _AutovalidatePage();
  @override
  State<_AutovalidatePage> createState() => _AutovalidatePageState();
}

class _AutovalidatePageState extends State<_AutovalidatePage> {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar('AutovalidateMode', Colors.blue.shade800),
        body: Form(
          key: _key,
          child: _wrap([
            _label('disabled: لا يتحقق إلا عند validate()'),
            TextFormField(
              // autovalidateMode: disabled (افتراضي) → يتحقق عند form.validate() فقط
              autovalidateMode: AutovalidateMode.disabled,
              validator: (v) => v!.isEmpty ? 'مطلوب (disabled)' : null,
              decoration: const InputDecoration(labelText: 'disabled', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            _label('onUserInteraction: يتحقق بعد أول تفاعل:'),
            TextFormField(
              // onUserInteraction: يتحقق بعد أول تفاعل مع الحقل
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (v) => v!.length < 3 ? 'أقل من 3 أحرف' : null,
              decoration: const InputDecoration(labelText: 'onUserInteraction', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            _label('always: يتحقق دائماً (حتى قبل التفاعل):'),
            TextFormField(
              // always: يتحقق دائماً حتى قبل الكتابة
              autovalidateMode: AutovalidateMode.always,
              validator: (v) => v!.isEmpty ? 'هذا الحقل مطلوب دائماً' : null,
              decoration: const InputDecoration(labelText: 'always', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _key.currentState!.validate(),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade800, foregroundColor: Colors.white, minimumSize: const Size.fromHeight(48)),
              child: const Text('تحقق يدوياً validate()'),
            ),
          ]),
        ),
      ),
    );
  }
}

// ============================================================
// 45. نموذج احترافي كامل
// ============================================================
class _ProFormPage extends StatefulWidget {
  const _ProFormPage();
  @override
  State<_ProFormPage> createState() => _ProFormPageState();
}

class _ProFormPageState extends State<_ProFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  final _bioCtrl = TextEditingController();
  bool _obscurePass = true;
  bool _obscureConfirm = true;
  bool _agreed = false;
  bool _isLoading = false;

  final _emailFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passFocus = FocusNode();
  final _confirmFocus = FocusNode();
  final _bioFocus = FocusNode();

  @override
  void dispose() {
    for (var c in [_nameCtrl, _emailCtrl, _phoneCtrl, _passCtrl, _confirmCtrl, _bioCtrl]) c.dispose();
    for (var f in [_emailFocus, _phoneFocus, _passFocus, _confirmFocus, _bioFocus]) f.dispose();
    super.dispose();
  }

  InputDecoration _dec(String label, IconData icon, {Widget? suffix, String? hint}) => InputDecoration(
    labelText: label, hintText: hint,
    prefixIcon: Icon(icon, color: const Color(0xFF1565C0)),
    suffixIcon: suffix,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF1565C0), width: 2)),
    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.red)),
    focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.red, width: 2)),
    filled: true, fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  );

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF1565C0);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(backgroundColor: primary, foregroundColor: Colors.white, title: const Text('نموذج تسجيل احترافي'), centerTitle: true),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              // Header
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(gradient: const LinearGradient(colors: [primary, Color(0xFF7B1FA2)], begin: Alignment.topRight, end: Alignment.bottomLeft), borderRadius: BorderRadius.circular(16)),
                child: const Row(children: [
                  CircleAvatar(radius: 28, backgroundColor: Colors.white24, child: Icon(Icons.person_add, color: Colors.white, size: 28)),
                  SizedBox(width: 12),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('إنشاء حساب جديد', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('أدخل بياناتك بدقة', style: TextStyle(color: Colors.white70, fontSize: 13)),
                  ]),
                ]),
              ),
              const SizedBox(height: 20),

              // الاسم
              TextFormField(controller: _nameCtrl, textInputAction: TextInputAction.next, decoration: _dec('الاسم الكامل *', Icons.person, hint: 'MProgrammer01'),
                  onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_emailFocus),
                  validator: (v) { if (v!.trim().isEmpty) return 'الاسم مطلوب'; if (v.trim().length < 3) return 'الاسم يجب 3 أحرف على الأقل'; return null; }),
              const SizedBox(height: 14),

              // البريد
              TextFormField(controller: _emailCtrl, focusNode: _emailFocus, keyboardType: TextInputType.emailAddress, textInputAction: TextInputAction.next,
                  decoration: _dec('البريد الإلكتروني *', Icons.email, hint: 'example@mail.com'),
                  onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_phoneFocus),
                  validator: (v) { if (v!.isEmpty) return 'البريد مطلوب'; if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v)) return 'صيغة البريد غير صحيحة'; return null; }),
              const SizedBox(height: 14),

              // الهاتف
              TextFormField(controller: _phoneCtrl, focusNode: _phoneFocus, keyboardType: TextInputType.phone, textInputAction: TextInputAction.next,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10)],
                  decoration: _dec('رقم الهاتف *', Icons.phone, hint: '0600000000'),
                  onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_passFocus),
                  validator: (v) { if (v!.isEmpty) return 'الهاتف مطلوب'; if (v.length < 10) return 'الرقم يجب 10 أرقام'; return null; }),
              const SizedBox(height: 14),

              // كلمة المرور
              TextFormField(controller: _passCtrl, focusNode: _passFocus, obscureText: _obscurePass, textInputAction: TextInputAction.next,
                  autocorrect: false, enableSuggestions: false,
                  decoration: _dec('كلمة المرور *', Icons.lock, suffix: IconButton(icon: Icon(_obscurePass ? Icons.visibility : Icons.visibility_off, color: Colors.grey), onPressed: () => setState(() => _obscurePass = !_obscurePass))),
                  onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_confirmFocus),
                  validator: (v) { if (v!.isEmpty) return 'كلمة المرور مطلوبة'; if (v.length < 8) return 'يجب 8 أحرف على الأقل'; if (!RegExp(r'[A-Z]').hasMatch(v)) return 'يجب حرف كبير واحد على الأقل'; return null; }),
              const SizedBox(height: 14),

              // تأكيد كلمة المرور
              TextFormField(controller: _confirmCtrl, focusNode: _confirmFocus, obscureText: _obscureConfirm, textInputAction: TextInputAction.next,
                  autocorrect: false, enableSuggestions: false,
                  decoration: _dec('تأكيد كلمة المرور *', Icons.lock_outline, suffix: IconButton(icon: Icon(_obscureConfirm ? Icons.visibility : Icons.visibility_off, color: Colors.grey), onPressed: () => setState(() => _obscureConfirm = !_obscureConfirm))),
                  onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_bioFocus),
                  validator: (v) { if (v!.isEmpty) return 'تأكيد كلمة المرور مطلوب'; if (v != _passCtrl.text) return 'كلمتا المرور غير متطابقتين'; return null; }),
              const SizedBox(height: 14),

              // نبذة
              TextFormField(controller: _bioCtrl, focusNode: _bioFocus, maxLines: 3, minLines: 2, maxLength: 200, textInputAction: TextInputAction.done,
                  decoration: _dec('نبذة شخصية', Icons.info_outline, hint: 'أخبرنا عن نفسك...').copyWith(alignLabelWithHint: true, counterText: '${_bioCtrl.text.length}/200'),
                  onChanged: (_) => setState(() {}),
                  onFieldSubmitted: (_) => FocusScope.of(context).unfocus()),
              const SizedBox(height: 14),

              // الموافقة
              CheckboxListTile(
                value: _agreed, onChanged: (v) => setState(() => _agreed = v!),
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('أوافق على الشروط والأحكام', style: TextStyle(fontSize: 14)),
                activeColor: primary,
              ),
              const SizedBox(height: 16),

              // زر التسجيل
              SizedBox(
                width: double.infinity, height: 52,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : () async {
                    if (!_agreed) { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('يجب الموافقة على الشروط'), backgroundColor: Colors.red)); return; }
                    if (_formKey.currentState!.validate()) {
                      setState(() => _isLoading = true);
                      await Future.delayed(const Duration(seconds: 2));
                      setState(() => _isLoading = false);
                      if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('✅ تم التسجيل بنجاح!'), backgroundColor: Colors.green));
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: primary, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  child: _isLoading ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) : const Text('إنشاء الحساب', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(onPressed: () => Navigator.pop(context), child: const Text('لديك حساب بالفعل؟ تسجيل الدخول', style: TextStyle(color: primary))),
            ]),
          ),
        ),
      ),
    );
  }
}