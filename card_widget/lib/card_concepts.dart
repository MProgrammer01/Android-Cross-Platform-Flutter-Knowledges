import 'package:flutter/material.dart';

class CardConcepts extends StatelessWidget {
  const CardConcepts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSectionTitle('1. Basic Card'),
            _buildBasicCardExamples(),

            _buildSectionTitle('2. Card with Elevation & Shadow'),
            _buildElevationExamples(),

            _buildSectionTitle('3. Card Shape & Border'),
            _buildShapeExamples(),

            _buildSectionTitle('4. Card Colors & Themes'),
            _buildColorExamples(),

            _buildSectionTitle('5. Card with Margin & Padding'),
            _buildMarginPaddingExamples(),

            _buildSectionTitle('6. Card with Image'),
            _buildImageCardExamples(),

            _buildSectionTitle('7. Card with ListTile'),
            _buildListTileCardExamples(),

            _buildSectionTitle('8. Interactive Cards (InkWell)'),
            _buildInteractiveCardExamples(),

            _buildSectionTitle('9. Complex Card Designs'),
            _buildComplexCardExamples(),

            _buildSectionTitle('10. Card Variations'),
            _buildCardVariations(),

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
        "Card Concepts",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.teal,
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
          colors: [Colors.teal.shade100, Colors.teal.shade50],
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.teal.shade700,
        ),
      ),
    );
  }

  // ==================== 1. Basic Card ====================
  Widget _buildBasicCardExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Simple Card
          Card(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Simple Card',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 8),
          _buildCodeBox("Card(child: Container(...))"),

          const SizedBox(height: 16),

          // Card with more content
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Card Title',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This is a basic card with title and description. Cards are used to group related information.',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 2. Elevation & Shadow ====================
  Widget _buildElevationExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Elevation 0
          Card(
            elevation: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: const Text('elevation: 0'),
            ),
          ),
          const SizedBox(height: 8),

          // Elevation 2
          Card(
            elevation: 2,
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: const Text('elevation: 2 (default)'),
            ),
          ),
          const SizedBox(height: 8),

          // Elevation 5
          Card(
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: const Text('elevation: 5'),
            ),
          ),
          const SizedBox(height: 8),

          // Elevation 10
          Card(
            elevation: 10,
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: const Text('elevation: 10'),
            ),
          ),
          const SizedBox(height: 8),

          // Elevation 20
          Card(
            elevation: 20,
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: const Text('elevation: 20'),
            ),
          ),
          const SizedBox(height: 8),

          // Custom Shadow Color
          Card(
            elevation: 10,
            shadowColor: Colors.red,
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: const Text('elevation: 10, shadowColor: Red'),
            ),
          ),
          const SizedBox(height: 8),

          Card(
            elevation: 10,
            shadowColor: Colors.blue,
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: const Text('elevation: 10, shadowColor: Blue'),
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 3. Shape & Border ====================
  Widget _buildShapeExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Default rounded corners
          Card(
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: const Text('Default Card Shape'),
            ),
          ),
          const SizedBox(height: 8),

          // Custom border radius
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: const Text('BorderRadius: 20'),
            ),
          ),
          const SizedBox(height: 8),

          // Sharp corners
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: const Text('Sharp Corners (BorderRadius: 0)'),
            ),
          ),
          const SizedBox(height: 8),

          // Card with border
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: Colors.blue, width: 2),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: const Text('Card with Blue Border'),
            ),
          ),
          const SizedBox(height: 8),

          // Different border radius corners
          Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              side: BorderSide(color: Colors.purple, width: 3),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: const Text('Custom Corner Radius'),
            ),
          ),
          const SizedBox(height: 8),

          // Stadium shape
          Card(
            shape: const StadiumBorder(
              side: BorderSide(color: Colors.green, width: 2),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: const Text('Stadium Shape'),
            ),
          ),
          const SizedBox(height: 8),

          // Circle shape
          Card(
            shape: const CircleBorder(
              side: BorderSide(color: Colors.orange, width: 3),
            ),
            child: Container(
              padding: const EdgeInsets.all(40),
              child: const Text('Circle'),
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 4. Colors & Themes ====================
  Widget _buildColorExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Default color
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Default Card Color'),
            ),
          ),
          const SizedBox(height: 8),

          // Blue card
          Card(
            color: Colors.blue.shade100,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Blue Card'),
            ),
          ),
          const SizedBox(height: 8),

          // Green card
          Card(
            color: Colors.green.shade100,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Green Card'),
            ),
          ),
          const SizedBox(height: 8),

          // Orange card
          Card(
            color: Colors.orange.shade100,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Orange Card'),
            ),
          ),
          const SizedBox(height: 8),

          // Purple card
          Card(
            color: Colors.purple.shade100,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Purple Card'),
            ),
          ),
          const SizedBox(height: 8),

          // Gradient card (using Container inside)
          Card(
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: const Text(
                'Gradient Card',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Dark themed card
          Card(
            color: Colors.grey.shade800,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Dark Themed Card',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 5. Margin & Padding ====================
  Widget _buildMarginPaddingExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Card with margin
          Card(
            margin: const EdgeInsets.all(20),
            color: Colors.blue.shade50,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('margin: EdgeInsets.all(20)'),
            ),
          ),

          // Card with symmetric margin
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            color: Colors.green.shade50,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('margin: symmetric(h:40, v:10)'),
            ),
          ),

          // Card with no margin
          Card(
            margin: EdgeInsets.zero,
            color: Colors.orange.shade50,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('margin: EdgeInsets.zero'),
            ),
          ),
          const SizedBox(height: 16),

          // Different padding examples
          Card(
            child: Container(
              padding: const EdgeInsets.all(30),
              color: Colors.purple.shade50,
              child: const Text('Large Padding (30)'),
            ),
          ),
          const SizedBox(height: 8),

          Card(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              color: Colors.pink.shade50,
              child: const Text('Padding: H:40, V:8'),
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 6. Card with Image ====================
  Widget _buildImageCardExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Card with top image
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1506905925346-21bda4d32df4',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mountain View',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Beautiful mountain landscape with clear sky.',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Card with side image
          Card(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1469474968028-56623f02e42e',
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nature Card',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Card with side image layout design.',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Card with background image
          Card(
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1447752875215-b2761acb3c5d',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Overlay Card',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Image with gradient overlay',
                        style: TextStyle(color: Colors.white),
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

  // ==================== 7. Card with ListTile ====================
  Widget _buildListTileCardExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Simple ListTile card
          Card(
            child: ListTile(
              leading: const Icon(Icons.person, size: 40),
              title: const Text('John Doe'),
              subtitle: const Text('Software Developer'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 8),

          // ListTile with avatar
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
                ),
              ),
              title: const Text('Jane Smith'),
              subtitle: const Text('jane@example.com'),
              trailing: IconButton(
                icon: const Icon(Icons.message),
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(height: 8),

          // ListTile with three lines
          const Card(
            child: ListTile(
              leading: Icon(Icons.notifications, size: 40, color: Colors.orange),
              title: Text('Notification Title'),
              subtitle: Text(
                'This is a longer description that spans multiple lines to show how ListTile handles longer text content.',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Text('2m ago'),
              isThreeLine: true,
            ),
          ),
          const SizedBox(height: 8),

          // ListTile with switch
          Card(
            child: SwitchListTile(
              secondary: const Icon(Icons.wifi),
              title: const Text('Wi-Fi'),
              subtitle: const Text('Connected to Network'),
              value: true,
              onChanged: (bool value) {},
            ),
          ),
          const SizedBox(height: 8),

          // ListTile with checkbox
          Card(
            child: CheckboxListTile(
              secondary: const Icon(Icons.star),
              title: const Text('Mark as Favorite'),
              subtitle: const Text('Add to favorites list'),
              value: true,
              onChanged: (bool? value) {},
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 8. Interactive Cards ====================
  Widget _buildInteractiveCardExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Card with InkWell
          Card(
            child: InkWell(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.touch_app, size: 40, color: Colors.blue),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tap Me!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text('Card with InkWell ripple effect'),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Card with gesture detector
          Card(
            child: InkWell(
              onTap: () {},
              onLongPress: () {},
              child: Container(
                padding: const EdgeInsets.all(16),
                child: const Column(
                  children: [
                    Icon(Icons.touch_app, size: 50, color: Colors.purple),
                    SizedBox(height: 8),
                    Text(
                      'Tap or Long Press',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Selectable card
          Card(
            color: Colors.green.shade50,
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(16),
                child: const Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 30),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Selectable Card',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 9. Complex Card Designs ====================
  Widget _buildComplexCardExamples() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Product card
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.network(
                      'https://images.unsplash.com/photo-1523275335684-37898b6baf30',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'SALE',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Premium Product',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber.shade700, size: 20),
                          Icon(Icons.star, color: Colors.amber.shade700, size: 20),
                          Icon(Icons.star, color: Colors.amber.shade700, size: 20),
                          Icon(Icons.star, color: Colors.amber.shade700, size: 20),
                          Icon(Icons.star_half, color: Colors.amber.shade700, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            '(4.5)',
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          Text(
                            '\$99.99',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '\$149.99',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_cart),
                          label: const Text('Add to Cart'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Profile card
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
                      _buildStatColumn('Posts', '142'),
                      _buildStatColumn('Followers', '2.5K'),
                      _buildStatColumn('Following', '890'),
                    ],
                  ),
                  const SizedBox(height: 16),
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

          // Weather card
          Card(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.lightBlueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New York',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Monday, 15 Feb',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.wb_sunny,
                        color: Colors.yellow,
                        size: 50,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '24°C',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Sunny',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildWeatherInfo(Icons.water_drop, '45%', 'Humidity'),
                      _buildWeatherInfo(Icons.air, '12 km/h', 'Wind'),
                      _buildWeatherInfo(Icons.visibility, '10 km', 'Visibility'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 10. Card Variations ====================
  Widget _buildCardVariations() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Horizontal card list
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildSmallCard('Card 1', Colors.blue),
                _buildSmallCard('Card 2', Colors.green),
                _buildSmallCard('Card 3', Colors.orange),
                _buildSmallCard('Card 4', Colors.purple),
                _buildSmallCard('Card 5', Colors.red),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Grid of cards
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            children: [
              _buildGridCard(Icons.home, 'Home', Colors.blue),
              _buildGridCard(Icons.favorite, 'Favorites', Colors.red),
              _buildGridCard(Icons.settings, 'Settings', Colors.grey),
              _buildGridCard(Icons.person, 'Profile', Colors.green),
            ],
          ),
          const SizedBox(height: 16),

          // Expandable card
          Card(
            child: ExpansionTile(
              leading: const Icon(Icons.info, color: Colors.blue),
              title: const Text('Expandable Card'),
              subtitle: const Text('Tap to expand'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'This is the expanded content of the card. You can put any widget here.',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ),
              ],
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

  Widget _buildWeatherInfo(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildSmallCard(String title, Color color) {
    return Card(
      color: color.withOpacity(0.2),
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridCard(IconData icon, String title, Color color) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}