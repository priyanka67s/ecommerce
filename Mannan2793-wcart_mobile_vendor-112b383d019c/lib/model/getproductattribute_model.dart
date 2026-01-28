class GetProductAttributeModel {
  String? status;
  String? message;
  List<Attributes>? attributes;
  String? vendorPermission;
  String? isOwner;

  GetProductAttributeModel(
      {this.status,
      this.message,
      this.attributes,
      this.vendorPermission,
      this.isOwner});

  GetProductAttributeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(Attributes.fromJson(v));
      });
    }
    vendorPermission = json['vendor_permission'];
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (attributes != null) {
      data['attributes'] = attributes!.map((v) => v.toJson()).toList();
    }
    data['vendor_permission'] = vendorPermission;
    data['is_owner'] = isOwner;
    return data;
  }
}

class Attributes {
  int? id;
  int? addedby;
  int? addedfrom;
  String? attrSlug;
  String? itemname;
  String? itemslug;

  Attributes(
      {this.id,
      this.addedby,
      this.addedfrom,
      this.attrSlug,
      this.itemname,
      this.itemslug});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addedby = json['addedby'];
    addedfrom = json['addedfrom'];
    attrSlug = json['attr_slug'];
    itemname = json['itemname'];
    itemslug = json['itemslug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['addedby'] = addedby;
    data['addedfrom'] = addedfrom;
    data['attr_slug'] = attrSlug;
    data['itemname'] = itemname;
    data['itemslug'] = itemslug;
    return data;
  }
}
