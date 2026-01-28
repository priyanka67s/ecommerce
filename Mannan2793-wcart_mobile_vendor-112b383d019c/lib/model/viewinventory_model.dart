class ViewInventoryModel {
  String? status;
  String? message;
  List<AllInventories>? allInventories;
  String? vendorPermission;
  String? isOwner;

  ViewInventoryModel(
      {this.status,
      this.message,
      this.allInventories,
      this.vendorPermission,
      this.isOwner});

  ViewInventoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['all_inventories'] != null) {
      allInventories = <AllInventories>[];
      json['all_inventories'].forEach((v) {
        allInventories!.add(AllInventories.fromJson(v));
      });
    }
    vendorPermission = json['vendor_permission'];
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (allInventories != null) {
      data['all_inventories'] =
          allInventories!.map((v) => v.toJson()).toList();
    }
    data['vendor_permission'] = vendorPermission;
    data['is_owner'] = isOwner;
    return data;
  }
}

class AllInventories {
  int? productInventoryId;
  int? warehouseId;
  String? skuCode;
  int? productid;
  int? incomingQuantity;
  int? committedQuantity;
  int? availableStock;
  int? addedby;
  int? addedfrom;
  int? postId;
  String? name;
  String? slug;
  int? producttype;
  dynamic status;
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
  dynamic specialprice;
  dynamic startdate;
  dynamic enddate;
  dynamic quantity;
  dynamic trackQuantity;
  dynamic sellOutOfStock;
  int? sizeChart;
  String? chartType;
  dynamic description;
  String? longdescription;
  int? trending;
  String? upsellProducts;
  String? crossSellProducts;
  String? createdtime;
  String? updatedtime;
  int? vendorProductId;
  int? vendorid;
  int? vendorPrice;
  int? vendorSaleprice;
  int? vendorQuantity;
  int? vendorProductStatus;
  String? includePincodes;
  String? excludePincodes;
  String? vendorNotesForProduct;
  String? createdDate;
  String? updatedDate;
  String? locationTitle;
  int? territoryId;
  String? conatctPersonName;
  String? addressline1;
  String? addressline2;
  String? city;
  String? state;
  String? country;
  String? pincode;
  String? googleMapUrl;
  String? emailId;
  String? countryCode;
  String? phoneNo;
  String? lCountryCode;
  String? lStateCode;
  String? landlineNumber;
  int? warehouseStatus;
  int? defaultLocation;
  int? locationOrder;
  String? pickupLocation;
  String? latitude;
  String? longitude;
  int? addedFrom;
  dynamic vid;
  int? pid;
  dynamic variation;
  dynamic varsku;
  dynamic varimage;
  int? sid;
  int? freeshipping;
  int? shippingcost;
  int? weightUnit;
  String? unitType;
  int? weight;
  int? length;
  int? width;
  int? height;
  int? shippingStatus;
  int? pincodeRestrictionSettings;
  dynamic simpleRegularprice;
  dynamic simpleSaleprice;
  dynamic variableRegularprice;
  dynamic variableSaleprice;
  int? simpleQuantity;
  dynamic variableQuantity;
  String? termIds;
  String? websiteurl;
  String? imageUrl;

  AllInventories(
      {this.productInventoryId,
      this.warehouseId,
      this.skuCode,
      this.productid,
      this.incomingQuantity,
      this.committedQuantity,
      this.availableStock,
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
      this.vendorPrice,
      this.vendorSaleprice,
      this.vendorQuantity,
      this.vendorProductStatus,
      this.includePincodes,
      this.excludePincodes,
      this.vendorNotesForProduct,
      this.createdDate,
      this.updatedDate,
      this.locationTitle,
      this.territoryId,
      this.conatctPersonName,
      this.addressline1,
      this.addressline2,
      this.city,
      this.state,
      this.country,
      this.pincode,
      this.googleMapUrl,
      this.emailId,
      this.countryCode,
      this.phoneNo,
      this.lCountryCode,
      this.lStateCode,
      this.landlineNumber,
      this.warehouseStatus,
      this.defaultLocation,
      this.locationOrder,
      this.pickupLocation,
      this.latitude,
      this.longitude,
      this.addedFrom,
      this.vid,
      this.pid,
      this.variation,
      this.varsku,
      this.varimage,
      this.sid,
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
      this.simpleRegularprice,
      this.simpleSaleprice,
      this.variableRegularprice,
      this.variableSaleprice,
      this.simpleQuantity,
      this.variableQuantity,
      this.termIds,
      this.websiteurl,
      this.imageUrl});

  AllInventories.fromJson(Map<String, dynamic> json) {
    productInventoryId = json['product_inventory_id'];
    warehouseId = json['warehouse_id'];
    skuCode = json['sku_code'];
    productid = json['productid'];
    incomingQuantity = json['incoming_quantity'];
    committedQuantity = json['committed_quantity'];
    availableStock = json['available_stock'];
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
    vendorPrice = json['vendor_price'];
    vendorSaleprice = json['vendor_saleprice'];
    vendorQuantity = json['vendor_quantity'];
    vendorProductStatus = json['vendor_product_status'];
    includePincodes = json['include_pincodes'];
    excludePincodes = json['exclude_pincodes'];
    vendorNotesForProduct = json['vendor_notes_for_product'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    locationTitle = json['location_title'];
    territoryId = json['territory_id'];
    conatctPersonName = json['conatct_person_name'];
    addressline1 = json['addressline1'];
    addressline2 = json['addressline2'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    pincode = json['pincode'];
    googleMapUrl = json['google_map_url'];
    emailId = json['email_id'];
    countryCode = json['country_code'];
    phoneNo = json['phone_no'];
    lCountryCode = json['l_country_code'];
    lStateCode = json['l_state_code'];
    landlineNumber = json['landline_number'];
    warehouseStatus = json['warehouse_status'];
    defaultLocation = json['default_location'];
    locationOrder = json['location_order'];
    pickupLocation = json['pickup_location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    addedFrom = json['added_from'];
    vid = json['vid'];
    pid = json['pid'];
    variation = json['variation'];
    varsku = json['varsku'];
    varimage = json['varimage'];
    sid = json['sid'];
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
    simpleRegularprice = json['simple_regularprice'];
    simpleSaleprice = json['simple_saleprice'];
    variableRegularprice = json['variable_regularprice'];
    variableSaleprice = json['variable_saleprice'];
    simpleQuantity = json['simple_quantity'];
    variableQuantity = json['variable_quantity'];
    termIds = json['term_ids'];
    websiteurl = json['websiteurl'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_inventory_id'] = productInventoryId;
    data['warehouse_id'] = warehouseId;
    data['sku_code'] = skuCode;
    data['productid'] = productid;
    data['incoming_quantity'] = incomingQuantity;
    data['committed_quantity'] = committedQuantity;
    data['available_stock'] = availableStock;
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
    data['vendor_price'] = vendorPrice;
    data['vendor_saleprice'] = vendorSaleprice;
    data['vendor_quantity'] = vendorQuantity;
    data['vendor_product_status'] = vendorProductStatus;
    data['include_pincodes'] = includePincodes;
    data['exclude_pincodes'] = excludePincodes;
    data['vendor_notes_for_product'] = vendorNotesForProduct;
    data['created_date'] = createdDate;
    data['updated_date'] = updatedDate;
    data['location_title'] = locationTitle;
    data['territory_id'] = territoryId;
    data['conatct_person_name'] = conatctPersonName;
    data['addressline1'] = addressline1;
    data['addressline2'] = addressline2;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['pincode'] = pincode;
    data['google_map_url'] = googleMapUrl;
    data['email_id'] = emailId;
    data['country_code'] = countryCode;
    data['phone_no'] = phoneNo;
    data['l_country_code'] = lCountryCode;
    data['l_state_code'] = lStateCode;
    data['landline_number'] = landlineNumber;
    data['warehouse_status'] = warehouseStatus;
    data['default_location'] = defaultLocation;
    data['location_order'] = locationOrder;
    data['pickup_location'] = pickupLocation;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['added_from'] = addedFrom;
    data['vid'] = vid;
    data['pid'] = pid;
    data['variation'] = variation;
    data['varsku'] = varsku;
    data['varimage'] = varimage;
    data['sid'] = sid;
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
    data['simple_regularprice'] = simpleRegularprice;
    data['simple_saleprice'] = simpleSaleprice;
    data['variable_regularprice'] = variableRegularprice;
    data['variable_saleprice'] = variableSaleprice;
    data['simple_quantity'] = simpleQuantity;
    data['variable_quantity'] = variableQuantity;
    data['term_ids'] = termIds;
    data['websiteurl'] = websiteurl;
    data['image_url'] = imageUrl;
    return data;
  }
}
