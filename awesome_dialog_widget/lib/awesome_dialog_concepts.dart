// ==================== awesome_dialog_concepts.dart ====================
// ملاحظة: يتطلب هذا الودجت حزمة خارجية
// أضف في pubspec.yaml:
// dependencies:
//   awesome_dialog: ^3.2.1

import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class AwesomeDialogConceptsApp extends StatelessWidget {
  const AwesomeDialogConceptsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSectionTitle('1. Dialog Types (الأنواع)'),
            _buildDialogTypesExamples(context),
            
            _buildSectionTitle('2. Alert Styles (الأنماط)'),
            _buildAlertStylesExamples(context),
            
            _buildSectionTitle('3. With Buttons'),
            _buildButtonsExamples(context),
            
            _buildSectionTitle('4. Custom Icons'),
            _buildCustomIconsExamples(context),
            
            _buildSectionTitle('5. Custom Content'),
            _buildCustomContentExamples(context),
            
            _buildSectionTitle('6. Animation Types'),
            _buildAnimationExamples(context),
            
            _buildSectionTitle('7. Dismissible Options'),
            _buildDismissibleExamples(context),
            
            _buildSectionTitle('8. Real-World Examples'),
            _buildRealWorldExamples(context),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "AwesomeDialog Concepts",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      backgroundColor: Colors.pink,
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
          colors: [Colors.pink.shade100, Colors.pink.shade50],
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.pink.shade700,
        ),
      ),
    );
  }

  // ==================== 1. Dialog Types ====================
  Widget _buildDialogTypesExamples(BuildContext context) {
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
              'AwesomeDialog يوفر أنواع جاهزة من مربعات الحوار الجميلة',
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
          ),
          const SizedBox(height: 16),
          
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildDialogButton(
                'نجاح Success',
                Colors.green,
                () => _showSuccessDialog(context),
              ),
              _buildDialogButton(
                'خطأ Error',
                Colors.red,
                () => _showErrorDialog(context),
              ),
              _buildDialogButton(
                'تحذير Warning',
                Colors.orange,
                () => _showWarningDialog(context),
              ),
              _buildDialogButton(
                'معلومات Info',
                Colors.blue,
                () => _showInfoDialog(context),
              ),
              _buildDialogButton(
                'سؤال Question',
                Colors.purple,
                () => _showQuestionDialog(context),
              ),
              _buildDialogButton(
                'بدون نوع NoHeader',
                Colors.grey,
                () => _showNoHeaderDialog(context),
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          _buildCodeBox(
            'AwesomeDialog(\n'
            '  context: context,\n'
            '  dialogType: DialogType.success,\n'
            '  title: "نجاح!",\n'
            '  desc: "تمت العملية بنجاح",\n'
            ').show();'
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'نجاح!',
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      desc: 'تمت العملية بنجاح',
      descTextStyle: const TextStyle(fontSize: 14),
      btnOkOnPress: () {},
    ).show();
  }

  void _showErrorDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: 'خطأ!',
      desc: 'حدث خطأ ما، حاول مرة أخرى',
      btnOkOnPress: () {},
    ).show();
  }

  void _showWarningDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.rightSlide,
      title: 'تحذير!',
      desc: 'هل أنت متأكد من هذا الإجراء؟',
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }

  void _showInfoDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.rightSlide,
      title: 'معلومة',
      desc: 'هذا التطبيق يستخدم أحدث التقنيات',
      btnOkOnPress: () {},
    ).show();
  }

  void _showQuestionDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.rightSlide,
      title: 'سؤال',
      desc: 'هل تريد المتابعة؟',
      btnCancelOnPress: () {},
      btnCancelText: 'لا',
      btnOkOnPress: () {},
      btnOkText: 'نعم',
    ).show();
  }

  void _showNoHeaderDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.scale,
      title: 'بدون رأس',
      desc: 'مربع حوار بسيط بدون أيقونة',
      btnOkOnPress: () {},
    ).show();
  }

  Widget _buildDialogButton(String label, Color color, VoidCallback onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
      ),
      child: Text(label, textDirection: TextDirection.rtl),
    );
  }

  // ==================== 2. Alert Styles ====================
  Widget _buildAlertStylesExamples(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'أنماط التنبيه المختلفة',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildDialogButton(
                'مربع بسيط',
                Colors.teal,
                () => _showBasicAlertDialog(context),
              ),
              _buildDialogButton(
                'مربع حوار كبير',
                Colors.indigo,
                () => _showLargeDialog(context),
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          _buildCodeBox(
            '// أنواع Dialog:\n'
            'DialogType.info\n'
            'DialogType.warning\n'
            'DialogType.error\n'
            'DialogType.success\n'
            'DialogType.question\n'
            'DialogType.noHeader\n'
            'DialogType.infoReverse\n'
            'DialogType.warningReverse\n'
            'DialogType.errorReverse\n'
            'DialogType.successReverse'
          ),
        ],
      ),
    );
  }

  void _showBasicAlertDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.infoReverse,
      animType: AnimType.bottomSlide,
      title: 'تنبيه',
      desc: 'هذا نمط عكسي (Reverse)',
      btnOkOnPress: () {},
    ).show();
  }

  void _showLargeDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      title: 'مربع حوار كبير',
      desc: 'يمكن أن يحتوي على المزيد من التفاصيل والمحتوى الإضافي هنا',
      btnOkOnPress: () {},
    ).show();
  }

  // ==================== 3. With Buttons ====================
  Widget _buildButtonsExamples(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'أزرار مخصصة',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildDialogButton(
                'زر واحد',
                Colors.blue,
                () => _showSingleButtonDialog(context),
              ),
              _buildDialogButton(
                'زرين',
                Colors.green,
                () => _showTwoButtonsDialog(context),
              ),
              _buildDialogButton(
                'أزرار مخصصة',
                Colors.purple,
                () => _showCustomButtonsDialog(context),
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          _buildCodeBox(
            'AwesomeDialog(\n'
            '  context: context,\n'
            '  dialogType: DialogType.warning,\n'
            '  btnCancelOnPress: () {},\n'
            '  btnCancelText: "إلغاء",\n'
            '  btnOkOnPress: () {},\n'
            '  btnOkText: "تأكيد",\n'
            '  btnOkColor: Colors.green,\n'
            '  btnCancelColor: Colors.red,\n'
            ').show();'
          ),
        ],
      ),
    );
  }

  void _showSingleButtonDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      title: 'زر واحد فقط',
      desc: 'مربع حوار مع زر تأكيد واحد',
      btnOkOnPress: () {},
      btnOkText: 'حسناً',
    ).show();
  }

  void _showTwoButtonsDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      title: 'تأكيد الحذف',
      desc: 'هل تريد حذف هذا العنصر؟',
      btnCancelOnPress: () {},
      btnCancelText: 'إلغاء',
      btnOkOnPress: () {},
      btnOkText: 'حذف',
      btnOkColor: Colors.red,
    ).show();
  }

  void _showCustomButtonsDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      title: 'خيارات مخصصة',
      desc: 'اختر أحد الخيارات',
      btnCancelOnPress: () {},
      btnCancelText: 'لاحقاً',
      btnCancelColor: Colors.grey,
      btnOkOnPress: () {},
      btnOkText: 'موافق',
      btnOkColor: Colors.blue,
    ).show();
  }

  // ==================== 4. Custom Icons ====================
  Widget _buildCustomIconsExamples(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'أيقونات مخصصة',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildDialogButton(
                'أيقونة مخصصة',
                Colors.amber,
                () => _showCustomIconDialog(context),
              ),
              _buildDialogButton(
                'بدون أيقونة',
                Colors.brown,
                () => _showNoIconDialog(context),
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          _buildCodeBox(
            'AwesomeDialog(\n'
            '  context: context,\n'
            '  dialogType: DialogType.noHeader,\n'
            '  customHeader: Icon(\n'
            '    Icons.emoji_emotions,\n'
            '    size: 80,\n'
            '    color: Colors.amber,\n'
            '  ),\n'
            '  title: "عنوان مخصص",\n'
            ').show();'
          ),
        ],
      ),
    );
  }

  void _showCustomIconDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      customHeader: const Icon(
        Icons.emoji_emotions,
        size: 80,
        color: Colors.amber,
      ),
      title: 'مبروك!',
      desc: 'لقد فزت بجائزة',
      btnOkOnPress: () {},
    ).show();
  }

  void _showNoIconDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      title: 'بدون أيقونة',
      desc: 'مربع حوار بسيط بدون أي أيقونة',
      btnOkOnPress: () {},
    ).show();
  }

  // ==================== 5. Custom Content ====================
  Widget _buildCustomContentExamples(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'محتوى مخصص كامل',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildDialogButton(
                'محتوى تفاعلي',
                Colors.deepPurple,
                () => _showCustomBodyDialog(context),
              ),
              _buildDialogButton(
                'نموذج إدخال',
                Colors.cyan,
                () => _showFormDialog(context),
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          _buildCodeBox(
            'AwesomeDialog(\n'
            '  context: context,\n'
            '  dialogType: DialogType.noHeader,\n'
            '  body: Column(\n'
            '    children: [\n'
            '      // أي محتوى مخصص\n'
            '      TextField(...),\n'
            '      ElevatedButton(...),\n'
            '    ],\n'
            '  ),\n'
            ').show();'
          ),
        ],
      ),
    );
  }

  void _showCustomBodyDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      body: Column(
        children: [
          const Icon(Icons.star, size: 60, color: Colors.amber),
          const SizedBox(height: 16),
          const Text(
            'قيّم تجربتك',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => const Icon(
                Icons.star,
                color: Colors.amber,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      btnOkOnPress: () {},
      btnOkText: 'إرسال',
    ).show();
  }

  void _showFormDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'أدخل بريدك الإلكتروني',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'example@email.com',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
      btnOkOnPress: () {},
      btnOkText: 'إرسال',
    ).show();
  }

  // ==================== 6. Animation Types ====================
  Widget _buildAnimationExamples(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'أنواع الحركة Animation',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildAnimButton('Right Slide', AnimType.rightSlide, context),
              _buildAnimButton('Left Slide', AnimType.leftSlide, context),
              _buildAnimButton('Top Slide', AnimType.topSlide, context),
              _buildAnimButton('Bottom Slide', AnimType.bottomSlide, context),
              _buildAnimButton('Scale', AnimType.scale, context),
            ],
          ),
          
          const SizedBox(height: 8),
          _buildCodeBox(
            'AwesomeDialog(\n'
            '  animType: AnimType.rightSlide,\n'
            '  // AnimType.leftSlide\n'
            '  // AnimType.topSlide\n'
            '  // AnimType.bottomSlide\n'
            '  // AnimType.scale\n'
            ').show();'
          ),
        ],
      ),
    );
  }

  Widget _buildAnimButton(String label, AnimType type, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: type,
          title: label,
          desc: 'حركة $label',
          btnOkOnPress: () {},
        ).show();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      child: Text(label),
    );
  }

  // ==================== 7. Dismissible Options ====================
  Widget _buildDismissibleExamples(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'خيارات الإغلاق',
            style: TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildDialogButton(
                'قابل للإغلاق',
                Colors.lightGreen,
                () => _showDismissibleDialog(context),
              ),
              _buildDialogButton(
                'غير قابل للإغلاق',
                Colors.deepOrange,
                () => _showNonDismissibleDialog(context),
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          _buildCodeBox(
            'AwesomeDialog(\n'
            '  dismissOnTouchOutside: false, // لا يغلق بالنقر خارجه\n'
            '  dismissOnBackKeyPress: false, // لا يغلق بزر الرجوع\n'
            ').show();'
          ),
        ],
      ),
    );
  }

  void _showDismissibleDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      title: 'قابل للإغلاق',
      desc: 'اضغط خارج المربع لإغلاقه',
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: true,
      btnOkOnPress: () {},
    ).show();
  }

  void _showNonDismissibleDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      title: 'يجب الرد',
      desc: 'لا يمكن إغلاق هذا المربع إلا بالضغط على الزر',
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      btnOkOnPress: () {},
      btnOkText: 'فهمت',
    ).show();
  }

  // ==================== 8. Real-World Examples ====================
  Widget _buildRealWorldExamples(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'أمثلة واقعية',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildDialogButton(
                'حذف حساب',
                Colors.red,
                () => _showDeleteAccountDialog(context),
              ),
              _buildDialogButton(
                'نجاح الطلب',
                Colors.green,
                () => _showOrderSuccessDialog(context),
              ),
              _buildDialogButton(
                'خطأ في الاتصال',
                Colors.orange,
                () => _showNetworkErrorDialog(context),
              ),
              _buildDialogButton(
                'تسجيل خروج',
                Colors.blue,
                () => _showLogoutDialog(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.scale,
      title: 'حذف الحساب',
      desc: 'هذا الإجراء لا يمكن التراجع عنه. سيتم حذف جميع بياناتك نهائياً.',
      btnCancelOnPress: () {},
      btnCancelText: 'إلغاء',
      btnOkOnPress: () {},
      btnOkText: 'حذف نهائياً',
      btnOkColor: Colors.red,
    ).show();
  }

  void _showOrderSuccessDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'تم الطلب بنجاح!',
      desc: 'رقم طلبك #12345\nسيصلك خلال 2-3 أيام عمل',
      btnOkOnPress: () {},
      btnOkText: 'تتبع الطلب',
    ).show();
  }

  void _showNetworkErrorDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.bottomSlide,
      title: 'خطأ في الاتصال',
      desc: 'تعذر الاتصال بالخادم. تحقق من اتصال الإنترنت.',
      btnCancelOnPress: () {},
      btnCancelText: 'إلغاء',
      btnOkOnPress: () {},
      btnOkText: 'إعادة المحاولة',
    ).show();
  }

  void _showLogoutDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.scale,
      title: 'تسجيل الخروج',
      desc: 'هل تريد تسجيل الخروج من حسابك؟',
      btnCancelOnPress: () {},
      btnCancelText: 'إلغاء',
      btnOkOnPress: () {},
      btnOkText: 'تسجيل الخروج',
      btnOkColor: Colors.red,
    ).show();
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