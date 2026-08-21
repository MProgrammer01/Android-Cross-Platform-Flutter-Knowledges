// ==================== dropdown_search_concepts.dart ====================
// ملاحظة: يتطلب هذا الودجت حزمة خارجية
// أضف في pubspec.yaml:
// dependencies:
//   dropdown_search: ^5.0.6

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class DropdownSearchConceptsApp extends StatefulWidget {
  const DropdownSearchConceptsApp({super.key});

  @override
  State<DropdownSearchConceptsApp> createState() =>
      _DropdownSearchConceptsAppState();
}

class _DropdownSearchConceptsAppState extends State<DropdownSearchConceptsApp> {
  String? _selectedCountry;
  String? _selectedCity;
  List<String>? _selectedMultiple;
  Map<String, dynamic>? _selectedUser;

  final List<String> _countries = [
    'المغرب',
    'مصر',
    'السعودية',
    'الإمارات',
    'الجزائر',
    'تونس',
    'العراق',
    'الأردن',
    'لبنان',
    'الكويت',
  ];

  final List<String> _cities = [
    'الرباط',
    'الدار البيضاء',
    'مراكش',
    'فاس',
    'طنجة',
    'أكادير',
    'مكناس',
    'وجدة',
    'القنيطرة',
    'تطوان',
  ];

  final List<Map<String, dynamic>> _users = [
    {'id': 1, 'name': 'أحمد محمد', 'email': 'ahmed@example.com'},
    {'id': 2, 'name': 'فاطمة علي', 'email': 'fatima@example.com'},
    {'id': 3, 'name': 'خالد حسن', 'email': 'khaled@example.com'},
    {'id': 4, 'name': 'مريم سعيد', 'email': 'mariam@example.com'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSectionTitle('1. Basic DropdownSearch'),
            _buildBasicExample(),

            _buildSectionTitle('2. DropdownSearch with Search'),
            _buildSearchableExample(),

            _buildSectionTitle('3. Custom Dropdown Style'),
            _buildCustomStyleExample(),

            _buildSectionTitle('4. Multi Selection'),
            _buildMultiSelectionExample(),

            _buildSectionTitle('5. Custom Item Builder'),
            _buildCustomItemExample(),

            _buildSectionTitle('6. With Validation'),
            _buildValidationExample(),

            _buildSectionTitle('7. Async Data (API)'),
            _buildAsyncExample(),

            _buildSectionTitle('8. Bottom Sheet Mode'),
            _buildBottomSheetExample(),

            _buildSectionTitle('9. Real-World Example'),
            _buildRealWorldExample(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "DropdownSearch Concepts",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      backgroundColor: Colors.brown,
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
          colors: [Colors.brown.shade100, Colors.brown.shade50],
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.brown.shade700,
        ),
      ),
    );
  }

  // ==================== 1. Basic ====================
  Widget _buildBasicExample() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: const Text(
              'DropdownSearch يوفر قائمة منسدلة مع خاصية البحث',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),
          const SizedBox(height: 16),

          DropdownSearch<String>(
            items: (filter, loadProps) => _countries,
            selectedItem: _selectedCountry,
            onSelected: (value) {
              setState(() {
                _selectedCountry = value;
              });
            },
            decoratorProps: const DropDownDecoratorProps(
              decoration: InputDecoration(
                labelText: 'اختر الدولة',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          if (_selectedCountry != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'المختار: $_selectedCountry',
                textDirection: TextDirection.rtl,
              ),
            ),
          ],

          const SizedBox(height: 8),
          _buildCodeBox(
            'DropdownSearch<String>(\n'
            '  items: (filter, loadProps) => countryList,\n'
            '  selectedItem: selectedCountry,\n'
            '  onSelected: (value) {\n'
            '    setState(() {\n'
            '      selectedCountry = value;\n'
            '    });\n'
            '  },\n'
            '  decoratorProps: DropDownDecoratorProps(\n'
            '    decoration: InputDecoration(\n'
            '      labelText: "اختر الدولة",\n'
            '    ),\n'
            '  ),\n'
            ')',
          ),
        ],
      ),
    );
  }

  // ==================== 2. Searchable ====================
  Widget _buildSearchableExample() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'مع خاصية البحث المفعلة صراحة',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          DropdownSearch<String>(
            items: (filter, loadProps) => _cities,
            selectedItem: _selectedCity,
            popupProps: const PopupProps.menu(
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  hintText: 'ابحث عن مدينة...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            onSelected: (value) {
              setState(() {
                _selectedCity = value;
              });
            },
            decoratorProps: const DropDownDecoratorProps(
              decoration: InputDecoration(
                labelText: 'اختر المدينة',
                prefixIcon: Icon(Icons.location_city),
                border: OutlineInputBorder(),
              ),
            ),
          ),

          const SizedBox(height: 8),
          _buildCodeBox(
            'DropdownSearch<String>(\n'
            '  items: (filter, loadProps) => cityList,\n'
            '  popupProps: PopupProps.menu(\n'
            '    showSearchBox: true,\n'
            '    searchFieldProps: TextFieldProps(\n'
            '      decoration: InputDecoration(\n'
            '        hintText: "ابحث...",\n'
            '      ),\n'
            '    ),\n'
            '  ),\n'
            '  onSelected: (value) {},\n'
            ')',
          ),
        ],
      ),
    );
  }

  // ==================== 3. Custom Style ====================
  Widget _buildCustomStyleExample() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'تنسيق مخصص',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          DropdownSearch<String>(
            items: (filter, loadProps) => _countries,

            popupProps: PopupProps.menu(
              showSearchBox: true,

              containerBuilder: (context, popupWidget) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: popupWidget,
                );
              },
            ),

            onSelected: (value) {},

            decoratorProps: DropDownDecoratorProps(
              decoration: InputDecoration(
                labelText: 'دولة مخصصة',
                filled: true,
                fillColor: Colors.purple.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.public, color: Colors.purple),
              ),
            ),
          ),

          const SizedBox(height: 8),
          _buildCodeBox(
            'DropdownSearch<String>(\n'
            '  decoratorProps: DropDownDecoratorProps(\n'
            '    decoration: InputDecoration(\n'
            '      filled: true,\n'
            '      fillColor: Colors.purple.shade50,\n'
            '      border: OutlineInputBorder(\n'
            '        borderRadius: BorderRadius.circular(15),\n'
            '      ),\n'
            '    ),\n'
            '  ),\n'
            ')',
          ),
        ],
      ),
    );
  }

  // ==================== 4. Multi Selection ====================
  Widget _buildMultiSelectionExample() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'اختيار متعدد',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          DropdownSearch<String>.multiSelection(
            items: (filter, loadProps) => _countries,
            selectedItems: _selectedMultiple ?? [],
            onSelected: (value) {
              setState(() {
                _selectedMultiple = value;
              });
            },
            popupProps: const MultiSelectionPopupProps.menu(
              showSearchBox: true,
              showSelectedItems: true,
            ),
            decoratorProps: const DropDownDecoratorProps(
              decoration: InputDecoration(
                labelText: 'اختر عدة دول',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          if (_selectedMultiple != null && _selectedMultiple!.isNotEmpty) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: _selectedMultiple!.map((item) {
                return Chip(
                  label: Text(item, textDirection: TextDirection.rtl),
                  backgroundColor: Colors.purple.shade100,
                );
              }).toList(),
            ),
          ],

          const SizedBox(height: 8),
          _buildCodeBox(
            'DropdownSearch<String>.multiSelection(\n'
            '  items: (filter, loadProps) => countryList,\n'
            '  selectedItems: selectedList,\n'
            '  onSelected: (value) {\n'
            '    setState(() {\n'
            '      selectedList = value;\n'
            '    });\n'
            '  },\n'
            '  popupProps: MultiSelectionPopupProps.menu(\n'
            '    showSelectedItems: true,\n'
            '  ),\n'
            ')',
          ),
        ],
      ),
    );
  }

  // ==================== 5. Custom Item Builder ====================
  Widget _buildCustomItemExample() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'عناصر مخصصة (مع صور/أيقونات)',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          DropdownSearch<Map<String, dynamic>>(
            items: (filter, loadProps) => _users,

            compareFn: (item1, item2) {
              return item1['id'] == item2['id'];
            },

            itemAsString: (user) => user['name'] ?? '',

            selectedItem: _selectedUser,

            onSelected: (value) {
              setState(() {
                _selectedUser = value;
              });
            },

            popupProps: PopupProps.menu(
              showSearchBox: true,
              itemBuilder: (context, user, isSelected, isDisabled) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(
                      (user['name'] ?? '')[0].toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    user['name'] ?? '',
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: Text(user['email'] ?? ''),
                  selected: isSelected,
                );
              },
            ),

            decoratorProps: const DropDownDecoratorProps(
              decoration: InputDecoration(
                labelText: 'اختر مستخدم',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          const SizedBox(height: 8),
          _buildCodeBox(
            'DropdownSearch<User>(\n'
            '  items: (filter, loadProps) => userList,\n'
            '  itemAsString: (user) => user.name,\n'
            '  popupProps: PopupProps.menu(\n'
            '    itemBuilder: (context, user, isSelected) {\n'
            '      return ListTile(\n'
            '        leading: CircleAvatar(...),\n'
            '        title: Text(user.name),\n'
            '        subtitle: Text(user.email),\n'
            '      );\n'
            '    },\n'
            '  ),\n'
            ')',
          ),
        ],
      ),
    );
  }

  // ==================== 6. Validation ====================
  Widget _buildValidationExample() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'مع التحقق من الصحة Validation',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          const ValidationFormExample(),

          const SizedBox(height: 8),
          _buildCodeBox(
            'Form(\n'
            '  key: formKey,\n'
            '  child: DropdownSearch<String>(\n'
            '    items: (filter, loadProps) => countryList,\n'
            '    validator: (value) {\n'
            '      if (value == null) {\n'
            '        return "هذا الحقل مطلوب";\n'
            '      }\n'
            '      return null;\n'
            '    },\n'
            '  ),\n'
            ')',
          ),
        ],
      ),
    );
  }

  // ==================== 7. Async Data ====================
  Widget _buildAsyncExample() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'بيانات غير متزامنة (من API)',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          DropdownSearch<String>(
            items: (String filter, loadProps) async {
              // محاكاة استدعاء API
              await Future.delayed(const Duration(seconds: 1));
              return _countries.where((c) => c.contains(filter)).toList();
            },
            popupProps: PopupProps.menu(
              showSearchBox: true,
              loadingBuilder: (context, loadProps) =>
                  Text('جاري التحميل...', textDirection: TextDirection.rtl),
            ),
            onSelected: (value) {},
            decoratorProps: const DropDownDecoratorProps(
              decoration: InputDecoration(
                labelText: 'بحث من الخادم',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          const SizedBox(height: 8),
          _buildCodeBox(
            'DropdownSearch<String>(\n'
            '  items: (String filter, loadProps) async {\n'
            '    final response = await api.search(filter);\n'
            '    return response.data;\n'
            '  },\n'
            '  popupProps: PopupProps.menu(\n'
            '    showSearchBox: true,\n'
            '    loadingBuilder: CircularProgressIndicator(),\n'
            '  ),\n'
            ')',
          ),
        ],
      ),
    );
  }

  // ==================== 8. Bottom Sheet Mode ====================
  Widget _buildBottomSheetExample() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'وضع Bottom Sheet',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          DropdownSearch<String>(
            items: (filter, loadProps) => _cities,
            popupProps: PopupProps.bottomSheet(
              showSearchBox: true,
              bottomSheetProps: BottomSheetProps(
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
              ),
              title: Container(
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'اختر مدينة',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
            onSelected: (value) {},
            decoratorProps: const DropDownDecoratorProps(
              decoration: InputDecoration(
                labelText: 'المدينة (Bottom Sheet)',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          const SizedBox(height: 8),
          _buildCodeBox(
            'DropdownSearch<String>(\n'
            '  popupProps: PopupProps.bottomSheet(\n'
            '    showSearchBox: true,\n'
            '    bottomSheetProps: BottomSheetProps(\n'
            '      shape: RoundedRectangleBorder(...),\n'
            '    ),\n'
            '  ),\n'
            ')',
          ),
        ],
      ),
    );
  }

  // ==================== 9. Real-World ====================
  Widget _buildRealWorldExample() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'نموذج تسجيل كامل',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  DropdownSearch<String>(
                    items: (filter, loadProps) => _countries,
                    popupProps: const PopupProps.menu(showSearchBox: true),
                    onSelected: (value) {},
                    decoratorProps: const DropDownDecoratorProps(
                      decoration: InputDecoration(
                        labelText: 'الدولة *',
                        prefixIcon: Icon(Icons.flag),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownSearch<String>(
                    items: (filter, loadProps) => _cities,
                    popupProps: const PopupProps.menu(showSearchBox: true),
                    onSelected: (value) {},
                    decoratorProps: const DropDownDecoratorProps(
                      decoration: InputDecoration(
                        labelText: 'المدينة *',
                        prefixIcon: Icon(Icons.location_city),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                        backgroundColor: Colors.brown,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'تسجيل',
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeBox(String code) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Text(
        code,
        style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
      ),
    );
  }
}

// ==================== Validation Form Example ====================
class ValidationFormExample extends StatefulWidget {
  const ValidationFormExample({super.key});

  @override
  State<ValidationFormExample> createState() => _ValidationFormExampleState();
}

class _ValidationFormExampleState extends State<ValidationFormExample> {
  final _formKey = GlobalKey<FormState>();
  String? _country;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          DropdownSearch<String>(
            items: (filter, loadProps) => const ['المغرب', 'مصر', 'السعودية'],
            selectedItem: _country,
            onSelected: (value) {
              setState(() {
                _country = value;
              });
            },
            validator: (value) {
              if (value == null) {
                return 'هذا الحقل مطلوب';
              }
              return null;
            },
            decoratorProps: const DropDownDecoratorProps(
              decoration: InputDecoration(
                labelText: 'الدولة (مطلوب)',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'تم التحقق بنجاح!',
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                );
              }
            },
            child: const Text(
              'تحقق Validate',
              textDirection: TextDirection.rtl,
            ),
          ),
        ],
      ),
    );
  }
}
