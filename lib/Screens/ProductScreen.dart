import 'package:flutter/material.dart';
import 'package:gamerz_zone/Screens/ProductBuyScreen.dart';

class ProductScreen extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductScreen({super.key, required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  //int _selectedColorIndex = 0;
  int _quantity = 1;
  //int _selectedImageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTopBar(context),
                    _buildImageSection(),
                    _buildDetailsSection(),
                  ],
                ),
              ),
            ),
            _buildBuyNowBar(widget.product),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios,
                size: 20, color: Color(0xFF1A1A1A)),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 320,
      color: const Color(0xFFF5F5F5),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Image.asset(
          widget.product['image'],
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildDetailsSection() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.product['name']
                .replaceAll('\n', ' ')
                .toString()
                .toUpperCase(),
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.product['description'],
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF888888),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          _buildQuantitySelector(),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Quantity',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _quantity > 1
                      ? _buildQtyButton(
                          icon: Icons.remove,
                          onTap: () {
                            if (_quantity > 1) setState(() => _quantity--);
                          },
                        )
                      : Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                color: Colors.black.withValues(alpha: 0.08),
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Icon(Icons.remove,
                              size: 16, color: Color(0xFFCCCCCC)),
                        ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '$_quantity',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                  ),
                  _buildQtyButton(
                    icon: Icons.add,
                    onTap: () => setState(() => _quantity++),
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(
          '৳ ${(int.parse(widget.product['price'].replaceAll(RegExp(r'[^\d]'), '')) * _quantity)}',
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1A1A1A),
          ),
        ),
      ],
    );
  }

  Widget _buildQtyButton(
      {required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: Colors.black.withValues(alpha: 0.08),
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, size: 16, color: const Color(0xFF1A1A1A)),
      ),
    );
  }

  Widget _buildBuyNowBar(Map<String, dynamic> product) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      color: Colors.white,
      child: SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductBuyScreen(
                        product: product, quantity: _quantity)));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE8445A),
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text(
            'Buy Now',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}
