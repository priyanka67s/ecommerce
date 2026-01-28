class RewardPointClaimedModel {
  String? status;
  String? message;
  Pricedata? pricedata;
  int? redeemPoint;
  int? redeemAmount;
  int? availableRewardPoint;
  List<RedeemEntries>? redeemEntries;

  RewardPointClaimedModel(
      {this.status,
      this.message,
      this.pricedata,
      this.redeemPoint,
      this.redeemAmount,
      this.availableRewardPoint,
      this.redeemEntries});

  RewardPointClaimedModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    pricedata = json['pricedata'] != null
        ? Pricedata.fromJson(json['pricedata'])
        : null;
    redeemPoint = json['redeem_point'];
    redeemAmount = json['redeem_amount'];
    availableRewardPoint = json['available_reward_point'];
    if (json['redeem_entries'] != null) {
      redeemEntries = <RedeemEntries>[];
      json['redeem_entries'].forEach((v) {
        redeemEntries!.add(RedeemEntries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (pricedata != null) {
      data['pricedata'] = pricedata!.toJson();
    }
    data['redeem_point'] = redeemPoint;
    data['redeem_amount'] = redeemAmount;
    data['available_reward_point'] = availableRewardPoint;
    if (redeemEntries != null) {
      data['redeem_entries'] =
          redeemEntries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pricedata {
  int? subtotal1;
  int? shipping;
  int? carttotal;
  int? downloadableProduct;
  int? taxvalue;
  String? tax;
  String? taxName;
  int? subtotal2;
  String? couponCode;
  int? couponAmount;
  int? redeemPoint;
  int? redeemAmount;
  String? rewardPointDisplayText;
  int? maxRedeemPointPerOrder;
  int? availableRewardPoints;

  Pricedata(
      {this.subtotal1,
      this.shipping,
      this.carttotal,
      this.downloadableProduct,
      this.taxvalue,
      this.tax,
      this.taxName,
      this.subtotal2,
      this.couponCode,
      this.couponAmount,
      this.redeemPoint,
      this.redeemAmount,
      this.rewardPointDisplayText,
      this.maxRedeemPointPerOrder,
      this.availableRewardPoints});

  Pricedata.fromJson(Map<String, dynamic> json) {
    subtotal1 = json['subtotal1'];
    shipping = json['shipping'];
    carttotal = json['carttotal'];
    downloadableProduct = json['downloadable_product'];
    taxvalue = json['taxvalue'];
    tax = json['tax'];
    taxName = json['tax_name'];
    subtotal2 = json['subtotal2'];
    couponCode = json['coupon_code'];
    couponAmount = json['coupon_amount'];
    redeemPoint = json['redeem_point'];
    redeemAmount = json['redeem_amount'];
    rewardPointDisplayText = json['reward_point_display_text'];
    maxRedeemPointPerOrder = json['max_redeem_point_per_order'];
    availableRewardPoints = json['available_reward_points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subtotal1'] = subtotal1;
    data['shipping'] = shipping;
    data['carttotal'] = carttotal;
    data['downloadable_product'] = downloadableProduct;
    data['taxvalue'] = taxvalue;
    data['tax'] = tax;
    data['tax_name'] = taxName;
    data['subtotal2'] = subtotal2;
    data['coupon_code'] = couponCode;
    data['coupon_amount'] = couponAmount;
    data['redeem_point'] = redeemPoint;
    data['redeem_amount'] = redeemAmount;
    data['reward_point_display_text'] = rewardPointDisplayText;
    data['max_redeem_point_per_order'] = maxRedeemPointPerOrder;
    data['available_reward_points'] = availableRewardPoints;
    return data;
  }
}

class RedeemEntries {
  int? entryId;
  int? remainingPoints;
  int? usedPoints;

  RedeemEntries({this.entryId, this.remainingPoints, this.usedPoints});

  RedeemEntries.fromJson(Map<String, dynamic> json) {
    entryId = json['entry_id'];
    remainingPoints = json['remaining_points'];
    usedPoints = json['used_points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['entry_id'] = entryId;
    data['remaining_points'] = remainingPoints;
    data['used_points'] = usedPoints;
    return data;
  }
}
