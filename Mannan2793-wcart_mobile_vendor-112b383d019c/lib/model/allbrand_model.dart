class AllBrandModel {
  String? status;
  String? message;
  List<Brands>? brands;
  String? vendorPermission;
  String? isOwner;

  AllBrandModel(
      {this.status,
      this.message,
      this.brands,
      this.vendorPermission,
      this.isOwner});

  AllBrandModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['brands'] != null) {
      brands = <Brands>[];
      json['brands'].forEach((v) {
        brands!.add(Brands.fromJson(v));
      });
    }
    vendorPermission = json['vendor_permission'];
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (brands != null) {
      data['brands'] = brands!.map((v) => v.toJson()).toList();
    }
    data['vendor_permission'] = vendorPermission;
    data['is_owner'] = isOwner;
    return data;
  }
}

class Brands {
  int? brandId;
  int? addedby;
  int? addedfrom;
  String? brandName;
  String? brandSlug;
  String? brandImage;
  int? brandStatus;
  int? brandFeatured;
  int? productCount;
  String? createdtime;
  String? updatedtime;
  String? websiteurl;

  Brands(
      {this.brandId,
      this.addedby,
      this.addedfrom,
      this.brandName,
      this.brandSlug,
      this.brandImage,
      this.brandStatus,
      this.brandFeatured,
      this.productCount,
      this.createdtime,
      this.updatedtime,
      this.websiteurl});

  Brands.fromJson(Map<String, dynamic> json) {
    brandId = json['brand_id'];
    addedby = json['addedby'];
    addedfrom = json['addedfrom'];
    brandName = json['brand_name'];
    brandSlug = json['brand_slug'];
    brandImage = json['brand_image'];
    brandStatus = json['brand_status'];
    brandFeatured = json['brand_featured'];
    productCount = json['product_count'];
    createdtime = json['createdtime'];
    updatedtime = json['updatedtime'];
    websiteurl = json['websiteurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brand_id'] = brandId;
    data['addedby'] = addedby;
    data['addedfrom'] = addedfrom;
    data['brand_name'] = brandName;
    data['brand_slug'] = brandSlug;
    data['brand_image'] = brandImage;
    data['brand_status'] = brandStatus;
    data['brand_featured'] = brandFeatured;
    data['product_count'] = productCount;
    data['createdtime'] = createdtime;
    data['updatedtime'] = updatedtime;
    data['websiteurl'] = websiteurl;
    return data;
  }
}
