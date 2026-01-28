class OtpVendorResponse {
  final String? status;
  final String? message;
  final OtpDetails? otpDetails;
  final VendorDetails? vendorDetails;

  OtpVendorResponse({
    this.status,
    this.message,
    this.otpDetails,
    this.vendorDetails,
  });

  factory OtpVendorResponse.fromJson(Map<String, dynamic> json) {
    return OtpVendorResponse(
      status: json['status'],
      message: json['message'],
      otpDetails: json['otpDetails'] != null 
          ? OtpDetails.fromJson(json['otpDetails']) 
          : null,
      vendorDetails: json['vendorDetails'] != null 
          ? VendorDetails.fromJson(json['vendorDetails']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'otpDetails': otpDetails?.toJson(),
      'vendorDetails': vendorDetails?.toJson(),
    };
  }
}

class OtpDetails {
  final int? otpid;
  final String? otpFor;
  final String? otpcode;
  final String? phoneNo;
  final String? mobilenumber;
  final String? emailId;
  final int? otpStatus;
  final DateTime? otpCreated;
  final DateTime? otpUpdated;

  OtpDetails({
    this.otpid,
    this.otpFor,
    this.otpcode,
    this.phoneNo,
    this.mobilenumber,
    this.emailId,
    this.otpStatus,
    this.otpCreated,
    this.otpUpdated,
  });

  factory OtpDetails.fromJson(Map<String, dynamic> json) {
    return OtpDetails(
      otpid: json['otpid'],
      otpFor: json['otp_for'],
      otpcode: json['otpcode'],
      phoneNo: json['phone_no'],
      mobilenumber: json['mobilenumber'],
      emailId: json['email_id'],
      otpStatus: json['otp_status'],
      otpCreated: json['otp_created'] != null ? DateTime.parse(json['otp_created']) : null,
      otpUpdated: json['otp_updated'] != null ? DateTime.parse(json['otp_updated']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'otpid': otpid,
      'otp_for': otpFor,
      'otpcode': otpcode,
      'phone_no': phoneNo,
      'mobilenumber': mobilenumber,
      'email_id': emailId,
      'otp_status': otpStatus,
      'otp_created': otpCreated?.toIso8601String(),
      'otp_updated': otpUpdated?.toIso8601String(),
    };
  }
}

class VendorDetails {
  final int? id;
  final int? status;
  final String? name;
  final String? lastName;
  final String? emailid;
  final String? countryCode;
  final String? phone;
  final String? password;
  final String? emaillogin;
  final String? address;
  final String? address2;
  final String? city;
  final String? state;
  final String? country;
  final String? pincode;
  final String? pickupLocationId;
  final String? brandname;
  final int? storeType;
  final int? defaultStoreLocationId;
  final String? brandslug;
  final String? brandlogo;
  final String? abourbrand;
  final int? businesstype;
  final String? registernumber;
  final String? website;
  final String? vatnumber;
  final String? gstnumber;
  final String? accountholder;
  final String? accountnumber;
  final String? bankname;
  final String? bankbranch;
  final String? bankcountry;
  final String? swiftcode;
  final String? emailverficationcode;
  final String? resetcode;
  final int? emailstatus;
  final int? emailupdate;
  final String? devicetoken;
  final String? rejectReason;
  final DateTime? createdtime;
  final DateTime? updatedtime;
  final String? additionalFields;
  final String? storebanner;
  final String? panCard;

  VendorDetails({
    this.id,
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
  });

  factory VendorDetails.fromJson(Map<String, dynamic> json) {
    return VendorDetails(
      id: json['id'],
      status: json['status'],
      name: json['name'],
      lastName: json['last_name'],
      emailid: json['emailid'],
      countryCode: json['country_code'],
      phone: json['phone'],
      password: json['password'],
      emaillogin: json['emaillogin'],
      address: json['address'],
      address2: json['address2'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      pincode: json['pincode'],
      pickupLocationId: json['pickup_location_id']?.toString(),
      brandname: json['brandname'],
      storeType: json['store_type'],
      defaultStoreLocationId: json['default_store_location_id'],
      brandslug: json['brandslug'],
      brandlogo: json['brandlogo'],
      abourbrand: json['abourbrand'],
      businesstype: json['businesstype'],
      registernumber: json['registernumber'],
      website: json['website'],
      vatnumber: json['vatnumber'],
      gstnumber: json['gstnumber'],
      accountholder: json['accountholder'],
      accountnumber: json['accountnumber'],
      bankname: json['bankname'],
      bankbranch: json['bankbranch'],
      bankcountry: json['bankcountry'],
      swiftcode: json['swiftcode'],
      emailverficationcode: json['emailverficationcode'],
      resetcode: json['resetcode'],
      emailstatus: json['emailstatus'],
      emailupdate: json['emailupdate'],
      devicetoken: json['devicetoken'],
      rejectReason: json['reject_reason'],
      createdtime: json['createdtime'] != null ? DateTime.parse(json['createdtime']) : null,
      updatedtime: json['updatedtime'] != null ? DateTime.parse(json['updatedtime']) : null,
      additionalFields: json['additional_fields'],
      storebanner: json['storebanner'],
      panCard: json['pan_card'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'name': name,
      'last_name': lastName,
      'emailid': emailid,
      'country_code': countryCode,
      'phone': phone,
      'password': password,
      'emaillogin': emaillogin,
      'address': address,
      'address2': address2,
      'city': city,
      'state': state,
      'country': country,
      'pincode': pincode,
      'pickup_location_id': pickupLocationId,
      'brandname': brandname,
      'store_type': storeType,
      'default_store_location_id': defaultStoreLocationId,
      'brandslug': brandslug,
      'brandlogo': brandlogo,
      'abourbrand': abourbrand,
      'businesstype': businesstype,
      'registernumber': registernumber,
      'website': website,
      'vatnumber': vatnumber,
      'gstnumber': gstnumber,
      'accountholder': accountholder,
      'accountnumber': accountnumber,
      'bankname': bankname,
      'bankbranch': bankbranch,
      'bankcountry': bankcountry,
      'swiftcode': swiftcode,
      'emailverficationcode': emailverficationcode,
      'resetcode': resetcode,
      'emailstatus': emailstatus,
      'emailupdate': emailupdate,
      'devicetoken': devicetoken,
      'reject_reason': rejectReason,
      'createdtime': createdtime?.toIso8601String(),
      'updatedtime': updatedtime?.toIso8601String(),
      'additional_fields': additionalFields,
      'storebanner': storebanner,
      'pan_card': panCard,
    };
  }
}
