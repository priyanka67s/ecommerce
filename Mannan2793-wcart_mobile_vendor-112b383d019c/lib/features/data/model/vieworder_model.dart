class ViewOrderModel {
  String? status;
  String? message;
  List<Orders>? orders;
  String? vendorPermission;
  String? isOwner;

  ViewOrderModel(
      {this.status,
      this.message,
      this.orders,
      this.vendorPermission,
      this.isOwner});

  ViewOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
    vendorPermission = json['vendor_permission'];
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    data['vendor_permission'] = vendorPermission;
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
  int? productid;
  int? quantity;
  String? attributes;
  String? skuCode;
  dynamic price;
  String? taxName;
  String? tax;
  int? deliveryType;
  num? shippingCost;
  dynamic totalAmount;
  num? totalShippingCost;
  String? currencyCode;
  String? storeCurrency;
  String? currencyValue;
  int? paymentby;
  String? couponCode;
  String? couponAmount;
  String? subtotal;
  int? shippingby;
  String? pickupLocationId;
  String? shipmentOrderId;
  String? shipmentId;
  int? returnType;
  String? returnReason;
  int? returnQuantity;
  String? returnDescription;
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
  String? totalTax;
  dynamic amount;
  dynamic storeBasedAmount;
  int? paymentLink;
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
      this.totalTax,
      this.amount,
      this.storeBasedAmount,
      this.paymentLink,
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
    totalTax = json['total_tax'];
    amount = json['amount'];
    storeBasedAmount = json['store_based_amount'];
    paymentLink = json['payment_link'];
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
    data['total_tax'] = totalTax;
    data['amount'] = amount;
    data['store_based_amount'] = storeBasedAmount;
    data['payment_link'] = paymentLink;
    data['username'] = username;
    data['paymentmethod'] = paymentmethod;
    data['ordertotal'] = ordertotal;
    return data;
  }
}
