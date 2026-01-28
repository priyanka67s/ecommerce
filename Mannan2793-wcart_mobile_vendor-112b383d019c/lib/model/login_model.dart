class LoginModel {
  String? status;
  String? message;
  VendorDetails? vendorDetails;

  LoginModel({this.status, this.message, this.vendorDetails});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    vendorDetails = json['vendorDetails'] != null
        ? VendorDetails.fromJson(json['vendorDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (vendorDetails != null) {
      data['vendorDetails'] = vendorDetails!.toJson();
    }
    return data;
  }
}

class VendorDetails {
  int? id;
  int? status;
  String? name;
  String? lastName;
  String? emailid;
  String? countryCode;
  String? phone;
  String? password;
  dynamic emaillogin;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? country;
  String? pincode;
  String? pickupLocationId;
  String? brandname;
  String? brandslug;
  String? brandlogo;
  String? abourbrand;
  int? businesstype;
  String? registernumber;
  String? website;
  String? vatnumber;
  String? gstnumber;
  String? accountholder;
  String? accountnumber;
  String? bankname;
  String? bankbranch;
  String? bankcountry;
  String? swiftcode;
  dynamic emailverficationcode;
  dynamic resetcode;
  int? emailstatus;
  int? emailupdate;
  String? devicetoken;
  String? createdtime;
  String? updatedtime;
  String? keytype;
  String? servicekey;
  int? vendorid;
  int? loginStatus;

  VendorDetails(
      {this.id,
      this.status,
      this.name,
      this.lastName,
      this.emailid,
      this.countryCode,
      this.phone,
      this.password,
      this.emaillogin,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.country,
      this.pincode,
      this.pickupLocationId,
      this.brandname,
      this.brandslug,
      this.brandlogo,
      this.abourbrand,
      this.businesstype,
      this.registernumber,
      this.website,
      this.vatnumber,
      this.gstnumber,
      this.accountholder,
      this.accountnumber,
      this.bankname,
      this.bankbranch,
      this.bankcountry,
      this.swiftcode,
      this.emailverficationcode,
      this.resetcode,
      this.emailstatus,
      this.emailupdate,
      this.devicetoken,
      this.createdtime,
      this.updatedtime,
      this.keytype,
      this.servicekey,
      this.vendorid,
      this.loginStatus});

  VendorDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    name = json['name'];
    lastName = json['last_name'];
    emailid = json['emailid'];
    countryCode = json['country_code'];
    phone = json['phone'];
    password = json['password'];
    emaillogin = json['emaillogin'];
    address1 = json['address1'];
    address2 = json['address2'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    pincode = json['pincode'];
    pickupLocationId = json['pickup_location_id'];
    brandname = json['brandname'];
    brandslug = json['brandslug'];
    brandlogo = json['brandlogo'];
    abourbrand = json['abourbrand'];
    businesstype = json['businesstype'];
    registernumber = json['registernumber'];
    website = json['website'];
    vatnumber = json['vatnumber'];
    gstnumber = json['gstnumber'];
    accountholder = json['accountholder'];
    accountnumber = json['accountnumber'];
    bankname = json['bankname'];
    bankbranch = json['bankbranch'];
    bankcountry = json['bankcountry'];
    swiftcode = json['swiftcode'];
    emailverficationcode = json['emailverficationcode'];
    resetcode = json['resetcode'];
    emailstatus = json['emailstatus'];
    emailupdate = json['emailupdate'];
    devicetoken = json['devicetoken'];
    createdtime = json['createdtime'];
    updatedtime = json['updatedtime'];
    keytype = json['keytype'];
    servicekey = json['servicekey'];
    vendorid = json['vendorid'];
    loginStatus = json['login_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['name'] = name;
    data['last_name'] = lastName;
    data['emailid'] = emailid;
    data['country_code'] = countryCode;
    data['phone'] = phone;
    data['password'] = password;
    data['emaillogin'] = emaillogin;
    data['address1'] = address1;
    data['address2'] = address2;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['pincode'] = pincode;
    data['pickup_location_id'] = pickupLocationId;
    data['brandname'] = brandname;
    data['brandslug'] = brandslug;
    data['brandlogo'] = brandlogo;
    data['abourbrand'] = abourbrand;
    data['businesstype'] = businesstype;
    data['registernumber'] = registernumber;
    data['website'] = website;
    data['vatnumber'] = vatnumber;
    data['gstnumber'] = gstnumber;
    data['accountholder'] = accountholder;
    data['accountnumber'] = accountnumber;
    data['bankname'] = bankname;
    data['bankbranch'] = bankbranch;
    data['bankcountry'] = bankcountry;
    data['swiftcode'] = swiftcode;
    data['emailverficationcode'] = emailverficationcode;
    data['resetcode'] = resetcode;
    data['emailstatus'] = emailstatus;
    data['emailupdate'] = emailupdate;
    data['devicetoken'] = devicetoken;
    data['createdtime'] = createdtime;
    data['updatedtime'] = updatedtime;
    data['keytype'] = keytype;
    data['servicekey'] = servicekey;
    data['vendorid'] = vendorid;
    data['login_status'] = loginStatus;
    return data;
  }
}
