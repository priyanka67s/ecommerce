class ViewPermissionModel {
  String? status;
  String? message;
  List<Permissions>? permissions;
  String? vendorPermission;
  String? isOwner;

  ViewPermissionModel(
      {this.status,
      this.message,
      this.permissions,
      this.vendorPermission,
      this.isOwner});

  ViewPermissionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['permissions'] != null) {
      permissions = <Permissions>[];
      json['permissions'].forEach((v) {
        permissions!.add(Permissions.fromJson(v));
      });
    }
    vendorPermission = json['vendor_permission'];
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (permissions != null) {
      data['permissions'] = permissions!.map((v) => v.toJson()).toList();
    }
    data['vendor_permission'] = vendorPermission;
    data['is_owner'] = isOwner;
    return data;
  }
}

class Permissions {
  int? permissionId;
  String? permissionName;

  Permissions({this.permissionId, this.permissionName});

  Permissions.fromJson(Map<String, dynamic> json) {
    permissionId = json['permission_id'];
    permissionName = json['permission_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['permission_id'] = permissionId;
    data['permission_name'] = permissionName;
    return data;
  }
}
