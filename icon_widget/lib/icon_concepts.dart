import 'package:flutter/material.dart';

class IconConcepts extends StatelessWidget {
  const IconConcepts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSectionTitle('1. Basic Icons'),
            _buildBasicIconsExamples(),

            _buildSectionTitle('2. Icon Size'),
            _buildIconSizeExamples(),

            _buildSectionTitle('3. Icon Color'),
            _buildIconColorExamples(),

            _buildSectionTitle('4. Icon with Text'),
            _buildIconWithTextExamples(),

            _buildSectionTitle('5. Material Icons Categories'),
            _buildIconCategoriesExamples(),

            _buildSectionTitle('6. Icon in Buttons'),
            _buildIconButtonsExamples(),

            _buildSectionTitle('7. Icon with Background'),
            _buildIconWithBackgroundExamples(),

            _buildSectionTitle('8. Animated Icons'),
            _buildAnimatedIconsExamples(),

            _buildSectionTitle('9. Custom Icon Styles'),
            _buildCustomIconStylesExamples(),

            _buildSectionTitle('10. Real-World Examples'),
            _buildRealWorldExamples(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ==================== AppBar ====================
  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "Icon Widget Concepts",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.purple,
      centerTitle: true,
    );
  }

  // ==================== Section Title ====================
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

  // ==================== 1. Basic Icons ====================
  Widget _buildBasicIconsExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'أيقونات أساسية Basic Icons',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
            child: const Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                Icon(Icons.home),
                Icon(Icons.favorite),
                Icon(Icons.settings),
                Icon(Icons.person),
                Icon(Icons.search),
                Icon(Icons.notifications),
                Icon(Icons.shopping_cart),
                Icon(Icons.email),
                Icon(Icons.phone),
                Icon(Icons.location_on),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'Icon(Icons.home)\n'
                  'Icon(Icons.favorite)\n'
                  'Icon(Icons.settings)'
          ),

          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline, color: Colors.blue),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Flutter يوفر أكثر من 1000 أيقونة جاهزة من Material Design',
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

  // ==================== 2. Icon Size ====================
  Widget _buildIconSizeExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'أحجام مختلفة Different Sizes',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.star, size: 20, color: Colors.amber.shade700),
                        const SizedBox(height: 4),
                        const Text('20', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.star, size: 30, color: Colors.amber.shade700),
                        const SizedBox(height: 4),
                        const Text('30', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.star, size: 40, color: Colors.amber.shade700),
                        const SizedBox(height: 4),
                        const Text('40', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.star, size: 50, color: Colors.amber.shade700),
                        const SizedBox(height: 4),
                        const Text('50', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.star, size: 60, color: Colors.amber.shade700),
                        const SizedBox(height: 4),
                        const Text('60', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.favorite, size: 80, color: Colors.red),
                        const SizedBox(height: 4),
                        const Text('80', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.favorite, size: 100, color: Colors.red),
                        const SizedBox(height: 4),
                        const Text('100', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'Icon(\n'
                  '  Icons.star,\n'
                  '  size: 50, // الحجم بالبكسل\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 3. Icon Color ====================
  Widget _buildIconColorExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'ألوان مختلفة Different Colors',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          // Basic Colors
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                Icon(Icons.favorite, size: 40, color: Colors.red),
                Icon(Icons.favorite, size: 40, color: Colors.blue),
                Icon(Icons.favorite, size: 40, color: Colors.green),
                Icon(Icons.favorite, size: 40, color: Colors.orange),
                Icon(Icons.favorite, size: 40, color: Colors.purple),
                Icon(Icons.favorite, size: 40, color: Colors.pink),
                Icon(Icons.favorite, size: 40, color: Colors.teal),
                Icon(Icons.favorite, size: 40, color: Colors.amber),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Color Shades
          const Text(
            'درجات اللون Color Shades',
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.circle, size: 40, color: Colors.blue.shade100),
                    Icon(Icons.circle, size: 40, color: Colors.blue.shade300),
                    Icon(Icons.circle, size: 40, color: Colors.blue.shade500),
                    Icon(Icons.circle, size: 40, color: Colors.blue.shade700),
                    Icon(Icons.circle, size: 40, color: Colors.blue.shade900),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Blue: 100, 300, 500, 700, 900',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Opacity
          const Text(
            'الشفافية Opacity',
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.favorite, size: 40, color: Colors.red.withOpacity(1.0)),
                Icon(Icons.favorite, size: 40, color: Colors.red.withOpacity(0.8)),
                Icon(Icons.favorite, size: 40, color: Colors.red.withOpacity(0.6)),
                Icon(Icons.favorite, size: 40, color: Colors.red.withOpacity(0.4)),
                Icon(Icons.favorite, size: 40, color: Colors.red.withOpacity(0.2)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'Icon(\n'
                  '  Icons.favorite,\n'
                  '  color: Colors.red.withOpacity(0.5),\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 4. Icon with Text ====================
  Widget _buildIconWithTextExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'أيقونات مع نص Icons with Text',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          // Icon + Text Horizontal
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.home, color: Colors.blue),
                    SizedBox(width: 8),
                    Text(
                      'الصفحة الرئيسية Home',
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.red),
                    SizedBox(width: 8),
                    Text(
                      'المفضلة Favorites',
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.settings, color: Colors.grey),
                    SizedBox(width: 8),
                    Text(
                      'الإعدادات Settings',
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Icon + Text Vertical
          const Text(
            'عمودي Vertical',
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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(Icons.home, size: 40, color: Colors.blue),
                    SizedBox(height: 8),
                    Text(
                      'الرئيسية',
                      style: TextStyle(fontSize: 12),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.search, size: 40, color: Colors.green),
                    SizedBox(height: 8),
                    Text(
                      'بحث',
                      style: TextStyle(fontSize: 12),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.person, size: 40, color: Colors.orange),
                    SizedBox(height: 8),
                    Text(
                      'الملف',
                      style: TextStyle(fontSize: 12),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.settings, size: 40, color: Colors.purple),
                    SizedBox(height: 8),
                    Text(
                      'إعدادات',
                      style: TextStyle(fontSize: 12),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Icon with Badge
          const Text(
            'أيقونة مع Badge',
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(Icons.notifications, size: 40, color: Colors.blue),
                    Positioned(
                      top: -5,
                      right: -5,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          '5',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(Icons.shopping_cart, size: 40, color: Colors.green),
                    Positioned(
                      top: -5,
                      right: -5,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          '3',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(Icons.email, size: 40, color: Colors.orange),
                    Positioned(
                      top: -5,
                      right: -5,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          '12',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 5. Icon Categories ====================
  Widget _buildIconCategoriesExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Action Icons
          _buildIconCategory(
            'أيقونات الإجراءات Action Icons',
            [
              Icons.add,
              Icons.remove,
              Icons.edit,
              Icons.delete,
              Icons.save,
              Icons.share,
              Icons.download,
              Icons.upload,
            ],
            Colors.blue,
          ),

          const SizedBox(height: 16),

          // Communication Icons
          _buildIconCategory(
            'أيقونات التواصل Communication',
            [
              Icons.phone,
              Icons.email,
              Icons.message,
              Icons.chat,
              Icons.video_call,
              Icons.call,
              Icons.mail_outline,
              Icons.forum,
            ],
            Colors.green,
          ),

          const SizedBox(height: 16),

          // Social Icons
          _buildIconCategory(
            'أيقونات اجتماعية Social',
            [
              Icons.thumb_up,
              Icons.thumb_down,
              Icons.favorite,
              Icons.share,
              Icons.comment,
              Icons.bookmark,
              Icons.notifications,
              Icons.people,
            ],
            Colors.red,
          ),

          const SizedBox(height: 16),

          // Navigation Icons
          _buildIconCategory(
            'أيقونات التنقل Navigation',
            [
              Icons.home,
              Icons.menu,
              Icons.arrow_back,
              Icons.arrow_forward,
              Icons.close,
              Icons.more_vert,
              Icons.expand_more,
              Icons.chevron_right,
            ],
            Colors.purple,
          ),

          const SizedBox(height: 16),

          // Media Icons
          _buildIconCategory(
            'أيقونات الوسائط Media',
            [
              Icons.play_arrow,
              Icons.pause,
              Icons.stop,
              Icons.skip_next,
              Icons.skip_previous,
              Icons.volume_up,
              Icons.camera,
              Icons.photo,
            ],
            Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _buildIconCategory(String title, List<IconData> icons, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
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
            children: icons.map((icon) => Icon(icon, size: 35, color: color)).toList(),
          ),
        ),
      ],
    );
  }

  // ==================== 6. Icon Buttons ====================
  Widget _buildIconButtonsExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'أزرار الأيقونات Icon Buttons',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          // IconButton
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                  color: Colors.red,
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                  color: Colors.blue,
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                  color: Colors.green,
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete),
                  color: Colors.grey,
                  iconSize: 30,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'IconButton(\n'
                  '  onPressed: () {},\n'
                  '  icon: Icon(Icons.favorite),\n'
                  '  color: Colors.red,\n'
                  ')'
          ),

          const SizedBox(height: 16),

          // Icon with ElevatedButton
          const Text(
            'أزرار مع أيقونات Buttons with Icons',
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
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text(
                    'إضافة Add',
                    textDirection: TextDirection.rtl,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                  label: const Text(
                    'تحميل Download',
                    textDirection: TextDirection.rtl,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                  label: const Text(
                    'مشاركة Share',
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(height: 8),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.delete),
                  label: const Text(
                    'حذف Delete',
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

  // ==================== 7. Icon with Background ====================
  Widget _buildIconWithBackgroundExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'أيقونات مع خلفية Icons with Background',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          // Circle Background
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Square Background
          const Text(
            'خلفية مربعة Square Background',
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.email,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.phone,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.camera,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Gradient Background
          const Text(
            'خلفية متدرجة Gradient Background',
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.orange, Colors.red],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.green, Colors.teal],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 8. Animated Icons ====================
  Widget _buildAnimatedIconsExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'أيقونات متحركة (مثال تصميم فقط)',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
            child: const Column(
              children: [
                Text(
                  'Flutter توفر AnimatedIcon للتحريك بين أيقونتين',
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.play_arrow, size: 40, color: Colors.blue),
                        SizedBox(height: 4),
                        Icon(Icons.pause, size: 40, color: Colors.blue),
                        SizedBox(height: 4),
                        Text(
                          'play ↔ pause',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.menu, size: 40, color: Colors.green),
                        SizedBox(height: 4),
                        Icon(Icons.close, size: 40, color: Colors.green),
                        SizedBox(height: 4),
                        Text(
                          'menu ↔ close',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.add, size: 40, color: Colors.orange),
                        SizedBox(height: 4),
                        Icon(Icons.remove, size: 40, color: Colors.orange),
                        SizedBox(height: 4),
                        Text(
                          'add ↔ remove',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'AnimatedIcon(\n'
                  '  icon: AnimatedIcons.play_pause,\n'
                  '  progress: controller,\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 9. Custom Icon Styles ====================
  Widget _buildCustomIconStylesExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'أنماط مخصصة Custom Styles',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          // Icon with Shadow
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.favorite,
                    size: 50,
                    color: Colors.blue,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.star,
                    size: 50,
                    color: Colors.red,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.shopping_cart,
                    size: 50,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Icon with Border
          const Text(
            'أيقونات مع حدود Icons with Border',
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue, width: 3),
                  ),
                  child: const Icon(
                    Icons.home,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red, width: 3),
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.green, width: 3),
                  ),
                  child: const Icon(
                    Icons.settings,
                    color: Colors.green,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 10. Real-World Examples ====================
  Widget _buildRealWorldExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Bottom Navigation Bar
          const Text(
            'شريط التنقل السفلي Bottom Navigation',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.home, color: Colors.blue, size: 28),
                    SizedBox(height: 4),
                    Text(
                      'الرئيسية',
                      style: TextStyle(color: Colors.blue, fontSize: 12),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.search, color: Colors.grey, size: 28),
                    SizedBox(height: 4),
                    Text(
                      'بحث',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.favorite, color: Colors.grey, size: 28),
                    SizedBox(height: 4),
                    Text(
                      'المفضلة',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.person, color: Colors.grey, size: 28),
                    SizedBox(height: 4),
                    Text(
                      'الملف',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Feature Cards
          const Text(
            'بطاقات الميزات Feature Cards',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: _buildFeatureCard(
                  'توصيل سريع Fast Delivery',
                  Icons.local_shipping,
                  Colors.blue,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildFeatureCard(
                  'دعم 24/7 Support',
                  Icons.headset_mic,
                  Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _buildFeatureCard(
                  'آمن Secure',
                  Icons.security,
                  Colors.orange,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildFeatureCard(
                  'ضمان Warranty',
                  Icons.verified_user,
                  Colors.purple,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Social Media Row
          const Text(
            'وسائل التواصل Social Media',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialIcon(Icons.facebook, Colors.blue),
                const SizedBox(width: 12),
                _buildSocialIcon(Icons.camera_alt, Colors.purple),
                const SizedBox(width: 12),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close, color: Colors.white, size: 30),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.play_arrow, color: Colors.white, size: 30),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Stats Cards
          const Text(
            'بطاقات الإحصائيات Stats Cards',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  '1,234',
                  'المستخدمين Users',
                  Icons.people,
                  Colors.blue,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildStatCard(
                  '567',
                  'المنتجات Products',
                  Icons.shopping_bag,
                  Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  '\$89K',
                  'المبيعات Sales',
                  Icons.attach_money,
                  Colors.orange,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildStatCard(
                  '4.8⭐',
                  'التقييم Rating',
                  Icons.star,
                  Colors.amber,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(String title, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, Color color) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 30),
    );
  }

  Widget _buildStatCard(String value, String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 35, color: color),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }

  // ==================== Helper Methods ====================
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
}