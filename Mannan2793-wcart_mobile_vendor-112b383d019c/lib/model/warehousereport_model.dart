// class WarehouseReportModel {
//   String? status;
//   String? message;
//   List<Orders>? orders;
//   String? vendorPermission;
//   String? isOwner;

//   WarehouseReportModel(
//       {this.status,
//       this.message,
//       this.orders,
//       this.vendorPermission,
//       this.isOwner});

//   WarehouseReportModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['orders'] != null) {
//       orders = <Orders>[];
//       json['orders'].forEach((v) {
//         orders!.add(new Orders.fromJson(v));
//       });
//     }
//     vendorPermission = json['vendor_permission'];
//     isOwner = json['is_owner'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.orders != null) {
//       data['orders'] = this.orders!.map((v) => v.toJson()).toList();
//     }
//     data['vendor_permission'] = this.vendorPermission;
//     data['is_owner'] = this.isOwner;
//     return data;
//   }
// }

// class Orders {
//   int? id;
//   int? orderid;
//   String? ordermapid;
//   String? userId;
//   int? createdBy;
//   int? warehouseId;
//   int? assignedFor;
//   String? assignedLocationId;
//   int? assignedBy;
//   int? assignedTo;
//   int? cartFrom;
//   int? vendorid;
//   int? addedfrom;
//   int? productorderstatus;
//   String? campaignId;
//   String? affiliateUserId;
//   int? productid;
//   int? quantity;
//   String? attributes;
//   String? skuCode;
//   int? price;
//   String? taxName;
//   String? tax;
//   int? deliveryType;
//   int? shippingCost;
//   int? totalAmount;
//   int? totalShippingCost;
//   String? currencyCode;
//   String? storeCurrency;
//   String? currencyValue;
//   int? paymentby;
//   String? couponCode;
//   String? couponAmount;
//   String? subtotal;
//   int? shippingby;
//   String? pickupLocationId;
//   String? shipmentOrderId;
//   String? shipmentId;
//   int? returnType;
//   String? returnReason;
//   int? returnQuantity;
//   String? returnDescription;
//   String? exchangedOrdermapid;
//   String? exchangeOrdermapid;
//   int? exchangeOrderCredit;
//   String? createdtime;
//   String? updatedtime;
//   int? userType;
//   String? orderfrom;
//   int? orderstatus;
//   String? locationname;
//   String? name;
//   String? addressline1;
//   String? addressline2;
//   String? city;
//   String? district;
//   String? state;
//   String? country;
//   String? pincode;
//   String? emailId;
//   String? countryCode;
//   String? phone;
//   String? landmark;
//   int? taxPercentage;
//   String? shipping;
//   int? shippingMethod;
//   String? totalTax;
//   int? amount;
//   int? storeBasedAmount;
//   int? paymentLink;
//   String? walletAmount;
//   String? username;
//   String? paymentmethod;
//   int? ordertotal;

//   Orders(
//       {this.id,
//       this.orderid,
//       this.ordermapid,
//       this.userId,
//       this.createdBy,
//       this.warehouseId,
//       this.assignedFor,
//       this.assignedLocationId,
//       this.assignedBy,
//       this.assignedTo,
//       this.cartFrom,
//       this.vendorid,
//       this.addedfrom,
//       this.productorderstatus,
//       this.campaignId,
//       this.affiliateUserId,
//       this.productid,
//       this.quantity,
//       this.attributes,
//       this.skuCode,
//       this.price,
//       this.taxName,
//       this.tax,
//       this.deliveryType,
//       this.shippingCost,
//       this.totalAmount,
//       this.totalShippingCost,
//       this.currencyCode,
//       this.storeCurrency,
//       this.currencyValue,
//       this.paymentby,
//       this.couponCode,
//       this.couponAmount,
//       this.subtotal,
//       this.shippingby,
//       this.pickupLocationId,
//       this.shipmentOrderId,
//       this.shipmentId,
//       this.returnType,
//       this.returnReason,
//       this.returnQuantity,
//       this.returnDescription,
//       this.exchangedOrdermapid,
//       this.exchangeOrdermapid,
//       this.exchangeOrderCredit,
//       this.createdtime,
//       this.updatedtime,
//       this.userType,
//       this.orderfrom,
//       this.orderstatus,
//       this.locationname,
//       this.name,
//       this.addressline1,
//       this.addressline2,
//       this.city,
//       this.district,
//       this.state,
//       this.country,
//       this.pincode,
//       this.emailId,
//       this.countryCode,
//       this.phone,
//       this.landmark,
//       this.taxPercentage,
//       this.shipping,
//       this.shippingMethod,
//       this.totalTax,
//       this.amount,
//       this.storeBasedAmount,
//       this.paymentLink,
//       this.walletAmount,
//       this.username,
//       this.paymentmethod,
//       this.ordertotal});

//   Orders.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     orderid = json['orderid'];
//     ordermapid = json['ordermapid'];
//     userId = json['user_id'];
//     createdBy = json['created_by'];
//     warehouseId = json['warehouse_id'];
//     assignedFor = json['assigned_for'];
//     assignedLocationId = json['assigned_location_id'];
//     assignedBy = json['assigned_by'];
//     assignedTo = json['assigned_to'];
//     cartFrom = json['cart_from'];
//     vendorid = json['vendorid'];
//     addedfrom = json['addedfrom'];
//     productorderstatus = json['productorderstatus'];
//     campaignId = json['campaign_id'];
//     affiliateUserId = json['affiliate_user_id'];
//     productid = json['productid'];
//     quantity = json['quantity'];
//     attributes = json['attributes'];
//     skuCode = json['sku_code'];
//     price = json['price'];
//     taxName = json['tax_name'];
//     tax = json['tax'];
//     deliveryType = json['delivery_type'];
//     shippingCost = json['shipping_cost'];
//     totalAmount = json['total_amount'];
//     totalShippingCost = json['total_shipping_cost'];
//     currencyCode = json['currency_code'];
//     storeCurrency = json['store_currency'];
//     currencyValue = json['currency_value'];
//     paymentby = json['paymentby'];
//     couponCode = json['coupon_code'];
//     couponAmount = json['coupon_amount'];
//     subtotal = json['subtotal'];
//     shippingby = json['shippingby'];
//     pickupLocationId = json['pickup_location_id'];
//     shipmentOrderId = json['shipment_order_id'];
//     shipmentId = json['shipment_id'];
//     returnType = json['return_type'];
//     returnReason = json['return_reason'];
//     returnQuantity = json['return_quantity'];
//     returnDescription = json['return_description'];
//     exchangedOrdermapid = json['exchanged_ordermapid'];
//     exchangeOrdermapid = json['exchange_ordermapid'];
//     exchangeOrderCredit = json['exchange_order_credit'];
//     createdtime = json['createdtime'];
//     updatedtime = json['updatedtime'];
//     userType = json['user_type'];
//     orderfrom = json['orderfrom'];
//     orderstatus = json['orderstatus'];
//     locationname = json['locationname'];
//     name = json['name'];
//     addressline1 = json['addressline1'];
//     addressline2 = json['addressline2'];
//     city = json['city'];
//     district = json['district'];
//     state = json['state'];
//     country = json['country'];
//     pincode = json['pincode'];
//     emailId = json['email_id'];
//     countryCode = json['country_code'];
//     phone = json['phone'];
//     landmark = json['landmark'];
//     taxPercentage = json['tax_percentage'];
//     shipping = json['shipping'];
//     shippingMethod = json['shipping_method'];
//     totalTax = json['total_tax'];
//     amount = json['amount'];
//     storeBasedAmount = json['store_based_amount'];
//     paymentLink = json['payment_link'];
//     walletAmount = json['wallet_amount'];
//     username = json['username'];
//     paymentmethod = json['paymentmethod'];
//     ordertotal = json['ordertotal'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['orderid'] = this.orderid;
//     data['ordermapid'] = this.ordermapid;
//     data['user_id'] = this.userId;
//     data['created_by'] = this.createdBy;
//     data['warehouse_id'] = this.warehouseId;
//     data['assigned_for'] = this.assignedFor;
//     data['assigned_location_id'] = this.assignedLocationId;
//     data['assigned_by'] = this.assignedBy;
//     data['assigned_to'] = this.assignedTo;
//     data['cart_from'] = this.cartFrom;
//     data['vendorid'] = this.vendorid;
//     data['addedfrom'] = this.addedfrom;
//     data['productorderstatus'] = this.productorderstatus;
//     data['campaign_id'] = this.campaignId;
//     data['affiliate_user_id'] = this.affiliateUserId;
//     data['productid'] = this.productid;
//     data['quantity'] = this.quantity;
//     data['attributes'] = this.attributes;
//     data['sku_code'] = this.skuCode;
//     data['price'] = this.price;
//     data['tax_name'] = this.taxName;
//     data['tax'] = this.tax;
//     data['delivery_type'] = this.deliveryType;
//     data['shipping_cost'] = this.shippingCost;
//     data['total_amount'] = this.totalAmount;
//     data['total_shipping_cost'] = this.totalShippingCost;
//     data['currency_code'] = this.currencyCode;
//     data['store_currency'] = this.storeCurrency;
//     data['currency_value'] = this.currencyValue;
//     data['paymentby'] = this.paymentby;
//     data['coupon_code'] = this.couponCode;
//     data['coupon_amount'] = this.couponAmount;
//     data['subtotal'] = this.subtotal;
//     data['shippingby'] = this.shippingby;
//     data['pickup_location_id'] = this.pickupLocationId;
//     data['shipment_order_id'] = this.shipmentOrderId;
//     data['shipment_id'] = this.shipmentId;
//     data['return_type'] = this.returnType;
//     data['return_reason'] = this.returnReason;
//     data['return_quantity'] = this.returnQuantity;
//     data['return_description'] = this.returnDescription;
//     data['exchanged_ordermapid'] = this.exchangedOrdermapid;
//     data['exchange_ordermapid'] = this.exchangeOrdermapid;
//     data['exchange_order_credit'] = this.exchangeOrderCredit;
//     data['createdtime'] = this.createdtime;
//     data['updatedtime'] = this.updatedtime;
//     data['user_type'] = this.userType;
//     data['orderfrom'] = this.orderfrom;
//     data['orderstatus'] = this.orderstatus;
//     data['locationname'] = this.locationname;
//     data['name'] = this.name;
//     data['addressline1'] = this.addressline1;
//     data['addressline2'] = this.addressline2;
//     data['city'] = this.city;
//     data['district'] = this.district;
//     data['state'] = this.state;
//     data['country'] = this.country;
//     data['pincode'] = this.pincode;
//     data['email_id'] = this.emailId;
//     data['country_code'] = this.countryCode;
//     data['phone'] = this.phone;
//     data['landmark'] = this.landmark;
//     data['tax_percentage'] = this.taxPercentage;
//     data['shipping'] = this.shipping;
//     data['shipping_method'] = this.shippingMethod;
//     data['total_tax'] = this.totalTax;
//     data['amount'] = this.amount;
//     data['store_based_amount'] = this.storeBasedAmount;
//     data['payment_link'] = this.paymentLink;
//     data['wallet_amount'] = this.walletAmount;
//     data['username'] = this.username;
//     data['paymentmethod'] = this.paymentmethod;
//     data['ordertotal'] = this.ordertotal;
//     return data;
//   }
// }
class WarehouseReportModel {
  String? status;
  String? message;
  List<Orders>? orders;
  List<VendorPermission>? vendorPermission;
  String? isOwner;

  WarehouseReportModel(
      {this.status,
      this.message,
      this.orders,
      this.vendorPermission,
      this.isOwner});

  WarehouseReportModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
    if (json['vendor_permission'] != null &&
        json['vendor_permission'].runtimeType != String) {
      vendorPermission = <VendorPermission>[];
      json['vendor_permission'].forEach((v) {
        vendorPermission!.add(VendorPermission.fromJson(v));
      });
    }
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    if (vendorPermission != null) {
      data['vendor_permission'] =
          vendorPermission!.map((v) => v.toJson()).toList();
    }
    data['is_owner'] = isOwner;
    return data;
  }
}

class Orders {
  int? id;
  int? orderid;
  String? ordermapid;
  String? userId;
  int? createdBy;
  int? warehouseId;
  int? assignedFor;
  String? assignedLocationId;
  int? assignedBy;
  int? assignedTo;
  int? cartFrom;
  int? vendorid;
  int? addedfrom;
  int? productorderstatus;
  String? campaignId;
  String? affiliateUserId;
  int? productid;
  int? quantity;
  String? attributes;
  String? skuCode;
  num? price;
  String? taxName;
  String? tax;
  int? deliveryType;
  dynamic shippingCost;
  num? totalAmount;
  dynamic totalShippingCost;
  String? currencyCode;
  String? storeCurrency;
  String? currencyValue;
  int? paymentby;
  String? couponCode;
  String? couponAmount;
  String? subtotal;
  int? shippingby;
  String? pickupLocationId;
  dynamic shipmentOrderId;
  dynamic shipmentId;
  int? returnType;
  dynamic returnReason;
  dynamic returnQuantity;
  dynamic returnDescription;
  String? exchangedOrdermapid;
  String? exchangeOrdermapid;
  int? exchangeOrderCredit;
  String? createdtime;
  String? updatedtime;
  int? userType;
  String? orderfrom;
  int? orderstatus;
  String? locationname;
  String? name;
  String? addressline1;
  String? addressline2;
  String? city;
  String? district;
  String? state;
  String? country;
  String? pincode;
  String? emailId;
  String? countryCode;
  String? phone;
  String? landmark;
  int? taxPercentage;
  String? shipping;
  int? shippingMethod;
  String? totalTax;
  dynamic amount;
  num? storeBasedAmount;
  int? paymentLink;
  String? walletAmount;
  String? username;
  String? paymentmethod;
  dynamic ordertotal;

  Orders(
      {this.id,
      this.orderid,
      this.ordermapid,
      this.userId,
      this.createdBy,
      this.warehouseId,
      this.assignedFor,
      this.assignedLocationId,
      this.assignedBy,
      this.assignedTo,
      this.cartFrom,
      this.vendorid,
      this.addedfrom,
      this.productorderstatus,
      this.campaignId,
      this.affiliateUserId,
      this.productid,
      this.quantity,
      this.attributes,
      this.skuCode,
      this.price,
      this.taxName,
      this.tax,
      this.deliveryType,
      this.shippingCost,
      this.totalAmount,
      this.totalShippingCost,
      this.currencyCode,
      this.storeCurrency,
      this.currencyValue,
      this.paymentby,
      this.couponCode,
      this.couponAmount,
      this.subtotal,
      this.shippingby,
      this.pickupLocationId,
      this.shipmentOrderId,
      this.shipmentId,
      this.returnType,
      this.returnReason,
      this.returnQuantity,
      this.returnDescription,
      this.exchangedOrdermapid,
      this.exchangeOrdermapid,
      this.exchangeOrderCredit,
      this.createdtime,
      this.updatedtime,
      this.userType,
      this.orderfrom,
      this.orderstatus,
      this.locationname,
      this.name,
      this.addressline1,
      this.addressline2,
      this.city,
      this.district,
      this.state,
      this.country,
      this.pincode,
      this.emailId,
      this.countryCode,
      this.phone,
      this.landmark,
      this.taxPercentage,
      this.shipping,
      this.shippingMethod,
      this.totalTax,
      this.amount,
      this.storeBasedAmount,
      this.paymentLink,
      this.walletAmount,
      this.username,
      this.paymentmethod,
      this.ordertotal});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderid = json['orderid'];
    ordermapid = json['ordermapid'];
    userId = json['user_id'];
    createdBy = json['created_by'];
    warehouseId = json['warehouse_id'];
    assignedFor = json['assigned_for'];
    assignedLocationId = json['assigned_location_id'];
    assignedBy = json['assigned_by'];
    assignedTo = json['assigned_to'];
    cartFrom = json['cart_from'];
    vendorid = json['vendorid'];
    addedfrom = json['addedfrom'];
    productorderstatus = json['productorderstatus'];
    campaignId = json['campaign_id'];
    affiliateUserId = json['affiliate_user_id'];
    productid = json['productid'];
    quantity = json['quantity'];
    attributes = json['attributes'];
    skuCode = json['sku_code'];
    price = json['price'];
    taxName = json['tax_name'];
    tax = json['tax'];
    deliveryType = json['delivery_type'];
    shippingCost = json['shipping_cost'];
    totalAmount = json['total_amount'];
    totalShippingCost = json['total_shipping_cost'];
    currencyCode = json['currency_code'];
    storeCurrency = json['store_currency'];
    currencyValue = json['currency_value'];
    paymentby = json['paymentby'];
    couponCode = json['coupon_code'];
    couponAmount = json['coupon_amount'];
    subtotal = json['subtotal'];
    shippingby = json['shippingby'];
    pickupLocationId = json['pickup_location_id'];
    shipmentOrderId = json['shipment_order_id'];
    shipmentId = json['shipment_id'];
    returnType = json['return_type'];
    returnReason = json['return_reason'];
    returnQuantity = json['return_quantity'];
    returnDescription = json['return_description'];
    exchangedOrdermapid = json['exchanged_ordermapid'];
    exchangeOrdermapid = json['exchange_ordermapid'];
    exchangeOrderCredit = json['exchange_order_credit'];
    createdtime = json['createdtime'];
    updatedtime = json['updatedtime'];
    userType = json['user_type'];
    orderfrom = json['orderfrom'];
    orderstatus = json['orderstatus'];
    locationname = json['locationname'];
    name = json['name'];
    addressline1 = json['addressline1'];
    addressline2 = json['addressline2'];
    city = json['city'];
    district = json['district'];
    state = json['state'];
    country = json['country'];
    pincode = json['pincode'];
    emailId = json['email_id'];
    countryCode = json['country_code'];
    phone = json['phone'];
    landmark = json['landmark'];
    taxPercentage = json['tax_percentage'];
    shipping = json['shipping'];
    shippingMethod = json['shipping_method'];
    totalTax = json['total_tax'];
    amount = json['amount'];
    storeBasedAmount = json['store_based_amount'];
    paymentLink = json['payment_link'];
    walletAmount = json['wallet_amount'];
    username = json['username'];
    paymentmethod = json['paymentmethod'];
    ordertotal = json['ordertotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['orderid'] = orderid;
    data['ordermapid'] = ordermapid;
    data['user_id'] = userId;
    data['created_by'] = createdBy;
    data['warehouse_id'] = warehouseId;
    data['assigned_for'] = assignedFor;
    data['assigned_location_id'] = assignedLocationId;
    data['assigned_by'] = assignedBy;
    data['assigned_to'] = assignedTo;
    data['cart_from'] = cartFrom;
    data['vendorid'] = vendorid;
    data['addedfrom'] = addedfrom;
    data['productorderstatus'] = productorderstatus;
    data['campaign_id'] = campaignId;
    data['affiliate_user_id'] = affiliateUserId;
    data['productid'] = productid;
    data['quantity'] = quantity;
    data['attributes'] = attributes;
    data['sku_code'] = skuCode;
    data['price'] = price;
    data['tax_name'] = taxName;
    data['tax'] = tax;
    data['delivery_type'] = deliveryType;
    data['shipping_cost'] = shippingCost;
    data['total_amount'] = totalAmount;
    data['total_shipping_cost'] = totalShippingCost;
    data['currency_code'] = currencyCode;
    data['store_currency'] = storeCurrency;
    data['currency_value'] = currencyValue;
    data['paymentby'] = paymentby;
    data['coupon_code'] = couponCode;
    data['coupon_amount'] = couponAmount;
    data['subtotal'] = subtotal;
    data['shippingby'] = shippingby;
    data['pickup_location_id'] = pickupLocationId;
    data['shipment_order_id'] = shipmentOrderId;
    data['shipment_id'] = shipmentId;
    data['return_type'] = returnType;
    data['return_reason'] = returnReason;
    data['return_quantity'] = returnQuantity;
    data['return_description'] = returnDescription;
    data['exchanged_ordermapid'] = exchangedOrdermapid;
    data['exchange_ordermapid'] = exchangeOrdermapid;
    data['exchange_order_credit'] = exchangeOrderCredit;
    data['createdtime'] = createdtime;
    data['updatedtime'] = updatedtime;
    data['user_type'] = userType;
    data['orderfrom'] = orderfrom;
    data['orderstatus'] = orderstatus;
    data['locationname'] = locationname;
    data['name'] = name;
    data['addressline1'] = addressline1;
    data['addressline2'] = addressline2;
    data['city'] = city;
    data['district'] = district;
    data['state'] = state;
    data['country'] = country;
    data['pincode'] = pincode;
    data['email_id'] = emailId;
    data['country_code'] = countryCode;
    data['phone'] = phone;
    data['landmark'] = landmark;
    data['tax_percentage'] = taxPercentage;
    data['shipping'] = shipping;
    data['shipping_method'] = shippingMethod;
    data['total_tax'] = totalTax;
    data['amount'] = amount;
    data['store_based_amount'] = storeBasedAmount;
    data['payment_link'] = paymentLink;
    data['wallet_amount'] = walletAmount;
    data['username'] = username;
    data['paymentmethod'] = paymentmethod;
    data['ordertotal'] = ordertotal;
    return data;
  }
}

class VendorPermission {
  String? permissionName;
  int? ssrpid;
  int? staffRoleId;
  int? permissionId;
  int? perView;
  int? perCreate;
  int? perEdit;
  int? perDelete;

  VendorPermission(
      {this.permissionName,
      this.ssrpid,
      this.staffRoleId,
      this.permissionId,
      this.perView,
      this.perCreate,
      this.perEdit,
      this.perDelete});

  VendorPermission.fromJson(Map<String, dynamic> json) {
    permissionName = json['permission_name'];
    ssrpid = json['ssrpid'];
    staffRoleId = json['staff_role_id'];
    permissionId = json['permission_id'];
    perView = json['per_view'];
    perCreate = json['per_create'];
    perEdit = json['per_edit'];
    perDelete = json['per_delete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['permission_name'] = permissionName;
    data['ssrpid'] = ssrpid;
    data['staff_role_id'] = staffRoleId;
    data['permission_id'] = permissionId;
    data['per_view'] = perView;
    data['per_create'] = perCreate;
    data['per_edit'] = perEdit;
    data['per_delete'] = perDelete;
    return data;
  }
}
