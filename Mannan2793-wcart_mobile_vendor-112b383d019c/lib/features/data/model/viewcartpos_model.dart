class ViewCartPosModel {
  String? status;
  List<Cartproducts>? cartproducts;
  List<Pricedata>? pricedata;
  int? cartCount;
  String? message;
  List<String>? errorarray;
  String? userId;

  ViewCartPosModel(
      {this.status,
      this.cartproducts,
      this.pricedata,
      this.cartCount,
      this.message,
      this.errorarray,
      this.userId});

  ViewCartPosModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['cartproducts'] != null) {
      cartproducts = <Cartproducts>[];
      json['cartproducts'].forEach((v) {
        cartproducts!.add(Cartproducts.fromJson(v));
      });
    }
    if (json['pricedata'] != null) {
      pricedata = <Pricedata>[];
      json['pricedata'].forEach((v) {
        pricedata!.add(Pricedata.fromJson(v));
      });
    }
    cartCount = json['cart_count'];
    message = json['message'];
    errorarray = json['errorarray'].cast<String>();
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (cartproducts != null) {
      data['cartproducts'] = cartproducts!.map((v) => v.toJson()).toList();
    }
    if (pricedata != null) {
      data['pricedata'] = pricedata!.map((v) => v.toJson()).toList();
    }
    data['cart_count'] = cartCount;
    data['message'] = message;
    data['errorarray'] = errorarray;
    data['user_id'] = userId;
    return data;
  }
}

class Cartproducts {
  int? cartId;
  int? userId;
  String? name;
  int? vendorid;
  int? addedfrom;
  String? slug;
  int? productid;
  String? image;
  int? producttype;
  dynamic regularprice;
  dynamic saleprice;
  String? attribute;
  dynamic variableRegularprice;
  dynamic variableSaleprice;
  int? shippingcost;
  int? shippingStatus;
  String? sku;
  int? weight;
  int? length;
  int? width;
  int? height;
  late int quantity;
  int? simpleQuantity;
  dynamic variableQuantity;
  int? vendorStatus;
  dynamic price;
  int? producttotal;
  String? errormessage;
  String? errortype;
  String? imageUrl;

  Cartproducts(
      {this.cartId,
      this.userId,
      this.name,
      this.vendorid,
      this.addedfrom,
      this.slug,
      this.productid,
      this.image,
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
      this.quantity = 1,
      this.simpleQuantity,
      this.variableQuantity,
      this.vendorStatus,
      this.price,
      this.producttotal,
      this.errormessage,
      this.errortype,
      this.imageUrl});

  Cartproducts.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    userId = json['user_id'];
    name = json['name'];
    vendorid = json['vendorid'];
    addedfrom = json['addedfrom'];
    slug = json['slug'];
    productid = json['productid'];
    image = json['image'];
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
    price = json['price'];
    producttotal = json['producttotal'];
    errormessage = json['errormessage'];
    errortype = json['errortype'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cart_id'] = cartId;
    data['user_id'] = userId;
    data['name'] = name;
    data['vendorid'] = vendorid;
    data['addedfrom'] = addedfrom;
    data['slug'] = slug;
    data['productid'] = productid;
    data['image'] = image;
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
    data['price'] = price;
    data['producttotal'] = producttotal;
    data['errormessage'] = errormessage;
    data['errortype'] = errortype;
    data['image_url'] = imageUrl;
    return data;
  }
}

class Pricedata {
  String? subtotal1;
  String? shipping;
  String? carttotal;
  String? subtotal2;
  String? taxvalue;
  Pricedata(
      {this.subtotal1,
      this.shipping,
      this.carttotal,
      this.subtotal2,
      this.taxvalue});

  Pricedata.fromJson(Map<String, dynamic> json) {
    subtotal1 = json['subtotal'];
    shipping = json['shipping'];
    carttotal = json['carttotal'];
    subtotal2 = json['subtotal2'];
    taxvalue = json['taxvalue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subtotal'] = subtotal1;
    data['shipping'] = shipping;
    data['carttotal'] = carttotal;
    data['subtotal2'] = subtotal2;
    data['taxvalue'] = taxvalue;
    return data;
  }
}
