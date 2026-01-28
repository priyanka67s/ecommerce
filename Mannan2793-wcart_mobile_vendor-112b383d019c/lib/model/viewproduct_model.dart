class ViewProductModel {
  String? status;
  String? message;
  List<Product>? product;
  List<Shipping>? shipping;
  List<Attrrelation>? attrrelation;
  List<Wcvariations>? wcvariations;
  List<Seodata>? seodata;
  String? vendorPermission;
  String? isOwner;

  ViewProductModel(
      {this.status,
      this.message,
      this.product,
      this.shipping,
      this.attrrelation,
      this.wcvariations,
      this.seodata,
      this.vendorPermission,
      this.isOwner});

  ViewProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
    if (json['inship'] != null) {
      shipping = <Shipping>[];
      json['inship'].forEach((v) {
        shipping!.add(Shipping.fromJson(v));
      });
    }
    if (json['attrrelation'] != null) {
      attrrelation = <Attrrelation>[];
      json['attrrelation'].forEach((v) {
        attrrelation!.add(Attrrelation.fromJson(v));
      });
    }
    if (json['wcvariations'] != null) {
      wcvariations = <Wcvariations>[];
      json['wcvariations'].forEach((v) {
        wcvariations!.add(Wcvariations.fromJson(v));
      });
    }
    if (json['seodata'] != null) {
      seodata = <Seodata>[];
      json['seodata'].forEach((v) {
        seodata!.add(Seodata.fromJson(v));
      });
    }
    vendorPermission = json['vendor_permission'];
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (product != null) {
      data['product'] = product!.map((v) => v.toJson()).toList();
    }
    if (shipping != null) {
      data['inship'] = shipping!.map((v) => v.toJson()).toList();
    }
    if (attrrelation != null) {
      data['attrrelation'] = attrrelation!.map((v) => v.toJson()).toList();
    }
    if (wcvariations != null) {
      data['wcvariations'] = wcvariations!.map((v) => v.toJson()).toList();
    }
    if (seodata != null) {
      data['seodata'] = seodata!.map((v) => v.toJson()).toList();
    }
    data['vendor_permission'] = vendorPermission;
    data['is_owner'] = isOwner;
    return data;
  }
}

class Product {
  int? productid;
  int? addedby;
  int? addedfrom;
  int? postId;
  String? name;
  String? slug;
  int? producttype;
  int? status;
  int? progressSteps;
  String? sku;
  String? image;
  String? thumbnail;
  String? smallimage;
  String? gallery1;
  String? gallery2;
  String? gallery3;
  String? gallery4;
  String? video;
  int? procatid;
  int? proBrand;
  dynamic price;
  dynamic saleprice;
  int? specialprice;
  String? startdate;
  String? enddate;
  int? quantity;
  int? trackQuantity;
  int? sellOutOfStock;
  int? sizeChart;
  String? chartType;
  String? description;
  String? longDescription;
  int? trending;
  String? upsellProducts;
  String? crossSellProducts;
  String? createdtime;
  String? updatedtime;
  int? brandId;
  String? brandName;
  String? brandSlug;
  String? brandImage;
  int? brandStatus;
  int? brandFeatured;
  int? productCount;
  String? productTags;
  String? categories;
  String? websiteurl;
  String? imageUrl;
  String? upsellName;
  String? crossSellName;

  Product(
      {this.productid,
      this.addedby,
      this.addedfrom,
      this.postId,
      this.name,
      this.slug,
      this.producttype,
      this.status,
      this.progressSteps,
      this.sku,
      this.image,
      this.thumbnail,
      this.smallimage,
      this.gallery1,
      this.gallery2,
      this.gallery3,
      this.gallery4,
      this.video,
      this.procatid,
      this.proBrand,
      this.price,
      this.saleprice,
      this.specialprice,
      this.startdate,
      this.enddate,
      this.quantity,
      this.trackQuantity,
      this.sellOutOfStock,
      this.sizeChart,
      this.chartType,
      this.description,
      this.longDescription,
      this.trending,
      this.upsellProducts,
      this.crossSellProducts,
      this.createdtime,
      this.updatedtime,
      this.brandId,
      this.brandName,
      this.brandSlug,
      this.brandImage,
      this.brandStatus,
      this.brandFeatured,
      this.productCount,
      this.productTags,
      this.categories,
      this.websiteurl,
      this.imageUrl,
      this.upsellName,
      this.crossSellName});

  Product.fromJson(Map<String, dynamic> json) {
    productid = json['productid'];
    addedby = json['addedby'];
    addedfrom = json['addedfrom'];
    postId = json['post_id'];
    name = json['name'];
    slug = json['slug'];
    producttype = json['producttype'];
    status = json['status'];
    progressSteps = json['progress_steps'];
    sku = json['sku'];
    image = json['image'];
    thumbnail = json['thumbnail'];
    smallimage = json['smallimage'];
    gallery1 = json['gallery1'];
    gallery2 = json['gallery2'];
    gallery3 = json['gallery3'];
    gallery4 = json['gallery4'];
    video = json['video'];
    procatid = json['procatid'];
    proBrand = json['pro_brand'];
    price = json['price'];
    saleprice = json['saleprice'];
    specialprice = json['specialprice'];
    startdate = json['startdate'];
    enddate = json['enddate'];
    quantity = json['quantity'];
    trackQuantity = json['track_quantity'];
    sellOutOfStock = json['sell_out_of_stock'];
    sizeChart = json['size_chart'];
    chartType = json['chart_type'];
    description = json['description'];
    longDescription = json['longdescription'];
    trending = json['trending'];
    upsellProducts = json['upsell_products'];
    crossSellProducts = json['cross_sell_products'];
    createdtime = json['createdtime'];
    updatedtime = json['updatedtime'];
    brandId = json['brand_id'];
    brandName = json['brand_name'];
    brandSlug = json['brand_slug'];
    brandImage = json['brand_image'];
    brandStatus = json['brand_status'];
    brandFeatured = json['brand_featured'];
    productCount = json['product_count'];
    productTags = json['product_tags'];
    categories = json['categories'];
    websiteurl = json['websiteurl'];
    imageUrl = json['image_url'];
    upsellName = json['upsell_name'];
    crossSellName = json['cross_sell_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productid'] = productid;
    data['addedby'] = addedby;
    data['addedfrom'] = addedfrom;
    data['post_id'] = postId;
    data['name'] = name;
    data['slug'] = slug;
    data['producttype'] = producttype;
    data['status'] = status;
    data['progress_steps'] = progressSteps;
    data['sku'] = sku;
    data['image'] = image;
    data['thumbnail'] = thumbnail;
    data['smallimage'] = smallimage;
    data['gallery1'] = gallery1;
    data['gallery2'] = gallery2;
    data['gallery3'] = gallery3;
    data['gallery4'] = gallery4;
    data['video'] = video;
    data['procatid'] = procatid;
    data['pro_brand'] = proBrand;
    data['price'] = price;
    data['saleprice'] = saleprice;
    data['specialprice'] = specialprice;
    data['startdate'] = startdate;
    data['enddate'] = enddate;
    data['quantity'] = quantity;
    data['track_quantity'] = trackQuantity;
    data['sell_out_of_stock'] = sellOutOfStock;
    data['size_chart'] = sizeChart;
    data['chart_type'] = chartType;
    data['description'] = description;
    data['longdescription'] = longDescription;
    data['trending'] = trending;
    data['upsell_products'] = upsellProducts;
    data['cross_sell_products'] = crossSellProducts;
    data['createdtime'] = createdtime;
    data['updatedtime'] = updatedtime;
    data['brand_id'] = brandId;
    data['brand_name'] = brandName;
    data['brand_slug'] = brandSlug;
    data['brand_image'] = brandImage;
    data['brand_status'] = brandStatus;
    data['brand_featured'] = brandFeatured;
    data['product_count'] = productCount;
    data['product_tags'] = productTags;
    data['categories'] = categories;
    data['websiteurl'] = websiteurl;
    data['image_url'] = imageUrl;
    data['upsell_name'] = upsellName;
    data['cross_sell_name'] = crossSellName;
    return data;
  }
}

class Shipping {
  int? productid;
  int? addedby;
  int? addedfrom;
  int? postId;
  String? name;
  String? slug;
  int? producttype;
  int? status;
  int? progressSteps;
  dynamic sku;
  String? image;
  String? thumbnail;
  String? smallimage;
  String? gallery1;
  String? gallery2;
  String? gallery3;
  String? gallery4;
  String? video;
  int? procatid;
  int? proBrand;
  String? price;
  String? saleprice;
  int? specialprice;
  String? startdate;
  String? enddate;
  int? quantity;
  int? trackQuantity;
  int? sellOutOfStock;
  int? sizeChart;
  String? chartType;
  String? description;
  String? longdescription;
  int? trending;
  String? upsellProducts;
  String? crossSellProducts;
  dynamic createdtime;
  dynamic updatedtime;
  dynamic sid;
  dynamic pid;
  dynamic freeshipping;
  dynamic shippingcost;
  dynamic weightUnit;
  dynamic unitType;
  dynamic weight;
  dynamic length;
  dynamic width;
  dynamic height;
  dynamic shippingStatus;
  dynamic pincodeRestrictionSettings;
  dynamic includePincodes;
  dynamic excludePincodes;

  Shipping(
      {this.productid,
      this.addedby,
      this.addedfrom,
      this.postId,
      this.name,
      this.slug,
      this.producttype,
      this.status,
      this.progressSteps,
      this.sku,
      this.image,
      this.thumbnail,
      this.smallimage,
      this.gallery1,
      this.gallery2,
      this.gallery3,
      this.gallery4,
      this.video,
      this.procatid,
      this.proBrand,
      this.price,
      this.saleprice,
      this.specialprice,
      this.startdate,
      this.enddate,
      this.quantity,
      this.trackQuantity,
      this.sellOutOfStock,
      this.sizeChart,
      this.chartType,
      this.description,
      this.longdescription,
      this.trending,
      this.upsellProducts,
      this.crossSellProducts,
      this.createdtime,
      this.updatedtime,
      this.sid,
      this.pid,
      this.freeshipping,
      this.shippingcost,
      this.weightUnit,
      this.unitType,
      this.weight,
      this.length,
      this.width,
      this.height,
      this.shippingStatus,
      this.pincodeRestrictionSettings,
      this.includePincodes,
      this.excludePincodes});

  Shipping.fromJson(Map<String, dynamic> json) {
    productid = json['productid'];
    addedby = json['addedby'];
    addedfrom = json['addedfrom'];
    postId = json['post_id'];
    name = json['name'];
    slug = json['slug'];
    producttype = json['producttype'];
    status = json['status'];
    progressSteps = json['progress_steps'];
    sku = json['sku'];
    image = json['image'];
    thumbnail = json['thumbnail'];
    smallimage = json['smallimage'];
    gallery1 = json['gallery1'];
    gallery2 = json['gallery2'];
    gallery3 = json['gallery3'];
    gallery4 = json['gallery4'];
    video = json['video'];
    procatid = json['procatid'];
    proBrand = json['pro_brand'];
    price = json['price'];
    saleprice = json['saleprice'];
    specialprice = json['specialprice'];
    startdate = json['startdate'];
    enddate = json['enddate'];
    quantity = json['quantity'];
    trackQuantity = json['track_quantity'];
    sellOutOfStock = json['sell_out_of_stock'];
    sizeChart = json['size_chart'];
    chartType = json['chart_type'];
    description = json['description'];
    longdescription = json['longdescription'];
    trending = json['trending'];
    upsellProducts = json['upsell_products'];
    crossSellProducts = json['cross_sell_products'];
    createdtime = json['createdtime'];
    updatedtime = json['updatedtime'];
    sid = json['sid'];
    pid = json['pid'];
    freeshipping = json['freeshipping'];
    shippingcost = json['shippingcost'];
    weightUnit = json['weight_unit'];
    unitType = json['unit_type'];
    weight = json['weight'];
    length = json['length'];
    width = json['width'];
    height = json['height'];
    shippingStatus = json['shipping_status'];
    pincodeRestrictionSettings = json['pincode_restriction_settings'];
    includePincodes = json['include_pincodes'];
    excludePincodes = json['exclude_pincodes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productid'] = productid;
    data['addedby'] = addedby;
    data['addedfrom'] = addedfrom;
    data['post_id'] = postId;
    data['name'] = name;
    data['slug'] = slug;
    data['producttype'] = producttype;
    data['status'] = status;
    data['progress_steps'] = progressSteps;
    data['sku'] = sku;
    data['image'] = image;
    data['thumbnail'] = thumbnail;
    data['smallimage'] = smallimage;
    data['gallery1'] = gallery1;
    data['gallery2'] = gallery2;
    data['gallery3'] = gallery3;
    data['gallery4'] = gallery4;
    data['video'] = video;
    data['procatid'] = procatid;
    data['pro_brand'] = proBrand;
    data['price'] = price;
    data['saleprice'] = saleprice;
    data['specialprice'] = specialprice;
    data['startdate'] = startdate;
    data['enddate'] = enddate;
    data['quantity'] = quantity;
    data['track_quantity'] = trackQuantity;
    data['sell_out_of_stock'] = sellOutOfStock;
    data['size_chart'] = sizeChart;
    data['chart_type'] = chartType;
    data['description'] = description;
    data['longdescription'] = longdescription;
    data['trending'] = trending;
    data['upsell_products'] = upsellProducts;
    data['cross_sell_products'] = crossSellProducts;
    data['createdtime'] = createdtime;
    data['updatedtime'] = updatedtime;
    data['sid'] = sid;
    data['pid'] = pid;
    data['freeshipping'] = freeshipping;
    data['shippingcost'] = shippingcost;
    data['weight_unit'] = weightUnit;
    data['unit_type'] = unitType;
    data['weight'] = weight;
    data['length'] = length;
    data['width'] = width;
    data['height'] = height;
    data['shipping_status'] = shippingStatus;
    data['pincode_restriction_settings'] = pincodeRestrictionSettings;
    data['include_pincodes'] = includePincodes;
    data['exclude_pincodes'] = excludePincodes;
    return data;
  }
}

class Attrrelation {
  int? relateId;
  int? pid;
  String? attrSlug;
  String? items;
  int? id;
  int? addedby;
  int? addedfrom;
  String? attributename;
  String? attributeslug;

  Attrrelation(
      {this.relateId,
      this.pid,
      this.attrSlug,
      this.items,
      this.id,
      this.addedby,
      this.addedfrom,
      this.attributename,
      this.attributeslug});

  Attrrelation.fromJson(Map<String, dynamic> json) {
    relateId = json['relate_id'];
    pid = json['pid'];
    attrSlug = json['attr_slug'];
    items = json['items'];
    id = json['id'];
    addedby = json['addedby'];
    addedfrom = json['addedfrom'];
    attributename = json['attributename'];
    attributeslug = json['attributeslug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['relate_id'] = relateId;
    data['pid'] = pid;
    data['attr_slug'] = attrSlug;
    data['items'] = items;
    data['id'] = id;
    data['addedby'] = addedby;
    data['addedfrom'] = addedfrom;
    data['attributename'] = attributename;
    data['attributeslug'] = attributeslug;
    return data;
  }
}

class Wcvariations {
  int? vid;
  dynamic pid;
  String? variation;
  String? varsku;
  int? status;
  String? varimage;
  int? price;
  int? saleprice;
  int? specialprice;
  String? startdate;
  String? enddate;
  int? quantity;
  int? trackQuantity;
  int? sellOutOfStock;
  String? description;
  dynamic createdtime;
  dynamic updatedtime;
  dynamic sid;
  dynamic sku;
  dynamic freeshipping;
  dynamic shippingcost;
  dynamic weightUnit;
  dynamic unitType;
  dynamic weight;
  dynamic length;
  dynamic width;
  dynamic height;
  dynamic shippingStatus;
  dynamic pincodeRestrictionSettings;
  dynamic includePincodes;
  dynamic excludePincodes;

  Wcvariations(
      {this.vid,
      this.pid,
      this.variation,
      this.varsku,
      this.status,
      this.varimage,
      this.price,
      this.saleprice,
      this.specialprice,
      this.startdate,
      this.enddate,
      this.quantity,
      this.trackQuantity,
      this.sellOutOfStock,
      this.description,
      this.createdtime,
      this.updatedtime,
      this.sid,
      this.sku,
      this.freeshipping,
      this.shippingcost,
      this.weightUnit,
      this.unitType,
      this.weight,
      this.length,
      this.width,
      this.height,
      this.shippingStatus,
      this.pincodeRestrictionSettings,
      this.includePincodes,
      this.excludePincodes});

  Wcvariations.fromJson(Map<String, dynamic> json) {
    vid = json['vid'];
    pid = json['pid'];
    variation = json['variation'];
    varsku = json['varsku'];
    status = json['status'];
    varimage = json['varimage'];
    price = json['price'];
    saleprice = json['saleprice'];
    specialprice = json['specialprice'];
    startdate = json['startdate'];
    enddate = json['enddate'];
    quantity = json['quantity'];
    trackQuantity = json['track_quantity'];
    sellOutOfStock = json['sell_out_of_stock'];
    description = json['description'];
    createdtime = json['createdtime'];
    updatedtime = json['updatedtime'];
    sid = json['sid'];
    sku = json['sku'];
    freeshipping = json['freeshipping'];
    shippingcost = json['shippingcost'];
    weightUnit = json['weight_unit'];
    unitType = json['unit_type'];
    weight = json['weight'];
    length = json['length'];
    width = json['width'];
    height = json['height'];
    shippingStatus = json['shipping_status'];
    pincodeRestrictionSettings = json['pincode_restriction_settings'];
    includePincodes = json['include_pincodes'];
    excludePincodes = json['exclude_pincodes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vid'] = vid;
    data['pid'] = pid;
    data['variation'] = variation;
    data['varsku'] = varsku;
    data['status'] = status;
    data['varimage'] = varimage;
    data['price'] = price;
    data['saleprice'] = saleprice;
    data['specialprice'] = specialprice;
    data['startdate'] = startdate;
    data['enddate'] = enddate;
    data['quantity'] = quantity;
    data['track_quantity'] = trackQuantity;
    data['sell_out_of_stock'] = sellOutOfStock;
    data['description'] = description;
    data['createdtime'] = createdtime;
    data['updatedtime'] = updatedtime;
    data['sid'] = sid;
    data['sku'] = sku;
    data['freeshipping'] = freeshipping;
    data['shippingcost'] = shippingcost;
    data['weight_unit'] = weightUnit;
    data['unit_type'] = unitType;
    data['weight'] = weight;
    data['length'] = length;
    data['width'] = width;
    data['height'] = height;
    data['shipping_status'] = shippingStatus;
    data['pincode_restriction_settings'] = pincodeRestrictionSettings;
    data['include_pincodes'] = includePincodes;
    data['exclude_pincodes'] = excludePincodes;
    return data;
  }
}

class Seodata {
  int? productid;
  int? addedby;
  int? addedfrom;
  int? postId;
  String? name;
  String? slug;
  int? producttype;
  int? status;
  int? progressSteps;
  String? sku;
  String? image;
  String? thumbnail;
  String? smallimage;
  String? gallery1;
  String? gallery2;
  String? gallery3;
  String? gallery4;
  String? video;
  int? procatid;
  int? proBrand;
  dynamic price;
  dynamic saleprice;
  int? specialprice;
  String? startdate;
  String? enddate;
  int? quantity;
  int? trackQuantity;
  int? sellOutOfStock;
  int? sizeChart;
  String? chartType;
  String? description;
  String? longdescription;
  int? trending;
  String? upsellProducts;
  String? crossSellProducts;
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

  Seodata(
      {this.productid,
      this.addedby,
      this.addedfrom,
      this.postId,
      this.name,
      this.slug,
      this.producttype,
      this.status,
      this.progressSteps,
      this.sku,
      this.image,
      this.thumbnail,
      this.smallimage,
      this.gallery1,
      this.gallery2,
      this.gallery3,
      this.gallery4,
      this.video,
      this.procatid,
      this.proBrand,
      this.price,
      this.saleprice,
      this.specialprice,
      this.startdate,
      this.enddate,
      this.quantity,
      this.trackQuantity,
      this.sellOutOfStock,
      this.sizeChart,
      this.chartType,
      this.description,
      this.longdescription,
      this.trending,
      this.upsellProducts,
      this.crossSellProducts,
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
      this.seoModified});

  Seodata.fromJson(Map<String, dynamic> json) {
    productid = json['productid'];
    addedby = json['addedby'];
    addedfrom = json['addedfrom'];
    postId = json['post_id'];
    name = json['name'];
    slug = json['slug'];
    producttype = json['producttype'];
    status = json['status'];
    progressSteps = json['progress_steps'];
    sku = json['sku'];
    image = json['image'];
    thumbnail = json['thumbnail'];
    smallimage = json['smallimage'];
    gallery1 = json['gallery1'];
    gallery2 = json['gallery2'];
    gallery3 = json['gallery3'];
    gallery4 = json['gallery4'];
    video = json['video'];
    procatid = json['procatid'];
    proBrand = json['pro_brand'];
    price = json['price'];
    saleprice = json['saleprice'];
    specialprice = json['specialprice'];
    startdate = json['startdate'];
    enddate = json['enddate'];
    quantity = json['quantity'];
    trackQuantity = json['track_quantity'];
    sellOutOfStock = json['sell_out_of_stock'];
    sizeChart = json['size_chart'];
    chartType = json['chart_type'];
    description = json['description'];
    longdescription = json['longdescription'];
    trending = json['trending'];
    upsellProducts = json['upsell_products'];
    crossSellProducts = json['cross_sell_products'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productid'] = productid;
    data['addedby'] = addedby;
    data['addedfrom'] = addedfrom;
    data['post_id'] = postId;
    data['name'] = name;
    data['slug'] = slug;
    data['producttype'] = producttype;
    data['status'] = status;
    data['progress_steps'] = progressSteps;
    data['sku'] = sku;
    data['image'] = image;
    data['thumbnail'] = thumbnail;
    data['smallimage'] = smallimage;
    data['gallery1'] = gallery1;
    data['gallery2'] = gallery2;
    data['gallery3'] = gallery3;
    data['gallery4'] = gallery4;
    data['video'] = video;
    data['procatid'] = procatid;
    data['pro_brand'] = proBrand;
    data['price'] = price;
    data['saleprice'] = saleprice;
    data['specialprice'] = specialprice;
    data['startdate'] = startdate;
    data['enddate'] = enddate;
    data['quantity'] = quantity;
    data['track_quantity'] = trackQuantity;
    data['sell_out_of_stock'] = sellOutOfStock;
    data['size_chart'] = sizeChart;
    data['chart_type'] = chartType;
    data['description'] = description;
    data['longdescription'] = longdescription;
    data['trending'] = trending;
    data['upsell_products'] = upsellProducts;
    data['cross_sell_products'] = crossSellProducts;
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
    return data;
  }
}
