import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مثال Dismissible',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DismissibleExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DismissibleExample extends StatefulWidget {
  const DismissibleExample({super.key});

  @override
  State<DismissibleExample> createState() => _DismissibleExampleState();
}

class _DismissibleExampleState extends State<DismissibleExample> {
  // قائمة العناصر التي سنقوم بعرضها
  List<String> items = List.generate(10, (index) => 'العنصر رقم ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('قائمة العناصر القابلة للسحب')),
      body: items.isEmpty
          ? const Center(child: Text('القائمة فارغة'))
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

                return Dismissible(
                  // 1. المفتاح الفريد (إلزامي)
                  // نستخدم قيمة العنصر كمفتاح، أو يمكن استخدام UniqueKey()
                  key: Key(item),

                  // 3. الخلفية عند السحب من اليسار إلى اليمين (للتأكيد على الحذف)
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20.0),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),

                  // 4. الخلفية عند السحب من اليمين إلى اليسار (للتأكيد على الأرشفة)
                  secondaryBackground: Container(
                    color: Colors.blue,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20.0),
                    child: const Icon(
                      Icons.archive,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),

                  // 5. اتجاه السحب المسموح به
                  direction: DismissDirection.horizontal,

                  // 6. دالة التأكيد قبل الإزالة او الارشفة
                  confirmDismiss: (DismissDirection direction) async {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('تأكيد الإجراء'),
                          content: Text(
                            direction == DismissDirection.startToEnd
                                ? 'هل تريد حذف "$item"؟'
                                : 'هل تريد أرشفة "$item"؟',
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () =>
                                  Navigator.of(context).pop(), // إلغاء
                              child: const Text('إلغاء'),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.of(context).pop(), // تأكيد
                              child: const Text('تأكيد'),
                            ),
                          ],
                        );
                      },
                    );
                  },

                  // 7. دالة تُستدعى عند اكتمال الإزالة
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      // إزالة العنصر من القائمة بناءً على الفهرس
                      items.removeAt(index);
                    });

                    // عرض رسالة (SnackBar) لتأكيد العملية
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          direction == DismissDirection.startToEnd
                              ? 'تم حذف $item'
                              : 'تمت أرشفة $item',
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },

                  // 8. مدة إعادة ترتيب القائمة بعد الحذف
                  resizeDuration: const Duration(milliseconds: 300),

                  // 2. العنصر الأساسي الذي سيظهر للمستخدم
                  child: ListTile(
                    title: Text(item),
                    leading: const Icon(Icons.list),
                  ),
                );
              },
            ),
    );
  }
}
