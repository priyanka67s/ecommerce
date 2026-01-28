// class ViewPinCodeModel {
//   String? status;
//   ViewPincode? viewPinCode;
//   String? message;

//   ViewPinCodeModel({this.status, this.viewPinCode, this.message});

//   ViewPinCodeModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     viewPinCode = json['view_pincode'] != null
//         ? ViewPincode.fromJson(json['view_pincode'])
//         : null;
//     message = json['message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     if (viewPinCode != null) {
//       data['view_pincode'] = viewPinCode!.toJson();
//     }
//     data['message'] = message;
//     return data;
//   }
// }

// class ViewPincode {
//   int? pinCodeId;
//   String? pinCode;
//   int? pincodeStatus;
//   String? countryCode;
//   String? stateCode;
//   String? cityCode;
//   int? deliveryDays;
//   int? pincodeCodStatus;

//   ViewPincode(
//       {this.pinCodeId,
//       this.pinCode,
//       this.pincodeStatus,
//       this.countryCode,
//       this.stateCode,
//       this.cityCode,
//       this.deliveryDays,
//       this.pincodeCodStatus});

//   ViewPincode.fromJson(Map<String, dynamic> json) {
//     pinCodeId = json['pincode_id'];
//     pinCode = json['pincode'];
//     pincodeStatus = json['pincode_status'];
//     countryCode = json['country_code'];
//     stateCode = json['state_code'];
//     cityCode = json['city_code'];
//     deliveryDays = json['delivery_days'];
//     pincodeCodStatus = json['pincode_cod_status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['pincode_id'] = pinCodeId;
//     data['pincode'] = pinCode;
//     data['pincode_status'] = pincodeStatus;
//     data['country_code'] = countryCode;
//     data['state_code'] = stateCode;
//     data['city_code'] = cityCode;
//     data['delivery_days'] = deliveryDays;
//     data['pincode_cod_status'] = pincodeCodStatus;
//     return data;
//   }
// }
class ViewPinCodeModel {
  String? status;
  ViewPincode? viewPincode;
  List<CountriesData>? countriesData;
  List<StatesData>? statesData;
  List<CitiesData>? citiesData;
  String? message;

  ViewPinCodeModel(
      {this.status,
      this.viewPincode,
      this.countriesData,
      this.statesData,
      this.citiesData,
      this.message});

  ViewPinCodeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    viewPincode = json['view_pincode'] != null
        ? ViewPincode.fromJson(json['view_pincode'])
        : null;
    if (json['countries_data'] != null) {
      countriesData = <CountriesData>[];
      json['countries_data'].forEach((v) {
        countriesData!.add(CountriesData.fromJson(v));
      });
    }
    if (json['states_data'] != null) {
      statesData = <StatesData>[];
      json['states_data'].forEach((v) {
        statesData!.add(StatesData.fromJson(v));
      });
    }
    if (json['cities_data'] != null) {
      citiesData = <CitiesData>[];
      json['cities_data'].forEach((v) {
        citiesData!.add(CitiesData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (viewPincode != null) {
      data['view_pincode'] = viewPincode!.toJson();
    }
    if (countriesData != null) {
      data['countries_data'] =
          countriesData!.map((v) => v.toJson()).toList();
    }
    if (statesData != null) {
      data['states_data'] = statesData!.map((v) => v.toJson()).toList();
    }
    if (citiesData != null) {
      data['cities_data'] = citiesData!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class ViewPincode {
  int? pincodeId;
  String? pincode;
  int? pincodeStatus;
  String? countryCode;
  String? stateCode;
  String? cityCode;
  int? deliveryDays;
  int? pincodeCodStatus;

  ViewPincode(
      {this.pincodeId,
      this.pincode,
      this.pincodeStatus,
      this.countryCode,
      this.stateCode,
      this.cityCode,
      this.deliveryDays,
      this.pincodeCodStatus});

  ViewPincode.fromJson(Map<String, dynamic> json) {
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

class CountriesData {
  int? countryId;
  String? countryName;
  String? countryCode;
  String? countryPhoneCode;
  int? countryShippingStatus;

  CountriesData(
      {this.countryId,
      this.countryName,
      this.countryCode,
      this.countryPhoneCode,
      this.countryShippingStatus});

  CountriesData.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    countryName = json['country_name'];
    countryCode = json['country_code'];
    countryPhoneCode = json['country_phone_code'];
    countryShippingStatus = json['country_shipping_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country_id'] = countryId;
    data['country_name'] = countryName;
    data['country_code'] = countryCode;
    data['country_phone_code'] = countryPhoneCode;
    data['country_shipping_status'] = countryShippingStatus;
    return data;
  }
}

class StatesData {
  int? stateId;
  String? countryCode;
  String? stateName;
  String? stateCode;
  String? statePhoneCode;
  int? stateShippingStatus;

  StatesData(
      {this.stateId,
      this.countryCode,
      this.stateName,
      this.stateCode,
      this.statePhoneCode,
      this.stateShippingStatus});

  StatesData.fromJson(Map<String, dynamic> json) {
    stateId = json['state_id'];
    countryCode = json['country_code'];
    stateName = json['state_name'];
    stateCode = json['state_code'];
    statePhoneCode = json['state_phone_code'];
    stateShippingStatus = json['state_shipping_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['state_id'] = stateId;
    data['country_code'] = countryCode;
    data['state_name'] = stateName;
    data['state_code'] = stateCode;
    data['state_phone_code'] = statePhoneCode;
    data['state_shipping_status'] = stateShippingStatus;
    return data;
  }
}

class CitiesData {
  int? cityId;
  String? countryCode;
  String? stateCode;
  String? cityName;
  String? cityCode;
  int? cityShippingStatus;

  CitiesData(
      {this.cityId,
      this.countryCode,
      this.stateCode,
      this.cityName,
      this.cityCode,
      this.cityShippingStatus});

  CitiesData.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    countryCode = json['country_code'];
    stateCode = json['state_code'];
    cityName = json['city_name'];
    cityCode = json['city_code'];
    cityShippingStatus = json['city_shipping_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city_id'] = cityId;
    data['country_code'] = countryCode;
    data['state_code'] = stateCode;
    data['city_name'] = cityName;
    data['city_code'] = cityCode;
    data['city_shipping_status'] = cityShippingStatus;
    return data;
  }
}
