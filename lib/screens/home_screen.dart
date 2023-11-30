import 'dart:convert';
import 'package:api_demo/api/category_api.dart';
import 'package:api_demo/api/product_api.dart';
import 'package:api_demo/models/category.dart';
import 'package:api_demo/models/product.dart';
import 'package:api_demo/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> categories = <Category>[];
  List<Widget> categoryWidgets = <Widget>[];
  List<Product> products = <Product>[];

  @override
  void initState() {
    super.initState();
    getCategoriesFromApi();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter RESTful",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryWidgets,
              ),
            ),
            const ProductListWidget(
              products: [],
            ),
          ],
        ),
      ),
    );
  }

  // TODO: Returns null in android emulator!!
  void getCategoriesFromApi() async {
    try {
      final response = await CategoryApi.getCategories();

      if (response.statusCode == 200) {
        setState(() {
          Iterable list = json.decode(response.body);
          categories = list.map((category) => Category.fromJson(category)).toList();
          getCategoryWidgets();
        });
      } else {
        print("API Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception during API call: $e");
    }
  }

  List<Widget> getCategoryWidgets() {
    for (int c = 0; c < categories.length; c++) {
      categoryWidgets.add(getCategoryWidget(categories[c]));
    }
    return categoryWidgets;
  }

  Widget getCategoryWidget(Category category) {
    return TextButton(
      onPressed: () {
        getProductsByCategoryId(category);
      },
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(color: Colors.purple),
        ),
      ),
      child: Text(
        category.categoryName != null ? category.categoryName! : 'NULL',
        style: const TextStyle(color: Colors.blue),
      ),
    );
  }

  void getProductsByCategoryId(Category category) {
    ProductApi.getProductsByCategoryId(category.id!).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        products = list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }

  void getProducts() {
    ProductApi.getProducts().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        products = list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }
}
