import 'package:flutter/material.dart';

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 0️⃣ تشغيل التطبيق
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
void main() => runApp(const SliderMasterApp());

class SliderMasterApp extends StatelessWidget {
  const SliderMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'كل مفاهيم Slider',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      builder: (context, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: child ?? const SizedBox(),
      ),
      home: const SliderHomeScreen(),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// الشاشة الرئيسية: تجمع جميع المفاهيم
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class SliderHomeScreen extends StatelessWidget {
  const SliderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎛️ جميع مفاهيم Slider'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const _ConceptBasic(),
          const _ConceptDiscrete(),
          const _ConceptRange(),
          const _ConceptAdaptive(),
          const _ConceptCallbacks(),
          const _ConceptInteraction(),
          const _ConceptFullTheme(),
          const _ConceptCustomShapes(),
          const _ConceptGradientTrack(),
          const _ConceptSyncTextField(),
          _ConceptValueNotifier(),
          const _ConceptAccessibility(),
          const _ConceptFormField(),
          const _ConceptValidation(),
        ],
      ),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 1️⃣ Slider أساسي مستمر (Continuous)
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _ConceptBasic extends StatefulWidget {
  const _ConceptBasic({super.key});
  @override
  State<_ConceptBasic> createState() => _ConceptBasicState();
}
class _ConceptBasicState extends State<_ConceptBasic> {
  double _value = 0.5;
  @override
  Widget build(BuildContext context) => _Card(
    title: '1️⃣ Slider مستمر (Continuous)',
    child: Column(children: [
      Text('القيمة: ${_value.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18)),
      Slider(
        value: _value,
        min: 0.0,
        max: 1.0,
        onChanged: (v) => setState(() => _value = v),
      ),
    ]),
  );
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 2️⃣ Slider منفصل بخطوات (Discrete)
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _ConceptDiscrete extends StatefulWidget {
  const _ConceptDiscrete({super.key});
  @override
  State<_ConceptDiscrete> createState() => _ConceptDiscreteState();
}
class _ConceptDiscreteState extends State<_ConceptDiscrete> {
  double _value = 0.0;
  @override
  Widget build(BuildContext context) => _Card(
    title: '2️⃣ Slider منفصل (Discrete + divisions + label)',
    child: Column(children: [
      Slider(
        value: _value,
        min: 0, max: 100,
        divisions: 10, // 🔑 يجعل الـ Slider يتحرك بخطوات ثابتة
        label: '${_value.round()}%', // 🔑 يظهر فوق المقبض
        onChanged: (v) => setState(() => _value = v),
      ),
      const Text('divisions = 10 → 11 نقطة ممكنة (0, 10, 20...)', style: TextStyle(color: Colors.grey, fontSize: 12)),
    ]),
  );
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 3️⃣ RangeSlider (اختيار مدى بين قيمتين)
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _ConceptRange extends StatefulWidget {
  const _ConceptRange({super.key});
  @override
  State<_ConceptRange> createState() => _ConceptRangeState();
}
class _ConceptRangeState extends State<_ConceptRange> {
  RangeValues _range = const RangeValues(0.2, 0.8);
  @override
  Widget build(BuildContext context) => _Card(
    title: '3️⃣ RangeSlider (مدى قيمتين)',
    child: Column(children: [
      RangeSlider(
        values: _range,
        min: 0, max: 100,
        divisions: 20,
        labels: RangeLabels(
          'بداية: ${_range.start.round()}',
          'نهاية: ${_range.end.round()}',
        ),
        onChanged: (v) => setState(() => _range = v),
      ),
      Text('المدى: ${_range.start.toStringAsFixed(0)} - ${_range.end.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.bold)),
    ]),
  );
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 4️⃣ Slider.adaptive (يتغير حسب النظام iOS/Android)
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _ConceptAdaptive extends StatefulWidget {
  const _ConceptAdaptive({super.key});
  @override
  State<_ConceptAdaptive> createState() => _ConceptAdaptiveState();
}
class _ConceptAdaptiveState extends State<_ConceptAdaptive> {
  double _value = 0.5;
  @override
  Widget build(BuildContext context) => _Card(
    title: '4️⃣ Slider.adaptive (Android/Material ↔ iOS/Cupertino)',
    child: Column(children: [
      Slider.adaptive(
        value: _value,
        min: 0, max: 100,
        onChanged: (v) => setState(() => _value = v),
      ),
      const Text('يختار التصميم تلقائياً حسب المنصة', style: TextStyle(color: Colors.grey, fontSize: 12)),
    ]),
  );
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 5️⃣ Callbacks (بداية، تغيير، نهاية)
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _ConceptCallbacks extends StatefulWidget {
  const _ConceptCallbacks({super.key});
  @override
  State<_ConceptCallbacks> createState() => _ConceptCallbacksState();
}
class _ConceptCallbacksState extends State<_ConceptCallbacks> {
  double _value = 50;
  String _status = 'في الانتظار...';
  @override
  Widget build(BuildContext context) => _Card(
    title: '5️⃣ Callbacks: onChangeStart, onChanged, onChangeEnd',
    child: Column(children: [
      Text('الحالة: $_status', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      Slider(
        value: _value,
        min: 0, max: 100,
        onChangeStart: (v) => setState(() => _status = '🔵 بدأ السحب: ${v.round()}'),
        onChanged: (v) => setState(() => _value = v),
        onChangeEnd: (v) => setState(() => _status = '🟢 انتهى السحب: ${v.round()}'),
      ),
    ]),
  );
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 6️⃣ allowedInteraction (التحكم بنوع التفاعل)
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _ConceptInteraction extends StatefulWidget {
  const _ConceptInteraction({super.key});
  @override
  State<_ConceptInteraction> createState() => _ConceptInteractionState();
}
class _ConceptInteractionState extends State<_ConceptInteraction> {
  double _value = 50;
  SliderInteraction _mode = SliderInteraction.tapAndSlide;
  @override
  Widget build(BuildContext context) => _Card(
    title: '6️⃣ allowedInteraction (تحكم بطريقة التفاعل)',
    child: Column(children: [
      DropdownButton<SliderInteraction>(
        value: _mode,
        isExpanded: true,
        items: SliderInteraction.values.map((e) => DropdownMenuItem(value: e, child: Text(e.toString().split('.').last))).toList(),
        onChanged: (v) => setState(() => _mode = v!),
      ),
      Slider(
        value: _value,
        min: 0, max: 100,
        allowedInteraction: _mode,
        onChanged: (v) => setState(() => _value = v),
      ),
      const Text('onlyTap = نقر فقط | onlySlide = سحب فقط | tapAndSlide = كلاهما', style: TextStyle(color: Colors.grey, fontSize: 12)),
    ]),
  );
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 7️⃣ SliderTheme Full Customization
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _ConceptFullTheme extends StatefulWidget {
  const _ConceptFullTheme({super.key});
  @override
  State<_ConceptFullTheme> createState() => _ConceptFullThemeState();
}
class _ConceptFullThemeState extends State<_ConceptFullTheme> {
  double _value = 0.6;
  @override
  Widget build(BuildContext context) => _Card(
    title: '7️⃣ تخصيص كامل عبر SliderTheme',
    child: SliderTheme(
      data: SliderThemeData(
        trackHeight: 8,
        activeTrackColor: Colors.orange,
        inactiveTrackColor: Colors.orange.withOpacity(0.2),
        thumbColor: Colors.deepOrange,
        overlayColor: Colors.deepOrange.withOpacity(0.15),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 14),
        overlayShape: SliderComponentShape.noOverlay,
        tickMarkShape: const RoundSliderTickMarkShape(tickMarkRadius: 3),
        activeTickMarkColor: Colors.white,
        inactiveTickMarkColor: Colors.orange.shade300,
        valueIndicatorColor: Colors.green,
        valueIndicatorTextStyle: const TextStyle(color: Colors.white, fontSize: 12),
        valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
        showValueIndicator: ShowValueIndicator.onlyForDiscrete,
      ),
      child: Slider(
        value: _value,
        min: 0, max: 1,
        divisions: 5,
        label: '${(_value * 100).round()}%',
        onChanged: (v) => setState(() => _value = v),
      ),
    ),
  );
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 8️⃣ Custom Thumb Shape (مقبض مخصص)
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _CustomSquareThumb extends SliderComponentShape {
  const _CustomSquareThumb();
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => const Size(20, 20);

  @override
  void paint(PaintingContext context, Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;
    final thumbColor = sliderTheme.thumbColor ?? Colors.blue;
    final paint = Paint()..color = thumbColor;

    final rect = Rect.fromCenter(center: center, width: 20, height: 20);
    canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(4)), paint);
  }
}

class _ConceptCustomShapes extends StatefulWidget {
  const _ConceptCustomShapes({super.key});
  @override
  State<_ConceptCustomShapes> createState() => _ConceptCustomShapesState();
}
class _ConceptCustomShapesState extends State<_ConceptCustomShapes> {
  double _value = 0.4;
  @override
  Widget build(BuildContext context) => _Card(
    title: '8️⃣ أشكال مخصصة (Custom Thumb & Track)',
    child: SliderTheme(
      data: SliderThemeData(
        thumbShape: const _CustomSquareThumb(),
        trackHeight: 10,
        activeTrackColor: Colors.purple,
        inactiveTrackColor: Colors.purple.withOpacity(0.2),
        valueIndicatorShape: const RectangularSliderValueIndicatorShape(),
        showValueIndicator: ShowValueIndicator.always,
      ),
      child: Slider(
        value: _value,
        min: 0, max: 1,
        label: 'مربع',
        onChanged: (v) => setState(() => _value = v),
      ),
    ),
  );
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 9️⃣ Gradient Track Shape (مسار بتدرج لوني)
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _GradientTrackShape extends RoundedRectSliderTrackShape {
  const _GradientTrackShape();

  @override
  void paint(
      PaintingContext context,
      Offset offset, {
        required Animation<double> enableAnimation,
        required TextDirection textDirection,
        required SliderThemeData sliderTheme,
        required RenderBox parentBox,
        bool isDiscrete = false,
        bool isEnabled = false,
        double additionalActiveTrackHeight = 2,
        Offset? secondaryOffset,
        required Offset thumbCenter,
      }) {
    final canvas = context.canvas;
    final trackRect = getPreferredRect(
      parentBox: parentBox, offset: offset, sliderTheme: sliderTheme,
      isEnabled: isEnabled, isDiscrete: isDiscrete,
    );

    final inactiveColor = sliderTheme.inactiveTrackColor ?? Colors.grey.shade300;
    canvas.drawRect(trackRect, Paint()..color = inactiveColor);

    final activeTrackRect = Rect.fromLTRB(
      trackRect.left, trackRect.top - additionalActiveTrackHeight / 2,
      thumbCenter.dx, trackRect.bottom + additionalActiveTrackHeight / 2,
    );

    final gradient = LinearGradient(
      begin: Alignment.centerLeft, end: Alignment.centerRight,
      colors: [Colors.blue.shade300, Colors.blue.shade700],
    );
    canvas.drawRect(activeTrackRect, Paint()..shader = gradient.createShader(activeTrackRect));
  }
}


class _ConceptGradientTrack extends StatefulWidget {
  const _ConceptGradientTrack({super.key});
  @override
  State<_ConceptGradientTrack> createState() => _ConceptGradientTrackState();
}
class _ConceptGradientTrackState extends State<_ConceptGradientTrack> {
  double _value = 0.7;
  @override
  Widget build(BuildContext context) => _Card(
    title: '9️⃣ مسار متدرج اللون (Gradient Track)',
    child: SliderTheme(
      data: SliderThemeData(trackShape: const _GradientTrackShape(), trackHeight: 12),
      child: Slider(value: _value, min: 0, max: 1, onChanged: (v) => setState(() => _value = v)),
    ),
  );
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 🔟 مزامنة Slider مع TextField
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _ConceptSyncTextField extends StatefulWidget {
  const _ConceptSyncTextField({super.key});
  @override
  State<_ConceptSyncTextField> createState() => _ConceptSyncTextFieldState();
}
class _ConceptSyncTextFieldState extends State<_ConceptSyncTextField> {
  double _sliderValue = 50;
  late TextEditingController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = TextEditingController(text: '50');
  }

  @override
  Widget build(BuildContext context) => _Card(
    title: '🔟 مزامنة Slider ↔ TextField',
    child: Row(children: [
      Expanded(
        child: Slider(
          value: _sliderValue,
          min: 0, max: 100,
          onChanged: (v) {
            setState(() => _sliderValue = v);
            _ctrl.text = v.round().toString();
          },
        ),
      ),
      SizedBox(
        width: 70,
        child: TextField(
          controller: _ctrl,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(border: OutlineInputBorder(), isDense: true),
          onChanged: (txt) {
            final v = double.tryParse(txt);
            if (v != null && v >= 0 && v <= 100) {
              setState(() => _sliderValue = v);
            }
          },
        ),
      ),
    ]),
  );
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 1️⃣1️⃣ ValueListenableBuilder (أداء أفضل من setState)
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _ConceptValueNotifier extends StatelessWidget {
  _ConceptValueNotifier({super.key});
  final ValueNotifier<double> _notifier = ValueNotifier(0.5);

  @override
  Widget build(BuildContext context) => _Card(
    title: '1️⃣1️⃣ ValueListenableBuilder (أداء عالي)',
    child: ValueListenableBuilder<double>(
      valueListenable: _notifier,
      builder: (_, value, __) => Column(children: [
        Text('القيمة: ${value.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
        Slider(value: value, min: 0, max: 1, onChanged: (v) => _notifier.value = v),
      ]),
    ),
  );
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 1️⃣2️⃣ Accessibility & FocusNode (إمكانية الوصول ولوحة المفاتيح)
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _ConceptAccessibility extends StatefulWidget {
  const _ConceptAccessibility({super.key});
  @override
  State<_ConceptAccessibility> createState() => _ConceptAccessibilityState();
}
class _ConceptAccessibilityState extends State<_ConceptAccessibility> {
  double _value = 0.0;
  final FocusNode _focus = FocusNode();
  @override
  Widget build(BuildContext context) => _Card(
    title: '1️⃣2️⃣ إمكانية الوصول (Focus + Semantic)',
    child: Column(children: [
      Slider(
        value: _value,
        min: 0, max: 100,
        autofocus: true,
        focusNode: _focus,
        semanticFormatterCallback: (v) => '${v.round()} بالمائة', // 🔑 قارئ الشاشة
        onChanged: (v) => setState(() => _value = v),
      ),
      const Text('اضغط Tab/أسهم لوحة المفاتيح للتحكم. قارئ الشاشة يقرأ النسبة.', style: TextStyle(color: Colors.grey, fontSize: 12)),
    ]),
  );
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 1️⃣3️⃣ SliderFormField (دمج مع Form)
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class SliderFormField extends FormField<double> {
  SliderFormField({
    required double min, required double max, required int? divisions,
    String Function(double)? labelBuilder, super.key,
    double initialValue = 0, super.validator, super.onSaved, super.autovalidateMode,
  }) : super(
    initialValue: initialValue,
    builder: (FormFieldState<double> field) {
      final currentValue = field.value ?? 0.0;

      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Slider(
          value: currentValue,
          min: min, max: max, divisions: divisions,
          label: labelBuilder?.call(currentValue) ?? currentValue.toStringAsFixed(1),
          onChanged: (v) => field.didChange(v),
        ),
        if (field.hasError)
          Padding(
            padding: const EdgeInsets.only(top: 4, right: 12),
            child: Text(field.errorText!, style: const TextStyle(color: Colors.red, fontSize: 12)),
          ),
      ]);
    },
  );
}

class _ConceptFormField extends StatefulWidget {
  const _ConceptFormField({super.key});
  @override
  State<_ConceptFormField> createState() => _ConceptFormFieldState();
}
class _ConceptFormFieldState extends State<_ConceptFormField> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => _Card(
    title: '1️⃣3️⃣ Slider داخل Form (FormField)',
    child: Form(
      key: _formKey,
      child: Column(children: [
        SliderFormField(
          min: 0, max: 100, divisions: 10,
          labelBuilder: (v) => '${v.round()}%',
          initialValue: 30,
          validator: (v) => v == null || v < 20 ? 'يجب أن تكون ≥ 20' : null,
          onSaved: (v) => debugPrint('تم الحفظ: $v'),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('✅ تم التحقق والحفظ')));
            }
          },
          child: const Text('تحقق وحفظ'),
        ),
      ]),
    ),
  );
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 1️⃣4️⃣ Validation & Error Handling (التعامل الآمن مع القيم)
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _ConceptValidation extends StatefulWidget {
  const _ConceptValidation({super.key});
  @override
  State<_ConceptValidation> createState() => _ConceptValidationState();
}
class _ConceptValidationState extends State<_ConceptValidation> {
  double _value = 50;
  String _msg = 'القيم ضمن المدى الآمن';
  @override
  Widget build(BuildContext context) => _Card(
    title: '1️⃣4️⃣ التحقق من المدى وتجنب الأخطاء',
    child: Column(children: [
      Text(_msg, style: TextStyle(color: _msg.contains('✅') ? Colors.green : Colors.red, fontSize: 16)),
      Slider(
        value: _value,
        min: 10, max: 90,
        onChanged: (v) {
          // 🔑 Clamping: يمنع الخروج عن min/max حتى لو جاءت قيمة خاطئة
          final safe = v.clamp(10.0, 90.0);
          setState(() {
            _value = safe;
            _msg = safe >= 20 && safe <= 80 ? '✅ قيمة آمنة ومقبولة' : '⚠️ خارج النطاق المسموح (20-80)';
          });
        },
      ),
      const Text('استخدم .clamp() لتجنب AssertionError', style: TextStyle(color: Colors.grey, fontSize: 12)),
    ]),
  );
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 🧩 ويدجت مساعدة لتوحيد شكل البطاقات
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class _Card extends StatelessWidget {
  final String title;
  final Widget child;
  const _Card({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          child,
        ],
      ),
    );
  }
}