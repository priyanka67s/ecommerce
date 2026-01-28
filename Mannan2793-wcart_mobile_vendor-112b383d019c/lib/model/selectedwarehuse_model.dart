class SelectedWarehouseModel {
  String? status;
  String? message;
  List<SelectedWarehouse>? selectedWarehouse;
  List<ListOfWarehouse>? listOfWarehouse;

  SelectedWarehouseModel(
      {this.status,
      this.message,
      this.selectedWarehouse,
      this.listOfWarehouse});

  SelectedWarehouseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['selected_warehouse'] != null) {
      selectedWarehouse = <SelectedWarehouse>[];
      json['selected_warehouse'].forEach((v) {
        selectedWarehouse!.add(SelectedWarehouse.fromJson(v));
      });
    }
    if (json['list_of_warehouse'] != null) {
      listOfWarehouse = <ListOfWarehouse>[];
      json['list_of_warehouse'].forEach((v) {
        listOfWarehouse!.add(ListOfWarehouse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (selectedWarehouse != null) {
      data['selected_warehouse'] =
          selectedWarehouse!.map((v) => v.toJson()).toList();
    }
    if (listOfWarehouse != null) {
      data['list_of_warehouse'] =
          listOfWarehouse!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SelectedWarehouse {
  int? locationId;
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
  int? productInventoryId;
  String? skuCode;
  int? productid;
  int? incomingQuantity;
  int? committedQuantity;
  int? availableStock;
  int? datacount;

  SelectedWarehouse(
      {this.locationId,
      this.warehouseId,
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
      this.productInventoryId,
      this.skuCode,
      this.productid,
      this.incomingQuantity,
      this.committedQuantity,
      this.availableStock,
      this.datacount});

  SelectedWarehouse.fromJson(Map<String, dynamic> json) {
    locationId = json['location_id'];
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
    productInventoryId = json['product_inventory_id'];
    skuCode = json['sku_code'];
    productid = json['productid'];
    incomingQuantity = json['incoming_quantity'];
    committedQuantity = json['committed_quantity'];
    availableStock = json['available_stock'];
    datacount = json['datacount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['location_id'] = locationId;
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
    data['product_inventory_id'] = productInventoryId;
    data['sku_code'] = skuCode;
    data['productid'] = productid;
    data['incoming_quantity'] = incomingQuantity;
    data['committed_quantity'] = committedQuantity;
    data['available_stock'] = availableStock;
    data['datacount'] = datacount;
    return data;
  }
}

class ListOfWarehouse {
  int? locationId;
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
  int? datacount;

  ListOfWarehouse(
      {this.locationId,
      this.warehouseId,
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
      this.datacount});

  ListOfWarehouse.fromJson(Map<String, dynamic> json) {
    locationId = json['location_id'];
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
    datacount = json['datacount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['location_id'] = locationId;
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
    data['datacount'] = datacount;
    return data;
  }
}
