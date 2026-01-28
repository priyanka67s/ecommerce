class AllCategoryListModel {
  String? status;
  String? message;
  List<Categories>? categories;
  String? vendorPermission;
  String? isOwner;

  AllCategoryListModel(
      {this.status,
      this.message,
      this.categories,
      this.vendorPermission,
      this.isOwner});

  AllCategoryListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    vendorPermission = json['vendor_permission'];
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['vendor_permission'] = vendorPermission;
    data['is_owner'] = isOwner;
    return data;
  }
}

class Categories {
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
  String? breadcrump;
  String? description;
  String? termImage;
  String? termIcon;
  String? termThumbnail;
  String? termCatalog;
  String? termBanner;
  String? termPromotional;
  String? termBannerMobile;
  String? termOfferBanner;
  String? termOfferBannerMobile;
  int? termStatus;
  int? termFeatured;
  int? productCount;
  String? createdtime;
  String? updatedtime;
  String? websiteurl;

  Categories(
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
      this.termPromotional,
      this.termBannerMobile,
      this.termOfferBanner,
      this.termOfferBannerMobile,
      this.termStatus,
      this.termFeatured,
      this.productCount,
      this.createdtime,
      this.updatedtime,
      this.websiteurl});

  Categories.fromJson(Map<String, dynamic> json) {
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
    termPromotional = json['term_promotional'];
    termBannerMobile = json['term_banner_mobile'];
    termOfferBanner = json['term_offer_banner'];
    termOfferBannerMobile = json['term_offer_banner_mobile'];
    termStatus = json['term_status'];
    termFeatured = json['term_featured'];
    productCount = json['product_count'];
    createdtime = json['createdtime'];
    updatedtime = json['updatedtime'];
    websiteurl = json['websiteurl'];
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
    data['term_promotional'] = termPromotional;
    data['term_banner_mobile'] = termBannerMobile;
    data['term_offer_banner'] = termOfferBanner;
    data['term_offer_banner_mobile'] = termOfferBannerMobile;
    data['term_status'] = termStatus;
    data['term_featured'] = termFeatured;
    data['product_count'] = productCount;
    data['createdtime'] = createdtime;
    data['updatedtime'] = updatedtime;
    data['websiteurl'] = websiteurl;
    return data;
  }
}
