class StoreLocationResponse {
  String? status;
  String? message;
  String? storeInfo;
  List<dynamic>? selectedStoreLocation;
  List<StoreLocation>? listOfStoreLocation;
  String? vendorPermission;
  String? isOwner;

  StoreLocationResponse({
    this.status,
    this.message,
    this.storeInfo,
    this.selectedStoreLocation,
    this.listOfStoreLocation,
    this.vendorPermission,
    this.isOwner,
  });

  factory StoreLocationResponse.fromJson(Map<String, dynamic> json) {
    return StoreLocationResponse(
      status: json['status'],
      message: json['message'],
      storeInfo: json['store_info'],
      selectedStoreLocation: json['selected_store_location'],
      listOfStoreLocation: (json['list_of_store_location'] as List<dynamic>?)
          ?.map((e) => StoreLocation.fromJson(e))
          .toList(),
      vendorPermission: json['vendor_permission'],
      isOwner: json['is_owner'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'store_info': storeInfo,
      'selected_store_location': selectedStoreLocation,
      'list_of_store_location': listOfStoreLocation?.map((e) => e.toJson()).toList(),
      'vendor_permission': vendorPermission,
      'is_owner': isOwner,
    };
  }
}

class StoreLocation {
  int? warehouseId;
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
  String? pickupLocation;
  dynamic priceMargin;
  String? latitude;
  String? longitude;
  int? addedby;
  int? addedFrom;
  String? storeLocationCreatedtime;
  String? storeLocationUpdatedtime;
  int? datacount;
  dynamic availableQuantity;

  StoreLocation({
    this.warehouseId,
    this.storeLocationId,
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
    this.priceMargin,
    this.latitude,
    this.longitude,
    this.addedby,
    this.addedFrom,
    this.storeLocationCreatedtime,
    this.storeLocationUpdatedtime,
    this.datacount,
    this.availableQuantity,
  });

  factory StoreLocation.fromJson(Map<String, dynamic> json) {
    return StoreLocation(
      warehouseId: json['warehouse_id'],
      storeLocationId: json['store_location_id'],
      vendorStoreId: json['vendor_store_id'],
      locationTitle: json['location_title'],
      conatctPersonName: json['conatct_person_name'],
      addressline1: json['addressline1'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      pincode: json['pincode'],
      googleMapUrl: json['google_map_url'],
      emailId: json['email_id'],
      countryCode: json['country_code'],
      phoneNo: json['phone_no'],
      storeLocationStatus: json['store_location_status'],
      defaultStoreLocation: json['default_store_location'],
      territoryId: json['territory_id'],
      pickupLocation: json['pickup_location'],
      priceMargin: json['price_margin'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      addedby: json['addedby'],
      addedFrom: json['added_from'],
      storeLocationCreatedtime: json['store_location_createdtime'],
      storeLocationUpdatedtime: json['store_location_updatedtime'],
      datacount: json['datacount'],
      availableQuantity: json['available_quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'warehouse_id': warehouseId,
      'store_location_id': storeLocationId,
      'vendor_store_id': vendorStoreId,
      'location_title': locationTitle,
      'conatct_person_name': conatctPersonName,
      'addressline1': addressline1,
      'city': city,
      'state': state,
      'country': country,
      'pincode': pincode,
      'google_map_url': googleMapUrl,
      'email_id': emailId,
      'country_code': countryCode,
      'phone_no': phoneNo,
      'store_location_status': storeLocationStatus,
      'default_store_location': defaultStoreLocation,
      'territory_id': territoryId,
      'pickup_location': pickupLocation,
      'price_margin': priceMargin,
      'latitude': latitude,
      'longitude': longitude,
      'addedby': addedby,
      'added_from': addedFrom,
      'store_location_createdtime': storeLocationCreatedtime,
      'store_location_updatedtime': storeLocationUpdatedtime,
      'datacount': datacount,
      'available_quantity': availableQuantity,
    };
  }
}
