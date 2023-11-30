import 'package:http/http.dart' as http;

class ProductApi {
  static Future getProducts() {
    final Uri uri = Uri.parse("http://localhost:3000/products");
    return http.get(uri);
  }

  static Future getProductsByCategoryId(int categoryId) {
    final Uri uri = Uri.parse("http://localhost:3000/products?categoryId=$categoryId");
    return http.get(uri);
  }
}
