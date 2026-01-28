class EditTagsModel {
  String? status;
  String? message;
  List<ViewTag>? viewTag;
  String? vendorPermission;
  String? isOwner;

  EditTagsModel(
      {this.status,
      this.message,
      this.viewTag,
      this.vendorPermission,
      this.isOwner});

  EditTagsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['view_tag'] != null) {
      viewTag = <ViewTag>[];
      json['view_tag'].forEach((v) {
        viewTag!.add(ViewTag.fromJson(v));
      });
    }
    vendorPermission = json['vendor_permission'];
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (viewTag != null) {
      data['view_tag'] = viewTag!.map((v) => v.toJson()).toList();
    }
    data['vendor_permission'] = vendorPermission;
    data['is_owner'] = isOwner;
    return data;
  }
}

class ViewTag {
  int? tagid;
  int? addedby;
  int? addedfrom;
  int? postId;
  String? tagname;
  String? tagslug;
  int? status;
  int? tagtype;
  String? tagbanner;
  String? created;
  String? updated;
  int? postAuthor;
  String? postType;
  String? postTitle;
  String? postContent;
  String? postCss;
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

  ViewTag(
      {this.tagid,
      this.addedby,
      this.addedfrom,
      this.postId,
      this.tagname,
      this.tagslug,
      this.status,
      this.tagtype,
      this.tagbanner,
      this.created,
      this.updated,
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

  ViewTag.fromJson(Map<String, dynamic> json) {
    tagid = json['tagid'];
    addedby = json['addedby'];
    addedfrom = json['addedfrom'];
    postId = json['post_id'];
    tagname = json['tagname'];
    tagslug = json['tagslug'];
    status = json['status'];
    tagtype = json['tagtype'];
    tagbanner = json['tagbanner'];
    created = json['created'];
    updated = json['updated'];
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
    data['tagid'] = tagid;
    data['addedby'] = addedby;
    data['addedfrom'] = addedfrom;
    data['post_id'] = postId;
    data['tagname'] = tagname;
    data['tagslug'] = tagslug;
    data['status'] = status;
    data['tagtype'] = tagtype;
    data['tagbanner'] = tagbanner;
    data['created'] = created;
    data['updated'] = updated;
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
