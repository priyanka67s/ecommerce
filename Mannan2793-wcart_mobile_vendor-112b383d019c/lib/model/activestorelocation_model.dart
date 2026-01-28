class ActiveStoreLocationModel {
  String? status;
  String? message;
  List<ActiveStoreLocations>? activeStoreLocations;
  String? vendorPermission;
  String? isOwner;

  ActiveStoreLocationModel(
      {this.status,
      this.message,
      this.activeStoreLocations,
      this.vendorPermission,
      this.isOwner});

  ActiveStoreLocationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['active_store_locations'] != null) {
      activeStoreLocations = <ActiveStoreLocations>[];
      json['active_store_locations'].forEach((v) {
        activeStoreLocations!.add(ActiveStoreLocations.fromJson(v));
      });
    }
    vendorPermission = json['vendor_permission'];
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (activeStoreLocations != null) {
      data['active_store_locations'] =
          activeStoreLocations!.map((v) => v.toJson()).toList();
    }
    data['vendor_permission'] = vendorPermission;
    data['is_owner'] = isOwner;
    return data;
  }
}

class ActiveStoreLocations {
  int? storeLocationId;
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
  int? warehouseId;
  String? pickupLocation;
  String? latitude;
  String? longitude;
  int? addedby;
  int? addedFrom;
  String? storeLocationCreatedtime;
  String? storeLocationUpdatedtime;

  ActiveStoreLocations(
      {this.storeLocationId,
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
      this.warehouseId,
      this.pickupLocation,
      this.latitude,
      this.longitude,
      this.addedby,
      this.addedFrom,
      this.storeLocationCreatedtime,
      this.storeLocationUpdatedtime});

  ActiveStoreLocations.fromJson(Map<String, dynamic> json) {
    storeLocationId = json['store_location_id'];
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
    warehouseId = json['warehouse_id'];
    pickupLocation = json['pickup_location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    addedby = json['addedby'];
    addedFrom = json['added_from'];
    storeLocationCreatedtime = json['store_location_createdtime'];
    storeLocationUpdatedtime = json['store_location_updatedtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['store_location_id'] = storeLocationId;
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
    data['warehouse_id'] = warehouseId;
    data['pickup_location'] = pickupLocation;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['addedby'] = addedby;
    data['added_from'] = addedFrom;
    data['store_location_createdtime'] = storeLocationCreatedtime;
    data['store_location_updatedtime'] = storeLocationUpdatedtime;
    return data;
  }
}
