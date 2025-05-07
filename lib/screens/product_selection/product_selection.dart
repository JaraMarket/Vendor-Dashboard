import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:jara_market/screens/product_selection/controller/product_selection_controller.dart';
import '../../widgets/status_bar.dart';
import '../../widgets/back_button.dart';

ProductSelectionController controller = Get.put(ProductSelectionController());

class ProductSelectionScreen extends StatefulWidget {
  const ProductSelectionScreen({super.key});

  @override
  State<ProductSelectionScreen> createState() => _ProductSelectionScreenState();
}

class _ProductSelectionScreenState extends State<ProductSelectionScreen> {
  final List<String> _products = [
    'Spices',
    'Protein',
    'Vegetables',
    'Cooking Oil',
    'Grains',
    'Tuber',
    'Fruit',
    'Drinks',
    'Beverage',
  ];

  final List<String> _selectedProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StatusBar(),
              const SizedBox(height: 16),
              Row(
                children: [
                  const CustomBackButton(),
                  const SizedBox(width: 16),
                  const Text(
                    'What product do you sell',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Lorem ipsum dolor sit amet consectetur. In met conse',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: _products.length + 1, // +1 for "Others" option
                  itemBuilder: (context, index) {
                    if (index < _products.length) {
                      final product = _products[index];
                      final isSelected = _selectedProducts.contains(product);

                      return _buildProductItem(product, isSelected, () {
                        setState(() {
                          if (isSelected) {
                            _selectedProducts.remove(product);
                          } else {
                            _selectedProducts.add(product);
                          }
                        });
                      });
                    } else {
                      // "Others" option
                      return _buildOthersItem();
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed:
                    _selectedProducts.isNotEmpty
                        ? () {
                          Navigator.pushNamed(context, '/shop-size');
                        }
                        : null,
                child: const Text('Continue'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductItem(
    String product,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color:
              isSelected
                  ? const Color(0xFFFF9800).withAlpha(26) // Changed from withOpacity(0.1)
                  : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFFFF9800) : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color:
                    isSelected ? const Color(0xFFFF9800) : Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _getIconForProduct(product),
                color: isSelected ? Colors.white : Colors.grey.shade600,
                size: 24,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              product,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? const Color(0xFFFF9800) : Colors.black,
              ),
            ),
            if (isSelected)
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Icon(Icons.check_circle, color: Color(0xFFFF9800)),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildOthersItem() {
    return InkWell(
      onTap: () {
        // Show dialog to add custom product
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Color(0xFFFF9800), size: 24),
            ),
            const SizedBox(height: 12),
            const Text(
              'Others',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForProduct(String product) {
    switch (product) {
      case 'Spices':
        return Icons.spa;
      case 'Protein':
        return Icons.egg;
      case 'Vegetables':
        return Icons.eco;
      case 'Cooking Oil':
        return Icons.water_drop;
      case 'Grains':
        return Icons.grain;
      case 'Tuber':
        return Icons.agriculture;
      case 'Fruit':
        return Icons.apple;
      case 'Drinks':
        return Icons.local_drink;
      case 'Beverage':
        return Icons.coffee;
      default:
        return Icons.category;
    }
  }
}
