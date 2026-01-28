class AddInventoryModel {
  String? status;
  String? message;
  String? productid;

  AddInventoryModel({this.status, this.message, this.productid});

  AddInventoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    productid = json['productid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['productid'] = productid;
    return data;
  }
}
