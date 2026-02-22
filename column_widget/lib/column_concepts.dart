import 'package:flutter/material.dart';

class ColumnConcepts extends StatelessWidget {
  const ColumnConcepts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSectionTitle('1. Basic Column'),
            _buildBasicColumnExamples(),

            _buildSectionTitle('2. MainAxisAlignment'),
            _buildMainAxisAlignmentExamples(),

            _buildSectionTitle('3. CrossAxisAlignment'),
            _buildCrossAxisAlignmentExamples(),

            _buildSectionTitle('4. MainAxisSize'),
            _buildMainAxisSizeExamples(),

            _buildSectionTitle('5. Spacing with SizedBox'),
            _buildSpacingExamples(),

            _buildSectionTitle('6. Column with Different Widgets'),
            _buildMixedWidgetsExamples(),

            _buildSectionTitle('7. Nested Columns'),
            _buildNestedColumnsExamples(),

            _buildSectionTitle('8. Column with Scroll'),
            _buildScrollableColumnExamples(),

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
        "Column Widget Concepts",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.indigo,
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
          colors: [Colors.indigo.shade100, Colors.indigo.shade50],
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.indigo.shade700,
        ),
      ),
    );
  }

  // ==================== 1. Basic Column ====================
  Widget _buildBasicColumnExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,//for take full width of screen
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.red,
                  child: const Center(
                    child: Text('Item 1', style: TextStyle(color: Colors.white)),
                  ),
                ),
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.blue,
                  child: const Center(
                    child: Text('Item 2', style: TextStyle(color: Colors.white)),
                  ),
                ),
                Container(
                  width: 100,
                  height: 50,
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
              "Column(\n"
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
    return Column(
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
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade400, width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 40,
                  color: Colors.red,
                  child: const Center(
                    child: Text('Stretched', style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 40,
                  color: Colors.blue,
                  child: const Center(
                    child: Text('Stretched', style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 40,
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
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,

              children: [
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.blue,
                  child: const Center(child: Text('Item 1')),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.green,
                  child: const Center(child: Text('Item 2')),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox('mainAxisSize: MainAxisSize.max'),

          const SizedBox(height: 16),

          // MainAxisSize.min
          const Text(
            'MainAxisSize.min',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.blue,
                  child: const Center(child: Text('Item 1')),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.green,
                  child: const Center(child: Text('Item 2')),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox('mainAxisSize: MainAxisSize.min'),
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
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 50,
                  color: Colors.red,
                  child: const Center(child: Text('Item 1')),
                ),
                Container(
                  width: 150,
                  height: 50,
                  color: Colors.blue,
                  child: const Center(child: Text('Item 2')),
                ),
                Container(
                  width: 150,
                  height: 50,
                  color: Colors.green,
                  child: const Center(child: Text('Item 3')),
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
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 50,
                  color: Colors.red,
                  child: const Center(child: Text('Item 1')),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 150,
                  height: 50,
                  color: Colors.blue,
                  child: const Center(child: Text('Item 2')),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 150,
                  height: 50,
                  color: Colors.green,
                  child: const Center(child: Text('Item 3')),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox('SizedBox(height: 16)'),

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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Container(
                    width: 150,
                    height: 50,
                    color: Colors.red,
                    child: const Center(child: Text('Item 1')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Container(
                    width: 150,
                    height: 50,
                    color: Colors.blue,
                    child: const Center(child: Text('Item 2')),
                  ),
                ),
                Container(
                  width: 150,
                  height: 50,
                  color: Colors.green,
                  child: const Center(child: Text('Item 3')),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox('Padding(padding: EdgeInsets.only(bottom: 12))'),
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
            child: Column(
              children: [
                // Icon
                const Icon(
                  Icons.star,
                  size: 50,
                  color: Colors.amber,
                ),
                const SizedBox(height: 8),

                // Text
                const Text(
                  'Mixed Widgets Example',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1506905925346-21bda4d32df4',
                    width: 200,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),

                // Button
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                  label: const Text('Like'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),

                // Container
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.purple, Colors.blue],
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Center(
                    child: Text(
                      'Gradient Container',
                      style: TextStyle(color: Colors.white),
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

  // ==================== 7. Nested Columns ====================
  Widget _buildNestedColumnsExamples() {
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
                const Text(
                  'Outer Column',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // First nested column
                    Container(
                      width: 100,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue),
                      ),
                      child: Column(
                        children: [
                          const Icon(Icons.home, color: Colors.blue),
                          const SizedBox(height: 4),
                          const Text('Home'),
                          const SizedBox(height: 4),
                          Container(
                            width: 60,
                            height: 30,
                            color: Colors.blue,
                            child: const Center(
                              child: Text(
                                'Tab 1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Second nested column
                    Container(
                      width: 100,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.green),
                      ),
                      child: Column(
                        children: [
                          const Icon(Icons.favorite, color: Colors.green),
                          const SizedBox(height: 4),
                          const Text('Favorite'),
                          const SizedBox(height: 4),
                          Container(
                            width: 60,
                            height: 30,
                            color: Colors.green,
                            child: const Center(
                              child: Text(
                                'Tab 2',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Third nested column
                    Container(
                      width: 100,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.orange),
                      ),
                      child: Column(
                        children: [
                          const Icon(Icons.settings, color: Colors.orange),
                          const SizedBox(height: 4),
                          const Text('Settings'),
                          const SizedBox(height: 4),
                          Container(
                            width: 60,
                            height: 30,
                            color: Colors.orange,
                            child: const Center(
                              child: Text(
                                'Tab 3',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
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

  // ==================== 8. Scrollable Column ====================
  Widget _buildScrollableColumnExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Column inside SingleChildScrollView',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.purple, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  10,
                      (index) => Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.primaries[index % Colors.primaries.length]
                          .shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.list,
                          color: Colors.primaries[index % Colors.primaries.length],
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Scrollable Item ${index + 1}',
                          style: const TextStyle(fontSize: 16),
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
                  '  child: Column(\n'
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
          // Profile Card Example
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/logo.jpg',

                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'MProgrammer01',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Full-Stack Developer',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatColumn('Posts', '245'),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey.shade300,
                      ),
                      _buildStatColumn('Followers', '12.5K'),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey.shade300,
                      ),
                      _buildStatColumn('Following', '892'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Follow'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text('Message'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Login Form Example
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sign in to continue',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: const Icon(Icons.visibility_off),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Forgot Password?'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Todo List Example
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'My Tasks',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_circle, size: 30),
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildTodoItem('Complete project documentation', true),
                  _buildTodoItem('Review pull requests', false),
                  _buildTodoItem('Update design system', true),
                  _buildTodoItem('Team meeting at 3 PM', false),
                  _buildTodoItem('Send weekly report', false),
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
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade400, width: 2),
          ),
          child: Column(
            mainAxisAlignment: mainAxis,
            crossAxisAlignment: crossAxis,
            children: [
              Container(
                width: 100,
                height: 40,
                color: Colors.red,
                child: const Center(child: Text('1')),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.blue,
                child: const Center(child: Text('2')),
              ),
              Container(
                width: 100,
                height: 40,
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
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade400, width: 2),
          ),
          child: Column(
            crossAxisAlignment: crossAxis,
            children: [
              Container(
                width: 80,
                height: 40,
                color: Colors.red,
                child: const Center(child: Text('Small')),
              ),
              const SizedBox(height: 8),
              Container(
                width: 120,
                height: 40,
                color: Colors.blue,
                child: const Center(child: Text('Medium')),
              ),
              const SizedBox(height: 8),
              Container(
                width: 160,
                height: 40,
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

  Widget _buildStatColumn(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildTodoItem(String title, bool completed) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: completed ? Colors.green.shade50 : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: completed ? Colors.green.shade200 : Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          Icon(
            completed ? Icons.check_circle : Icons.radio_button_unchecked,
            color: completed ? Colors.green : Colors.grey,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                decoration: completed ? TextDecoration.lineThrough : null,
                color: completed ? Colors.grey : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}