class RewardPointTransactionModel {
  String? status;
  String? message;
  List<RewardTransactions>? rewardTransactions;
  UserDetails? userDetails;

  RewardPointTransactionModel(
      {this.status, this.message, this.rewardTransactions, this.userDetails});

  RewardPointTransactionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['reward_transactions'] != null) {
      rewardTransactions = <RewardTransactions>[];
      json['reward_transactions'].forEach((v) {
        rewardTransactions!.add(RewardTransactions.fromJson(v));
      });
    }
    userDetails = json['userDetails'] != null
        ? UserDetails.fromJson(json['userDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (rewardTransactions != null) {
      data['reward_transactions'] =
          rewardTransactions!.map((v) => v.toJson()).toList();
    }
    if (userDetails != null) {
      data['userDetails'] = userDetails!.toJson();
    }
    return data;
  }
}

class RewardTransactions {
  int? entryId;
  int? userId;
  String? orderId;
  String? ordermapid;
  String? usedOrderId;
  int? earnPoints;
  int? usedPoints;
  int? remainingPoints;
  int? entryType;
  int? pointStatus;
  String? expiredDate;
  String? entryDate;
  String? updatedDate;

  RewardTransactions(
      {this.entryId,
      this.userId,
      this.orderId,
      this.ordermapid,
      this.usedOrderId,
      this.earnPoints,
      this.usedPoints,
      this.remainingPoints,
      this.entryType,
      this.pointStatus,
      this.expiredDate,
      this.entryDate,
      this.updatedDate});

  RewardTransactions.fromJson(Map<String, dynamic> json) {
    entryId = json['entry_id'];
    userId = json['user_id'];
    orderId = json['order_id'];
    ordermapid = json['ordermapid'];
    usedOrderId = json['used_order_id'];
    earnPoints = json['earn_points'];
    usedPoints = json['used_points'];
    remainingPoints = json['remaining_points'];
    entryType = json['entry_type'];
    pointStatus = json['point_status'];
    expiredDate = json['expired_date'];
    entryDate = json['entry_date'];
    updatedDate = json['updated_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['entry_id'] = entryId;
    data['user_id'] = userId;
    data['order_id'] = orderId;
    data['ordermapid'] = ordermapid;
    data['used_order_id'] = usedOrderId;
    data['earn_points'] = earnPoints;
    data['used_points'] = usedPoints;
    data['remaining_points'] = remainingPoints;
    data['entry_type'] = entryType;
    data['point_status'] = pointStatus;
    data['expired_date'] = expiredDate;
    data['entry_date'] = entryDate;
    data['updated_date'] = updatedDate;
    return data;
  }
}

class UserDetails {
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
  dynamic devicetype;
  String? devicetoken;
  String? dob;
  int? gender;
  String? googleid;
  String? facebookid;
  String? emailverificationcode;
  dynamic resetcode;
  int? walletStatus;
  int? walletAmount;
  int? affiliateUser;
  int? affiliateStatus;
  String? affiliateNotes;
  int? availableRewardPoint;
  String? created;
  String? updated;

  UserDetails(
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
      this.walletStatus,
      this.walletAmount,
      this.affiliateUser,
      this.affiliateStatus,
      this.affiliateNotes,
      this.availableRewardPoint,
      this.created,
      this.updated});

  UserDetails.fromJson(Map<String, dynamic> json) {
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
    walletStatus = json['wallet_status'];
    walletAmount = json['wallet_amount'];
    affiliateUser = json['affiliate_user'];
    affiliateStatus = json['affiliate_status'];
    affiliateNotes = json['affiliate_notes'];
    availableRewardPoint = json['available_reward_point'];
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
    data['wallet_status'] = walletStatus;
    data['wallet_amount'] = walletAmount;
    data['affiliate_user'] = affiliateUser;
    data['affiliate_status'] = affiliateStatus;
    data['affiliate_notes'] = affiliateNotes;
    data['available_reward_point'] = availableRewardPoint;
    data['created'] = created;
    data['updated'] = updated;
    return data;
  }
}
