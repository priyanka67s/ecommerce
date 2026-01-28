class StoreInventoryDetailsModel {
  String? status;
  String? message;
  ViewInventory? viewInventory;
  List<InventoryHistory>? inventoryHistory;
  String? vendorPermission;
  String? isOwner;

  StoreInventoryDetailsModel(
      {this.status,
      this.message,
      this.viewInventory,
      this.inventoryHistory,
      this.vendorPermission,
      this.isOwner});

  StoreInventoryDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    viewInventory = json['view_inventory'] != null
        ? ViewInventory.fromJson(json['view_inventory'])
        : null;
    if (json['inventory_history'] != null) {
      inventoryHistory = <InventoryHistory>[];
      json['inventory_history'].forEach((v) {
        inventoryHistory!.add(InventoryHistory.fromJson(v));
      });
    }
    vendorPermission = json['vendor_permission'];
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (viewInventory != null) {
      data['view_inventory'] = viewInventory!.toJson();
    }
    if (inventoryHistory != null) {
      data['inventory_history'] =
          inventoryHistory!.map((v) => v.toJson()).toList();
    }
    data['vendor_permission'] = vendorPermission;
    data['is_owner'] = isOwner;
    return data;
  }
}

class ViewInventory {
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
  String? pickupLocation;
  String? latitude;
  String? longitude;
  int? addedFrom;
  String? storeLocationCreatedtime;
  String? storeLocationUpdatedtime;

  ViewInventory(
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
      this.sizeChart,
      this.chartType,
      this.description,
      this.longdescription,
      this.trending,
      this.upsellProducts,
      this.crossSellProducts,
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
      this.pickupLocation,
      this.latitude,
      this.longitude,
      this.addedFrom,
      this.storeLocationCreatedtime,
      this.storeLocationUpdatedtime});

  ViewInventory.fromJson(Map<String, dynamic> json) {
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
    sizeChart = json['size_chart'];
    chartType = json['chart_type'];
    description = json['description'];
    longdescription = json['longdescription'];
    trending = json['trending'];
    upsellProducts = json['upsell_products'];
    crossSellProducts = json['cross_sell_products'];
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
    pickupLocation = json['pickup_location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    addedFrom = json['added_from'];
    storeLocationCreatedtime = json['store_location_createdtime'];
    storeLocationUpdatedtime = json['store_location_updatedtime'];
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
    data['size_chart'] = sizeChart;
    data['chart_type'] = chartType;
    data['description'] = description;
    data['longdescription'] = longdescription;
    data['trending'] = trending;
    data['upsell_products'] = upsellProducts;
    data['cross_sell_products'] = crossSellProducts;
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
    data['pickup_location'] = pickupLocation;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['added_from'] = addedFrom;
    data['store_location_createdtime'] = storeLocationCreatedtime;
    data['store_location_updatedtime'] = storeLocationUpdatedtime;
    return data;
  }
}

class InventoryHistory {
  int? storeInventoryHistoryId;
  int? storeInventoryId;
  int? activityType;
  String? activityDescription;
  int? activityQuantity;
  int? availableQuantity;

  InventoryHistory(
      {this.storeInventoryHistoryId,
      this.storeInventoryId,
      this.activityType,
      this.activityDescription,
      this.activityQuantity,
      this.availableQuantity});

  InventoryHistory.fromJson(Map<String, dynamic> json) {
    storeInventoryHistoryId = json['store_inventory_history_id'];
    storeInventoryId = json['store_inventory_id'];
    activityType = json['activity_type'];
    activityDescription = json['activity_description'];
    activityQuantity = json['activity_quantity'];
    availableQuantity = json['available_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['store_inventory_history_id'] = storeInventoryHistoryId;
    data['store_inventory_id'] = storeInventoryId;
    data['activity_type'] = activityType;
    data['activity_description'] = activityDescription;
    data['activity_quantity'] = activityQuantity;
    data['available_quantity'] = availableQuantity;
    return data;
  }
}
