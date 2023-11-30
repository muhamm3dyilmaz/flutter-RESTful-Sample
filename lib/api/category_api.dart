import 'package:http/http.dart' as http;

class CategoryApi {
  static Future getCategories() {
    final Uri uri = Uri.parse("http://localhost:3000/categories");
    return http.get(uri);
  }
}
