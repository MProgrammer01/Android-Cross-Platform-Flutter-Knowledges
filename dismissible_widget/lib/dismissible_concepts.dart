// ==================== dismissible_concepts.dart ====================
// Dismissible هو widget أساسي في Flutter، لا يحتاج حزمة خارجية

import 'package:flutter/material.dart';

class DismissibleConceptsApp extends StatefulWidget {
  const DismissibleConceptsApp({super.key});

  @override
  State<DismissibleConceptsApp> createState() =>
      _DismissibleConceptsAppState();
}

class _DismissibleConceptsAppState extends State<DismissibleConceptsApp> {
  List<String> _basicList = ['عنصر 1', 'عنصر 2', 'عنصر 3', 'عنصر 4', 'عنصر 5'];
  final List<String> _directionList = ['يمين فقط', 'يسار فقط', 'كلاهما'];
  final List<Map<String, dynamic>> _emailList = [
    {'title': 'رسالة من أحمد', 'subtitle': 'مرحباً، كيف حالك؟', 'read': false},
    {'title': 'رسالة من فاطمة', 'subtitle': 'اجتماع غداً الساعة 10', 'read': true},
    {'title': 'رسالة من خالد', 'subtitle': 'تم إرسال الملف المطلوب', 'read': false},
    {'title': 'رسالة من مريم', 'subtitle': 'شكراً على المساعدة', 'read': true},
  ];
  final List<Map<String, dynamic>> _cartItems = [
    {'name': 'قميص أزرق', 'price': 150, 'qty': 1},
    {'name': 'بنطلون جينز', 'price': 300, 'qty': 2},
    {'name': 'حذاء رياضي', 'price': 450, 'qty': 1},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSectionTitle('1. Basic Dismissible'),
            _buildBasicExample(),
            
            _buildSectionTitle('2. Dismiss Direction'),
            _buildDirectionExample(),
            
            _buildSectionTitle('3. Background & Confirm'),
            _buildBackgroundExample(),
            
            _buildSectionTitle('4. Confirmation Dialog'),
            _buildConfirmDismissExample(),
            
            _buildSectionTitle('5. Undo with SnackBar'),
            _buildUndoExample(),
            
            _buildSectionTitle('6. Custom Background per Direction'),
            _buildDualBackgroundExample(),
            
            _buildSectionTitle('7. Real-World: Email List'),
            _buildEmailListExample(),
            
            _buildSectionTitle('8. Real-World: Shopping Cart'),
            _buildShoppingCartExample(),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "Dismissible Concepts",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      backgroundColor: Colors.deepPurple,
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
          colors: [Colors.deepPurple.shade100, Colors.deepPurple.shade50],
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple.shade700,
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
              'Dismissible يسمح بسحب العنصر لحذفه من القائمة (اسحب يميناً أو يساراً)',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),
          const SizedBox(height: 16),
          
          Container(
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListView.builder(
              itemCount: _basicList.length,
              itemBuilder: (context, index) {
                final item = _basicList[index];
                return Dismissible(
                  key: Key(item),
                  onDismissed: (direction) {
                    setState(() {
                      _basicList.removeAt(index);
                    });
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: ListTile(
                    title: Text(item, textDirection: TextDirection.rtl),
                    leading: const Icon(Icons.article),
                  ),
                );
              },
            ),
          ),
          
          if (_basicList.isEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _basicList = ['عنصر 1', 'عنصر 2', 'عنصر 3', 'عنصر 4', 'عنصر 5'];
                    });
                  },
                  child: const Text('إعادة تعيين', textDirection: TextDirection.rtl),
                ),
              ),
            ),
          
          const SizedBox(height: 8),
          _buildCodeBox(
            'Dismissible(\n'
            '  key: Key(item.id),\n'
            '  onDismissed: (direction) {\n'
            '    setState(() {\n'
            '      list.removeAt(index);\n'
            '    });\n'
            '  },\n'
            '  background: Container(color: Colors.red),\n'
            '  child: ListTile(title: Text(item)),\n'
            ')'
          ),
          
          const SizedBox(height: 16),
          
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.amber.shade200),
            ),
            child: const Row(
              children: [
                Icon(Icons.warning_amber, color: Colors.amber),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'مهم: key مطلوب ويجب أن يكون فريداً لكل عنصر',
                    style: TextStyle(fontSize: 13),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 2. Direction ====================
  Widget _buildDirectionExample() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'اتجاه السحب DismissDirection',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DismissDirection.horizontal (كلاهما)',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  'DismissDirection.endToStart (من النهاية للبداية)',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  'DismissDirection.startToEnd (من البداية للنهاية)',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  'DismissDirection.up / down (عمودي)',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  'DismissDirection.none (لا شيء)',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Dismissible(
                  key: const Key('endToStart'),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      _directionList.remove('اليمين فقط endToStart');
                    });
                  },
                  background: Container(
                    color: Colors.orange,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  child: const ListTile(
                    title: Text(
                      'اسحب من اليمين لليسار فقط',
                      textDirection: TextDirection.rtl,
                    ),
                    subtitle: Text('endToStart'),
                  ),
                ),
                const Divider(height: 1),
                Dismissible(
                  key: const Key('startToEnd'),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {},
                  background: Container(
                    color: Colors.green,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                  child: const ListTile(
                    title: Text(
                      'اسحب من اليسار لليمين فقط',
                      textDirection: TextDirection.rtl,
                    ),
                    subtitle: Text('startToEnd'),
                  ),
                ),
                const Divider(height: 1),
                Dismissible(
                  key: const Key('horizontal'),
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) {},
                  background: Container(
                    color: Colors.blue,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.swap_horiz, color: Colors.white),
                  ),
                  secondaryBackground: Container(
                    color: Colors.blue,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.swap_horiz, color: Colors.white),
                  ),
                  child: const ListTile(
                    title: Text(
                      'اسحب في أي اتجاه',
                      textDirection: TextDirection.rtl,
                    ),
                    subtitle: Text('horizontal'),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 8),
          _buildCodeBox(
            'Dismissible(\n'
            '  key: Key(item.id),\n'
            '  direction: DismissDirection.endToStart,\n'
            '  onDismissed: (direction) {},\n'
            '  child: ListTile(...),\n'
            ')'
          ),
        ],
      ),
    );
  }

  // ==================== 3. Background ====================
  Widget _buildBackgroundExample() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'تصميم الخلفية Background',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Dismissible(
              key: const Key('styled-background'),
              onDismissed: (direction) {},
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red.shade400, Colors.red.shade700],
                  ),
                ),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'حذف',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.delete_forever, color: Colors.white),
                  ],
                ),
              ),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: const Row(
                  children: [
                    Icon(Icons.description, color: Colors.blue),
                    SizedBox(width: 12),
                    Text(
                      'اسحب لرؤية خلفية مصممة',
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 8),
          _buildCodeBox(
            'Dismissible(\n'
            '  background: Container(\n'
            '    decoration: BoxDecoration(\n'
            '      gradient: LinearGradient(\n'
            '        colors: [Colors.red.shade400, Colors.red.shade700],\n'
            '      ),\n'
            '    ),\n'
            '    alignment: Alignment.centerRight,\n'
            '    child: Row(\n'
            '      children: [Text("حذف"), Icon(Icons.delete)],\n'
            '    ),\n'
            '  ),\n'
            '  child: ListTile(...),\n'
            ')'
          ),
        ],
      ),
    );
  }

  // ==================== 4. Confirm Dismiss ====================
  Widget _buildConfirmDismissExample() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'تأكيد قبل الحذف confirmDismiss',
            style: TextStyle(fontWeight: FontWeight.bold),
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
              'يظهر مربع تأكيد قبل حذف العنصر فعلياً',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),
          const SizedBox(height: 16),
          
          const ConfirmDismissExample(),
          
          const SizedBox(height: 8),
          _buildCodeBox(
            'Dismissible(\n'
            '  key: Key(item.id),\n'
            '  confirmDismiss: (direction) async {\n'
            '    return await showDialog(\n'
            '      context: context,\n'
            '      builder: (context) => AlertDialog(\n'
            '        title: Text("تأكيد"),\n'
            '        content: Text("هل تريد الحذف؟"),\n'
            '        actions: [\n'
            '          TextButton(\n'
            '            onPressed: () => Navigator.pop(context, false),\n'
            '            child: Text("إلغاء"),\n'
            '          ),\n'
            '          TextButton(\n'
            '            onPressed: () => Navigator.pop(context, true),\n'
            '            child: Text("حذف"),\n'
            '          ),\n'
            '        ],\n'
            '      ),\n'
            '    );\n'
            '  },\n'
            '  onDismissed: (direction) {},\n'
            '  child: ListTile(...),\n'
            ')'
          ),
        ],
      ),
    );
  }

  // ==================== 5. Undo ====================
  Widget _buildUndoExample() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'التراجع عن الحذف Undo',
            style: TextStyle(fontWeight: FontWeight.bold),
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
              'إظهار SnackBar مع خيار التراجع بعد الحذف',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),
          const SizedBox(height: 16),
          
          const UndoExample(),
          
          const SizedBox(height: 8),
          _buildCodeBox(
            'onDismissed: (direction) {\n'
            '  final removedItem = list[index];\n'
            '  setState(() {\n'
            '    list.removeAt(index);\n'
            '  });\n'
            '  \n'
            '  ScaffoldMessenger.of(context).showSnackBar(\n'
            '    SnackBar(\n'
            '      content: Text("تم الحذف"),\n'
            '      action: SnackBarAction(\n'
            '        label: "تراجع",\n'
            '        onPressed: () {\n'
            '          setState(() {\n'
            '            list.insert(index, removedItem);\n'
            '          });\n'
            '        },\n'
            '      ),\n'
            '    ),\n'
            '  );\n'
            '}'
          ),
        ],
      ),
    );
  }

  // ==================== 6. Dual Background ====================
  Widget _buildDualBackgroundExample() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'خلفية مختلفة لكل اتجاه',
            style: TextStyle(fontWeight: FontWeight.bold),
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
              'استخدم background للاتجاه الأول و secondaryBackground للاتجاه الثاني',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),
          const SizedBox(height: 16),
          
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Dismissible(
              key: const Key('dual-background'),
              onDismissed: (direction) {},
              // من اليسار لليمين = أرشفة (أخضر)
              background: Container(
                color: Colors.green,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Row(
                  children: [
                    Icon(Icons.archive, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'أرشفة',
                      style: TextStyle(color: Colors.white),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
              // من اليمين لليسار = حذف (أحمر)
              secondaryBackground: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'حذف',
                      style: TextStyle(color: Colors.white),
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.delete, color: Colors.white),
                  ],
                ),
              ),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'اسحب يميناً = أرشفة | اسحب يساراً = حذف',
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 8),
          _buildCodeBox(
            'Dismissible(\n'
            '  background: Container(color: Colors.green), // اتجاه 1\n'
            '  secondaryBackground: Container(color: Colors.red), // اتجاه 2\n'
            '  onDismissed: (direction) {\n'
            '    if (direction == DismissDirection.startToEnd) {\n'
            '      // أرشفة\n'
            '    } else {\n'
            '      // حذف\n'
            '    }\n'
            '  },\n'
            ')'
          ),
        ],
      ),
    );
  }

  // ==================== 7. Email List ====================
  Widget _buildEmailListExample() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'قائمة بريد إلكتروني',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          
          Card(
            child: Column(
              children: _emailList.map((email) {
                return Dismissible(
                  key: Key(email['title']),
                  onDismissed: (direction) {
                    setState(() {
                      _emailList.remove(email);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'تم حذف: ${email['title']}',
                          textDirection: TextDirection.rtl,
                        ),
                        action: SnackBarAction(
                          label: 'تراجع',
                          onPressed: () {
                            setState(() {
                              _emailList.add(email);
                            });
                          },
                        ),
                      ),
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          email['read'] ? Colors.grey : Colors.blue,
                      child: Icon(
                        Icons.email,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                    title: Text(
                      email['title'],
                      style: TextStyle(
                        fontWeight:
                            email['read'] ? FontWeight.normal : FontWeight.bold,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    subtitle: Text(
                      email['subtitle'],
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          
          if (_emailList.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'لا توجد رسائل',
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ==================== 8. Shopping Cart ====================
  Widget _buildShoppingCartExample() {
    final total = _cartItems.fold<int>(
      0,
      (sum, item) => sum + (item['price'] as int) * (item['qty'] as int),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'سلة التسوق Shopping Cart',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          
          Card(
            child: Column(
              children: [
                ..._cartItems.map((item) {
                  return Dismissible(
                    key: Key(item['name']),
                    onDismissed: (direction) {
                      setState(() {
                        _cartItems.remove(item);
                      });
                    },
                    confirmDismiss: (direction) async {
                      return await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                'إزالة من السلة',
                                textDirection: TextDirection.rtl,
                              ),
                              content: Text(
                                'هل تريد إزالة "${item['name']}"؟',
                                textDirection: TextDirection.rtl,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, false),
                                  child: const Text(
                                    'إلغاء',
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, true),
                                  child: const Text(
                                    'إزالة',
                                    style: TextStyle(color: Colors.red),
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                              ],
                            ),
                          ) ??
                          false;
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.remove_shopping_cart,
                          color: Colors.white),
                    ),
                    child: ListTile(
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.shopping_bag),
                      ),
                      title: Text(
                        item['name'],
                        textDirection: TextDirection.rtl,
                      ),
                      subtitle: Text(
                        'الكمية: ${item['qty']}',
                        textDirection: TextDirection.rtl,
                      ),
                      trailing: Text(
                        '${item['price'] * item['qty']} درهم',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  );
                }).toList(),
                
                if (_cartItems.isNotEmpty) ...[
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'المجموع:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        Text(
                          '$total درهم',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                ],
                
                if (_cartItems.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Center(
                      child: Text(
                        'السلة فارغة',
                        style: TextStyle(color: Colors.grey),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
              ],
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

// ==================== Confirm Dismiss Example ====================
class ConfirmDismissExample extends StatefulWidget {
  const ConfirmDismissExample({super.key});

  @override
  State<ConfirmDismissExample> createState() => _ConfirmDismissExampleState();
}

class _ConfirmDismissExampleState extends State<ConfirmDismissExample> {
  List<String> _items = ['ملف مهم 1', 'ملف مهم 2', 'ملف مهم 3'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: _items.map((item) {
          return Dismissible(
            key: Key(item),
            confirmDismiss: (direction) async {
              return await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        'تأكيد الحذف',
                        textDirection: TextDirection.rtl,
                      ),
                      content: Text(
                        'هل تريد حذف "$item"؟',
                        textDirection: TextDirection.rtl,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text(
                            'إلغاء',
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text(
                            'حذف',
                            style: TextStyle(color: Colors.red),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ],
                    ),
                  ) ??
                  false;
            },
            onDismissed: (direction) {
              setState(() {
                _items.remove(item);
              });
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: ListTile(
              leading: const Icon(Icons.insert_drive_file),
              title: Text(item, textDirection: TextDirection.rtl),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ==================== Undo Example ====================
class UndoExample extends StatefulWidget {
  const UndoExample({super.key});

  @override
  State<UndoExample> createState() => _UndoExampleState();
}

class _UndoExampleState extends State<UndoExample> {
  List<String> _items = ['مهمة 1', 'مهمة 2', 'مهمة 3', 'مهمة 4'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: _items.map((item) {
          final index = _items.indexOf(item);
          return Dismissible(
            key: Key(item),
            onDismissed: (direction) {
              final removedItem = item;
              final removedIndex = index;
              
              setState(() {
                _items.remove(item);
              });
              
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'تم حذف "$removedItem"',
                    textDirection: TextDirection.rtl,
                  ),
                  action: SnackBarAction(
                    label: 'تراجع',
                    onPressed: () {
                      setState(() {
                        _items.insert(removedIndex, removedItem);
                      });
                    },
                  ),
                  duration: const Duration(seconds: 3),
                ),
              );
            },
            background: Container(
              color: Colors.deepOrange,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete_sweep, color: Colors.white),
            ),
            child: ListTile(
              leading: const Icon(Icons.check_circle_outline),
              title: Text(item, textDirection: TextDirection.rtl),
            ),
          );
        }).toList(),
      ),
    );
  }
}