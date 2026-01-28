class ActiveTerriToryModel {
  String? status;
  String? message;
  List<ActiveTerritoryLocations>? activeTerritoryLocations;

  ActiveTerriToryModel(
      {this.status, this.message, this.activeTerritoryLocations});

  ActiveTerriToryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['active_territory_locations'] != null) {
      activeTerritoryLocations = <ActiveTerritoryLocations>[];
      json['active_territory_locations'].forEach((v) {
        activeTerritoryLocations!.add(ActiveTerritoryLocations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (activeTerritoryLocations != null) {
      data['active_territory_locations'] =
          activeTerritoryLocations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ActiveTerritoryLocations {
  int? territoryId;
  String? territoryName;
  String? territoryRadius;
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
  int? territoryStatus;
  int? addedby;
  int? addedFrom;
  String? storeLocationCreatedtime;
  String? storeLocationUpdatedtime;

  ActiveTerritoryLocations(
      {this.territoryId,
      this.territoryName,
      this.territoryRadius,
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
      this.territoryStatus,
      this.addedby,
      this.addedFrom,
      this.storeLocationCreatedtime,
      this.storeLocationUpdatedtime});

  ActiveTerritoryLocations.fromJson(Map<String, dynamic> json) {
    territoryId = json['territory_id'];
    territoryName = json['territory_name'];
    territoryRadius = json['territory_radius'];
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
    territoryStatus = json['territory_status'];
    addedby = json['addedby'];
    addedFrom = json['added_from'];
    storeLocationCreatedtime = json['store_location_createdtime'];
    storeLocationUpdatedtime = json['store_location_updatedtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['territory_id'] = territoryId;
    data['territory_name'] = territoryName;
    data['territory_radius'] = territoryRadius;
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
    data['territory_status'] = territoryStatus;
    data['addedby'] = addedby;
    data['added_from'] = addedFrom;
    data['store_location_createdtime'] = storeLocationCreatedtime;
    data['store_location_updatedtime'] = storeLocationUpdatedtime;
    return data;
  }
}
