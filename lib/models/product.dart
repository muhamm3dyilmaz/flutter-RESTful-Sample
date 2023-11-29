class Product {
  int? id;
  int? categoryId;
  String? productName;
  String? quantityPerUnit;
  String? unitPrice;
  int? unitsInStock;

  Product({this.id, this.categoryId, this.productName, this.quantityPerUnit, this.unitPrice, this.unitsInStock});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['categoryId'];
    productName = json['productName'];
    quantityPerUnit = json['quantityPerUnit'];
    unitPrice = json['unitPrice'];
    unitsInStock = json['unitsInStock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['categoryId'] = categoryId;
    data['productName'] = productName;
    data['quantityPerUnit'] = quantityPerUnit;
    data['unitPrice'] = unitPrice;
    data['unitsInStock'] = unitsInStock;
    return data;
  }
}
