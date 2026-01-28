class RewardTransactionHistoryModel {
  String? status;
  String? message;
  List<Null>? rewardTransactionsHistory;
  RewardPointData? rewardPointData;

  RewardTransactionHistoryModel(
      {this.status,
      this.message,
      this.rewardTransactionsHistory,
      this.rewardPointData});

  RewardTransactionHistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['reward_transactions_history'] != null) {
      rewardTransactionsHistory = <Null>[];
      // json['reward_transactions_history'].forEach((v) {
      //   rewardTransactionsHistory!.add(Null.fromJson(v));
      // });
    }
    rewardPointData = json['reward_point_data'] != null
        ? RewardPointData.fromJson(json['reward_point_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    // if (this.rewardTransactionsHistory != null) {
    //   data['reward_transactions_history'] =
    //       this.rewardTransactionsHistory!.map((v) => v?.toJson()).toList();
    // }
    if (rewardPointData != null) {
      data['reward_point_data'] = rewardPointData!.toJson();
    }
    return data;
  }
}

class RewardPointData {
  int? earnPoints;
  int? remainingPoints;
  String? expiredDate;

  RewardPointData({this.earnPoints, this.remainingPoints, this.expiredDate});

  RewardPointData.fromJson(Map<String, dynamic> json) {
    earnPoints = json['earn_points'];
    remainingPoints = json['remaining_points'];
    expiredDate = json['expired_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['earn_points'] = earnPoints;
    data['remaining_points'] = remainingPoints;
    data['expired_date'] = expiredDate;
    return data;
  }
}
