class Category {
  int? id;
  String? categoryName;
  String? seoUrl;

  Category({this.id, this.categoryName, this.seoUrl});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'].toString();
    seoUrl = json['seoUrl'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['categoryName'] = categoryName;
    data['seoUrl'] = seoUrl;
    return data;
  }
}
