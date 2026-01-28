class Singleton {
  Singleton._();

  String? vendorId;
  String? serviceKey;
  String? userName;
  String? userId;
  String? userType;
  String? storeLocationId;
  String? storeStaffId;
  String? warehouseId;
  String? staffId;
  String? name;
  String? email;
  String? country;
  String? mobile;
  String? district;
  String? state;
  String? active;
  // String? saleserviceKey;

  /// the one and only instance of this singleton
  static final instance = Singleton._();
}
