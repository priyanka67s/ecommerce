// attribute_management_model.dart

class AttributeManagementResponse {
  final bool? status;
  final String? message;
  final List<Attribute>? attribute;
  final List<AttributeItem>? items;
  final String? vendorPermission;
  final String? isOwner;

  AttributeManagementResponse({
    this.status,
    this.message,
    this.attribute,
    this.items,
    this.vendorPermission,
    this.isOwner,
  });

  factory AttributeManagementResponse.fromJson(Map<String, dynamic> json) {
    return AttributeManagementResponse(
      status: json['status'] == 'true' ? true : false,
      message: json['message'],
      attribute: json['attribute'] != null
          ? List<Attribute>.from(
              json['attribute'].map((x) => Attribute.fromJson(x)))
          : null,
      items: json['items'] != null
          ? List<AttributeItem>.from(
              json['items'].map((x) => AttributeItem.fromJson(x)))
          : null,
      vendorPermission: json['vendor_permission'],
      isOwner: json['is_owner'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status.toString(),
      'message': message,
      'attribute': attribute?.map((x) => x.toJson()).toList(),
      'items': items?.map((x) => x.toJson()).toList(),
      'vendor_permission': vendorPermission,
      'is_owner': isOwner,
    };
  }
}

class Attribute {
  final int? id;
  final int? addedby;
  final int? addedfrom;
  final String? attributename;
  final String? attributeslug;

  Attribute({
    this.id,
    this.addedby,
    this.addedfrom,
    this.attributename,
    this.attributeslug,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      id: json['id'],
      addedby: json['addedby'],
      addedfrom: json['addedfrom'],
      attributename: json['attributename'],
      attributeslug: json['attributeslug'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'addedby': addedby,
      'addedfrom': addedfrom,
      'attributename': attributename,
      'attributeslug': attributeslug,
    };
  }
}

class AttributeItem {
  final int? id;
  final int? addedby;
  final int? addedfrom;
  final String? attrSlug;
  final String? itemname;
  final String? itemslug;

  AttributeItem({
    this.id,
    this.addedby,
    this.addedfrom,
    this.attrSlug,
    this.itemname,
    this.itemslug,
  });

  factory AttributeItem.fromJson(Map<String, dynamic> json) {
    return AttributeItem(
      id: json['id'],
      addedby: json['addedby'],
      addedfrom: json['addedfrom'],
      attrSlug: json['attr_slug'],
      itemname: json['itemname'],
      itemslug: json['itemslug'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'addedby': addedby,
      'addedfrom': addedfrom,
      'attr_slug': attrSlug,
      'itemname': itemname,
      'itemslug': itemslug,
    };
  }
}