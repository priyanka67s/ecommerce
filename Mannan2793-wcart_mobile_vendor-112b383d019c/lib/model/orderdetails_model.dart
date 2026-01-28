class ViewManageOrderModel {
  String? status;
  String? message;
  List<Result>? result;
  List<Ordermeta>? ordermeta;
  List<Null>? ordertracking;
  List<Ordernotes>? ordernotes;
  int? shippingGatewayId;
  String? availableCourierCompanies;
  List<Orderlogs>? orderlogs;
  List<ReturnMediaGallery>? returnMediaGallery;

  ViewManageOrderModel(
      {this.status,
      this.message,
      this.result,
      this.ordermeta,
      this.ordertracking,
      this.ordernotes,
      this.shippingGatewayId,
      this.availableCourierCompanies,
      this.orderlogs,
      this.returnMediaGallery});

  ViewManageOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
    if (json['ordermeta'] != null) {
      ordermeta = <Ordermeta>[];
      json['ordermeta'].forEach((v) {
        ordermeta!.add(Ordermeta.fromJson(v));
      });
    }
    if (json['ordertracking'] != null) {
      ordertracking = <Null>[];
      json['ordertracking'].forEach((v) {
        // ordertracking!.add(new Null.fromJson(v));
      });
    }
    if (json['ordernotes'] != null) {
      ordernotes = <Ordernotes>[];
      json['ordernotes'].forEach((v) {
        ordernotes!.add(Ordernotes.fromJson(v));
      });
    }
    shippingGatewayId = json['shipping_gateway_id'];
    availableCourierCompanies = json['available_courier_companies'];
    if (json['orderlogs'] != null) {
      orderlogs = <Orderlogs>[];
      json['orderlogs'].forEach((v) {
        orderlogs!.add(Orderlogs.fromJson(v));
      });
    }
    if (json['return_media_gallery'] != null) {
      returnMediaGallery = <ReturnMediaGallery>[];
      json['return_media_gallery'].forEach((v) {
        returnMediaGallery!.add(ReturnMediaGallery.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    if (ordermeta != null) {
      data['ordermeta'] = ordermeta!.map((v) => v.toJson()).toList();
    }
    // if (this.ordertracking != null) {
    //   data['ordertracking'] =
    //       this.ordertracking!.map((v) => v.toJson()).toList();
    // }
    if (ordernotes != null) {
      data['ordernotes'] = ordernotes!.map((v) => v.toJson()).toList();
    }
    data['shipping_gateway_id'] = shippingGatewayId;
    data['available_courier_companies'] = availableCourierCompanies;
    if (orderlogs != null) {
      data['orderlogs'] = orderlogs!.map((v) => v.toJson()).toList();
    }
    if (returnMediaGallery != null) {
      data['return_media_gallery'] =
          returnMediaGallery!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int? id;
  int? orderid;
  String? ordermapid;
  String? userId;
  int? createdBy;
  int? warehouseId;
  int? cartFrom;
  int? vendorid;
  int? addedfrom;
  int? productorderstatus;
  int? productid;
  int? quantity;
  String? attributes;
  dynamic price;
  String? taxName;
  String? tax;
  int? shippingCost;
  int? totalAmount;
  int? totalShippingCost;
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
  int? deliveryType;
  int? taxPercentage;
  String? shipping;
  String? totalTax;
  dynamic amount;
  dynamic storeBasedAmount;
  int? paymentLink;
  String? username;
  String? paymentmethod;
  int? ordertotal;

  Result(
      {this.id,
      this.orderid,
      this.ordermapid,
      this.userId,
      this.createdBy,
      this.warehouseId,
      this.cartFrom,
      this.vendorid,
      this.addedfrom,
      this.productorderstatus,
      this.productid,
      this.quantity,
      this.attributes,
      this.price,
      this.taxName,
      this.tax,
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
      this.deliveryType,
      this.taxPercentage,
      this.shipping,
      this.totalTax,
      this.amount,
      this.storeBasedAmount,
      this.paymentLink,
      this.username,
      this.paymentmethod,
      this.ordertotal});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderid = json['orderid'];
    ordermapid = json['ordermapid'];
    userId = json['user_id'];
    createdBy = json['created_by'];
    warehouseId = json['warehouse_id'];
    cartFrom = json['cart_from'];
    vendorid = json['vendorid'];
    addedfrom = json['addedfrom'];
    productorderstatus = json['productorderstatus'];
    productid = json['productid'];
    quantity = json['quantity'];
    attributes = json['attributes'];
    price = json['price'];
    taxName = json['tax_name'];
    tax = json['tax'];
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
    deliveryType = json['delivery_type'];
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
    data['cart_from'] = cartFrom;
    data['vendorid'] = vendorid;
    data['addedfrom'] = addedfrom;
    data['productorderstatus'] = productorderstatus;
    data['productid'] = productid;
    data['quantity'] = quantity;
    data['attributes'] = attributes;
    data['price'] = price;
    data['tax_name'] = taxName;
    data['tax'] = tax;
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
    data['delivery_type'] = deliveryType;
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

class Ordermeta {
  String? name;
  String? slug;
  int? productid;
  String? image;
  int? producttype;
  int? id;
  int? orderid;
  String? ordermapid;
  String? userId;
  int? createdBy;
  int? warehouseId;
  int? cartFrom;
  int? vendorid;
  int? addedfrom;
  int? productorderstatus;
  int? quantity;
  String? attributes;
  int? price;
  String? taxName;
  String? tax;
  int? shippingCost;
  int? totalAmount;
  int? totalShippingCost;
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
  int? ordertotal;

  Ordermeta(
      {this.name,
      this.slug,
      this.productid,
      this.image,
      this.producttype,
      this.id,
      this.orderid,
      this.ordermapid,
      this.userId,
      this.createdBy,
      this.warehouseId,
      this.cartFrom,
      this.vendorid,
      this.addedfrom,
      this.productorderstatus,
      this.quantity,
      this.attributes,
      this.price,
      this.taxName,
      this.tax,
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
      this.ordertotal});

  Ordermeta.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    productid = json['productid'];
    image = json['image'];
    producttype = json['producttype'];
    id = json['id'];
    orderid = json['orderid'];
    ordermapid = json['ordermapid'];
    userId = json['user_id'];
    createdBy = json['created_by'];
    warehouseId = json['warehouse_id'];
    cartFrom = json['cart_from'];
    vendorid = json['vendorid'];
    addedfrom = json['addedfrom'];
    productorderstatus = json['productorderstatus'];
    quantity = json['quantity'];
    attributes = json['attributes'];
    price = json['price'];
    taxName = json['tax_name'];
    tax = json['tax'];
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
    ordertotal = json['ordertotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['slug'] = slug;
    data['productid'] = productid;
    data['image'] = image;
    data['producttype'] = producttype;
    data['id'] = id;
    data['orderid'] = orderid;
    data['ordermapid'] = ordermapid;
    data['user_id'] = userId;
    data['created_by'] = createdBy;
    data['warehouse_id'] = warehouseId;
    data['cart_from'] = cartFrom;
    data['vendorid'] = vendorid;
    data['addedfrom'] = addedfrom;
    data['productorderstatus'] = productorderstatus;
    data['quantity'] = quantity;
    data['attributes'] = attributes;
    data['price'] = price;
    data['tax_name'] = taxName;
    data['tax'] = tax;
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
    data['ordertotal'] = ordertotal;
    return data;
  }
}

class Ordernotes {
  int? noteId;
  String? ordermapid;
  int? tocustomer;
  String? orderNote;
  String? createdtime;
  String? updatedtime;

  Ordernotes(
      {this.noteId,
      this.ordermapid,
      this.tocustomer,
      this.orderNote,
      this.createdtime,
      this.updatedtime});

  Ordernotes.fromJson(Map<String, dynamic> json) {
    noteId = json['note_id'];
    ordermapid = json['ordermapid'];
    tocustomer = json['tocustomer'];
    orderNote = json['order_note'];
    createdtime = json['createdtime'];
    updatedtime = json['updatedtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['note_id'] = noteId;
    data['ordermapid'] = ordermapid;
    data['tocustomer'] = tocustomer;
    data['order_note'] = orderNote;
    data['createdtime'] = createdtime;
    data['updatedtime'] = updatedtime;
    return data;
  }
}

class Orderlogs {
  int? logId;
  String? ordermapid;
  int? status;
  String? statusNote;
  int? updatedBy;
  String? createdtime;
  String? updatedtime;

  Orderlogs(
      {this.logId,
      this.ordermapid,
      this.status,
      this.statusNote,
      this.updatedBy,
      this.createdtime,
      this.updatedtime});

  Orderlogs.fromJson(Map<String, dynamic> json) {
    logId = json['log_id'];
    ordermapid = json['ordermapid'];
    status = json['status'];
    statusNote = json['status_note'];
    updatedBy = json['updated_by'];
    createdtime = json['createdtime'];
    updatedtime = json['updatedtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['log_id'] = logId;
    data['ordermapid'] = ordermapid;
    data['status'] = status;
    data['status_note'] = statusNote;
    data['updated_by'] = updatedBy;
    data['createdtime'] = createdtime;
    data['updatedtime'] = updatedtime;
    return data;
  }
}

class ReturnMediaGallery {
  int? imageId;
  String? ordermapid;
  String? imageName;
  String? fileSize;
  String? fileType;
  int? createdBy;
  String? createdDate;

  ReturnMediaGallery(
      {this.imageId,
      this.ordermapid,
      this.imageName,
      this.fileSize,
      this.fileType,
      this.createdBy,
      this.createdDate});

  ReturnMediaGallery.fromJson(Map<String, dynamic> json) {
    imageId = json['image_id'];
    ordermapid = json['ordermapid'];
    imageName = json['image_name'];
    fileSize = json['file_size'];
    fileType = json['file_type'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image_id'] = imageId;
    data['ordermapid'] = ordermapid;
    data['image_name'] = imageName;
    data['file_size'] = fileSize;
    data['file_type'] = fileType;
    data['created_by'] = createdBy;
    data['created_date'] = createdDate;
    return data;
  }
}
