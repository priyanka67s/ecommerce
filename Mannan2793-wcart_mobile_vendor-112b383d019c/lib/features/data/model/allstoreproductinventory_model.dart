class AllStoreProductInventoryModel {
  String? status;
  String? message;
  List<AllInventories>? allInventories;

  AllStoreProductInventoryModel(
      {this.status, this.message, this.allInventories});

  AllStoreProductInventoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['all_inventories'] != null) {
      allInventories = <AllInventories>[];
      json['all_inventories'].forEach((v) {
        allInventories!.add(AllInventories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (allInventories != null) {
      data['all_inventories'] =
          allInventories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllInventories {
  int? storeInventoryId;
  int? warehouseId;
  int? storeLocationId;
  int? productid;
  String? skuCode;
  int? incomingQuantity;
  int? committedQuantity;
  int? availableStock;
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
  int? price;
  int? saleprice;
  int? specialprice;
  String? startdate;
  String? enddate;
  int? quantity;
  int? trackQuantity;
  int? sellOutOfStock;
  String? description;
  String? longdescription;
  int? trending;
  String? createdtime;
  String? updatedtime;
  int? vendorStoreId;
  String? locationTitle;
  String? conatctPersonName;
  String? addressline1;
  String? city;
  String? state;
  String? country;
  String? pincode;
  String? googleMapUrl;
  String? emailId;
  String? countryCode;
  String? phoneNo;
  int? storeLocationStatus;
  int? defaultStoreLocation;
  int? territoryId;
  int? addedFrom;
  String? storeLocationCreatedtime;
  String? storeLocationUpdatedtime;
  int? vid;
  int? pid;
  String? variation;
  String? varsku;
  String? varimage;
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
  dynamic simpleRegularprice;
  dynamic simpleSaleprice;
  int? variableRegularprice;
  int? variableSaleprice;
  int? simpleQuantity;
  int? variableQuantity;
  int? vendorStatus;
  String? termIds;
  String? websiteurl;
  String? imageUrl;

  AllInventories(
      {this.storeInventoryId,
      this.warehouseId,
      this.storeLocationId,
      this.productid,
      this.skuCode,
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
      this.description,
      this.longdescription,
      this.trending,
      this.createdtime,
      this.updatedtime,
      this.vendorStoreId,
      this.locationTitle,
      this.conatctPersonName,
      this.addressline1,
      this.city,
      this.state,
      this.country,
      this.pincode,
      this.googleMapUrl,
      this.emailId,
      this.countryCode,
      this.phoneNo,
      this.storeLocationStatus,
      this.defaultStoreLocation,
      this.territoryId,
      this.addedFrom,
      this.storeLocationCreatedtime,
      this.storeLocationUpdatedtime,
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
      this.simpleRegularprice,
      this.simpleSaleprice,
      this.variableRegularprice,
      this.variableSaleprice,
      this.simpleQuantity,
      this.variableQuantity,
      this.vendorStatus,
      this.termIds,
      this.websiteurl,
      this.imageUrl});

  AllInventories.fromJson(Map<String, dynamic> json) {
    storeInventoryId = json['store_inventory_id'];
    warehouseId = json['warehouse_id'];
    storeLocationId = json['store_location_id'];
    productid = json['productid'];
    skuCode = json['sku_code'];
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
    description = json['description'];
    longdescription = json['longdescription'];
    trending = json['trending'];
    createdtime = json['createdtime'];
    updatedtime = json['updatedtime'];
    vendorStoreId = json['vendor_store_id'];
    locationTitle = json['location_title'];
    conatctPersonName = json['conatct_person_name'];
    addressline1 = json['addressline1'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    pincode = json['pincode'];
    googleMapUrl = json['google_map_url'];
    emailId = json['email_id'];
    countryCode = json['country_code'];
    phoneNo = json['phone_no'];
    storeLocationStatus = json['store_location_status'];
    defaultStoreLocation = json['default_store_location'];
    territoryId = json['territory_id'];
    addedFrom = json['added_from'];
    storeLocationCreatedtime = json['store_location_createdtime'];
    storeLocationUpdatedtime = json['store_location_updatedtime'];
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
    simpleRegularprice = json['simple_regularprice'];
    simpleSaleprice = json['simple_saleprice'];
    variableRegularprice = json['variable_regularprice'];
    variableSaleprice = json['variable_saleprice'];
    simpleQuantity = json['simple_quantity'];
    variableQuantity = json['variable_quantity'];
    vendorStatus = json['vendor_status'];
    termIds = json['term_ids'];
    websiteurl = json['websiteurl'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['store_inventory_id'] = storeInventoryId;
    data['warehouse_id'] = warehouseId;
    data['store_location_id'] = storeLocationId;
    data['productid'] = productid;
    data['sku_code'] = skuCode;
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
    data['description'] = description;
    data['longdescription'] = longdescription;
    data['trending'] = trending;
    data['createdtime'] = createdtime;
    data['updatedtime'] = updatedtime;
    data['vendor_store_id'] = vendorStoreId;
    data['location_title'] = locationTitle;
    data['conatct_person_name'] = conatctPersonName;
    data['addressline1'] = addressline1;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['pincode'] = pincode;
    data['google_map_url'] = googleMapUrl;
    data['email_id'] = emailId;
    data['country_code'] = countryCode;
    data['phone_no'] = phoneNo;
    data['store_location_status'] = storeLocationStatus;
    data['default_store_location'] = defaultStoreLocation;
    data['territory_id'] = territoryId;
    data['added_from'] = addedFrom;
    data['store_location_createdtime'] = storeLocationCreatedtime;
    data['store_location_updatedtime'] = storeLocationUpdatedtime;
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
    data['simple_regularprice'] = simpleRegularprice;
    data['simple_saleprice'] = simpleSaleprice;
    data['variable_regularprice'] = variableRegularprice;
    data['variable_saleprice'] = variableSaleprice;
    data['simple_quantity'] = simpleQuantity;
    data['variable_quantity'] = variableQuantity;
    data['vendor_status'] = vendorStatus;
    data['term_ids'] = termIds;
    data['websiteurl'] = websiteurl;
    data['image_url'] = imageUrl;
    return data;
  }
}
