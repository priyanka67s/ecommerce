class StaffLoginModel {
  String? status;
  String? message;
  VendorDetails? vendorDetails;
  List<Rolepermission>? rolepermission;

  StaffLoginModel(
      {this.status, this.message, this.vendorDetails, this.rolepermission});

  StaffLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    vendorDetails = json['vendorDetails'] != null
        ? VendorDetails.fromJson(json['vendorDetails'])
        : null;
    if (json['rolepermission'] != null) {
      rolepermission = <Rolepermission>[];
      json['rolepermission'].forEach((v) {
        rolepermission!.add(Rolepermission.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (vendorDetails != null) {
      data['vendorDetails'] = vendorDetails!.toJson();
    }
    if (rolepermission != null) {
      data['rolepermission'] =
          rolepermission!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VendorDetails {
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
  int? id;
  int? warehouseId;
  String? keytype;
  String? servicekey;
  int? vendorid;
  int? loginStatus;
  String? createdtime;
  String? updatedtime;

  VendorDetails(
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
      this.id,
      this.warehouseId,
      this.keytype,
      this.servicekey,
      this.vendorid,
      this.loginStatus,
      this.createdtime,
      this.updatedtime});

  VendorDetails.fromJson(Map<String, dynamic> json) {
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
    id = json['id'];
    warehouseId = json['warehouse_id'];
    keytype = json['keytype'];
    servicekey = json['servicekey'];
    vendorid = json['vendorid'];
    loginStatus = json['login_status'];
    createdtime = json['createdtime'];
    updatedtime = json['updatedtime'];
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
    data['id'] = id;
    data['warehouse_id'] = id;
    data['keytype'] = keytype;
    data['servicekey'] = servicekey;
    data['vendorid'] = vendorid;
    data['login_status'] = loginStatus;
    data['createdtime'] = createdtime;
    data['updatedtime'] = updatedtime;
    return data;
  }
}

class Rolepermission {
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
  int? ssrpid;
  int? permissionId;
  int? perView;
  int? perCreate;
  int? perEdit;
  int? perDelete;
  String? permissionName;

  Rolepermission(
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
      this.ssrpid,
      this.permissionId,
      this.perView,
      this.perCreate,
      this.perEdit,
      this.perDelete,
      this.permissionName});

  Rolepermission.fromJson(Map<String, dynamic> json) {
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
    ssrpid = json['ssrpid'];
    permissionId = json['permission_id'];
    perView = json['per_view'];
    perCreate = json['per_create'];
    perEdit = json['per_edit'];
    perDelete = json['per_delete'];
    permissionName = json['permission_name'];
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
    data['ssrpid'] = ssrpid;
    data['permission_id'] = permissionId;
    data['per_view'] = perView;
    data['per_create'] = perCreate;
    data['per_edit'] = perEdit;
    data['per_delete'] = perDelete;
    data['permission_name'] = permissionName;
    return data;
  }
}
