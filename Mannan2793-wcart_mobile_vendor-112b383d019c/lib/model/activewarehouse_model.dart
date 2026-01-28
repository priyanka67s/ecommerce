class ActiveWareHouseModel {
  String? status;
  String? message;
  List<WarehouseAddress>? warehouseAddress;
  String? vendorPermission;
  String? isOwner;

  ActiveWareHouseModel(
      {this.status,
      this.message,
      this.warehouseAddress,
      this.vendorPermission,
      this.isOwner});

  ActiveWareHouseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['warehouse_address'] != null) {
      warehouseAddress = <WarehouseAddress>[];
      json['warehouse_address'].forEach((v) {
        warehouseAddress!.add(WarehouseAddress.fromJson(v));
      });
    }
    vendorPermission = json['vendor_permission'];
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (warehouseAddress != null) {
      data['warehouse_address'] =
          warehouseAddress!.map((v) => v.toJson()).toList();
    }
    data['vendor_permission'] = vendorPermission;
    data['is_owner'] = isOwner;
    return data;
  }
}

class WarehouseAddress {
  int? warehouseId;
  String? locationTitle;
  int? territoryId;
  String? storeLocationId;
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
  int? addedby;
  int? addedFrom;
  String? createdtime;
  String? updatedtime;
  String? territoryName;
  String? territoryRadius;

  WarehouseAddress(
      {this.warehouseId,
      this.locationTitle,
      this.territoryId,
      this.conatctPersonName,
      this.storeLocationId,
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
      this.addedby,
      this.addedFrom,
      this.createdtime,
      this.updatedtime,
      this.territoryName,
      this.territoryRadius});

  WarehouseAddress.fromJson(Map<String, dynamic> json) {
    warehouseId = json['warehouse_id'];
    locationTitle = json['location_title'];
    territoryId = json['territory_id'];
    storeLocationId = json['store_location_id'];
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
    addedby = json['addedby'];
    addedFrom = json['added_from'];
    createdtime = json['createdtime'];
    updatedtime = json['updatedtime'];
    territoryName = json['territory_name'];
    territoryRadius = json['territory_radius'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['warehouse_id'] = warehouseId;
    data['location_title'] = locationTitle;
    data['territory_id'] = territoryId;
    data['store_location_id'] = storeLocationId;
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
    data['addedby'] = addedby;
    data['added_from'] = addedFrom;
    data['createdtime'] = createdtime;
    data['updatedtime'] = updatedtime;
    data['territory_name'] = territoryName;
    data['territory_radius'] = territoryRadius;
    return data;
  }
}
