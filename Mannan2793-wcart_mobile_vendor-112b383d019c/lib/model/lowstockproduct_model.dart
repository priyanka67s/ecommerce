class LowStockProductsModel {
  String? status;
  String? message;
  List<ProductData>? productData;

  LowStockProductsModel({this.status, this.message, this.productData});

  LowStockProductsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['product_data'] != null) {
      productData = <ProductData>[];
      json['product_data'].forEach((v) {
        productData!.add(ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (productData != null) {
      data['product_data'] = productData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductData {
  int? productid;
  String? name;
  String? slug;
  int? producttype;
  int? status;
  int? quantity;
  int? lowStockLimit;
  String? sku;

  ProductData(
      {this.productid,
      this.name,
      this.slug,
      this.producttype,
      this.status,
      this.quantity,
      this.lowStockLimit,
      this.sku});

  ProductData.fromJson(Map<String, dynamic> json) {
    productid = json['productid'];
    name = json['name'];
    slug = json['slug'];
    producttype = json['producttype'];
    status = json['status'];
    quantity = json['quantity'];
    lowStockLimit = json['low_stock_limit'];
    sku = json['sku'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productid'] = productid;
    data['name'] = name;
    data['slug'] = slug;
    data['producttype'] = producttype;
    data['status'] = status;
    data['quantity'] = quantity;
    data['low_stock_limit'] = lowStockLimit;
    data['sku'] = sku;
    return data;
  }
}
