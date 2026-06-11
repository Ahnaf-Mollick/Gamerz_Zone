import 'dart:ui';

class OrderManager {
  // Singleton instance
  static final OrderManager _instance = OrderManager._internal();
  factory OrderManager() => _instance;
  OrderManager._internal();

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

  // ✅ Public getter for products
  List<Map<String, dynamic>> get products => List.unmodifiable(_products);

  // List of all orders
  final List<Map<String, dynamic>> _orders = [];

  List<Map<String, dynamic>> get orders => List.unmodifiable(_orders);

  bool get hasOrders => _orders.isNotEmpty;

  int get orderCount => _orders.length;

  void saveOrder({
    required Map<String, dynamic> buyData,
    required Map<String, dynamic> product,
  }) {
    _orders.add({
      'buyData': buyData,
      'product': product,
      'orderId': DateTime.now().millisecondsSinceEpoch.toString(),
      'orderDate': DateTime.now().toString().substring(0, 16),
    });
  }

  Map<String, dynamic> getOrder(int index) => _orders[index];

  void removeOrder(int index) {
    if (index >= 0 && index < _orders.length) {
      _orders.removeAt(index);
    }
  }

  void clearAllOrders() {
    _orders.clear();
  }
}
