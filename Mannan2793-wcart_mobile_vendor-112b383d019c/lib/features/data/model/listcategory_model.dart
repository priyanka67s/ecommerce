class ListCategoryModel {
  String? status;
  String? message;
  List<Category>? category;
  String? vendorPermission;
  String? isOwner;

  ListCategoryModel(
      {this.status,
      this.message,
      this.category,
      this.vendorPermission,
      this.isOwner});

  ListCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
    vendorPermission = json['vendor_permission'];
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    data['vendor_permission'] = vendorPermission;
    data['is_owner'] = isOwner;
    return data;
  }
}

class Category {
  int? termId;
  int? addedby;
  int? addedfrom;
  int? postId;
  String? termName;
  String? termSlug;
  int? parent;
  String? catAttribute;
  String? termUrl;
  String? termFullName;
  int? level;
  dynamic breadcrump;
  String? description;
  String? termImage;
  String? termIcon;
  String? termThumbnail;
  String? termCatalog;
  String? termBanner;
  String? termBannerMobile;
  String? termOfferBanner;
  String? termOfferBannerMobile;
  int? termStatus;
  int? termFeatured;
  int? productCount;
  String? createdtime;
  String? updatedtime;
  String? websiteurl;
  String? imageUrl;

  Category(
      {this.termId,
      this.addedby,
      this.addedfrom,
      this.postId,
      this.termName,
      this.termSlug,
      this.parent,
      this.catAttribute,
      this.termUrl,
      this.termFullName,
      this.level,
      this.breadcrump,
      this.description,
      this.termImage,
      this.termIcon,
      this.termThumbnail,
      this.termCatalog,
      this.termBanner,
      this.termBannerMobile,
      this.termOfferBanner,
      this.termOfferBannerMobile,
      this.termStatus,
      this.termFeatured,
      this.productCount,
      this.createdtime,
      this.updatedtime,
      this.websiteurl,
      this.imageUrl});

  Category.fromJson(Map<String, dynamic> json) {
    termId = json['term_id'];
    addedby = json['addedby'];
    addedfrom = json['addedfrom'];
    postId = json['post_id'];
    termName = json['term_name'];
    termSlug = json['term_slug'];
    parent = json['parent'];
    catAttribute = json['cat_attribute'];
    termUrl = json['term_url'];
    termFullName = json['term_full_name'];
    level = json['level'];
    breadcrump = json['breadcrump'];
    description = json['description'];
    termImage = json['term_image'];
    termIcon = json['term_icon'];
    termThumbnail = json['term_thumbnail'];
    termCatalog = json['term_catalog'];
    termBanner = json['term_banner'];
    termBannerMobile = json['term_banner_mobile'];
    termOfferBanner = json['term_offer_banner'];
    termOfferBannerMobile = json['term_offer_banner_mobile'];
    termStatus = json['term_status'];
    termFeatured = json['term_featured'];
    productCount = json['product_count'];
    createdtime = json['createdtime'];
    updatedtime = json['updatedtime'];
    websiteurl = json['websiteurl'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['term_id'] = termId;
    data['addedby'] = addedby;
    data['addedfrom'] = addedfrom;
    data['post_id'] = postId;
    data['term_name'] = termName;
    data['term_slug'] = termSlug;
    data['parent'] = parent;
    data['cat_attribute'] = catAttribute;
    data['term_url'] = termUrl;
    data['term_full_name'] = termFullName;
    data['level'] = level;
    data['breadcrump'] = breadcrump;
    data['description'] = description;
    data['term_image'] = termImage;
    data['term_icon'] = termIcon;
    data['term_thumbnail'] = termThumbnail;
    data['term_catalog'] = termCatalog;
    data['term_banner'] = termBanner;
    data['term_banner_mobile'] = termBannerMobile;
    data['term_offer_banner'] = termOfferBanner;
    data['term_offer_banner_mobile'] = termOfferBannerMobile;
    data['term_status'] = termStatus;
    data['term_featured'] = termFeatured;
    data['product_count'] = productCount;
    data['createdtime'] = createdtime;
    data['updatedtime'] = updatedtime;
    data['websiteurl'] = websiteurl;
    data['image_url'] = imageUrl;
    return data;
  }
}
