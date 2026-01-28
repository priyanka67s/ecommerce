class ViewPaidPayoutModel {
  String? status;
  String? message;
  List<Result>? result;
  String? vendorPermission;
  String? isOwner;

  ViewPaidPayoutModel(
      {this.status,
      this.message,
      this.result,
      this.vendorPermission,
      this.isOwner});

  ViewPaidPayoutModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
    vendorPermission = json['vendor_permission'];
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['vendor_permission'] = vendorPermission;
    data['is_owner'] = isOwner;
    return data;
  }
}

class Result {
  String? processId;
  String? processed;
  int? totalpayouts;

  Result({this.processId, this.processed, this.totalpayouts});

  Result.fromJson(Map<String, dynamic> json) {
    processId = json['process_id'];
    processed = json['processed'];
    totalpayouts = json['Totalpayouts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['process_id'] = processId;
    data['processed'] = processed;
    data['Totalpayouts'] = totalpayouts;
    return data;
  }
}
