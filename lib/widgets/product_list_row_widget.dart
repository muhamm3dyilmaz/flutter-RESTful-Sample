import 'package:api_demo/models/product.dart';
import 'package:flutter/material.dart';

class ProductListRowWidget extends StatelessWidget {
  ProductListRowWidget({required this.product, super.key});

  Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width / 2,
              child: Image.network("https://img.freepik.com/free-vector/illustration-gallery-icon_53876-27002.jpg?size=626&ext=jpg&ga=GA1.1.1826414947.1699920000&semt=ais"),
            ),
            Text(product.productName!),
            Text(product.unitPrice!.toString()),
          ],
        ),
      ),
    );
  }
}
