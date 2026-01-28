class ViewCustomerModel {
  String? status;
  String? message;
  List<Customers>? customers;

  ViewCustomerModel({this.status, this.message, this.customers});

  ViewCustomerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['customers'] != null) {
      customers = <Customers>[];
      json['customers'].forEach((v) {
        customers!.add(Customers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (customers != null) {
      data['customers'] = customers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Customers {
  int? id;
  String? userid;
  int? status;
  int? addedby;
  int? addedfrom;
  String? name;
  String? emailId;
  String? phone;
  String? countryCode;
  String? password;
  String? profile;
  int? registertype;
  String? devicetype;
  String? devicetoken;
  String? dob;
  int? gender;
  String? googleid;
  String? facebookid;
  String? emailverificationcode;
  String? resetcode;
  String? created;
  String? updated;

  Customers(
      {this.id,
      this.userid,
      this.status,
      this.addedby,
      this.addedfrom,
      this.name,
      this.emailId,
      this.phone,
      this.countryCode,
      this.password,
      this.profile,
      this.registertype,
      this.devicetype,
      this.devicetoken,
      this.dob,
      this.gender,
      this.googleid,
      this.facebookid,
      this.emailverificationcode,
      this.resetcode,
      this.created,
      this.updated});

  Customers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    status = json['status'];
    addedby = json['addedby'];
    addedfrom = json['addedfrom'];
    name = json['name'];
    emailId = json['email_id'];
    phone = json['phone'];
    countryCode = json['country_code'];
    password = json['password'];
    profile = json['profile'];
    registertype = json['registertype'];
    devicetype = json['devicetype'];
    devicetoken = json['devicetoken'];
    dob = json['dob'];
    gender = json['gender'];
    googleid = json['googleid'];
    facebookid = json['facebookid'];
    emailverificationcode = json['emailverificationcode'];
    resetcode = json['resetcode'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userid'] = userid;
    data['status'] = status;
    data['addedby'] = addedby;
    data['addedfrom'] = addedfrom;
    data['name'] = name;
    data['email_id'] = emailId;
    data['phone'] = phone;
    data['country_code'] = countryCode;
    data['password'] = password;
    data['profile'] = profile;
    data['registertype'] = registertype;
    data['devicetype'] = devicetype;
    data['devicetoken'] = devicetoken;
    data['dob'] = dob;
    data['gender'] = gender;
    data['googleid'] = googleid;
    data['facebookid'] = facebookid;
    data['emailverificationcode'] = emailverificationcode;
    data['resetcode'] = resetcode;
    data['created'] = created;
    data['updated'] = updated;
    return data;
  }
}
