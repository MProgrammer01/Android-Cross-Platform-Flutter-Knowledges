import 'package:flutter/material.dart';

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
      home: const ListViewScreen(),
    );
  }
}

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  // ==================== بيانات تجريبية ====================
  final List<String> _items = List.generate(20, (i) => 'عنصر رقم ${i + 1}');
  final List<String> _dynamicItems = ['تفاحة 🍎', 'موزة 🍌', 'برتقالة 🍊'];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _addItem() {
    setState(() {
      _dynamicItems.add('عنصر جديد ${_dynamicItems.length + 1} 🆕');
    });
  }

  void _removeItem(int index) {
    setState(() {
      _dynamicItems.removeAt(index);
    });
  }

  Future<void> _loadMore() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _items.addAll(
        List.generate(5, (i) => 'عنصر محمّل ${_items.length + i + 1}'),
      );
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          children: [
            // ── 1
            _buildSectionTitle('1️⃣  ListView العادي (children)'),
            _buildBasicListView(),

            // ── 2
            _buildSectionTitle('2️⃣  ListView.builder'),
            _buildListViewBuilder(),

            // ── 3
            _buildSectionTitle('3️⃣  ListView.separated'),
            _buildListViewSeparated(),

            // ── 4
            _buildSectionTitle('4️⃣  ListView.custom (SliverChildBuilderDelegate)'),
            _buildListViewCustom(),

            // ── 5
            _buildSectionTitle('5️⃣  scrollDirection: Horizontal (أفقي)'),
            _buildHorizontalListView(),

            // ── 6
            _buildSectionTitle('6️⃣  reverse: true (عكسي)'),
            _buildReverseListView(),

            // ── 7
            _buildSectionTitle('7️⃣  shrinkWrap: true'),
            _buildShrinkWrapListView(),

            // ── 8
            _buildSectionTitle('8️⃣  physics (سلوك التمرير)'),
            _buildPhysicsExamples(),

            // ── 9
            _buildSectionTitle('9️⃣  ScrollController والتحكم يدوياً'),
            _buildScrollControllerExample(),

            // ── 10
            _buildSectionTitle('🔟  padding داخل ListView'),
            _buildPaddingExample(),

            // ── 11
            _buildSectionTitle('1️⃣1️⃣  itemExtent (ارتفاع ثابت)'),
            _buildItemExtentExample(),

            // ── 12
            _buildSectionTitle('1️⃣2️⃣  prototypeItem'),
            _buildPrototypeItemExample(),

            // ── 13
            _buildSectionTitle('1️⃣3️⃣  cacheExtent (التخزين المؤقت)'),
            _buildCacheExtentExample(),

            // ── 14
            _buildSectionTitle('1️⃣4️⃣  keyboardDismissBehavior'),
            _buildKeyboardDismissExample(),

            // ── 15
            _buildSectionTitle('1️⃣5️⃣  إضافة وحذف عناصر ديناميكياً'),
            _buildDynamicListView(),

            // ── 16
            _buildSectionTitle('1️⃣6️⃣  Lazy Loading (تحميل عند التمرير)'),
            _buildLazyLoadingExample(),

            // ── 17
            _buildSectionTitle('1️⃣7️⃣  Reorderable ListView'),
            _buildReorderableListView(),

            // ── 18
            _buildSectionTitle('1️⃣8️⃣  ListView مع Dismissible (حذف بالسحب)'),
            _buildDismissibleListView(),

            // ── 19
            _buildSectionTitle('1️⃣9️⃣  NeverScrollableScrollPhysics داخل Column'),
            _buildInsideColumnExample(),

            // ── 20
            _buildSectionTitle('2️⃣0️⃣  ListView مع Scrollbar'),
            _buildScrollbarExample(),
          ],
        ),
      ),
    );
  }

  // ==================== AppBar ====================
  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'جميع مفاهيم ListView',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blue,
    );
  }

  // ==================== Section Title ====================
  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 16, bottom: 8),
      color: Colors.blue.shade100,
      child: Text(
        title,
        textDirection: TextDirection.rtl,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  // ============================================================
  // 1. ListView العادي children
  // ============================================================
  Widget _buildBasicListView() {
    return SizedBox(
      height: 200,
      child: ListView(
        // children: قائمة ثابتة من الـ Widgets - كلها تُبنى دفعة واحدة
        children: [
          _tile(Icons.star, 'العنصر الأول', 'children[0]', Colors.amber),
          _tile(Icons.star, 'العنصر الثاني', 'children[1]', Colors.orange),
          _tile(Icons.star, 'العنصر الثالث', 'children[2]', Colors.red),
          _tile(Icons.star, 'العنصر الرابع', 'children[3]', Colors.purple),
          _tile(Icons.star, 'العنصر الخامس', 'children[4]', Colors.indigo),
        ],
      ),
    );
  }

  // ============================================================
  // 2. ListView.builder
  // ============================================================
  Widget _buildListViewBuilder() {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        // itemCount: عدد العناصر - إذا null فالقائمة لا نهائية
        itemCount: 15,
        // itemBuilder: يُنشئ كل عنصر عند الحاجة فقط (lazy)
        itemBuilder: (context, index) {
          return _tile(
            Icons.build,
            'builder - عنصر $index',
            'itemBuilder(context, $index)',
            Colors.teal,
          );
        },
      ),
    );
  }

  // ============================================================
  // 3. ListView.separated
  // ============================================================
  Widget _buildListViewSeparated() {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        itemCount: 8,
        // separatorBuilder: الـ Widget الذي يظهر بين كل عنصرين
        separatorBuilder: (context, index) => Divider(
          color: Colors.blue.shade200,
          thickness: 1.5,
          indent: 16,
          endIndent: 16,
        ),
        itemBuilder: (context, index) {
          return _tile(
            Icons.linear_scale,
            'separated - عنصر $index',
            'separatorBuilder يظهر بين العناصر',
            Colors.green,
          );
        },
      ),
    );
  }

  // ============================================================
  // 4. ListView.custom
  // ============================================================
  Widget _buildListViewCustom() {
    return SizedBox(
      height: 200,
      child: ListView.custom(
        // SliverChildBuilderDelegate: تحكم كامل في بناء العناصر
        childrenDelegate: SliverChildBuilderDelegate(
              (context, index) {
            return _tile(
              Icons.tune,
              'custom - عنصر $index',
              'SliverChildBuilderDelegate',
              Colors.deepPurple,
            );
          },
          // childCount: عدد العناصر
          childCount: 6,
          // addAutomaticKeepAlives: الحفاظ على حالة العناصر
          addAutomaticKeepAlives: true,
          // addRepaintBoundaries: تحسين الأداء عند إعادة الرسم
          addRepaintBoundaries: true,
        ),
      ),
    );
  }

  // ============================================================
  // 5. scrollDirection Horizontal
  // ============================================================
  Widget _buildHorizontalListView() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        // scrollDirection: الاتجاه - Axis.horizontal أو Axis.vertical
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.primaries[index % Colors.primaries.length],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.swap_horiz, color: Colors.white, size: 28),
                const SizedBox(height: 4),
                Text(
                  'بطاقة $index',
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ============================================================
  // 6. reverse: true
  // ============================================================
  Widget _buildReverseListView() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        // reverse: true → يبدأ العرض من الأسفل (مثل شاشة الدردشة)
        reverse: true,
        itemCount: 6,
        itemBuilder: (context, index) {
          return _tile(
            Icons.swap_vert,
            'reverse - عنصر $index',
            'reverse: true → من الأسفل للأعلى',
            Colors.pink,
          );
        },
      ),
    );
  }

  // ============================================================
  // 7. shrinkWrap: true
  // ============================================================
  Widget _buildShrinkWrapListView() {
    return Container(
      color: Colors.yellow.shade50,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              '⬆️ نص فوق الـ ListView',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListView(
            // shrinkWrap: true → يأخذ الـ ListView فقط المساحة التي يحتاجها
            // ضروري عند وضعه داخل Column أو SingleChildScrollView
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _tile(Icons.compress, 'shrinkWrap عنصر 1', 'shrinkWrap: true', Colors.cyan),
              _tile(Icons.compress, 'shrinkWrap عنصر 2', 'لا يأخذ مساحة زائدة', Colors.cyan),
              _tile(Icons.compress, 'shrinkWrap عنصر 3', 'يتكيف مع محتواه', Colors.cyan),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              '⬇️ نص تحت الـ ListView',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // 8. physics
  // ============================================================
  Widget _buildPhysicsExamples() {
    return Column(
      children: [
        // BouncingScrollPhysics
        _physicsBox(
          label: 'BouncingScrollPhysics - تأثير ارتداد (iOS)',
          physics: const BouncingScrollPhysics(),
          color: Colors.blue,
        ),
        const SizedBox(height: 8),
        // ClampingScrollPhysics
        _physicsBox(
          label: 'ClampingScrollPhysics - بدون ارتداد (Android)',
          physics: const ClampingScrollPhysics(),
          color: Colors.green,
        ),
        const SizedBox(height: 8),
        // NeverScrollableScrollPhysics
        _physicsBox(
          label: 'NeverScrollableScrollPhysics - بدون تمرير نهائياً',
          physics: const NeverScrollableScrollPhysics(),
          color: Colors.red,
        ),
        const SizedBox(height: 8),
        // AlwaysScrollableScrollPhysics
        _physicsBox(
          label: 'AlwaysScrollableScrollPhysics - دائماً قابل للتمرير',
          physics: const AlwaysScrollableScrollPhysics(),
          color: Colors.orange,
        ),
      ],
    );
  }

  Widget _physicsBox({
    required String label,
    required ScrollPhysics physics,
    required Color color,
  }) {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(6),
            color: color.withOpacity(0.15),
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color,
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: physics,
              itemCount: 5,
              itemBuilder: (_, i) => ListTile(
                dense: true,
                title: Text('عنصر $i', style: const TextStyle(fontSize: 13)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // 9. ScrollController
  // ============================================================
  Widget _buildScrollControllerExample() {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: ListView.builder(
            // controller: للتحكم يدوياً في التمرير
            controller: _scrollController,
            itemCount: 20,
            itemBuilder: (context, index) {
              return _tile(
                Icons.gamepad,
                'عنصر $index',
                'ScrollController يتحكم في هذه القائمة',
                Colors.indigo,
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                // animateTo: التمرير مع حركة
                _scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              },
              icon: const Icon(Icons.arrow_upward),
              label: const Text('للأعلى'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, foregroundColor: Colors.white),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // jumpTo: التمرير بدون حركة
                _scrollController.jumpTo(
                  _scrollController.position.maxScrollExtent,
                );
              },
              icon: const Icon(Icons.arrow_downward),
              label: const Text('للأسفل'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, foregroundColor: Colors.white),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            'animateTo() → تمرير بحركة\njumpTo() → تمرير فوري',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // 10. padding
  // ============================================================
  Widget _buildPaddingExample() {
    return Column(
      children: [
        // بدون padding
        Container(
          height: 100,
          color: Colors.red.shade50,
          child: ListView(
            // padding: null → بدون مسافات داخلية
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
              _tile(Icons.format_indent_decrease, 'padding: EdgeInsets.zero', 'بدون مسافة', Colors.red),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // مع padding
        Container(
          height: 100,
          color: Colors.green.shade50,
          child: ListView(
            // padding: مسافات داخلية حول محتوى الـ ListView
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              _tile(Icons.format_indent_increase, 'padding: EdgeInsets.all(16)', 'مع مسافة 16', Colors.green),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // 11. itemExtent
  // ============================================================
  Widget _buildItemExtentExample() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        // itemExtent: تحديد ارتفاع ثابت لكل عنصر → يحسّن الأداء كثيراً
        // لأن Flutter لن يحتاج لحساب ارتفاع كل عنصر
        itemExtent: 60,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              border: Border.all(color: Colors.teal.shade200),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'itemExtent: 60 - عنصر $index (ارتفاع ثابت)',
              style: const TextStyle(fontSize: 13),
            ),
          );
        },
      ),
    );
  }

  // ============================================================
  // 12. prototypeItem
  // ============================================================
  Widget _buildPrototypeItemExample() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        // prototypeItem: عنصر نموذجي يُستخدم لحساب الأبعاد
        // بديل لـ itemExtent عندما لا تعرف الارتفاع مسبقاً
        prototypeItem: const ListTile(
          leading: Icon(Icons.copy),
          title: Text('نموذج'),
          subtitle: Text('subtitle'),
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purple.shade100,
              child: Text('$index'),
            ),
            title: Text('prototypeItem - عنصر $index'),
            subtitle: const Text('يُستخدم لحساب الأبعاد تلقائياً'),
          );
        },
      ),
    );
  }

  // ============================================================
  // 13. cacheExtent
  // ============================================================
  Widget _buildCacheExtentExample() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        // cacheExtent: المسافة خارج الشاشة التي يتم فيها بناء العناصر مسبقاً
        // القيمة الافتراضية: 250 بكسل
        // قيمة أكبر = تمرير أسلس، لكن استهلاك ذاكرة أكبر
        cacheExtent: 500,
        itemCount: 15,
        itemBuilder: (context, index) {
          return _tile(
            Icons.cached,
            'cacheExtent: 500 - عنصر $index',
            'العناصر تُبنى مسبقاً خارج الشاشة',
            Colors.brown,
          );
        },
      ),
    );
  }

  // ============================================================
  // 14. keyboardDismissBehavior
  // ============================================================
  Widget _buildKeyboardDismissExample() {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListView(
        // keyboardDismissBehavior: ماذا يحدث للكيبورد عند التمرير
        // onDrag → يُغلق الكيبورد عند السحب
        // manual → لا يُغلق تلقائياً
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          const Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                labelText: 'اكتب شيئاً ثم مرر القائمة',
                border: OutlineInputBorder(),
                hintText: 'الكيبورد سيُغلق عند التمرير',
              ),
            ),
          ),
          ...List.generate(
            8,
                (i) => _tile(
              Icons.keyboard_hide,
              'مرر للأسفل لإغلاق الكيبورد',
              'keyboardDismissBehavior.onDrag',
              Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // 15. إضافة وحذف ديناميكي
  // ============================================================
  Widget _buildDynamicListView() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: ElevatedButton.icon(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
            label: const Text('إضافة عنصر'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 44),
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: _dynamicItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.circle, color: Colors.green, size: 14),
                title: Text(_dynamicItems[index]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _removeItem(index),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ============================================================
  // 16. Lazy Loading
  // ============================================================
  Widget _buildLazyLoadingExample() {
    return NotificationListener<ScrollNotification>(
      // الاستماع لأحداث التمرير لتحميل المزيد عند الوصول للنهاية
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
            !_isLoading) {
          _loadMore();
        }
        return false;
      },
      child: SizedBox(
        height: 220,
        child: ListView.builder(
          itemCount: _items.length + 1,
          itemBuilder: (context, index) {
            if (index == _items.length) {
              // آخر عنصر: مؤشر تحميل
              return _isLoading
                  ? const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: CircularProgressIndicator()),
              )
                  : const SizedBox.shrink();
            }
            return _tile(
              Icons.cloud_download,
              _items[index],
              'مرر للأسفل لتحميل المزيد',
              Colors.cyan,
            );
          },
        ),
      ),
    );
  }

  // ============================================================
  // 17. ReorderableListView
  // ============================================================
  final List<String> _reorderItems = ['🥇 الأول', '🥈 الثاني', '🥉 الثالث', '4️⃣ الرابع', '5️⃣ الخامس'];

  Widget _buildReorderableListView() {
    return SizedBox(
      height: 250,
      child: ReorderableListView(
        // onReorder: يُستدعى عند إعادة ترتيب العناصر بالسحب
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) newIndex--;
            final item = _reorderItems.removeAt(oldIndex);
            _reorderItems.insert(newIndex, item);
          });
        },
        children: _reorderItems.map((item) {
          return ListTile(
            // key: مطلوب في ReorderableListView
            key: ValueKey(item),
            leading: const Icon(Icons.drag_handle, color: Colors.grey),
            title: Text(item),
            subtitle: const Text('اسحب لإعادة الترتيب'),
          );
        }).toList(),
      ),
    );
  }

  // ============================================================
  // 18. Dismissible
  // ============================================================
  final List<String> _dismissItems = List.generate(6, (i) => 'اسحب لحذف العنصر ${i + 1}');

  Widget _buildDismissibleListView() {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        itemCount: _dismissItems.length,
        itemBuilder: (context, index) {
          final item = _dismissItems[index];
          return Dismissible(
            // key: معرّف فريد لكل عنصر
            key: Key(item),
            // direction: اتجاه السحب
            direction: DismissDirection.endToStart,
            // background: الخلفية التي تظهر عند السحب
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            // onDismissed: يُستدعى بعد الحذف
            onDismissed: (_) {
              setState(() => _dismissItems.removeAt(index));
            },
            child: ListTile(
              leading: const Icon(Icons.swipe, color: Colors.red),
              title: Text(item),
            ),
          );
        },
      ),
    );
  }

  // ============================================================
  // 19. داخل Column مع NeverScrollableScrollPhysics
  // ============================================================
  Widget _buildInsideColumnExample() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '💡 عند وضع ListView داخل Column:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text('✅ استخدم shrinkWrap: true', style: TextStyle(fontSize: 13)),
          const Text('✅ استخدم NeverScrollableScrollPhysics', style: TextStyle(fontSize: 13)),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (_, i) => ListTile(
              dense: true,
              leading: const Icon(Icons.check, color: Colors.orange, size: 18),
              title: Text('عنصر $i داخل Column', style: const TextStyle(fontSize: 13)),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // 20. ListView مع Scrollbar
  // ============================================================
  Widget _buildScrollbarExample() {
    final controller = ScrollController();
    return SizedBox(
      height: 200,
      child: Scrollbar(
        // Scrollbar: يُضيف شريط تمرير مرئي
        controller: controller,
        thumbVisibility: true, // دائماً ظاهر
        trackVisibility: true, // مسار الـ scrollbar ظاهر
        thickness: 8,
        radius: const Radius.circular(4),
        child: ListView.builder(
          controller: controller,
          itemCount: 15,
          itemBuilder: (context, index) {
            return _tile(
              Icons.view_list,
              'Scrollbar - عنصر $index',
              'thumbVisibility: true, trackVisibility: true',
              Colors.blueGrey,
            );
          },
        ),
      ),
    );
  }

  // ==================== Helper: tile عادي ====================
  Widget _tile(IconData icon, String title, String subtitle, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        border: Border(right: BorderSide(color: color, width: 4)),
      ),
      child: ListTile(
        dense: true,
        leading: Icon(icon, color: color, size: 22),
        title: Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
      ),
    );
  }
}