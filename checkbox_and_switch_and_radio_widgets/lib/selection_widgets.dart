import 'package:flutter/material.dart';

class SelectionWidgets extends StatelessWidget {
  const SelectionWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSectionTitle('1. Checkbox'),
            const CheckboxExamples(),

            _buildSectionTitle('2. CheckboxListTile'),
            const CheckboxListTileExamples(),

            _buildSectionTitle('3. Radio'),
            const RadioExamples(),

            _buildSectionTitle('4. RadioListTile'),
            const RadioListTileExamples(),

            _buildSectionTitle('5. Switch'),
            const SwitchExamples(),

            _buildSectionTitle('6. SwitchListTile'),
            const SwitchListTileExamples(),

            _buildSectionTitle('7. ListTile'),
            const ListTileExamples(),

            _buildSectionTitle('8. Real-World Examples'),
            const RealWorldExamples(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "Selection Widgets Concepts",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      backgroundColor: Colors.purple,
      centerTitle: true,
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 16, bottom: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple.shade100, Colors.purple.shade50],
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.purple.shade700,
        ),
      ),
    );
  }
}

// ==================== 1. Checkbox ====================
class CheckboxExamples extends StatefulWidget {
  const CheckboxExamples({super.key});

  @override
  State<CheckboxExamples> createState() => _CheckboxExamplesState();
}

class _CheckboxExamplesState extends State<CheckboxExamples> {
  bool _isChecked1 = false;
  bool _isChecked2 = true;
  bool? _tristate = null; // null, false, true

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Checkbox - مربع اختيار',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: const Text(
              'مربع يمكن تحديده أو إلغاء تحديده (true/false)',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),

          const SizedBox(height: 16),

          // Basic Checkbox
          const Text(
            'Checkbox أساسي',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked1,
                      onChanged: (value) {
                        setState(() {
                          _isChecked1 = value!;
                        });
                      },
                    ),
                    const Text(
                      'غير محدد (false)',
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked2,
                      onChanged: (value) {
                        setState(() {
                          _isChecked2 = value!;
                        });
                      },
                    ),
                    const Text(
                      'محدد (true)',
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: null, // Disabled
                    ),
                    const Text(
                      'معطل (disabled)',
                      style: TextStyle(color: Colors.grey),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Tristate Checkbox
          const Text(
            'Checkbox ثلاثي الحالات Tristate',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Checkbox(
                  value: _tristate,
                  tristate: true,
                  onChanged: (value) {
                    setState(() {
                      if (_tristate == null) {
                        _tristate = false;
                      } else if (_tristate == false) {
                        _tristate = true;
                      } else {
                        _tristate = null;
                      }
                    });
                  },
                ),
                Text(
                  _tristate == null
                      ? 'حالة وسطى (null)'
                      : _tristate!
                      ? 'محدد (true)'
                      : 'غير محدد (false)',
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Custom colors
          const Text(
            'ألوان مخصصة Custom Colors',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                  activeColor: Colors.red,
                ),
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                  activeColor: Colors.green,
                ),
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                  activeColor: Colors.blue,
                ),
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                  activeColor: Colors.orange,
                ),
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                  activeColor: Colors.purple,
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
          _buildCodeBox(
              'bool isChecked = false;\n\n'
                  'Checkbox(\n'
                  '  value: isChecked,\n'
                  '  onChanged: (value) {\n'
                  '    setState(() {\n'
                  '      isChecked = value!;\n'
                  '    });\n'
                  '  },\n'
                  ')'
          ),
        ],
      ),
    );
  }
}

// ==================== 2. CheckboxListTile ====================
class CheckboxListTileExamples extends StatefulWidget {
  const CheckboxListTileExamples({super.key});

  @override
  State<CheckboxListTileExamples> createState() =>
      _CheckboxListTileExamplesState();
}

class _CheckboxListTileExamplesState extends State<CheckboxListTileExamples> {
  bool _accept = false;
  bool _notifications = true;
  bool _darkMode = false;

  final List<String> _selectedHobbies = [];
  final List<String> _hobbies = ['القراءة', 'الرياضة', 'السفر', 'الطبخ'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'CheckboxListTile - عنصر قائمة مع Checkbox',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: const Text(
              'Checkbox مع عنوان ووصف في عنصر واحد',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),

          const SizedBox(height: 16),

          // Basic
          const Text(
            'CheckboxListTile أساسي',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                CheckboxListTile(
                  value: _accept,
                  onChanged: (value) {
                    setState(() {
                      _accept = value!;
                    });
                  },
                  title: const Text(
                    'أوافق على الشروط والأحكام',
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const Divider(height: 1),
                CheckboxListTile(
                  value: _notifications,
                  onChanged: (value) {
                    setState(() {
                      _notifications = value!;
                    });
                  },
                  title: const Text(
                    'تلقي الإشعارات',
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: const Text(
                    'السماح بإرسال الإشعارات',
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const Divider(height: 1),
                CheckboxListTile(
                  value: _darkMode,
                  onChanged: (value) {
                    setState(() {
                      _darkMode = value!;
                    });
                  },
                  title: const Text(
                    'الوضع الداكن',
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: const Text(
                    'استخدام المظهر الداكن',
                    textDirection: TextDirection.rtl,
                  ),
                  secondary: const Icon(Icons.dark_mode),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Multiple selection
          const Text(
            'اختيار متعدد Multiple Selection',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: _hobbies.map((hobby) {
                return CheckboxListTile(
                  value: _selectedHobbies.contains(hobby),
                  onChanged: (value) {
                    setState(() {
                      if (value!) {
                        _selectedHobbies.add(hobby);
                      } else {
                        _selectedHobbies.remove(hobby);
                      }
                    });
                  },
                  title: Text(
                    hobby,
                    textDirection: TextDirection.rtl,
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                );
              }).toList(),
            ),
          ),

          if (_selectedHobbies.isNotEmpty) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'محدد: ${_selectedHobbies.join(", ")}',
                textDirection: TextDirection.rtl,
              ),
            ),
          ],

          const SizedBox(height: 8),
          _buildCodeBox(
              'CheckboxListTile(\n'
                  '  value: isChecked,\n'
                  '  onChanged: (value) {\n'
                  '    setState(() {\n'
                  '      isChecked = value!;\n'
                  '    });\n'
                  '  },\n'
                  '  title: Text("عنوان"),\n'
                  '  subtitle: Text("وصف"),\n'
                  '  secondary: Icon(Icons.info),\n'
                  ')'
          ),
        ],
      ),
    );
  }
}

// ==================== 3. Radio ====================
class RadioExamples extends StatefulWidget {
  const RadioExamples({super.key});

  @override
  State<RadioExamples> createState() => _RadioExamplesState();
}

class _RadioExamplesState extends State<RadioExamples> {
  String _gender = 'male';
  int _rating = 3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Radio - زر اختيار واحد',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: const Text(
              'اختيار خيار واحد فقط من مجموعة خيارات',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),

          const SizedBox(height: 16),

          // Basic Radio
          const Text(
            'Radio أساسي',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'الجنس Gender:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Radio<String>(
                      value: 'male',
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    ),
                    const Text(
                      'ذكر Male',
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: 'female',
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    ),
                    const Text(
                      'أنثى Female',
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Rating example
          const Text(
            'تقييم Rating',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'كيف كانت تجربتك؟',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [1, 2, 3, 4, 5].map((rating) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio<int>(
                          value: rating,
                          groupValue: _rating,
                          onChanged: (value) {
                            setState(() {
                              _rating = value!;
                            });
                          },
                        ),
                        Text('$rating'),
                        if (rating < 5) const SizedBox(width: 8),
                      ],
                    );
                  }).toList(),
                ),
                const SizedBox(height: 8),
                Row(
                  children: List.generate(
                    _rating,
                        (index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Custom colors
          const Text(
            'ألوان مخصصة',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Wrap(
              spacing: 16,
              children: [
                Radio(
                  value: 1,
                  groupValue: 1,
                  onChanged: (value) {},
                  activeColor: Colors.red,
                ),
                Radio(
                  value: 2,
                  groupValue: 2,
                  onChanged: (value) {},
                  activeColor: Colors.green,
                ),
                Radio(
                  value: 3,
                  groupValue: 3,
                  onChanged: (value) {},
                  activeColor: Colors.blue,
                ),
                Radio(
                  value: 4,
                  groupValue: 4,
                  onChanged: (value) {},
                  activeColor: Colors.orange,
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
          _buildCodeBox(
              'String selectedValue = "option1";\n\n'
                  'Radio<String>(\n'
                  '  value: "option1",\n'
                  '  groupValue: selectedValue,\n'
                  '  onChanged: (value) {\n'
                  '    setState(() {\n'
                  '      selectedValue = value!;\n'
                  '    });\n'
                  '  },\n'
                  ')'
          ),
        ],
      ),
    );
  }
}

// ==================== 4. RadioListTile ====================
class RadioListTileExamples extends StatefulWidget {
  const RadioListTileExamples({super.key});

  @override
  State<RadioListTileExamples> createState() => _RadioListTileExamplesState();
}

class _RadioListTileExamplesState extends State<RadioListTileExamples> {
  String _language = 'ar';
  String _paymentMethod = 'card';
  String _theme = 'light';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'RadioListTile - عنصر قائمة مع Radio',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: const Text(
              'Radio مع عنوان ووصف في عنصر واحد',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),

          const SizedBox(height: 16),

          // Language selection
          const Text(
            'اختيار اللغة Language',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                RadioListTile<String>(
                  value: 'ar',
                  groupValue: _language,
                  onChanged: (value) {
                    setState(() {
                      _language = value!;
                    });
                  },
                  title: const Text(
                    'العربية',
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: const Text(
                    'Arabic',
                  ),
                  secondary: const Icon(Icons.language),
                ),
                const Divider(height: 1),
                RadioListTile<String>(
                  value: 'en',
                  groupValue: _language,
                  onChanged: (value) {
                    setState(() {
                      _language = value!;
                    });
                  },
                  title: const Text('English'),
                  subtitle: const Text('الإنجليزية', textDirection: TextDirection.rtl),
                  secondary: const Icon(Icons.language),
                ),
                const Divider(height: 1),
                RadioListTile<String>(
                  value: 'fr',
                  groupValue: _language,
                  onChanged: (value) {
                    setState(() {
                      _language = value!;
                    });
                  },
                  title: const Text('Français'),
                  subtitle: const Text('الفرنسية', textDirection: TextDirection.rtl),
                  secondary: const Icon(Icons.language),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Payment method
          const Text(
            'طريقة الدفع Payment Method',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                RadioListTile<String>(
                  value: 'card',
                  groupValue: _paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _paymentMethod = value!;
                    });
                  },
                  title: const Text(
                    'بطاقة ائتمان',
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: const Text(
                    'Visa, Mastercard',
                  ),
                  secondary: const Icon(Icons.credit_card, color: Colors.blue),
                ),
                const Divider(height: 1),
                RadioListTile<String>(
                  value: 'cash',
                  groupValue: _paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _paymentMethod = value!;
                    });
                  },
                  title: const Text(
                    'الدفع عند الاستلام',
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: const Text(
                    'Cash on Delivery',
                  ),
                  secondary: const Icon(Icons.money, color: Colors.green),
                ),
                const Divider(height: 1),
                RadioListTile<String>(
                  value: 'paypal',
                  groupValue: _paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _paymentMethod = value!;
                    });
                  },
                  title: const Text('PayPal'),
                  subtitle: const Text(
                    'حساب PayPal',
                    textDirection: TextDirection.rtl,
                  ),
                  secondary: const Icon(Icons.account_balance_wallet, color: Colors.orange),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Theme selection
          const Text(
            'المظهر Theme',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                RadioListTile<String>(
                  value: 'light',
                  groupValue: _theme,
                  onChanged: (value) {
                    setState(() {
                      _theme = value!;
                    });
                  },
                  title: const Text(
                    'فاتح Light',
                    textDirection: TextDirection.rtl,
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
                RadioListTile<String>(
                  value: 'dark',
                  groupValue: _theme,
                  onChanged: (value) {
                    setState(() {
                      _theme = value!;
                    });
                  },
                  title: const Text(
                    'داكن Dark',
                    textDirection: TextDirection.rtl,
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
                RadioListTile<String>(
                  value: 'auto',
                  groupValue: _theme,
                  onChanged: (value) {
                    setState(() {
                      _theme = value!;
                    });
                  },
                  title: const Text(
                    'تلقائي Auto',
                    textDirection: TextDirection.rtl,
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
          _buildCodeBox(
              'RadioListTile<String>(\n'
                  '  value: "option1",\n'
                  '  groupValue: selectedValue,\n'
                  '  onChanged: (value) {\n'
                  '    setState(() {\n'
                  '      selectedValue = value!;\n'
                  '    });\n'
                  '  },\n'
                  '  title: Text("عنوان"),\n'
                  '  subtitle: Text("وصف"),\n'
                  ')'
          ),
        ],
      ),
    );
  }
}

// ==================== 5. Switch ====================
class SwitchExamples extends StatefulWidget {
  const SwitchExamples({super.key});

  @override
  State<SwitchExamples> createState() => _SwitchExamplesState();
}

class _SwitchExamplesState extends State<SwitchExamples> {
  bool _isOn1 = false;
  bool _isOn2 = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Switch - مفتاح تبديل',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: const Text(
              'مفتاح تشغيل/إيقاف (ON/OFF)',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),

          const SizedBox(height: 16),

          // Basic Switch
          const Text(
            'Switch أساسي',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'مطفئ OFF',
                      textDirection: TextDirection.rtl,
                    ),
                    Switch(
                      value: _isOn1,
                      onChanged: (value) {
                        setState(() {
                          _isOn1 = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'مشغل ON',
                      textDirection: TextDirection.rtl,
                    ),
                    Switch(
                      value: _isOn2,
                      onChanged: (value) {
                        setState(() {
                          _isOn2 = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'معطل Disabled',
                      style: TextStyle(color: Colors.grey),
                      textDirection: TextDirection.rtl,
                    ),
                    Switch(
                      value: true,
                      onChanged: null,
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Custom colors
          const Text(
            'ألوان مخصصة',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                Switch(
                  value: true,
                  onChanged: (value) {},
                  activeColor: Colors.red,
                ),
                Switch(
                  value: true,
                  onChanged: (value) {},
                  activeColor: Colors.green,
                ),
                Switch(
                  value: true,
                  onChanged: (value) {},
                  activeColor: Colors.blue,
                ),
                Switch(
                  value: true,
                  onChanged: (value) {},
                  activeColor: Colors.orange,
                ),
                Switch(
                  value: true,
                  onChanged: (value) {},
                  activeColor: Colors.purple,
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
          _buildCodeBox(
              'bool isOn = false;\n\n'
                  'Switch(\n'
                  '  value: isOn,\n'
                  '  onChanged: (value) {\n'
                  '    setState(() {\n'
                  '      isOn = value;\n'
                  '    });\n'
                  '  },\n'
                  '  activeColor: Colors.blue,\n'
                  ')'
          ),
        ],
      ),
    );
  }
}

// ==================== 6. SwitchListTile ====================
class SwitchListTileExamples extends StatefulWidget {
  const SwitchListTileExamples({super.key});

  @override
  State<SwitchListTileExamples> createState() => _SwitchListTileExamplesState();
}

class _SwitchListTileExamplesState extends State<SwitchListTileExamples> {
  bool _wifi = true;
  bool _bluetooth = false;
  bool _location = true;
  bool _notifications = true;
  bool _darkMode = false;
  bool _airplane = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'SwitchListTile - عنصر قائمة مع Switch',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: const Text(
              'Switch مع عنوان ووصف في عنصر واحد',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),

          const SizedBox(height: 16),

          // Settings example
          const Text(
            'إعدادات Settings',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                SwitchListTile(
                  value: _wifi,
                  onChanged: (value) {
                    setState(() {
                      _wifi = value;
                    });
                  },
                  title: const Text(
                    'Wi-Fi',
                  ),
                  subtitle: Text(
                    _wifi ? 'متصل Connected' : 'غير متصل Disconnected',
                    textDirection: TextDirection.rtl,
                  ),
                  secondary: const Icon(Icons.wifi, color: Colors.blue),
                ),
                const Divider(height: 1),
                SwitchListTile(
                  value: _bluetooth,
                  onChanged: (value) {
                    setState(() {
                      _bluetooth = value;
                    });
                  },
                  title: const Text('Bluetooth'),
                  subtitle: Text(
                    _bluetooth ? 'مشغل ON' : 'مطفئ OFF',
                    textDirection: TextDirection.rtl,
                  ),
                  secondary: const Icon(Icons.bluetooth, color: Colors.blue),
                ),
                const Divider(height: 1),
                SwitchListTile(
                  value: _location,
                  onChanged: (value) {
                    setState(() {
                      _location = value;
                    });
                  },
                  title: const Text(
                    'الموقع Location',
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: const Text(
                    'السماح بتحديد الموقع',
                    textDirection: TextDirection.rtl,
                  ),
                  secondary: const Icon(Icons.location_on, color: Colors.red),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // App settings
          const Text(
            'إعدادات التطبيق',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                SwitchListTile(
                  value: _notifications,
                  onChanged: (value) {
                    setState(() {
                      _notifications = value;
                    });
                  },
                  title: const Text(
                    'الإشعارات',
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: const Text(
                    'تلقي إشعارات التطبيق',
                    textDirection: TextDirection.rtl,
                  ),
                  secondary: const Icon(Icons.notifications, color: Colors.orange),
                  activeColor: Colors.green,
                ),
                const Divider(height: 1),
                SwitchListTile(
                  value: _darkMode,
                  onChanged: (value) {
                    setState(() {
                      _darkMode = value;
                    });
                  },
                  title: const Text(
                    'الوضع الداكن',
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: const Text(
                    'تفعيل المظهر الداكن',
                    textDirection: TextDirection.rtl,
                  ),
                  secondary: Icon(
                    _darkMode ? Icons.dark_mode : Icons.light_mode,
                    color: _darkMode ? Colors.purple : Colors.amber,
                  ),
                  activeColor: Colors.purple,
                ),
                const Divider(height: 1),
                SwitchListTile(
                  value: _airplane,
                  onChanged: (value) {
                    setState(() {
                      _airplane = value;
                    });
                  },
                  title: const Text(
                    'وضع الطيران',
                    textDirection: TextDirection.rtl,
                  ),
                  secondary: const Icon(Icons.airplanemode_active, color: Colors.teal),
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
          _buildCodeBox(
              'SwitchListTile(\n'
                  '  value: isOn,\n'
                  '  onChanged: (value) {\n'
                  '    setState(() {\n'
                  '      isOn = value;\n'
                  '    });\n'
                  '  },\n'
                  '  title: Text("عنوان"),\n'
                  '  subtitle: Text("وصف"),\n'
                  '  secondary: Icon(Icons.wifi),\n'
                  ')'
          ),
        ],
      ),
    );
  }
}

// ==================== 7. ListTile ====================
class ListTileExamples extends StatelessWidget {
  const ListTileExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'ListTile - عنصر قائمة',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: const Text(
              'عنصر قائمة مع أيقونة، عنوان، ووصف',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),

          const SizedBox(height: 16),

          // Basic ListTile
          const Text(
            'ListTile أساسي',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                const ListTile(
                  title: Text(
                    'عنوان فقط',
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const Divider(height: 1),
                const ListTile(
                  leading: Icon(Icons.person, color: Colors.blue),
                  title: Text(
                    'مع أيقونة',
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const Divider(height: 1),
                const ListTile(
                  leading: Icon(Icons.email, color: Colors.red),
                  title: Text(
                    'مع عنوان ووصف',
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: Text(
                    'هذا هو الوصف',
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.phone, color: Colors.green),
                  title: const Text(
                    'مع سهم',
                    textDirection: TextDirection.rtl,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Dense ListTile
          const Text(
            'مضغوط Dense',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                ListTile(
                  dense: true,
                  leading: const Icon(Icons.home, size: 20),
                  title: const Text(
                    'عنصر مضغوط 1',
                    style: TextStyle(fontSize: 14),
                    textDirection: TextDirection.rtl,
                  ),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  dense: true,
                  leading: const Icon(Icons.settings, size: 20),
                  title: const Text(
                    'عنصر مضغوط 2',
                    style: TextStyle(fontSize: 14),
                    textDirection: TextDirection.rtl,
                  ),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  dense: true,
                  leading: const Icon(Icons.info, size: 20),
                  title: const Text(
                    'عنصر مضغوط 3',
                    style: TextStyle(fontSize: 14),
                    textDirection: TextDirection.rtl,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Three-line ListTile
          const Text(
            'ثلاثة أسطر Three Lines',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                const ListTile(
                  isThreeLine: true,
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    'أحمد محمد',
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: Text(
                    'مطور تطبيقات\nالمغرب',
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  isThreeLine: true,
                  leading: const CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.email, color: Colors.white),
                  ),
                  title: const Text(
                    'رسالة جديدة',
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: const Text(
                    'لديك 3 رسائل جديدة\nاضغط للمشاهدة',
                    textDirection: TextDirection.rtl,
                  ),
                  trailing: const Text('الآن', textDirection: TextDirection.rtl),
                  onTap: () {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Custom ListTile
          const Text(
            'مخصص Custom',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                ListTile(
                  tileColor: Colors.blue.shade50,
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.star, color: Colors.white),
                  ),
                  title: const Text(
                    'عنوان مخصص',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: const Text(
                    'مع خلفية ملونة',
                    textDirection: TextDirection.rtl,
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'جديد',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
          _buildCodeBox(
              'ListTile(\n'
                  '  leading: Icon(Icons.person),\n'
                  '  title: Text("عنوان"),\n'
                  '  subtitle: Text("وصف"),\n'
                  '  trailing: Icon(Icons.arrow_forward),\n'
                  '  onTap: () {},\n'
                  ')'
          ),
        ],
      ),
    );
  }
}

// ==================== 8. Real-World Examples ====================
class RealWorldExamples extends StatefulWidget {
  const RealWorldExamples({super.key});

  @override
  State<RealWorldExamples> createState() => _RealWorldExamplesState();
}

class _RealWorldExamplesState extends State<RealWorldExamples> {
  final List<String> _selectedFeatures = [];
  String _plan = 'basic';
  bool _marketing = true;
  bool _updates = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Subscription form
          const Text(
            'نموذج اشتراك Subscription Form',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'اختر الخطة:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 12),
                  RadioListTile<String>(
                    value: 'basic',
                    groupValue: _plan,
                    onChanged: (value) {
                      setState(() {
                        _plan = value!;
                      });
                    },
                    title: const Text(
                      'أساسي Basic',
                      textDirection: TextDirection.rtl,
                    ),
                    subtitle: const Text('\$9.99/شهر'),
                  ),
                  RadioListTile<String>(
                    value: 'pro',
                    groupValue: _plan,
                    onChanged: (value) {
                      setState(() {
                        _plan = value!;
                      });
                    },
                    title: const Text(
                      'احترافي Pro',
                      textDirection: TextDirection.rtl,
                    ),
                    subtitle: const Text('\$19.99/شهر'),
                  ),
                  RadioListTile<String>(
                    value: 'premium',
                    groupValue: _plan,
                    onChanged: (value) {
                      setState(() {
                        _plan = value!;
                      });
                    },
                    title: const Text(
                      'مميز Premium',
                      textDirection: TextDirection.rtl,
                    ),
                    subtitle: const Text('\$29.99/شهر'),
                  ),
                  const Divider(),
                  const Text(
                    'الميزات الإضافية:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 8),
                  CheckboxListTile(
                    value: _selectedFeatures.contains('storage'),
                    onChanged: (value) {
                      setState(() {
                        if (value!) {
                          _selectedFeatures.add('storage');
                        } else {
                          _selectedFeatures.remove('storage');
                        }
                      });
                    },
                    title: const Text(
                      'مساحة تخزين إضافية',
                      textDirection: TextDirection.rtl,
                    ),
                    subtitle: const Text('+\$5/شهر'),
                  ),
                  CheckboxListTile(
                    value: _selectedFeatures.contains('support'),
                    onChanged: (value) {
                      setState(() {
                        if (value!) {
                          _selectedFeatures.add('support');
                        } else {
                          _selectedFeatures.remove('support');
                        }
                      });
                    },
                    title: const Text(
                      'دعم ذو أولوية',
                      textDirection: TextDirection.rtl,
                    ),
                    subtitle: const Text('+\$10/شهر'),
                  ),
                  const Divider(),
                  const Text(
                    'الإشعارات:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 8),
                  SwitchListTile(
                    value: _marketing,
                    onChanged: (value) {
                      setState(() {
                        _marketing = value;
                      });
                    },
                    title: const Text(
                      'رسائل تسويقية',
                      textDirection: TextDirection.rtl,
                    ),
                    secondary: const Icon(Icons.email),
                  ),
                  SwitchListTile(
                    value: _updates,
                    onChanged: (value) {
                      setState(() {
                        _updates = value;
                      });
                    },
                    title: const Text(
                      'تحديثات المنتج',
                      textDirection: TextDirection.rtl,
                    ),
                    secondary: const Icon(Icons.notifications),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(16),
                      ),
                      child: const Text(
                        'اشترك الآن Subscribe',
                        style: TextStyle(fontSize: 16),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Contact list
          const Text(
            'قائمة جهات الاتصال Contacts',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: const Text(
                    'أحمد محمد',
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: const Text('+212 600 000 001'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.phone, color: Colors.green),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.message, color: Colors.blue),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.pink,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: const Text(
                    'فاطمة علي',
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: const Text('+212 600 000 002'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.phone, color: Colors.green),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.message, color: Colors.blue),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: const Text(
                    'خالد حسن',
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: const Text('+212 600 000 003'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.phone, color: Colors.green),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.message, color: Colors.blue),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== Helper Method ====================
Widget _buildCodeBox(String code) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    margin: const EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.grey.shade400),
    ),
    child: Text(
      code,
      style: const TextStyle(
        fontFamily: 'monospace',
        fontSize: 12,
      ),
    ),
  );
}