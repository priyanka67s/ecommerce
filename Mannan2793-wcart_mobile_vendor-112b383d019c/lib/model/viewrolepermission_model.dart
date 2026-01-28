class ViewRolePermissionModel {
  String? status;
  String? message;
  List<ViewRole>? viewRole;
  List<ViewRolePermission>? viewRolePermission;
  String? vendorPermission;
  String? isOwner;

  ViewRolePermissionModel(
      {this.status,
      this.message,
      this.viewRole,
      this.viewRolePermission,
      this.vendorPermission,
      this.isOwner});

  ViewRolePermissionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['view_role'] != null) {
      viewRole = <ViewRole>[];
      json['view_role'].forEach((v) {
        viewRole!.add(ViewRole.fromJson(v));
      });
    }
    if (json['view_role_permission'] != null) {
      viewRolePermission = <ViewRolePermission>[];
      json['view_role_permission'].forEach((v) {
        viewRolePermission!.add(ViewRolePermission.fromJson(v));
      });
    }
    vendorPermission = json['vendor_permission'];
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (viewRole != null) {
      data['view_role'] = viewRole!.map((v) => v.toJson()).toList();
    }
    if (viewRolePermission != null) {
      data['view_role_permission'] =
          viewRolePermission!.map((v) => v.toJson()).toList();
    }
    data['vendor_permission'] = vendorPermission;
    data['is_owner'] = isOwner;
    return data;
  }
}

class ViewRole {
  int? staffRoleId;
  String? roleName;
  int? vendorId;

  ViewRole({this.staffRoleId, this.roleName, this.vendorId});

  ViewRole.fromJson(Map<String, dynamic> json) {
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

class ViewRolePermission {
  int? permissionId;
  String? permissionName;
  int? ssrpid;
  int? staffRoleId;
  int? perView;
  int? perCreate;
  int? perEdit;
  int? perDelete;
  bool? isSelected;

  ViewRolePermission(
      {this.permissionId,
      this.permissionName,
      this.ssrpid,
      this.staffRoleId,
      this.perView,
      this.perCreate,
      this.perEdit,
      this.perDelete});

  ViewRolePermission.fromJson(Map<String, dynamic> json) {
    permissionId = json['permission_id'];
    permissionName = json['permission_name'];
    ssrpid = json['ssrpid'];
    staffRoleId = json['staff_role_id'];
    perView = json['per_view'];
    perCreate = json['per_create'];
    perEdit = json['per_edit'];
    perDelete = json['per_delete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['permission_id'] = permissionId;
    data['permission_name'] = permissionName;
    data['ssrpid'] = ssrpid;
    data['staff_role_id'] = staffRoleId;
    data['per_view'] = perView;
    data['per_create'] = perCreate;
    data['per_edit'] = perEdit;
    data['per_delete'] = perDelete;
    return data;
  }
}
