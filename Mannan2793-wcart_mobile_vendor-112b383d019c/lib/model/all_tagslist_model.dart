class AllTagsListModel {
  String? status;
  String? message;
  List<Tags>? tags;
  String? vendorPermission;
  String? isOwner;

  AllTagsListModel(
      {this.status,
      this.message,
      this.tags,
      this.vendorPermission,
      this.isOwner});

  AllTagsListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    vendorPermission = json['vendor_permission'];
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    data['vendor_permission'] = vendorPermission;
    data['is_owner'] = isOwner;
    return data;
  }
}

class Tags {
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
  String? websiteurl;

  Tags(
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
      this.websiteurl});

  Tags.fromJson(Map<String, dynamic> json) {
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
    websiteurl = json['websiteurl'];
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
    data['websiteurl'] = websiteurl;
    return data;
  }
}
