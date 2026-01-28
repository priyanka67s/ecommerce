class ViewVendorStaffModel {
  String? status;
  String? message;
  List<ViewStaff>? viewStaff;
  String? vendorPermission;
  String? isOwner;

  ViewVendorStaffModel(
      {this.status,
      this.message,
      this.viewStaff,
      this.vendorPermission,
      this.isOwner});

  ViewVendorStaffModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['view_staff'] != null) {
      viewStaff = <ViewStaff>[];
      json['view_staff'].forEach((v) {
        viewStaff!.add(ViewStaff.fromJson(v));
      });
    }
    vendorPermission = json['vendor_permission'];
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (viewStaff != null) {
      data['view_staff'] = viewStaff!.map((v) => v.toJson()).toList();
    }
    data['vendor_permission'] = vendorPermission;
    data['is_owner'] = isOwner;
    return data;
  }
}

class ViewStaff {
  int? storeStaffId;
  String? userName;
  String? profileImage;
  int? staffRoleId;
  String? email;
  String? password;
  int? vendorStoreId;
  int? storeLocationId;
  int? staffType;
  int? active;
  String? roleName;
  int? vendorId;
  String? imageUrl;

  ViewStaff(
      {this.storeStaffId,
      this.userName,
      this.profileImage,
      this.staffRoleId,
      this.email,
      this.password,
      this.vendorStoreId,
      this.storeLocationId,
      this.staffType,
      this.active,
      this.roleName,
      this.vendorId,
      this.imageUrl});

  ViewStaff.fromJson(Map<String, dynamic> json) {
    storeStaffId = json['store_staff_id'];
    userName = json['user_name'];
    profileImage = json['profile_image'];
    staffRoleId = json['staff_role_id'];
    email = json['email'];
    password = json['password'];
    vendorStoreId = json['vendor_store_id'];
    storeLocationId = json['store_location_id'];
    staffType = json['staff_type'];
    active = json['active'];
    roleName = json['role_name'];
    vendorId = json['vendor_id'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['store_staff_id'] = storeStaffId;
    data['user_name'] = userName;
    data['profile_image'] = profileImage;
    data['staff_role_id'] = staffRoleId;
    data['email'] = email;
    data['password'] = password;
    data['vendor_store_id'] = vendorStoreId;
    data['store_location_id'] = storeLocationId;
    data['staff_type'] = staffType;
    data['active'] = active;
    data['role_name'] = roleName;
    data['vendor_id'] = vendorId;
    data['image_url'] = imageUrl;
    return data;
  }
}
