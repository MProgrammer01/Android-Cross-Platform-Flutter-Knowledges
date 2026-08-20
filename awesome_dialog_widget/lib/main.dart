import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مثال AwesomeDialog',

      locale: const Locale('ar'),

      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),

      home: const AwesomeDialogExample(),

      debugShowCheckedModeBanner: false,
    );
  }
}

class AwesomeDialogExample extends StatefulWidget {
  const AwesomeDialogExample({super.key});

  @override
  State<AwesomeDialogExample> createState() => _AwesomeDialogExampleState();
}

class _AwesomeDialogExampleState extends State<AwesomeDialogExample> {
  
  // دالة لعرض نافذة معلومات بسيطة
  void _showInfoDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.rightSlide,
      title: 'معلومات هامة',
      desc: 'هذا هو نص الوصف الذي يوضح التفاصيل الإضافية للمستخدم.',
      btnOkOnPress: () {},
    ).show();
  }

  // دالة لعرض نافذة نجاح تُغلق تلقائياً
  void _showSuccessDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: 'تمت العملية بنجاح',
      desc: 'تم حفظ البيانات الخاصة بك.',
      autoHide: const Duration(seconds: 2), // تُغلق تلقائياً بعد ثانيتين
    ).show();
  }

  // دالة لعرض نافذة خطأ مع زر إغلاق مخصص
  void _showErrorDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.leftSlide,
      title: 'حدث خطأ',
      desc: 'تعذر الاتصال بالخادم، يرجى المحاولة لاحقاً.',
      btnOkText: 'حسناً',
      btnOkOnPress: () {
        debugPrint('تم إغلاق نافذة الخطأ');
      },
    ).show();
  }

  // دالة لعرض نافذة تأكيد (سؤال) مع زرين
  void _showQuestionDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.bottomSlide,
      title: 'تأكيد الحذف',
      desc: 'هل أنت متأكد من رغبتك في حذف هذا العنصر؟ لا يمكن التراجع عن هذه العملية.',
      btnCancelText: 'إلغاء',
      btnOkText: 'حذف',
      btnCancelOnPress: () {
        debugPrint('تم إلغاء الحذف');
      },
      btnOkOnPress: () {
        debugPrint('تم تأكيد الحذف');
        // هنا يتم تنفيذ عملية الحذف الفعلية
      },
      // منع الإغلاق عند النقر خارج النافذة لضمان اتخاذ قرار صريح
      dismissOnTouchOutside: false, 
    ).show();
  }

  // دالة لعرض نافذة بمحتوى مخصص (Custom Body)
  void _showCustomBodyDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.scale,
      title: 'تسجيل الدخول',
      // استخدام body لعرض حقول إدخال مخصصة
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'البريد الإلكتروني',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'كلمة المرور',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      btnOkText: 'دخول',
      btnCancelText: 'إلغاء',
      btnOkOnPress: () {
        debugPrint('تم الضغط على زر الدخول');
      },
      btnCancelOnPress: () {},
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أنواع نوافذ AwesomeDialog'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            ElevatedButton(
              onPressed: _showInfoDialog,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('عرض نافذة معلومات (Info)'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _showSuccessDialog,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('عرض نافذة نجاح (Success)'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _showErrorDialog,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('عرض نافذة خطأ (Error)'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _showQuestionDialog,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text('عرض نافذة تأكيد (Question)'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _showCustomBodyDialog,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              child: const Text('عرض نافذة بمحتوى مخصص (Custom Body)'),
            ),
          ],
        ),
      ),
    );
  }
}