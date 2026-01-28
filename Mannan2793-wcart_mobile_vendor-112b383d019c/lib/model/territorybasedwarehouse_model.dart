class TerritoryBasedWarehouseModel {
  String? status;
  String? message;
  List<TerritoryBasedWarehouse>? territoryBasedWarehouse;

  TerritoryBasedWarehouseModel(
      {this.status, this.message, this.territoryBasedWarehouse});

  TerritoryBasedWarehouseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['territory_based_warehouse'] != null) {
      territoryBasedWarehouse = <TerritoryBasedWarehouse>[];
      json['territory_based_warehouse'].forEach((v) {
        territoryBasedWarehouse!.add(TerritoryBasedWarehouse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (territoryBasedWarehouse != null) {
      data['territory_based_warehouse'] =
          territoryBasedWarehouse!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TerritoryBasedWarehouse {
  int? warehouseId;
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
  int? addedby;
  int? addedFrom;
  String? createdtime;
  String? updatedtime;
  String? territoryName;
  String? territoryRadius;

  TerritoryBasedWarehouse(
      {this.warehouseId,
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
      this.addedby,
      this.addedFrom,
      this.createdtime,
      this.updatedtime,
      this.territoryName,
      this.territoryRadius});

  TerritoryBasedWarehouse.fromJson(Map<String, dynamic> json) {
    warehouseId = json['warehouse_id'];
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
    data['addedby'] = addedby;
    data['added_from'] = addedFrom;
    data['createdtime'] = createdtime;
    data['updatedtime'] = updatedtime;
    data['territory_name'] = territoryName;
    data['territory_radius'] = territoryRadius;
    return data;
  }
}
