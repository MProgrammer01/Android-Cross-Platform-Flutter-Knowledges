import 'package:flutter/material.dart';

class RowConcepts extends StatelessWidget {
  const RowConcepts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSectionTitle('1. Basic Row'),
            _buildBasicRowExamples(),

            _buildSectionTitle('2. MainAxisAlignment'),
            _buildMainAxisAlignmentExamples(),

            _buildSectionTitle('3. CrossAxisAlignment'),
            _buildCrossAxisAlignmentExamples(),

            _buildSectionTitle('4. MainAxisSize'),
            _buildMainAxisSizeExamples(),

            _buildSectionTitle('5. Spacing with SizedBox'),
            _buildSpacingExamples(),

            _buildSectionTitle('6. Row with Different Widgets'),
            _buildMixedWidgetsExamples(),

            _buildSectionTitle('7. Nested Rows'),
            _buildNestedRowsExamples(),

            _buildSectionTitle('8. Row with Scroll'),
            _buildScrollableRowExamples(),

            _buildSectionTitle('9. Real-World Examples'),
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
        "Row Widget Concepts",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.deepOrange,
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
          colors: [Colors.deepOrange.shade100, Colors.orange.shade50],
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.deepOrange.shade700,
        ),
      ),
    );
  }

  // ==================== 1. Basic Row ====================
  Widget _buildBasicRowExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 60,
                  color: Colors.red,
                  child: const Center(
                    child: Text('Item 1', style: TextStyle(color: Colors.white)),
                  ),
                ),
                Container(
                  width: 80,
                  height: 60,
                  color: Colors.blue,
                  child: const Center(
                    child: Text('Item 2', style: TextStyle(color: Colors.white)),
                  ),
                ),
                Container(
                  width: 80,
                  height: 60,
                  color: Colors.green,
                  child: const Center(
                    child: Text('Item 3', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              "Row(\n"
                  "  children: [\n"
                  "    Widget1,\n"
                  "    Widget2,\n"
                  "    Widget3,\n"
                  "  ],\n"
                  ")"
          ),
        ],
      ),
    );
  }

  // ==================== 2. MainAxisAlignment ====================
  Widget _buildMainAxisAlignmentExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // MainAxisAlignment.start
          _buildAlignmentExample(
            'MainAxisAlignment.start (default)',
            MainAxisAlignment.start,
            CrossAxisAlignment.center,
          ),

          // MainAxisAlignment.center
          _buildAlignmentExample(
            'MainAxisAlignment.center',
            MainAxisAlignment.center,
            CrossAxisAlignment.center,
          ),

          // MainAxisAlignment.end
          _buildAlignmentExample(
            'MainAxisAlignment.end',
            MainAxisAlignment.end,
            CrossAxisAlignment.center,
          ),

          // MainAxisAlignment.spaceBetween
          _buildAlignmentExample(
            'MainAxisAlignment.spaceBetween',
            MainAxisAlignment.spaceBetween,
            CrossAxisAlignment.center,
          ),

          // MainAxisAlignment.spaceAround
          _buildAlignmentExample(
            'MainAxisAlignment.spaceAround',
            MainAxisAlignment.spaceAround,
            CrossAxisAlignment.center,
          ),

          // MainAxisAlignment.spaceEvenly
          _buildAlignmentExample(
            'MainAxisAlignment.spaceEvenly',
            MainAxisAlignment.spaceEvenly,
            CrossAxisAlignment.center,
          ),
        ],
      ),
    );
  }

  // ==================== 3. CrossAxisAlignment ====================
  Widget _buildCrossAxisAlignmentExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // CrossAxisAlignment.start
          _buildCrossAxisExample(
            'CrossAxisAlignment.start',
            CrossAxisAlignment.start,
          ),

          // CrossAxisAlignment.center
          _buildCrossAxisExample(
            'CrossAxisAlignment.center (default)',
            CrossAxisAlignment.center,
          ),

          // CrossAxisAlignment.end
          _buildCrossAxisExample(
            'CrossAxisAlignment.end',
            CrossAxisAlignment.end,
          ),

          // CrossAxisAlignment.stretch
          const Text(
            'CrossAxisAlignment.stretch',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade400, width: 2),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 60,
                  color: Colors.red,
                  child: const Center(
                    child: Text('Stretched', style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 60,
                  color: Colors.blue,
                  child: const Center(
                    child: Text('Stretched', style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 60,
                  color: Colors.green,
                  child: const Center(
                    child: Text('Stretched', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // CrossAxisAlignment.baseline
          const Text(
            'CrossAxisAlignment.baseline',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade400, width: 2),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  'Big',
                  style: TextStyle(fontSize: 40, color: Colors.red),
                ),
                SizedBox(width: 8),
                Text(
                  'Medium',
                  style: TextStyle(fontSize: 25, color: Colors.blue),
                ),
                SizedBox(width: 8),
                Text(
                  'Small',
                  style: TextStyle(fontSize: 15, color: Colors.green),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox('crossAxisAlignment: CrossAxisAlignment.baseline'),
        ],
      ),
    );
  }

  // ==================== 4. MainAxisSize ====================
  Widget _buildMainAxisSizeExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // MainAxisSize.max
          const Text(
            'MainAxisSize.max (default)',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          const Text(
            'Row ياخد كل العرض المتاح (انظر الخلفية الحمراء)',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              // ⭐ Background أحمر للـ Row كامل
              color: Colors.red.withOpacity(0.2),
              child: Row(
                mainAxisSize: MainAxisSize.max, // كل العرض
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    color: Colors.blue,
                    child: const Center(child: Text('1')),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 60,
                    height: 60,
                    color: Colors.green,
                    child: const Center(child: Text('2')),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'mainAxisSize: MainAxisSize.max\n'
                  '// Row ياخد كل العرض المتاح'
          ),

          const SizedBox(height: 16),

          // MainAxisSize.min
          const Text(
            'MainAxisSize.min',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          const Text(
            'Row ياخد فقط العرض المحتاج (انظر الخلفية الخضراء)',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  // ⭐ Background أخضر فقط للعرض المحتاج
                  color: Colors.green.withOpacity(0.2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // العرض المحتاج فقط
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        color: Colors.blue,
                        child: const Center(child: Text('1')),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 60,
                        height: 60,
                        color: Colors.green,
                        child: const Center(child: Text('2')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'mainAxisSize: MainAxisSize.min\n'
                  '// Row ياخد فقط 128px (60+8+60)'
          ),

          const SizedBox(height: 16),

          // مثال توضيحي إضافي
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.blue),
                    SizedBox(width: 8),
                    Text(
                      'انظر الفرق في الخلفية الملونة:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('🔴 ', style: TextStyle(fontSize: 20)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'MainAxisSize.max:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'الخلفية الحمراء تملأ كل العرض',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('🟢 ', style: TextStyle(fontSize: 20)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'MainAxisSize.min:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'الخلفية الخضراء تاخد فقط 128px',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
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

  // ==================== 5. Spacing ====================
  Widget _buildSpacingExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Without spacing
          const Text(
            'Without Spacing',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 60,
                  color: Colors.red,
                  child: const Center(child: Text('1')),
                ),
                Container(
                  width: 70,
                  height: 60,
                  color: Colors.blue,
                  child: const Center(child: Text('2')),
                ),
                Container(
                  width: 70,
                  height: 60,
                  color: Colors.green,
                  child: const Center(child: Text('3')),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // With SizedBox spacing
          const Text(
            'With SizedBox Spacing',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 60,
                  color: Colors.red,
                  child: const Center(child: Text('1')),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 70,
                  height: 60,
                  color: Colors.blue,
                  child: const Center(child: Text('2')),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 70,
                  height: 60,
                  color: Colors.green,
                  child: const Center(child: Text('3')),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox('SizedBox(width: 16)'),

          const SizedBox(height: 16),

          // With Padding
          const Text(
            'With Padding Widget',
            style: TextStyle(fontWeight: FontWeight.bold),
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
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Container(
                    width: 70,
                    height: 60,
                    color: Colors.red,
                    child: const Center(child: Text('1')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Container(
                    width: 70,
                    height: 60,
                    color: Colors.blue,
                    child: const Center(child: Text('2')),
                  ),
                ),
                Container(
                  width: 70,
                  height: 60,
                  color: Colors.green,
                  child: const Center(child: Text('3')),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox('Padding(padding: EdgeInsets.only(right: 12))'),
        ],
      ),
    );
  }

  // ==================== 6. Mixed Widgets ====================
  Widget _buildMixedWidgetsExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
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
                // Icon
                const Icon(
                  Icons.home,
                  size: 40,
                  color: Colors.blue,
                ),

                // Text
                const Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Click'),
                ),

                // CircleAvatar
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.purple,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ],
            ),
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
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1506905925346-21bda4d32df4',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),

                // Column inside Row
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Mountain View',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Beautiful landscape',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                // IconButton
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite, color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 7. Nested Rows ====================
  Widget _buildNestedRowsExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.home, color: Colors.blue),
                          const SizedBox(height: 4),
                          const Text('Home', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.green),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.favorite, color: Colors.green),
                          const SizedBox(height: 4),
                          const Text('Favorite', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.orange),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.settings, color: Colors.orange),
                          const SizedBox(height: 4),
                          const Text('Settings', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                    //nested row
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.purple.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Colors.purple),
                              const SizedBox(width: 8),
                              const Text('Rating: 4.5'),
                            ],
                          ),
                        ),
                      ],
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

  // ==================== 8. Scrollable Row ====================
  Widget _buildScrollableRowExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Row inside SingleChildScrollView',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.purple, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  10,
                      (index) => Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(16),
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.primaries[index % Colors.primaries.length]
                          .shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.category,
                          color: Colors.primaries[index % Colors.primaries.length],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Item ${index + 1}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox(
              'SingleChildScrollView(\n'
                  '  scrollDirection: Axis.horizontal,\n'
                  '  child: Row(\n'
                  '    children: [...],\n'
                  '  ),\n'
                  ')'
          ),
        ],
      ),
    );
  }

  // ==================== 9. Real-World Examples ====================
  Widget _buildRealWorldExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // App Bar Example
          Card(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                  ),
                  const Expanded(
                    child: Text(
                      'My App',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Social Media Post Example
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(
                          'assets/logo.jpg',

                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'MProgrammer01',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '2 hours ago',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Beautiful day at the mountains! 🏔️',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1506905925346-21bda4d32df4',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Actions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildActionButton(Icons.favorite_border, 'Like', 245),
                      _buildActionButton(Icons.comment_outlined, 'Comment', 32),
                      _buildActionButton(Icons.share_outlined, 'Share', 12),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Product Card Example
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1523275335684-37898b6baf30',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Premium Watch',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Luxury timepiece',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber.shade700, size: 18),
                            Icon(Icons.star, color: Colors.amber.shade700, size: 18),
                            Icon(Icons.star, color: Colors.amber.shade700, size: 18),
                            Icon(Icons.star, color: Colors.amber.shade700, size: 18),
                            Icon(Icons.star_half, color: Colors.amber.shade700, size: 18),
                            const SizedBox(width: 4),
                            Text(
                              '(4.5)',
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Text(
                              '\$299',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '\$399',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border),
                        color: Colors.red,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.shopping_cart),
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Navigation Bar Example
          Card(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.home, 'Home', true),
                  _buildNavItem(Icons.explore, 'Explore', false),
                  _buildNavItem(Icons.add_circle, 'Post', false),
                  _buildNavItem(Icons.notifications, 'Alerts', false),
                  _buildNavItem(Icons.person, 'Profile', false),
                ],
              ),
            ),
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

  Widget _buildAlignmentExample(
      String title,
      MainAxisAlignment mainAxis,
      CrossAxisAlignment crossAxis,
      ) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade400, width: 2),
          ),
          child: Row(
            mainAxisAlignment: mainAxis,
            crossAxisAlignment: crossAxis,
            children: [
              Container(
                width: 60,
                height: 50,
                color: Colors.red,
                child: const Center(child: Text('1')),
              ),
              Container(
                width: 60,
                height: 50,
                color: Colors.blue,
                child: const Center(child: Text('2')),
              ),
              Container(
                width: 60,
                height: 50,
                color: Colors.green,
                child: const Center(child: Text('3')),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildCrossAxisExample(
      String title,
      CrossAxisAlignment crossAxis,
      ) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade400, width: 2),
          ),
          child: Row(
            crossAxisAlignment: crossAxis,
            children: [
              Container(
                width: 60,
                height: 40,
                color: Colors.red,
                child: const Center(child: Text('Small')),
              ),
              const SizedBox(width: 8),
              Container(
                width: 60,
                height: 60,
                color: Colors.blue,
                child: const Center(child: Text('Med')),
              ),
              const SizedBox(width: 8),
              Container(
                width: 60,
                height: 80,
                color: Colors.green,
                child: const Center(child: Text('Large')),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label, int count) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: [
            Icon(icon, size: 22),
            const SizedBox(width: 4),
            Text(count.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive ? Colors.blue : Colors.grey,
          size: 28,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.blue : Colors.grey,
            fontSize: 12,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}