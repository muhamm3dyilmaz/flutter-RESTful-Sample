import 'package:api_demo/models/product.dart';
import 'package:api_demo/widgets/product_list_row_widget.dart';
import 'package:flutter/material.dart';

class ProductListWidget extends StatefulWidget {
  const ProductListWidget({required this.products, super.key});

  final List<Product> products;

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return buildProductList(context);
  }

  Widget buildProductList(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          widget.products.length,
          (index) {
            return ProductListRowWidget(product: widget.products[index]);
          },
        ),
      ),
    );
  }
}
