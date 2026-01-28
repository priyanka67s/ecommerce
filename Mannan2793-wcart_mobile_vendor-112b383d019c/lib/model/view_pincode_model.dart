class ViewZipCodeModel {
  bool? status;
  PinCodeDetails? viewPincode;
  List<CountryData>? countriesData;
  List<StateData>? statesData;
  List<CityData>? citiesData;
  String? message;
  // Filtered data
  CountryData? filteredCountry;
  StateData? filteredState;
  CityData? filteredCity;

  ViewZipCodeModel({
    this.status,
    this.viewPincode,
    this.countriesData,
    this.statesData,
    this.citiesData,
    this.message,
  });

  ViewZipCodeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] == "true";
    viewPincode = json['view_pincode'] != null
        ? PinCodeDetails.fromJson(json['view_pincode'])
        : null;
    if (json['countries_data'] != null) {
      countriesData = <CountryData>[];
      json['countries_data'].forEach((v) {
        countriesData!.add(CountryData.fromJson(v));
      });
    }
    if (json['states_data'] != null) {
      statesData = <StateData>[];
      json['states_data'].forEach((v) {
        statesData!.add(StateData.fromJson(v));
      });
    }
    if (json['cities_data'] != null) {
      citiesData = <CityData>[];
      json['cities_data'].forEach((v) {
        citiesData!.add(CityData.fromJson(v));
      });
    }
    message = json['message'];

    // Filter data based on pincode details
    if (viewPincode != null) {
      filterData();
    }
  }

  void filterData() {
    // Filter country
    filteredCountry = countriesData?.firstWhere(
      (country) => country.countryCode == viewPincode?.countryCode,
      orElse: () => CountryData(),
    );

    // Filter state
    filteredState = statesData?.firstWhere(
      (state) => state.stateCode == viewPincode?.stateCode,
      orElse: () => StateData(),
    );

    // Filter city
    filteredCity = citiesData?.firstWhere(
      (city) => city.cityCode == viewPincode?.cityCode,
      orElse: () => CityData(),
    );
  }
}

class PinCodeDetails {
  int? pincodeId;
  String? pincode;
  int? pincodeStatus;
  String? countryCode;
  String? stateCode;
  String? cityCode;
  int? deliveryDays;
  int? pincodeCodStatus;

  PinCodeDetails({
    this.pincodeId,
    this.pincode,
    this.pincodeStatus,
    this.countryCode,
    this.stateCode,
    this.cityCode,
    this.deliveryDays,
    this.pincodeCodStatus,
  });

  PinCodeDetails.fromJson(Map<String, dynamic> json) {
    pincodeId = json['pincode_id'];
    pincode = json['pincode'];
    pincodeStatus = json['pincode_status'];
    countryCode = json['country_code'];
    stateCode = json['state_code'];
    cityCode = json['city_code'];
    deliveryDays = json['delivery_days'];
    pincodeCodStatus = json['pincode_cod_status'];
  }
}

class CountryData {
  int? countryId;
  String? countryName;
  String? countryCode;
  String? countryPhoneCode;
  int? countryShippingStatus;

  CountryData({
    this.countryId,
    this.countryName,
    this.countryCode,
    this.countryPhoneCode,
    this.countryShippingStatus,
  });

  CountryData.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    countryName = json['country_name'];
    countryCode = json['country_code'];
    countryPhoneCode = json['country_phone_code'];
    countryShippingStatus = json['country_shipping_status'];
  }
}

class StateData {
  int? stateId;
  String? countryCode;
  String? stateName;
  String? stateCode;
  String? statePhoneCode;
  int? stateShippingStatus;

  StateData({
    this.stateId,
    this.countryCode,
    this.stateName,
    this.stateCode,
    this.statePhoneCode,
    this.stateShippingStatus,
  });

  StateData.fromJson(Map<String, dynamic> json) {
    stateId = json['state_id'];
    countryCode = json['country_code'];
    stateName = json['state_name'];
    stateCode = json['state_code'];
    statePhoneCode = json['state_phone_code'];
    stateShippingStatus = json['state_shipping_status'];
  }
}

class CityData {
  int? cityId;
  String? countryCode;
  String? stateCode;
  String? cityName;
  String? cityCode;
  int? cityShippingStatus;

  CityData({
    this.cityId,
    this.countryCode,
    this.stateCode,
    this.cityName,
    this.cityCode,
    this.cityShippingStatus,
  });

  CityData.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    countryCode = json['country_code'];
    stateCode = json['state_code'];
    cityName = json['city_name'];
    cityCode = json['city_code'];
    cityShippingStatus = json['city_shipping_status'];
  }
}
