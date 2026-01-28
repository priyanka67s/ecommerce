class ManageProductModel {
  String? status;
  String? message;
  List<Products>? products;
  String? vendorPermission;
  String? isOwner;

  ManageProductModel(
      {this.status,
      this.message,
      this.products,
      this.vendorPermission,
      this.isOwner});

  ManageProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    vendorPermission = json['vendor_permission'];
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['vendor_permission'] = vendorPermission;
    data['is_owner'] = isOwner;
    return data;
  }
}

class Products {
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
  int? vendorProductId;
  int? vendorid;
  String? skuCode;
  int? vendorPrice;
  int? vendorSaleprice;
  int? vendorQuantity;
  int? vendorProductStatus;
  String? includePincodes;
  String? excludePincodes;
  String? vendorNotesForProduct;
  String? createdDate;
  String? updatedDate;
  String? websiteurl;
  String? imageUrl;

  Products(
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
      this.vendorProductId,
      this.vendorid,
      this.skuCode,
      this.vendorPrice,
      this.vendorSaleprice,
      this.vendorQuantity,
      this.vendorProductStatus,
      this.includePincodes,
      this.excludePincodes,
      this.vendorNotesForProduct,
      this.createdDate,
      this.updatedDate,
      this.websiteurl,
      this.imageUrl});

  Products.fromJson(Map<String, dynamic> json) {
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
    vendorProductId = json['vendor_product_id'];
    vendorid = json['vendorid'];
    skuCode = json['sku_code'];
    vendorPrice = json['vendor_price'];
    vendorSaleprice = json['vendor_saleprice'];
    vendorQuantity = json['vendor_quantity'];
    vendorProductStatus = json['vendor_product_status'];
    includePincodes = json['include_pincodes'];
    excludePincodes = json['exclude_pincodes'];
    vendorNotesForProduct = json['vendor_notes_for_product'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    websiteurl = json['websiteurl'];
    imageUrl = json['image_url'];
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
    data['vendor_product_id'] = vendorProductId;
    data['vendorid'] = vendorid;
    data['sku_code'] = skuCode;
    data['vendor_price'] = vendorPrice;
    data['vendor_saleprice'] = vendorSaleprice;
    data['vendor_quantity'] = vendorQuantity;
    data['vendor_product_status'] = vendorProductStatus;
    data['include_pincodes'] = includePincodes;
    data['exclude_pincodes'] = excludePincodes;
    data['vendor_notes_for_product'] = vendorNotesForProduct;
    data['created_date'] = createdDate;
    data['updated_date'] = updatedDate;
    data['websiteurl'] = websiteurl;
    data['image_url'] = imageUrl;
    return data;
  }
}
