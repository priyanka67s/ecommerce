class AddAttributeModel {
  String? status;
  String? message;

  AddAttributeModel({this.status, this.message});

  AddAttributeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
