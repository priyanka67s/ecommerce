class VendorSalesByCategoryModel {
  String? status;
  String? message;
  List<Ordercount>? ordercount;

  VendorSalesByCategoryModel({this.status, this.message, this.ordercount});

  VendorSalesByCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['ordercount'] != null) {
      ordercount = <Ordercount>[];
      json['ordercount'].forEach((v) {
        ordercount!.add(Ordercount.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (ordercount != null) {
      data['ordercount'] = ordercount!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ordercount {
  int? termId;
  String? termName;
  String? termSlug;
  int? quantitysold;
  num? productsale;
  String? orderDate;

  Ordercount(
      {this.termId,
      this.termName,
      this.termSlug,
      this.quantitysold,
      this.productsale,
      this.orderDate});

  Ordercount.fromJson(Map<String, dynamic> json) {
    termId = json['term_id'];
    termName = json['term_name'];
    termSlug = json['term_slug'];
    quantitysold = json['quantitysold'];
    productsale = json['productsale'];
    orderDate = json['order_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['term_id'] = termId;
    data['term_name'] = termName;
    data['term_slug'] = termSlug;
    data['quantitysold'] = quantitysold;
    data['productsale'] = productsale;
    data['order_date'] = orderDate;
    return data;
  }
}
