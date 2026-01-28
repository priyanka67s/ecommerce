// class ViewProfileModel {
//   String? status;
//   Vendordata? vendordata;
//   String? message;
//   String? vendorPermission;
//   String? isOwner;

//   ViewProfileModel(
//       {this.status,
//       this.vendordata,
//       this.message,
//       this.vendorPermission,
//       this.isOwner});

//   ViewProfileModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     vendordata = json['vendordata'] != null
//         ? new Vendordata.fromJson(json['vendordata'])
//         : null;
//     message = json['message'];
//     vendorPermission = json['vendor_permission'];
//     isOwner = json['is_owner'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.vendordata != null) {
//       data['vendordata'] = this.vendordata!.toJson();
//     }
//     data['message'] = this.message;
//     data['vendor_permission'] = this.vendorPermission;
//     data['is_owner'] = this.isOwner;
//     return data;
//   }
// }

// class Vendordata {
//   int? id;
//   int? status;
//   String? name;
//   String? lastName;
//   String? emailid;
//   String? countryCode;
//   String? phone;
//   String? password;
//   dynamic emaillogin;
//   String? address1;
//   String? address2;
//   String? city;
//   String? state;
//   String? country;
//   String? pincode;
//   String? pickupLocationId;
//   String? brandname;
//   int? storeType;
//   int? defaultStoreLocationId;
//   String? brandslug;
//   String? brandlogo;
//   String? abourbrand;
//   int? businesstype;
//   String? registernumber;
//   String? website;
//   String? vatnumber;
//   String? gstnumber;
//   String? accountholder;
//   String? accountnumber;
//   String? bankname;
//   String? bankbranch;
//   String? bankcountry;
//   String? swiftcode;
//   dynamic emailverficationcode;
//   dynamic resetcode;
//   int? emailstatus;
//   int? emailupdate;
//   String? devicetoken;
//   dynamic rejectReason;
//   String? createdtime;
//   String? updatedtime;
//   String? additionalFields;
//   String? imageUrl;

//   Vendordata(
//       {this.id,
//       this.status,
//       this.name,
//       this.lastName,
//       this.emailid,
//       this.countryCode,
//       this.phone,
//       this.password,
//       this.emaillogin,
//       this.address1,
//       this.address2,
//       this.city,
//       this.state,
//       this.country,
//       this.pincode,
//       this.pickupLocationId,
//       this.brandname,
//       this.storeType,
//       this.defaultStoreLocationId,
//       this.brandslug,
//       this.brandlogo,
//       this.abourbrand,
//       this.businesstype,
//       this.registernumber,
//       this.website,
//       this.vatnumber,
//       this.gstnumber,
//       this.accountholder,
//       this.accountnumber,
//       this.bankname,
//       this.bankbranch,
//       this.bankcountry,
//       this.swiftcode,
//       this.emailverficationcode,
//       this.resetcode,
//       this.emailstatus,
//       this.emailupdate,
//       this.devicetoken,
//       this.rejectReason,
//       this.createdtime,
//       this.updatedtime,
//       this.additionalFields,
//       this.imageUrl});

//   Vendordata.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     status = json['status'];
//     name = json['name'];
//     lastName = json['last_name'];
//     emailid = json['emailid'];
//     countryCode = json['country_code'];
//     phone = json['phone'];
//     password = json['password'];
//     emaillogin = json['emaillogin'];
//     address1 = json['address1'];
//     address2 = json['address2'];
//     city = json['city'];
//     state = json['state'];
//     country = json['country'];
//     pincode = json['pincode'];
//     pickupLocationId = json['pickup_location_id'];
//     brandname = json['brandname'];
//     storeType = json['store_type'];
//     defaultStoreLocationId = json['default_store_location_id'];
//     brandslug = json['brandslug'];
//     brandlogo = json['brandlogo'];
//     abourbrand = json['abourbrand'];
//     businesstype = json['businesstype'];
//     registernumber = json['registernumber'];
//     website = json['website'];
//     vatnumber = json['vatnumber'];
//     gstnumber = json['gstnumber'];
//     accountholder = json['accountholder'];
//     accountnumber = json['accountnumber'];
//     bankname = json['bankname'];
//     bankbranch = json['bankbranch'];
//     bankcountry = json['bankcountry'];
//     swiftcode = json['swiftcode'];
//     emailverficationcode = json['emailverficationcode'];
//     resetcode = json['resetcode'];
//     emailstatus = json['emailstatus'];
//     emailupdate = json['emailupdate'];
//     devicetoken = json['devicetoken'];
//     rejectReason = json['reject_reason'];
//     createdtime = json['createdtime'];
//     updatedtime = json['updatedtime'];
//     additionalFields = json['additional_fields'];
//     imageUrl = json['image_url'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['status'] = this.status;
//     data['name'] = this.name;
//     data['last_name'] = this.lastName;
//     data['emailid'] = this.emailid;
//     data['country_code'] = this.countryCode;
//     data['phone'] = this.phone;
//     data['password'] = this.password;
//     data['emaillogin'] = this.emaillogin;
//     data['address1'] = this.address1;
//     data['address2'] = this.address2;
//     data['city'] = this.city;
//     data['state'] = this.state;
//     data['country'] = this.country;
//     data['pincode'] = this.pincode;
//     data['pickup_location_id'] = this.pickupLocationId;
//     data['brandname'] = this.brandname;
//     data['store_type'] = this.storeType;
//     data['default_store_location_id'] = this.defaultStoreLocationId;
//     data['brandslug'] = this.brandslug;
//     data['brandlogo'] = this.brandlogo;
//     data['abourbrand'] = this.abourbrand;
//     data['businesstype'] = this.businesstype;
//     data['registernumber'] = this.registernumber;
//     data['website'] = this.website;
//     data['vatnumber'] = this.vatnumber;
//     data['gstnumber'] = this.gstnumber;
//     data['accountholder'] = this.accountholder;
//     data['accountnumber'] = this.accountnumber;
//     data['bankname'] = this.bankname;
//     data['bankbranch'] = this.bankbranch;
//     data['bankcountry'] = this.bankcountry;
//     data['swiftcode'] = this.swiftcode;
//     data['emailverficationcode'] = this.emailverficationcode;
//     data['resetcode'] = this.resetcode;
//     data['emailstatus'] = this.emailstatus;
//     data['emailupdate'] = this.emailupdate;
//     data['devicetoken'] = this.devicetoken;
//     data['reject_reason'] = this.rejectReason;
//     data['createdtime'] = this.createdtime;
//     data['updatedtime'] = this.updatedtime;
//     data['additional_fields'] = this.additionalFields;
//     data['image_url'] = this.imageUrl;
//     return data;
//   }
// }
class ViewProfileModel {
  String? status;
  Vendordata? vendordata;
  String? message;
  String? vendorPermission;
  String? isOwner;

  ViewProfileModel(
      {this.status,
      this.vendordata,
      this.message,
      this.vendorPermission,
      this.isOwner});

  ViewProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    vendordata = json['vendordata'] != null
        ? Vendordata.fromJson(json['vendordata'])
        : null;
    message = json['message'];
    vendorPermission = json['vendor_permission'];
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (vendordata != null) {
      data['vendordata'] = vendordata!.toJson();
    }
    data['message'] = message;
    data['vendor_permission'] = vendorPermission;
    data['is_owner'] = isOwner;
    return data;
  }
}

class Vendordata {
  int? id;
  int? status;
  String? name;
  String? lastName;
  String? emailid;
  String? countryCode;
  String? phone;
  String? password;
  dynamic emaillogin;
  String? address;
  String? address2;
  String? city;
  String? state;
  String? country;
  String? pincode;
  String? pickupLocationId;
  String? brandname;
  int? storeType;
  int? defaultStoreLocationId;
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
  dynamic rejectReason;
  String? createdtime;
  String? updatedtime;
  String? additionalFields;
  dynamic storebanner;
  dynamic panCard;
  String? imageUrl;

  Vendordata(
      {this.id,
      this.status,
      this.name,
      this.lastName,
      this.emailid,
      this.countryCode,
      this.phone,
      this.password,
      this.emaillogin,
      this.address,
      this.address2,
      this.city,
      this.state,
      this.country,
      this.pincode,
      this.pickupLocationId,
      this.brandname,
      this.storeType,
      this.defaultStoreLocationId,
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
      this.rejectReason,
      this.createdtime,
      this.updatedtime,
      this.additionalFields,
      this.storebanner,
      this.panCard,
      this.imageUrl});

  Vendordata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    name = json['name'];
    lastName = json['last_name'];
    emailid = json['emailid'];
    countryCode = json['country_code'];
    phone = json['phone'];
    password = json['password'];
    emaillogin = json['emaillogin'];
    address = json['address'];
    address2 = json['address2'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    pincode = json['pincode'];
    pickupLocationId = json['pickup_location_id'];
    brandname = json['brandname'];
    storeType = json['store_type'];
    defaultStoreLocationId = json['default_store_location_id'];
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
    rejectReason = json['reject_reason'];
    createdtime = json['createdtime'];
    updatedtime = json['updatedtime'];
    additionalFields = json['additional_fields'];
    storebanner = json['storebanner'];
    panCard = json['pan_card'];
    imageUrl = json['image_url'];
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
    data['address'] = address;
    data['address2'] = address2;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['pincode'] = pincode;
    data['pickup_location_id'] = pickupLocationId;
    data['brandname'] = brandname;
    data['store_type'] = storeType;
    data['default_store_location_id'] = defaultStoreLocationId;
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
    data['reject_reason'] = rejectReason;
    data['createdtime'] = createdtime;
    data['updatedtime'] = updatedtime;
    data['additional_fields'] = additionalFields;
    data['storebanner'] = storebanner;
    data['pan_card'] = panCard;
    data['image_url'] = imageUrl;
    return data;
  }
}
