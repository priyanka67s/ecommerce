class AllInventoryDetailsModel {
  String? status;
  String? message;
  List<AllInventories>? allInventories;

  AllInventoryDetailsModel({this.status, this.message, this.allInventories});

  AllInventoryDetailsModel.fromJson(Map<String, dynamic> json) {
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
  int? addedFrom;

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
      this.description,
      this.longdescription,
      this.trending,
      this.createdtime,
      this.updatedtime,
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
      this.addedFrom});

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
    description = json['description'];
    longdescription = json['longdescription'];
    trending = json['trending'];
    createdtime = json['createdtime'];
    updatedtime = json['updatedtime'];
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
    addedFrom = json['added_from'];
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
    data['description'] = description;
    data['longdescription'] = longdescription;
    data['trending'] = trending;
    data['createdtime'] = createdtime;
    data['updatedtime'] = updatedtime;
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
    data['added_from'] = addedFrom;
    return data;
  }
}
