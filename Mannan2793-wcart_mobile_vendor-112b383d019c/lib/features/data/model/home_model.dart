class VendorModel {
  final String? title;
  final bool? status;
  final String? baseURL;
  final int? userCount;
  final num? orderValue;
  final int? productCount;
  final int? ordersCount;
  final int? subscribeCount;
  final String? vendorPermission;
  final List<SalesByCategory>? salesByCategory;
  final List<MonthBasedOrder>? monthBasedOrders;
  final String? isOwner;

  VendorModel({
    this.title,
    this.status,
    this.baseURL,
    this.userCount,
    this.productCount,
    this.ordersCount,
    this.subscribeCount,
    this.vendorPermission,
    this.salesByCategory,
    this.monthBasedOrders,
    this.isOwner,
    this.orderValue,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) {
    return VendorModel(
      title: json['title'],
      status: json['status'] == 'true',
      baseURL: json['baseURL'],
      orderValue: json['orderValue'],
      userCount: json['userCount'] is List && json['userCount'].isNotEmpty
          ? json['userCount'][0]['userCount']
          : null,
      productCount:
          json['productCount'] is List && json['productCount'].isNotEmpty
              ? json['productCount'][0]['productCount']
              : json['productCount']['productCount'] ?? 0,
      ordersCount: json['ordersCount'] is List && json['ordersCount'].isNotEmpty
          ? json['ordersCount'][0]['ordersCount']
          : json['ordersCount'] ?? 0,
      subscribeCount:
          json['subscribeCount'] is List && json['subscribeCount'].isNotEmpty
              ? json['subscribeCount'][0]['subscribeCount']
              : null,
      vendorPermission: json['vendor_permission'],
      salesByCategory: json['sales_by_category'] != null
          ? List<SalesByCategory>.from(
              json['sales_by_category'].map((x) => SalesByCategory.fromJson(x)))
          : null,
      monthBasedOrders: json['month_based_orders'] != null
          ? List<MonthBasedOrder>.from(json['month_based_orders']
              .map((x) => MonthBasedOrder.fromJson(x)))
          : null,
      isOwner: json['is_owner'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'title': title,
      'status': status?.toString(),
      'baseURL': baseURL,
      'orderValue': orderValue,
    };
    
    if (userCount != null) {
      data['userCount'] = [{'userCount': userCount}];
    }
    if (productCount != null) {
      data['productCount'] = {'productCount': productCount};
    }
    if (ordersCount != null) {
      data['ordersCount'] = {'ordersCount': ordersCount};
    }
    if (subscribeCount != null) {
      data['subscribeCount'] = [{'subscribeCount': subscribeCount}];
    }
    if (vendorPermission != null) {
      data['vendor_permission'] = vendorPermission;
    }
    if (salesByCategory != null) {
      data['sales_by_category'] =
          salesByCategory!.map((x) => x.toJson()).toList();
    }
    if (monthBasedOrders != null) {
      data['month_based_orders'] =
          monthBasedOrders!.map((x) => x.toJson()).toList();
    }
    if (isOwner != null) {
      data['is_owner'] = isOwner;
    }
    
    return data;
  }
}

class SalesByCategory {
  final int? termId;
  final String? termName;
  final String? termSlug;
  final int? quantitySold;
  final double? productSale;
  final DateTime? orderDate;

  SalesByCategory({
    this.termId,
    this.termName,
    this.termSlug,
    this.quantitySold,
    this.productSale,
    this.orderDate,
  });

  factory SalesByCategory.fromJson(Map<String, dynamic> json) {
    return SalesByCategory(
      termId: json['term_id'],
      termName: json['term_name'],
      termSlug: json['term_slug'],
      quantitySold: json['quantitysold'],
      productSale: json['productsale'] is int
          ? json['productsale'].toDouble()
          : json['productsale'],
      orderDate: json['order_date'] != null
          ? DateTime.parse(json['order_date'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'term_id': termId,
      'term_name': termName,
      'term_slug': termSlug,
      'quantitysold': quantitySold,
      'productsale': productSale,
    };

    if (orderDate != null) {
      data['order_date'] = orderDate!.toIso8601String();
    }

    return data;
  }
}

class MonthBasedOrder {
  final int? totalOrders;
  final double? totalSales;
  final DateTime? orderDate;

  MonthBasedOrder({
    this.totalOrders,
    this.totalSales,
    this.orderDate,
  });

  factory MonthBasedOrder.fromJson(Map<String, dynamic> json) {
    return MonthBasedOrder(
      totalOrders: json['total_orders'],
      totalSales: json['total_sales'] is int
          ? json['total_sales'].toDouble()
          : json['total_sales'],
      orderDate: json['order_date'] != null
          ? DateTime.parse(json['order_date'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'total_orders': totalOrders,
      'total_sales': totalSales,
    };

    if (orderDate != null) {
      data['order_date'] = orderDate!.toIso8601String();
    }

    return data;
  }
}
