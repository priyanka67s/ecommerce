class DeleteOrderNoteModel {
  String? status;
  String? message;
  String? vendorPermission;
  String? isOwner;

  DeleteOrderNoteModel(
      {this.status, this.message, this.vendorPermission, this.isOwner});

  DeleteOrderNoteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    vendorPermission = json['vendor_permission'];
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['vendor_permission'] = vendorPermission;
    data['is_owner'] = isOwner;
    return data;
  }
}
