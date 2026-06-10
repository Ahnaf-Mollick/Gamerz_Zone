import 'package:flutter/material.dart';
import 'package:gamerz_zone/Screens/ProductScreen.dart';

import 'ProductBuyScreen.dart';
import 'SearchScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.initialNavIndex = 0});
  final int initialNavIndex;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategoryIndex = 0;
  int selectedNavIndex = 0;
  int selectedCategoryIndex = 0;
  @override
  void initState() {
    super.initState();
    selectedNavIndex = widget.initialNavIndex; // ✅ set from param
  }

  final List<String> _categories = ['All', 'PS4', 'Xbox', 'PS5'];

  final List<Map<String, dynamic>> _products = [
    {
      'name': 'God of War Themed\nDualSense Controller',
      'price': '৳ 20,000',
      'image': 'assets/images/featured_controller.jpg',
      'category': 'PS5',
      'description':
          'Immerse yourself in the world of Kratos with the God of War Themed DualSense Controller. This limited-edition controller features a striking design inspired by the iconic God of War series, with intricate detailing and a bold color scheme. Experience enhanced gameplay with the DualSense technology, including adaptive triggers and haptic feedback, all while showcasing your love for the legendary franchise. Whether you\'re battling gods or exploring new realms, this controller is the perfect companion for your PS5 gaming adventures.',
      'primaryColor': const Color(0xFFE8445A),
    },
    {
      'name': 'Army Mode\nPS5 Stick',
      'price': '৳ 15,000',
      'image': 'assets/images/army_controller.jpg',
      'category': 'PS5',
      'description':
          'Experience the thrill of battle with the Army Mode PS5 Stick. Designed for precision and durability, this controller features customizable buttons and enhanced grip, making it perfect for intense gaming sessions. Whether you\'re storming the battlefield or strategizing with your squad, the Army Mode PS5 Stick delivers unparalleled performance and comfort.',
      'primaryColor': const Color(0xFF1A1A1A),
    },
    {
      'name': 'Kids Combo\nPS5 Stick',
      'price': '৳ 12,000',
      'image': 'assets/images/kids_controller.jpg',
      'category': 'PS5',
      'description':
          'The Kids Combo PS5 Stick is the perfect gaming accessory for young gamers. With its vibrant colors and ergonomic design, this controller is tailored for smaller hands, ensuring a comfortable grip during play. It features responsive buttons and a durable build, making it ideal for hours of fun. Whether your child is exploring new worlds or competing with friends, the Kids Combo PS5 Stick provides an enjoyable and immersive gaming experience.',
      'primaryColor': const Color(0xFFdf3331),
    },
    {
      'name': 'Xbox Elite\nSeries 2',
      'price': '৳ 25,000',
      'image': 'assets/images/xbox_elite.jpg',
      'category': 'Xbox',
      'description':
          'The Xbox Elite Series 2 is the ultimate gaming controller for Xbox enthusiasts. With its premium build quality and customizable features, this controller offers unparalleled performance and comfort. It includes adjustable tension thumbsticks, interchangeable paddles, and a wrap-around rubberized grip for enhanced control. Whether you\'re a competitive gamer or a casual player, the Xbox Elite Series 2 delivers a superior gaming experience on Xbox consoles.',
      'primaryColor': const Color(0xFF1A1A1A),
    },
    {
      'name': 'PS4 DualShock\nController',
      'price': '৳ 10,000',
      'image': 'assets/images/ps4_controller.jpg',
      'category': 'PS4',
      'description':
          'The PS4 DualShock Controller is the standard controller for PlayStation 4 gaming. It features a comfortable design with responsive buttons and a built-in touchpad for enhanced gameplay. The controller also includes a built-in speaker and a headphone jack for immersive audio experiences. Whether you\'re playing action-packed games or exploring open worlds, the PS4 DualShock Controller provides a reliable and enjoyable gaming experience.',
      'primaryColor': const Color(0xFF123086),
    }
  ];
  bottomNavigator(int index) {
    if (index == 0) {
      setState(() {
        selectedNavIndex = index;
      });
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchScreen(
                  products: _products,
                )),
      );
      setState(() {
        selectedNavIndex = index;
      });
    } else if (index == 2) {
      setState(() {
        selectedNavIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    _buildHeader(),
                    const SizedBox(height: 20),
                    _buildFeaturedBanner(),
                    const SizedBox(height: 24),
                    _buildCategoryTabs(),
                    const SizedBox(height: 16),
                    _buildProductGrid(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            _buildBottomNavBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Text(
      'Enjoy your\nGame with Speed',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w800,
        color: Color(0xFF1A1A1A),
        height: 1.2,
      ),
    );
  }

  Widget _buildFeaturedBanner() {
    return Stack(
      children: [
        Positioned(
            child: Container(
          height: 160,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
        )),
        Positioned(
            left: 0,
            top: 0,
            child: Container(
              height: 160,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(30),
              ),
            )),
        Positioned(
          left: 20,
          top: 20,
          bottom: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'God of War Themed\nDualSense Controller',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '৳ 20,000',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const ProductBuyScreen())); // Handle buy now action
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Buy Now',
                    style: TextStyle(
                      color: Color(0xFF1A1A1A),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: -20,
          top: 0,
          bottom: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: Transform.rotate(
              angle: 0.5,
              child: Image.asset(
                'assets/images/featured_controller.jpg',
                fit: BoxFit.fill,
                width: 180,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(_categories.length, (index) {
          final bool isSelected = _selectedCategoryIndex == index;
          return GestureDetector(
            onTap: () => {
              setState(() => _selectedCategoryIndex = index),
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color:
                    isSelected ? const Color(0xFF1A1A1A) : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _categories[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : const Color(0xFF888888),
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildProductGrid() {
    final filteredProducts = _selectedCategoryIndex == 0
        ? _products
        : _products.where((product) {
            return product['category'] == _categories[_selectedCategoryIndex];
          }).toList();
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        return _buildProductCard(filteredProducts[
            index]); // Skip products that don't match the selected category
      },
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductScreen(
                    product: product,
                  )),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Image.asset(
                  product['image'],
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'],
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A1A),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product['price'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    final icons = [
      Icons.home_outlined,
      Icons.search,
      Icons.menu_book,
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(icons.length, (index) {
          final bool isCenter = index == 1;
          final bool isSelected = selectedNavIndex == index;

          return GestureDetector(
            onTap: () => bottomNavigator(index),
            child: isCenter
                ? Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE8445A),
                      shape: BoxShape.circle,
                    ),
                    child:
                        const Icon(Icons.search, color: Colors.white, size: 22),
                  )
                : Icon(
                    icons[index],
                    size: 24,
                    color: isSelected
                        ? const Color(0xFF1A1A1A)
                        : const Color(0xFFBBBBBB),
                  ),
          );
        }),
      ),
    );
  }
}
