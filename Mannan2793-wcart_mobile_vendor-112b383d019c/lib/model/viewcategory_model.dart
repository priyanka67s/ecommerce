class ViewCategoryModel {
  String? status;
  String? message;
  List<ViewCategory>? viewCategory;
  String? vendorPermission;
  String? isOwner;

  ViewCategoryModel(
      {this.status,
      this.message,
      this.viewCategory,
      this.vendorPermission,
      this.isOwner});

  ViewCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['view_category'] != null) {
      viewCategory = <ViewCategory>[];
      json['view_category'].forEach((v) {
        viewCategory!.add(ViewCategory.fromJson(v));
      });
    }
    vendorPermission = json['vendor_permission'];
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (viewCategory != null) {
      data['view_category'] =
          viewCategory!.map((v) => v.toJson()).toList();
    }
    data['vendor_permission'] = vendorPermission;
    data['is_owner'] = isOwner;
    return data;
  }
}

class ViewCategory {
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
  int? postAuthor;
  String? postType;
  String? postTitle;
  dynamic postContent;
  dynamic postCss;
  String? postUrlPrefix;
  String? postUrl;
  int? postStatus;
  String? postPassword;
  String? postDate;
  String? postModified;
  int? seoId;
  String? seoTitle;
  String? seoDescription;
  String? seoFeaturedImage;
  String? seoKeyword;
  String? seoIndex;
  String? seoFollow;
  String? metaRobots;
  dynamic canonicalUrl;
  String? seoCreated;
  String? seoModified;
  String? websiteurl;
  String? imageUrl;

  ViewCategory(
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
      this.postAuthor,
      this.postType,
      this.postTitle,
      this.postContent,
      this.postCss,
      this.postUrlPrefix,
      this.postUrl,
      this.postStatus,
      this.postPassword,
      this.postDate,
      this.postModified,
      this.seoId,
      this.seoTitle,
      this.seoDescription,
      this.seoFeaturedImage,
      this.seoKeyword,
      this.seoIndex,
      this.seoFollow,
      this.metaRobots,
      this.canonicalUrl,
      this.seoCreated,
      this.seoModified,
      this.websiteurl,
      this.imageUrl});

  ViewCategory.fromJson(Map<String, dynamic> json) {
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
    postAuthor = json['post_author'];
    postType = json['post_type'];
    postTitle = json['post_title'];
    postContent = json['post_content'];
    postCss = json['post_css'];
    postUrlPrefix = json['post_url_prefix'];
    postUrl = json['post_url'];
    postStatus = json['post_status'];
    postPassword = json['post_password'];
    postDate = json['post_date'];
    postModified = json['post_modified'];
    seoId = json['seo_id'];
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    seoFeaturedImage = json['seo_featured_image'];
    seoKeyword = json['seo_keyword'];
    seoIndex = json['seo_index'];
    seoFollow = json['seo_follow'];
    metaRobots = json['meta_robots'];
    canonicalUrl = json['canonical_url'];
    seoCreated = json['seo_created'];
    seoModified = json['seo_modified'];
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
    data['post_author'] = postAuthor;
    data['post_type'] = postType;
    data['post_title'] = postTitle;
    data['post_content'] = postContent;
    data['post_css'] = postCss;
    data['post_url_prefix'] = postUrlPrefix;
    data['post_url'] = postUrl;
    data['post_status'] = postStatus;
    data['post_password'] = postPassword;
    data['post_date'] = postDate;
    data['post_modified'] = postModified;
    data['seo_id'] = seoId;
    data['seo_title'] = seoTitle;
    data['seo_description'] = seoDescription;
    data['seo_featured_image'] = seoFeaturedImage;
    data['seo_keyword'] = seoKeyword;
    data['seo_index'] = seoIndex;
    data['seo_follow'] = seoFollow;
    data['meta_robots'] = metaRobots;
    data['canonical_url'] = canonicalUrl;
    data['seo_created'] = seoCreated;
    data['seo_modified'] = seoModified;
    data['websiteurl'] = websiteurl;
    data['image_url'] = imageUrl;
    return data;
  }
}
