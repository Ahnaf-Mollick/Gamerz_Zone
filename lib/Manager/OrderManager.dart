class OrderManager {
  // Singleton instance
  static final OrderManager _instance = OrderManager._internal();
  factory OrderManager() => _instance;
  OrderManager._internal();

  // List of all orders
  final List<Map<String, dynamic>> _orders = [];

  // Read-only access to orders
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
      'orderDate':
          DateTime.now().toString().substring(0, 16), // "2025-01-15 14:30"
    });
  }

  // Get a single order by index
  Map<String, dynamic> getOrder(int index) => _orders[index];

  // Remove a specific order
  void removeOrder(int index) {
    if (index >= 0 && index < _orders.length) {
      _orders.removeAt(index);
    }
  }

  // Clear all orders
  void clearAllOrders() {
    _orders.clear();
  }
}
