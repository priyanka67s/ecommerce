class AllPinCodeModel {
  String? status;
  List<ActivePincodes>? activePincodes;
  String? message;

  AllPinCodeModel({this.status, this.activePincodes, this.message});

  AllPinCodeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['active_pincodes'] != null) {
      activePincodes = <ActivePincodes>[];
      json['active_pincodes'].forEach((v) {
        activePincodes!.add(ActivePincodes.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (activePincodes != null) {
      data['active_pincodes'] =
          activePincodes!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class ActivePincodes {
  int? pincodeId;
  String? pincode;
  int? pincodeStatus;
  String? countryCode;
  String? stateCode;
  String? cityCode;
  int? deliveryDays;
  int? pincodeCodStatus;

  ActivePincodes(
      {this.pincodeId,
      this.pincode,
      this.pincodeStatus,
      this.countryCode,
      this.stateCode,
      this.cityCode,
      this.deliveryDays,
      this.pincodeCodStatus});

  ActivePincodes.fromJson(Map<String, dynamic> json) {
    pincodeId = json['pincode_id'];
    pincode = json['pincode'];
    pincodeStatus = json['pincode_status'];
    countryCode = json['country_code'];
    stateCode = json['state_code'];
    cityCode = json['city_code'];
    deliveryDays = json['delivery_days'];
    pincodeCodStatus = json['pincode_cod_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pincode_id'] = pincodeId;
    data['pincode'] = pincode;
    data['pincode_status'] = pincodeStatus;
    data['country_code'] = countryCode;
    data['state_code'] = stateCode;
    data['city_code'] = cityCode;
    data['delivery_days'] = deliveryDays;
    data['pincode_cod_status'] = pincodeCodStatus;
    return data;
  }
}
