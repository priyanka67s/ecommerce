class ViewPayoutModel {
  String? status;
  List<Result>? result;
  String? message;
  String? vendorPermission;
  String? isOwner;

  ViewPayoutModel(
      {this.status,
      this.result,
      this.message,
      this.vendorPermission,
      this.isOwner});

  ViewPayoutModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
    message = json['message'];
    vendorPermission = json['vendor_permission'];
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['vendor_permission'] = vendorPermission;
    data['is_owner'] = isOwner;
    return data;
  }
}

class Result {
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
  int? vendorid;
  int? orderid;
  String? ordermapid;
  int? orderAmount;
  double? adminCommission;
  double? vendorEarning;
  int? vendorReturnEarning;
  int? paymentStatus;
  String? processId;
  String? processed;
  String? createdNote;
  String? completed;
  double? totalEarning;
  int? totalOrder;

  Result(
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
      this.vendorid,
      this.orderid,
      this.ordermapid,
      this.orderAmount,
      this.adminCommission,
      this.vendorEarning,
      this.vendorReturnEarning,
      this.paymentStatus,
      this.processId,
      this.processed,
      this.createdNote,
      this.completed,
      this.totalEarning,
      this.totalOrder});

  Result.fromJson(Map<String, dynamic> json) {
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
    vendorid = json['vendorid'];
    orderid = json['orderid'];
    ordermapid = json['ordermapid'];
    orderAmount = json['order_amount'];
    adminCommission = json['admin_commission'];
    vendorEarning = json['vendor_earning'];
    vendorReturnEarning = json['vendor_return_earning'];
    paymentStatus = json['payment_status'];
    processId = json['process_id'];
    processed = json['processed'];
    createdNote = json['created_note'];
    completed = json['completed'];
    totalEarning = json['total_earning'];
    totalOrder = json['total_order'];
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
    data['vendorid'] = vendorid;
    data['orderid'] = orderid;
    data['ordermapid'] = ordermapid;
    data['order_amount'] = orderAmount;
    data['admin_commission'] = adminCommission;
    data['vendor_earning'] = vendorEarning;
    data['vendor_return_earning'] = vendorReturnEarning;
    data['payment_status'] = paymentStatus;
    data['process_id'] = processId;
    data['processed'] = processed;
    data['created_note'] = createdNote;
    data['completed'] = completed;
    data['total_earning'] = totalEarning;
    data['total_order'] = totalOrder;
    return data;
  }
}
