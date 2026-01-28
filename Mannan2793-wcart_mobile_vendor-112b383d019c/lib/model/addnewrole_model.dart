class AddStaffRoleModel {
  String? status;
  String? message;
  int? staffRoleId;

  AddStaffRoleModel({this.status, this.message, this.staffRoleId});

  AddStaffRoleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    staffRoleId = json['staff_role_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['staff_role_id'] = staffRoleId;
    return data;
  }
}
