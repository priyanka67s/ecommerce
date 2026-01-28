class PerformanceReportModel {
  String? status;
  String? message;
  int? totalsales;
  int? productsold;
  int? totalorder;
  List<TopUsers>? topUsers;
  List<TopProducts>? topProducts;
  List<TopCategories>? topCategories;
  List<SalesChartData>? salesChartData;

  PerformanceReportModel(
      {this.status,
      this.message,
      this.totalsales,
      this.productsold,
      this.totalorder,
      this.topUsers,
      this.topProducts,
      this.topCategories,
      this.salesChartData});

  PerformanceReportModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    totalsales = json['totalsales'];
    productsold = json['productsold'];
    totalorder = json['totalorder'];
    if (json['top_users'] != null) {
      topUsers = <TopUsers>[];
      json['top_users'].forEach((v) {
        topUsers!.add(TopUsers.fromJson(v));
      });
    }
    if (json['top_products'] != null) {
      topProducts = <TopProducts>[];
      json['top_products'].forEach((v) {
        topProducts!.add(TopProducts.fromJson(v));
      });
    }
    if (json['top_categories'] != null) {
      topCategories = <TopCategories>[];
      json['top_categories'].forEach((v) {
        topCategories!.add(TopCategories.fromJson(v));
      });
    }
    if (json['sales_chart_data'] != null) {
      salesChartData = <SalesChartData>[];
      json['sales_chart_data'].forEach((v) {
        salesChartData!.add(SalesChartData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['totalsales'] = totalsales;
    data['productsold'] = productsold;
    data['totalorder'] = totalorder;
    if (topUsers != null) {
      data['top_users'] = topUsers!.map((v) => v.toJson()).toList();
    }
    if (topProducts != null) {
      data['top_products'] = topProducts!.map((v) => v.toJson()).toList();
    }
    if (topCategories != null) {
      data['top_categories'] =
          topCategories!.map((v) => v.toJson()).toList();
    }
    if (salesChartData != null) {
      data['sales_chart_data'] =
          salesChartData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopUsers {
  int? id;
  String? name;
  int? ordercount;

  TopUsers({this.id, this.name, this.ordercount});

  TopUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ordercount = json['ordercount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['ordercount'] = ordercount;
    return data;
  }
}

class TopProducts {
  int? productid;
  String? name;
  int? quantitysold;
  num? productsale;

  TopProducts({this.productid, this.name, this.quantitysold, this.productsale});

  TopProducts.fromJson(Map<String, dynamic> json) {
    productid = json['productid'];
    name = json['name'];
    quantitysold = json['quantitysold'];
    productsale = json['productsale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productid'] = productid;
    data['name'] = name;
    data['quantitysold'] = quantitysold;
    data['productsale'] = productsale;
    return data;
  }
}

class TopCategories {
  int? termId;
  String? termName;
  int? quantitysold;
  num? productsale;

  TopCategories(
      {this.termId, this.termName, this.quantitysold, this.productsale});

  TopCategories.fromJson(Map<String, dynamic> json) {
    termId = json['term_id'];
    termName = json['term_name'];
    quantitysold = json['quantitysold'];
    productsale = json['productsale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['term_id'] = termId;
    data['term_name'] = termName;
    data['quantitysold'] = quantitysold;
    data['productsale'] = productsale;
    return data;
  }
}

class SalesChartData {
  String? m;
  String? d;
  int? earnings;
  int? orderCount;

  SalesChartData({this.m, this.d, this.earnings, this.orderCount});

  SalesChartData.fromJson(Map<String, dynamic> json) {
    m = json['m'];
    d = json['d'];
    earnings = json['Earnings'];
    orderCount = json['OrderCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['m'] = m;
    data['d'] = d;
    data['Earnings'] = earnings;
    data['OrderCount'] = orderCount;
    return data;
  }
}
