class ViewRolesModel {
  String? status;
  String? message;
  List<Roles>? roles;
  String? vendorPermission;
  String? isOwner;

  ViewRolesModel(
      {this.status,
      this.message,
      this.roles,
      this.vendorPermission,
      this.isOwner});

  ViewRolesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
    vendorPermission = json['vendor_permission'];
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    data['vendor_permission'] = vendorPermission;
    data['is_owner'] = isOwner;
    return data;
  }
}

class Roles {
  int? staffRoleId;
  String? roleName;
  int? vendorId;

  Roles({this.staffRoleId, this.roleName, this.vendorId});

  Roles.fromJson(Map<String, dynamic> json) {
    staffRoleId = json['staff_role_id'];
    roleName = json['role_name'];
    vendorId = json['vendor_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['staff_role_id'] = staffRoleId;
    data['role_name'] = roleName;
    data['vendor_id'] = vendorId;
    return data;
  }
}
