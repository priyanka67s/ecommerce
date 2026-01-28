// class PosCreateOrderModel {
//   String? status;
//   List<Orderdata>? orderdata;
//   String? paymentmethod;
//   List<Cartproducts>? cartproducts;
//   String? message;
//   Paymentgateway? paymentgateway;
//   int? orderid;
//   int? amount;
//   String? name;
//   String? email;
//   String? receipt;
//   int? orderstatus;

//   PosCreateOrderModel(
//       {this.status,
//       this.orderdata,
//       this.paymentmethod,
//       this.cartproducts,
//       this.message,
//       this.paymentgateway,
//       this.orderid,
//       this.amount,
//       this.name,
//       this.email,
//       this.receipt,
//       this.orderstatus});

//   PosCreateOrderModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['orderdata'] != null) {
//       orderdata = <Orderdata>[];
//       json['orderdata'].forEach((v) {
//         orderdata!.add(new Orderdata.fromJson(v));
//       });
//     }
//     paymentmethod = json['paymentmethod'];
//     if (json['cartproducts'] != null) {
//       cartproducts = <Cartproducts>[];
//       json['cartproducts'].forEach((v) {
//         cartproducts!.add(new Cartproducts.fromJson(v));
//       });
//     }
//     message = json['message'];
//     // paymentgateway = json['paymentgateway'] != null
//     //     ? new Paymentgateway.fromJson(json['paymentgateway'])
//     //     : null;
//     orderid = json['orderid'];
//     amount = json['amount'];
//     name = json['name'];
//     email = json['email'];
//     receipt = json['receipt'];
//     orderstatus = json['orderstatus'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.orderdata != null) {
//       data['orderdata'] = this.orderdata!.map((v) => v.toJson()).toList();
//     }
//     data['paymentmethod'] = this.paymentmethod;
//     if (this.cartproducts != null) {
//       data['cartproducts'] = this.cartproducts!.map((v) => v.toJson()).toList();
//     }
//     data['message'] = this.message;
//     if (this.paymentgateway != null) {
//       data['paymentgateway'] = this.paymentgateway!.toJson();
//     }
//     data['orderid'] = this.orderid;
//     data['amount'] = this.amount;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['receipt'] = this.receipt;
//     data['orderstatus'] = this.orderstatus;
//     return data;
//   }
// }

// class Orderdata {
//   int? orderid;
//   int? userId;
//   int? createdBy;
//   int? warehouseId;
//   int? cartFrom;
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
//   int? amount;
//   int? paymentby;
//   String? createdtime;
//   String? updatedtime;

//   Orderdata(
//       {this.orderid,
//       this.userId,
//       this.createdBy,
//       this.warehouseId,
//       this.cartFrom,
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
//       this.amount,
//       this.paymentby,
//       this.createdtime,
//       this.updatedtime});

//   Orderdata.fromJson(Map<String, dynamic> json) {
//     orderid = json['orderid'];
//     userId = json['user_id'];
//     createdBy = json['created_by'];
//     warehouseId = json['warehouse_id'];
//     cartFrom = json['cart_from'];
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
//     amount = json['amount'];
//     paymentby = json['paymentby'];
//     createdtime = json['createdtime'];
//     updatedtime = json['updatedtime'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['orderid'] = this.orderid;
//     data['user_id'] = this.userId;
//     data['created_by'] = this.createdBy;
//     data['warehouse_id'] = this.warehouseId;
//     data['cart_from'] = this.cartFrom;
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
//     data['amount'] = this.amount;
//     data['paymentby'] = this.paymentby;
//     data['createdtime'] = this.createdtime;
//     data['updatedtime'] = this.updatedtime;
//     return data;
//   }
// }

// class Cartproducts {
//   int? cartId;
//   dynamic userId;
//   String? name;
//   int? vendorid;
//   int? addedfrom;
//   String? slug;
//   int? productid;
//   String? image;
//   int? producttype;
//   int? regularprice;
//   int? saleprice;
//   String? attribute;
//   dynamic variableRegularprice;
//   dynamic variableSaleprice;
//   int? shippingcost;
//   int? shippingStatus;
//   String? sku;
//   int? weight;
//   int? length;
//   int? width;
//   int? height;
//   int? quantity;
//   int? simpleQuantity;
//   dynamic variableQuantity;
//   int? vendorStatus;
//   int? price;
//   int? producttotal;
//   String? errormessage;
//   String? errortype;
//   String? imageUrl;

//   Cartproducts(
//       {this.cartId,
//       this.userId,
//       this.name,
//       this.vendorid,
//       this.addedfrom,
//       this.slug,
//       this.productid,
//       this.image,
//       this.producttype,
//       this.regularprice,
//       this.saleprice,
//       this.attribute,
//       this.variableRegularprice,
//       this.variableSaleprice,
//       this.shippingcost,
//       this.shippingStatus,
//       this.sku,
//       this.weight,
//       this.length,
//       this.width,
//       this.height,
//       this.quantity,
//       this.simpleQuantity,
//       this.variableQuantity,
//       this.vendorStatus,
//       this.price,
//       this.producttotal,
//       this.errormessage,
//       this.errortype,
//       this.imageUrl});

//   Cartproducts.fromJson(Map<String, dynamic> json) {
//     cartId = json['cart_id'];
//     userId = json['user_id'];
//     name = json['name'];
//     vendorid = json['vendorid'];
//     addedfrom = json['addedfrom'];
//     slug = json['slug'];
//     productid = json['productid'];
//     image = json['image'];
//     producttype = json['producttype'];
//     regularprice = json['regularprice'];
//     saleprice = json['saleprice'];
//     attribute = json['attribute'];
//     variableRegularprice = json['variable_regularprice'];
//     variableSaleprice = json['variable_saleprice'];
//     shippingcost = json['shippingcost'];
//     shippingStatus = json['shipping_status'];
//     sku = json['sku'];
//     weight = json['weight'];
//     length = json['length'];
//     width = json['width'];
//     height = json['height'];
//     quantity = json['quantity'];
//     simpleQuantity = json['simple_quantity'];
//     variableQuantity = json['variable_quantity'];
//     vendorStatus = json['vendor_status'];
//     price = json['price'];
//     producttotal = json['producttotal'];
//     errormessage = json['errormessage'];
//     errortype = json['errortype'];
//     imageUrl = json['image_url'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['cart_id'] = this.cartId;
//     data['user_id'] = this.userId;
//     data['name'] = this.name;
//     data['vendorid'] = this.vendorid;
//     data['addedfrom'] = this.addedfrom;
//     data['slug'] = this.slug;
//     data['productid'] = this.productid;
//     data['image'] = this.image;
//     data['producttype'] = this.producttype;
//     data['regularprice'] = this.regularprice;
//     data['saleprice'] = this.saleprice;
//     data['attribute'] = this.attribute;
//     data['variable_regularprice'] = this.variableRegularprice;
//     data['variable_saleprice'] = this.variableSaleprice;
//     data['shippingcost'] = this.shippingcost;
//     data['shipping_status'] = this.shippingStatus;
//     data['sku'] = this.sku;
//     data['weight'] = this.weight;
//     data['length'] = this.length;
//     data['width'] = this.width;
//     data['height'] = this.height;
//     data['quantity'] = this.quantity;
//     data['simple_quantity'] = this.simpleQuantity;
//     data['variable_quantity'] = this.variableQuantity;
//     data['vendor_status'] = this.vendorStatus;
//     data['price'] = this.price;
//     data['producttotal'] = this.producttotal;
//     data['errormessage'] = this.errormessage;
//     data['errortype'] = this.errortype;
//     data['image_url'] = this.imageUrl;
//     return data;
//   }
// }

// class Paymentgateway {
//   int? gateId;
//   int? status;
//   int? live;
//   String? name;
//   String? description;
//   String? paymentMail;
//   String? testKeyId;
//   String? testKeySecret;
//   String? liveKeyId;
//   String? liveKeySecret;
//   String? createdOn;
//   String? updatedOn;

//   Paymentgateway(
//       {this.gateId,
//       this.status,
//       this.live,
//       this.name,
//       this.description,
//       this.paymentMail,
//       this.testKeyId,
//       this.testKeySecret,
//       this.liveKeyId,
//       this.liveKeySecret,
//       this.createdOn,
//       this.updatedOn});

//   Paymentgateway.fromJson(Map<String, dynamic> json) {
//     gateId = json['gate_id'];
//     status = json['status'];
//     live = json['live'];
//     name = json['name'];
//     description = json['description'];
//     paymentMail = json['payment_mail'];
//     testKeyId = json['test_key_id'];
//     testKeySecret = json['test_key_secret'];
//     liveKeyId = json['live_key_id'];
//     liveKeySecret = json['live_key_secret'];
//     createdOn = json['created_on'];
//     updatedOn = json['updated_on'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['gate_id'] = this.gateId;
//     data['status'] = this.status;
//     data['live'] = this.live;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['payment_mail'] = this.paymentMail;
//     data['test_key_id'] = this.testKeyId;
//     data['test_key_secret'] = this.testKeySecret;
//     data['live_key_id'] = this.liveKeyId;
//     data['live_key_secret'] = this.liveKeySecret;
//     data['created_on'] = this.createdOn;
//     data['updated_on'] = this.updatedOn;
//     return data;
//   }
// }
// class PosCreateOrderModel {
//   String? status;
//   List<Orderdata>? orderdata;
//   String? paymentmethod;
//   List<Cartproducts>? cartproducts;
//   Pricedata? pricedata;
//   String? message;
//   Paymentgateway? paymentgateway;
//   int? orderid;
//   int? amount;
//   String? name;
//   String? currency;
//   String? currencyValue;
//   String? receipt;
//   int? orderstatus;
//   String? invoice;

//   PosCreateOrderModel(
//       {this.status,
//       this.orderdata,
//       this.paymentmethod,
//       this.cartproducts,
//       this.pricedata,
//       this.message,
//       this.paymentgateway,
//       this.orderid,
//       this.amount,
//       this.name,
//       this.currency,
//       this.currencyValue,
//       this.receipt,
//       this.orderstatus,
//       this.invoice});

//   PosCreateOrderModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['orderdata'] != null) {
//       orderdata = <Orderdata>[];
//       json['orderdata'].forEach((v) {
//         orderdata!.add(new Orderdata.fromJson(v));
//       });
//     }
//     paymentmethod = json['paymentmethod'];
//     if (json['cartproducts'] != null) {
//       cartproducts = <Cartproducts>[];
//       json['cartproducts'].forEach((v) {
//         cartproducts!.add(new Cartproducts.fromJson(v));
//       });
//     }
//     pricedata = json['pricedata'] != null
//         ? new Pricedata.fromJson(json['pricedata'])
//         : null;
//     message = json['message'];
//     paymentgateway = json['paymentgateway'] != null
//         ? new Paymentgateway.fromJson(json['paymentgateway'])
//         : null;
//     orderid = json['orderid'];
//     amount = json['amount'];
//     name = json['name'];
//     currency = json['currency'];
//     currencyValue = json['currency_value'];
//     receipt = json['receipt'];
//     orderstatus = json['orderstatus'];
//     invoice = json['invoice'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.orderdata != null) {
//       data['orderdata'] = this.orderdata!.map((v) => v.toJson()).toList();
//     }
//     data['paymentmethod'] = this.paymentmethod;
//     if (this.cartproducts != null) {
//       data['cartproducts'] = this.cartproducts!.map((v) => v.toJson()).toList();
//     }
//     if (this.pricedata != null) {
//       data['pricedata'] = this.pricedata!.toJson();
//     }
//     data['message'] = this.message;
//     if (this.paymentgateway != null) {
//       data['paymentgateway'] = this.paymentgateway!.toJson();
//     }
//     data['orderid'] = this.orderid;
//     data['amount'] = this.amount;
//     data['name'] = this.name;
//     data['currency'] = this.currency;
//     data['currency_value'] = this.currencyValue;
//     data['receipt'] = this.receipt;
//     data['orderstatus'] = this.orderstatus;
//     data['invoice'] = this.invoice;
//     return data;
//   }
// }

// class Orderdata {
//   int? orderid;
//   String? userId;
//   int? createdBy;
//   int? warehouseId;
//   int? cartFrom;
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
//   String? currencyCode;
//   String? storeCurrency;
//   String? currencyValue;
//   int? deliveryType;
//   String? tax;
//   String? taxName;
//   int? taxPercentage;
//   String? subtotal;
//   String? shipping;
//   int? shippingMethod;
//   String? totalTax;
//   int? amount;
//   int? storeBasedAmount;
//   int? paymentby;
//   int? paymentLink;
//   String? couponCode;
//   String? couponAmount;
//   String? walletAmount;
//   String? createdtime;
//   String? updatedtime;

//   Orderdata(
//       {this.orderid,
//       this.userId,
//       this.createdBy,
//       this.warehouseId,
//       this.cartFrom,
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
//       this.currencyCode,
//       this.storeCurrency,
//       this.currencyValue,
//       this.deliveryType,
//       this.tax,
//       this.taxName,
//       this.taxPercentage,
//       this.subtotal,
//       this.shipping,
//       this.shippingMethod,
//       this.totalTax,
//       this.amount,
//       this.storeBasedAmount,
//       this.paymentby,
//       this.paymentLink,
//       this.couponCode,
//       this.couponAmount,
//       this.walletAmount,
//       this.createdtime,
//       this.updatedtime});

//   Orderdata.fromJson(Map<String, dynamic> json) {
//     orderid = json['orderid'];
//     userId = json['user_id'];
//     createdBy = json['created_by'];
//     warehouseId = json['warehouse_id'];
//     cartFrom = json['cart_from'];
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
//     currencyCode = json['currency_code'];
//     storeCurrency = json['store_currency'];
//     currencyValue = json['currency_value'];
//     deliveryType = json['delivery_type'];
//     tax = json['tax'];
//     taxName = json['tax_name'];
//     taxPercentage = json['tax_percentage'];
//     subtotal = json['subtotal'];
//     shipping = json['shipping'];
//     shippingMethod = json['shipping_method'];
//     totalTax = json['total_tax'];
//     amount = json['amount'];
//     storeBasedAmount = json['store_based_amount'];
//     paymentby = json['paymentby'];
//     paymentLink = json['payment_link'];
//     couponCode = json['coupon_code'];
//     couponAmount = json['coupon_amount'];
//     walletAmount = json['wallet_amount'];
//     createdtime = json['createdtime'];
//     updatedtime = json['updatedtime'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['orderid'] = this.orderid;
//     data['user_id'] = this.userId;
//     data['created_by'] = this.createdBy;
//     data['warehouse_id'] = this.warehouseId;
//     data['cart_from'] = this.cartFrom;
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
//     data['currency_code'] = this.currencyCode;
//     data['store_currency'] = this.storeCurrency;
//     data['currency_value'] = this.currencyValue;
//     data['delivery_type'] = this.deliveryType;
//     data['tax'] = this.tax;
//     data['tax_name'] = this.taxName;
//     data['tax_percentage'] = this.taxPercentage;
//     data['subtotal'] = this.subtotal;
//     data['shipping'] = this.shipping;
//     data['shipping_method'] = this.shippingMethod;
//     data['total_tax'] = this.totalTax;
//     data['amount'] = this.amount;
//     data['store_based_amount'] = this.storeBasedAmount;
//     data['paymentby'] = this.paymentby;
//     data['payment_link'] = this.paymentLink;
//     data['coupon_code'] = this.couponCode;
//     data['coupon_amount'] = this.couponAmount;
//     data['wallet_amount'] = this.walletAmount;
//     data['createdtime'] = this.createdtime;
//     data['updatedtime'] = this.updatedtime;
//     return data;
//   }
// }

// class Cartproducts {
//   int? cartId;
//   int? cartStatus;
//   int? cartFrom;
//   int? createdBy;
//   int? userSessionId;
//   String? name;
//   int? vendorid;
//   int? addedfrom;
//   String? slug;
//   int? productid;
//   String? image;
//   String? gallery1;
//   int? producttype;
//   String? regularprice;
//   String? saleprice;
//   dynamic attribute;
//   dynamic variableRegularprice;
//   dynamic variableSaleprice;
//   int? shippingcost;
//   int? shippingStatus;
//   String? sku;
//   int? weight;
//   int? length;
//   int? width;
//   int? height;
//   int? quantity;
//   int? simpleQuantity;
//   dynamic variableQuantity;
//   int? vendorStatus;
//   String? vendorName;
//   String? termIds;
//   String? includePincodes;
//   String? excludePincodes;
//   int? vendorPrice;
//   int? vendorSaleprice;
//   int? vendorQuantity;
//   int? vendorProductStatus;
//   String? vIncludePincodes;
//   String? vExcludePincodes;
//   int? availableStock;
//   dynamic price;
//   int? producttotal;
//   String? taxName;
//   int? tax;
//   dynamic taxvalue;
//   dynamic subtotal;
//   dynamic subtotal2;
//   int? shipping;
//   String? errormessage;
//   String? errortype;
//   List<Null>? downloadable;
//   String? imageUrl;

//   Cartproducts(
//       {this.cartId,
//       this.cartStatus,
//       this.cartFrom,
//       this.createdBy,
//       this.userSessionId,
//       this.name,
//       this.vendorid,
//       this.addedfrom,
//       this.slug,
//       this.productid,
//       this.image,
//       this.gallery1,
//       this.producttype,
//       this.regularprice,
//       this.saleprice,
//       this.attribute,
//       this.variableRegularprice,
//       this.variableSaleprice,
//       this.shippingcost,
//       this.shippingStatus,
//       this.sku,
//       this.weight,
//       this.length,
//       this.width,
//       this.height,
//       this.quantity,
//       this.simpleQuantity,
//       this.variableQuantity,
//       this.vendorStatus,
//       this.vendorName,
//       this.termIds,
//       this.includePincodes,
//       this.excludePincodes,
//       this.vendorPrice,
//       this.vendorSaleprice,
//       this.vendorQuantity,
//       this.vendorProductStatus,
//       this.vIncludePincodes,
//       this.vExcludePincodes,
//       this.availableStock,
//       this.price,
//       this.producttotal,
//       this.taxName,
//       this.tax,
//       this.taxvalue,
//       this.subtotal,
//       this.subtotal2,
//       this.shipping,
//       this.errormessage,
//       this.errortype,
//       this.downloadable,
//       this.imageUrl});

//   Cartproducts.fromJson(Map<String, dynamic> json) {
//     cartId = json['cart_id'];
//     cartStatus = json['cart_status'];
//     cartFrom = json['cart_from'];
//     createdBy = json['created_by'];
//     userSessionId = json['user_session_id'];
//     name = json['name'];
//     vendorid = json['vendorid'];
//     addedfrom = json['addedfrom'];
//     slug = json['slug'];
//     productid = json['productid'];
//     image = json['image'];
//     gallery1 = json['gallery1'];
//     producttype = json['producttype'];
//     regularprice = json['regularprice'];
//     saleprice = json['saleprice'];
//     attribute = json['attribute'];
//     variableRegularprice = json['variable_regularprice'];
//     variableSaleprice = json['variable_saleprice'];
//     shippingcost = json['shippingcost'];
//     shippingStatus = json['shipping_status'];
//     sku = json['sku'];
//     weight = json['weight'];
//     length = json['length'];
//     width = json['width'];
//     height = json['height'];
//     quantity = json['quantity'];
//     simpleQuantity = json['simple_quantity'];
//     variableQuantity = json['variable_quantity'];
//     vendorStatus = json['vendor_status'];
//     vendorName = json['vendor_name'];
//     termIds = json['term_ids'];
//     includePincodes = json['include_pincodes'];
//     excludePincodes = json['exclude_pincodes'];
//     vendorPrice = json['vendor_price'];
//     vendorSaleprice = json['vendor_saleprice'];
//     vendorQuantity = json['vendor_quantity'];
//     vendorProductStatus = json['vendor_product_status'];
//     vIncludePincodes = json['v_include_pincodes'];
//     vExcludePincodes = json['v_exclude_pincodes'];
//     availableStock = json['available_stock'];
//     price = json['price'];
//     producttotal = json['producttotal'];
//     taxName = json['tax_name'];
//     tax = json['tax'];
//     taxvalue = json['taxvalue'];
//     subtotal = json['subtotal'];
//     subtotal2 = json['subtotal2'];
//     shipping = json['shipping'];
//     errormessage = json['errormessage'];
//     errortype = json['errortype'];
//     // if (json['downloadable'] != null) {
//     //   downloadable = <Null>[];
//     //   json['downloadable'].forEach((v) {
//     //     downloadable!.add(Null.fromJson(v));
//     //   });
//     // }
//     imageUrl = json['image_url'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['cart_id'] = this.cartId;
//     data['cart_status'] = this.cartStatus;
//     data['cart_from'] = this.cartFrom;
//     data['created_by'] = this.createdBy;
//     data['user_session_id'] = this.userSessionId;
//     data['name'] = this.name;
//     data['vendorid'] = this.vendorid;
//     data['addedfrom'] = this.addedfrom;
//     data['slug'] = this.slug;
//     data['productid'] = this.productid;
//     data['image'] = this.image;
//     data['gallery1'] = this.gallery1;
//     data['producttype'] = this.producttype;
//     data['regularprice'] = this.regularprice;
//     data['saleprice'] = this.saleprice;
//     data['attribute'] = this.attribute;
//     data['variable_regularprice'] = this.variableRegularprice;
//     data['variable_saleprice'] = this.variableSaleprice;
//     data['shippingcost'] = this.shippingcost;
//     data['shipping_status'] = this.shippingStatus;
//     data['sku'] = this.sku;
//     data['weight'] = this.weight;
//     data['length'] = this.length;
//     data['width'] = this.width;
//     data['height'] = this.height;
//     data['quantity'] = this.quantity;
//     data['simple_quantity'] = this.simpleQuantity;
//     data['variable_quantity'] = this.variableQuantity;
//     data['vendor_status'] = this.vendorStatus;
//     data['vendor_name'] = this.vendorName;
//     data['term_ids'] = this.termIds;
//     data['include_pincodes'] = this.includePincodes;
//     data['exclude_pincodes'] = this.excludePincodes;
//     data['vendor_price'] = this.vendorPrice;
//     data['vendor_saleprice'] = this.vendorSaleprice;
//     data['vendor_quantity'] = this.vendorQuantity;
//     data['vendor_product_status'] = this.vendorProductStatus;
//     data['v_include_pincodes'] = this.vIncludePincodes;
//     data['v_exclude_pincodes'] = this.vExcludePincodes;
//     data['available_stock'] = this.availableStock;
//     data['price'] = this.price;
//     data['producttotal'] = this.producttotal;
//     data['tax_name'] = this.taxName;
//     data['tax'] = this.tax;
//     data['taxvalue'] = this.taxvalue;
//     data['subtotal'] = this.subtotal;
//     data['subtotal2'] = this.subtotal2;
//     data['shipping'] = this.shipping;
//     data['errormessage'] = this.errormessage;
//     data['errortype'] = this.errortype;
//     // if (this.downloadable != null) {
//     //   data['downloadable'] =
//     //       this.downloadable!.map((v) => v?.toJson()).toList();
//     // }
//     data['image_url'] = this.imageUrl;
//     return data;
//   }
// }

// class Pricedata {
//   String? subtotal1;
//   String? shipping;
//   String? carttotal;
//   String? downloadableProduct;
//   String? taxvalue;
//   String? tax;
//   String? taxName;
//   String? subtotal2;
//   String? couponCode;
//   int? couponAmount;

//   Pricedata(
//       {this.subtotal1,
//       this.shipping,
//       this.carttotal,
//       this.downloadableProduct,
//       this.taxvalue,
//       this.tax,
//       this.taxName,
//       this.subtotal2,
//       this.couponCode,
//       this.couponAmount});

//   Pricedata.fromJson(Map<String, dynamic> json) {
//     subtotal1 = json['subtotal1'];
//     shipping = json['shipping'];
//     carttotal = json['carttotal'];
//     downloadableProduct = json['downloadable_product'];
//     taxvalue = json['taxvalue'];
//     tax = json['tax'];
//     taxName = json['tax_name'];
//     subtotal2 = json['subtotal2'];
//     couponCode = json['coupon_code'];
//     couponAmount = json['coupon_amount'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['subtotal1'] = this.subtotal1;
//     data['shipping'] = this.shipping;
//     data['carttotal'] = this.carttotal;
//     data['downloadable_product'] = this.downloadableProduct;
//     data['taxvalue'] = this.taxvalue;
//     data['tax'] = this.tax;
//     data['tax_name'] = this.taxName;
//     data['subtotal2'] = this.subtotal2;
//     data['coupon_code'] = this.couponCode;
//     data['coupon_amount'] = this.couponAmount;
//     return data;
//   }
// }

// class Paymentgateway {
//   int? gateId;
//   int? status;
//   int? live;
//   String? name;
//   String? description;
//   String? paymentMail;
//   String? testKeyId;
//   String? testKeySecret;
//   String? liveKeyId;
//   String? liveKeySecret;
//   String? createdOn;
//   String? updatedOn;

//   Paymentgateway(
//       {this.gateId,
//       this.status,
//       this.live,
//       this.name,
//       this.description,
//       this.paymentMail,
//       this.testKeyId,
//       this.testKeySecret,
//       this.liveKeyId,
//       this.liveKeySecret,
//       this.createdOn,
//       this.updatedOn});

//   Paymentgateway.fromJson(Map<String, dynamic> json) {
//     gateId = json['gate_id'];
//     status = json['status'];
//     live = json['live'];
//     name = json['name'];
//     description = json['description'];
//     paymentMail = json['payment_mail'];
//     testKeyId = json['test_key_id'];
//     testKeySecret = json['test_key_secret'];
//     liveKeyId = json['live_key_id'];
//     liveKeySecret = json['live_key_secret'];
//     createdOn = json['created_on'];
//     updatedOn = json['updated_on'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['gate_id'] = this.gateId;
//     data['status'] = this.status;
//     data['live'] = this.live;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['payment_mail'] = this.paymentMail;
//     data['test_key_id'] = this.testKeyId;
//     data['test_key_secret'] = this.testKeySecret;
//     data['live_key_id'] = this.liveKeyId;
//     data['live_key_secret'] = this.liveKeySecret;
//     data['created_on'] = this.createdOn;
//     data['updated_on'] = this.updatedOn;
//     return data;
//   }
// }
class PosCreateOrderModel {
  String? status;
  List<Orderdata>? orderdata;
  String? paymentmethod;
  List<Cartproducts>? cartproducts;
  Pricedata? pricedata;
  String? message;
  Paymentgateway? paymentgateway;
  int? orderid;
  dynamic amount;
  String? name;
  String? email;
  String? currency;
  String? currencyValue;
  String? receipt;
  int? orderstatus;
  String? invoice;
  StoreLocationDetails? storeLocationDetails;

  PosCreateOrderModel(
      {this.status,
      this.orderdata,
      this.paymentmethod,
      this.cartproducts,
      this.pricedata,
      this.message,
      this.paymentgateway,
      this.orderid,
      this.amount,
      this.name,
      this.email,
      this.currency,
      this.currencyValue,
      this.receipt,
      this.orderstatus,
      this.invoice,
      this.storeLocationDetails});

  PosCreateOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['orderdata'] != null) {
      orderdata = <Orderdata>[];
      json['orderdata'].forEach((v) {
        orderdata!.add(Orderdata.fromJson(v));
      });
    }
    paymentmethod = json['paymentmethod'];
    if (json['cartproducts'] != null) {
      cartproducts = <Cartproducts>[];
      json['cartproducts'].forEach((v) {
        cartproducts!.add(Cartproducts.fromJson(v));
      });
    }
    pricedata = json['pricedata'] != null
        ? Pricedata.fromJson(json['pricedata'])
        : null;
    message = json['message'];
    paymentgateway = json['paymentgateway'] != null
        ? Paymentgateway.fromJson(json['paymentgateway'])
        : null;
    orderid = json['orderid'];
    amount = json['amount'];
    name = json['name'];
    email = json['email'];
    currency = json['currency'];
    currencyValue = json['currency_value'];
    receipt = json['receipt'];
    orderstatus = json['orderstatus'];
    invoice = json['invoice'];
    storeLocationDetails = json['store_location_details'] != null
        ? StoreLocationDetails.fromJson(json['store_location_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (orderdata != null) {
      data['orderdata'] = orderdata!.map((v) => v.toJson()).toList();
    }
    data['paymentmethod'] = paymentmethod;
    if (cartproducts != null) {
      data['cartproducts'] = cartproducts!.map((v) => v.toJson()).toList();
    }
    if (pricedata != null) {
      data['pricedata'] = pricedata!.toJson();
    }
    data['message'] = message;
    if (paymentgateway != null) {
      data['paymentgateway'] = paymentgateway!.toJson();
    }
    data['orderid'] = orderid;
    data['amount'] = amount;
    data['name'] = name;
    data['email'] = email;
    data['currency'] = currency;
    data['currency_value'] = currencyValue;
    data['receipt'] = receipt;
    data['orderstatus'] = orderstatus;
    data['invoice'] = invoice;
    if (storeLocationDetails != null) {
      data['store_location_details'] = storeLocationDetails!.toJson();
    }
    return data;
  }
}

class Orderdata {
  int? orderid;
  String? userId;
  int? createdBy;
  int? cartFrom;
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
  String? currencyCode;
  String? storeCurrency;
  String? currencyValue;
  int? deliveryType;
  String? tax;
  String? taxName;
  int? taxPercentage;
  String? subtotal;
  String? shipping;
  int? shippingMethod;
  String? totalTax;
  dynamic amount;
  int? storeBasedAmount;
  int? paymentby;
  int? paymentLink;
  String? couponCode;
  String? couponAmount;
  String? walletAmount;
  String? createdtime;
  String? updatedtime;

  Orderdata(
      {this.orderid,
      this.userId,
      this.createdBy,
      this.cartFrom,
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
      this.currencyCode,
      this.storeCurrency,
      this.currencyValue,
      this.deliveryType,
      this.tax,
      this.taxName,
      this.taxPercentage,
      this.subtotal,
      this.shipping,
      this.shippingMethod,
      this.totalTax,
      this.amount,
      this.storeBasedAmount,
      this.paymentby,
      this.paymentLink,
      this.couponCode,
      this.couponAmount,
      this.walletAmount,
      this.createdtime,
      this.updatedtime});

  Orderdata.fromJson(Map<String, dynamic> json) {
    orderid = json['orderid'];
    userId = json['user_id'];
    createdBy = json['created_by'];
    cartFrom = json['cart_from'];
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
    currencyCode = json['currency_code'];
    storeCurrency = json['store_currency'];
    currencyValue = json['currency_value'];
    deliveryType = json['delivery_type'];
    tax = json['tax'];
    taxName = json['tax_name'];
    taxPercentage = json['tax_percentage'];
    subtotal = json['subtotal'];
    shipping = json['shipping'];
    shippingMethod = json['shipping_method'];
    totalTax = json['total_tax'];
    amount = json['amount'];
    storeBasedAmount = json['store_based_amount'];
    paymentby = json['paymentby'];
    paymentLink = json['payment_link'];
    couponCode = json['coupon_code'];
    couponAmount = json['coupon_amount'];
    walletAmount = json['wallet_amount'];
    createdtime = json['createdtime'];
    updatedtime = json['updatedtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderid'] = orderid;
    data['user_id'] = userId;
    data['created_by'] = createdBy;
    data['cart_from'] = cartFrom;
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
    data['currency_code'] = currencyCode;
    data['store_currency'] = storeCurrency;
    data['currency_value'] = currencyValue;
    data['delivery_type'] = deliveryType;
    data['tax'] = tax;
    data['tax_name'] = taxName;
    data['tax_percentage'] = taxPercentage;
    data['subtotal'] = subtotal;
    data['shipping'] = shipping;
    data['shipping_method'] = shippingMethod;
    data['total_tax'] = totalTax;
    data['amount'] = amount;
    data['store_based_amount'] = storeBasedAmount;
    data['paymentby'] = paymentby;
    data['payment_link'] = paymentLink;
    data['coupon_code'] = couponCode;
    data['coupon_amount'] = couponAmount;
    data['wallet_amount'] = walletAmount;
    data['createdtime'] = createdtime;
    data['updatedtime'] = updatedtime;
    return data;
  }
}

class Cartproducts {
  int? cartId;
  int? cartStatus;
  int? cartFrom;
  int? createdBy;
  int? userSessionId;
  String? name;
  dynamic vendorid;
  int? addedfrom;
  String? slug;
  int? productid;
  String? image;
  String? gallery1;
  int? producttype;
  String? regularprice;
  String? saleprice;
  dynamic attribute;
  dynamic variableRegularprice;
  dynamic variableSaleprice;
  int? shippingcost;
  int? shippingStatus;
  String? sku;
  int? weight;
  int? length;
  int? width;
  int? height;
  int? quantity;
  int? simpleQuantity;
  dynamic variableQuantity;
  dynamic vendorStatus;
  dynamic vendorName;
  String? termIds;
  String? includePincodes;
  String? excludePincodes;
  dynamic vendorPrice;
  dynamic vendorSaleprice;
  dynamic vendorQuantity;
  dynamic vendorProductStatus;
  dynamic vIncludePincodes;
  dynamic vExcludePincodes;
  int? availableStock;
  dynamic price;
  int? producttotal;
  String? taxName;
  dynamic tax;
  dynamic taxvalue;
  dynamic subtotal;
  dynamic subtotal2;
  int? shipping;
  String? errormessage;
  String? errortype;
  List<dynamic>? downloadable;
  String? imageUrl;

  Cartproducts(
      {this.cartId,
      this.cartStatus,
      this.cartFrom,
      this.createdBy,
      this.userSessionId,
      this.name,
      this.vendorid,
      this.addedfrom,
      this.slug,
      this.productid,
      this.image,
      this.gallery1,
      this.producttype,
      this.regularprice,
      this.saleprice,
      this.attribute,
      this.variableRegularprice,
      this.variableSaleprice,
      this.shippingcost,
      this.shippingStatus,
      this.sku,
      this.weight,
      this.length,
      this.width,
      this.height,
      this.quantity,
      this.simpleQuantity,
      this.variableQuantity,
      this.vendorStatus,
      this.vendorName,
      this.termIds,
      this.includePincodes,
      this.excludePincodes,
      this.vendorPrice,
      this.vendorSaleprice,
      this.vendorQuantity,
      this.vendorProductStatus,
      this.vIncludePincodes,
      this.vExcludePincodes,
      this.availableStock,
      this.price,
      this.producttotal,
      this.taxName,
      this.tax,
      this.taxvalue,
      this.subtotal,
      this.subtotal2,
      this.shipping,
      this.errormessage,
      this.errortype,
      this.downloadable,
      this.imageUrl});

  Cartproducts.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    cartStatus = json['cart_status'];
    cartFrom = json['cart_from'];
    createdBy = json['created_by'];
    userSessionId = json['user_session_id'];
    name = json['name'];
    vendorid = json['vendorid'];
    addedfrom = json['addedfrom'];
    slug = json['slug'];
    productid = json['productid'];
    image = json['image'];
    gallery1 = json['gallery1'];
    producttype = json['producttype'];
    regularprice = json['regularprice'];
    saleprice = json['saleprice'];
    attribute = json['attribute'];
    variableRegularprice = json['variable_regularprice'];
    variableSaleprice = json['variable_saleprice'];
    shippingcost = json['shippingcost'];
    shippingStatus = json['shipping_status'];
    sku = json['sku'];
    weight = json['weight'];
    length = json['length'];
    width = json['width'];
    height = json['height'];
    quantity = json['quantity'];
    simpleQuantity = json['simple_quantity'];
    variableQuantity = json['variable_quantity'];
    vendorStatus = json['vendor_status'];
    vendorName = json['vendor_name'];
    termIds = json['term_ids'];
    includePincodes = json['include_pincodes'];
    excludePincodes = json['exclude_pincodes'];
    vendorPrice = json['vendor_price'];
    vendorSaleprice = json['vendor_saleprice'];
    vendorQuantity = json['vendor_quantity'];
    vendorProductStatus = json['vendor_product_status'];
    vIncludePincodes = json['v_include_pincodes'];
    vExcludePincodes = json['v_exclude_pincodes'];
    availableStock = json['available_stock'];
    price = json['price'];
    producttotal = json['producttotal'];
    taxName = json['tax_name'];
    tax = json['tax'];
    taxvalue = json['taxvalue'];
    subtotal = json['subtotal'];
    subtotal2 = json['subtotal2'];
    shipping = json['shipping'];
    errormessage = json['errormessage'];
    errortype = json['errortype'];
    if (json['downloadable'] != null) {
      downloadable = <Null>[];
      // json['downloadable'].forEach((v) {
      //   downloadable!.add(new Null.fromJson(v));
      // });
    }
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cart_id'] = cartId;
    data['cart_status'] = cartStatus;
    data['cart_from'] = cartFrom;
    data['created_by'] = createdBy;
    data['user_session_id'] = userSessionId;
    data['name'] = name;
    data['vendorid'] = vendorid;
    data['addedfrom'] = addedfrom;
    data['slug'] = slug;
    data['productid'] = productid;
    data['image'] = image;
    data['gallery1'] = gallery1;
    data['producttype'] = producttype;
    data['regularprice'] = regularprice;
    data['saleprice'] = saleprice;
    data['attribute'] = attribute;
    data['variable_regularprice'] = variableRegularprice;
    data['variable_saleprice'] = variableSaleprice;
    data['shippingcost'] = shippingcost;
    data['shipping_status'] = shippingStatus;
    data['sku'] = sku;
    data['weight'] = weight;
    data['length'] = length;
    data['width'] = width;
    data['height'] = height;
    data['quantity'] = quantity;
    data['simple_quantity'] = simpleQuantity;
    data['variable_quantity'] = variableQuantity;
    data['vendor_status'] = vendorStatus;
    data['vendor_name'] = vendorName;
    data['term_ids'] = termIds;
    data['include_pincodes'] = includePincodes;
    data['exclude_pincodes'] = excludePincodes;
    data['vendor_price'] = vendorPrice;
    data['vendor_saleprice'] = vendorSaleprice;
    data['vendor_quantity'] = vendorQuantity;
    data['vendor_product_status'] = vendorProductStatus;
    data['v_include_pincodes'] = vIncludePincodes;
    data['v_exclude_pincodes'] = vExcludePincodes;
    data['available_stock'] = availableStock;
    data['price'] = price;
    data['producttotal'] = producttotal;
    data['tax_name'] = taxName;
    data['tax'] = tax;
    data['taxvalue'] = taxvalue;
    data['subtotal'] = subtotal;
    data['subtotal2'] = subtotal2;
    data['shipping'] = shipping;
    data['errormessage'] = errormessage;
    data['errortype'] = errortype;
    // if (this.downloadable != null) {
    //   data['downloadable'] = this.downloadable!.map((v) => v.toJson()).toList();
    // }
    data['image_url'] = imageUrl;
    return data;
  }
}

class Pricedata {
  String? subtotal1;
  String? shipping;
  String? carttotal;
  String? downloadableProduct;
  String? taxvalue;
  String? tax;
  String? taxName;
  String? subtotal2;
  String? couponCode;
  int? couponAmount;

  Pricedata(
      {this.subtotal1,
      this.shipping,
      this.carttotal,
      this.downloadableProduct,
      this.taxvalue,
      this.tax,
      this.taxName,
      this.subtotal2,
      this.couponCode,
      this.couponAmount});

  Pricedata.fromJson(Map<String, dynamic> json) {
    subtotal1 = json['subtotal1'];
    shipping = json['shipping'];
    carttotal = json['carttotal'];
    downloadableProduct = json['downloadable_product'];
    taxvalue = json['taxvalue'];
    tax = json['tax'];
    taxName = json['tax_name'];
    subtotal2 = json['subtotal2'];
    couponCode = json['coupon_code'];
    couponAmount = json['coupon_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subtotal1'] = subtotal1;
    data['shipping'] = shipping;
    data['carttotal'] = carttotal;
    data['downloadable_product'] = downloadableProduct;
    data['taxvalue'] = taxvalue;
    data['tax'] = tax;
    data['tax_name'] = taxName;
    data['subtotal2'] = subtotal2;
    data['coupon_code'] = couponCode;
    data['coupon_amount'] = couponAmount;
    return data;
  }
}

class Paymentgateway {
  int? gateId;
  int? status;
  int? live;
  String? name;
  String? description;
  String? paymentMail;
  String? testKeyId;
  String? testKeySecret;
  String? liveKeyId;
  String? liveKeySecret;
  String? createdOn;
  String? updatedOn;

  Paymentgateway(
      {this.gateId,
      this.status,
      this.live,
      this.name,
      this.description,
      this.paymentMail,
      this.testKeyId,
      this.testKeySecret,
      this.liveKeyId,
      this.liveKeySecret,
      this.createdOn,
      this.updatedOn});

  Paymentgateway.fromJson(Map<String, dynamic> json) {
    gateId = json['gate_id'];
    status = json['status'];
    live = json['live'];
    name = json['name'];
    description = json['description'];
    paymentMail = json['payment_mail'];
    testKeyId = json['test_key_id'];
    testKeySecret = json['test_key_secret'];
    liveKeyId = json['live_key_id'];
    liveKeySecret = json['live_key_secret'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gate_id'] = gateId;
    data['status'] = status;
    data['live'] = live;
    data['name'] = name;
    data['description'] = description;
    data['payment_mail'] = paymentMail;
    data['test_key_id'] = testKeyId;
    data['test_key_secret'] = testKeySecret;
    data['live_key_id'] = liveKeyId;
    data['live_key_secret'] = liveKeySecret;
    data['created_on'] = createdOn;
    data['updated_on'] = updatedOn;
    return data;
  }
}

class StoreLocationDetails {
  int? storeLocationId;
  String? locationTitle;
  String? addressline1;
  String? countryName;
  dynamic stateName;
  dynamic cityName;

  StoreLocationDetails(
      {this.storeLocationId,
      this.locationTitle,
      this.addressline1,
      this.countryName,
      this.stateName,
      this.cityName});

  StoreLocationDetails.fromJson(Map<String, dynamic> json) {
    storeLocationId = json['store_location_id'];
    locationTitle = json['location_title'];
    addressline1 = json['addressline1'];
    countryName = json['country_name'];
    stateName = json['state_name'];
    cityName = json['city_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['store_location_id'] = storeLocationId;
    data['location_title'] = locationTitle;
    data['addressline1'] = addressline1;
    data['country_name'] = countryName;
    data['state_name'] = stateName;
    data['city_name'] = cityName;
    return data;
  }
}
