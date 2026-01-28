class OrderCountReportModel {
  String? status;
  String? message;
  List<OrderCount>? ordercount;

  OrderCountReportModel({this.status, this.message, this.ordercount});

  OrderCountReportModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['ordercount'] != null) {
      ordercount = <OrderCount>[];
      json['ordercount'].forEach((v) {
        ordercount!.add(OrderCount.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (ordercount != null) {
      data['ordercount'] = ordercount!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderCount {
  int? totalOrders;
  int? totalSales;
  String? orderDate;

  OrderCount({this.totalOrders, this.totalSales, this.orderDate});

  OrderCount.fromJson(Map<String, dynamic> json) {
    totalOrders = json['total_orders'];
    totalSales = json['total_sales'];
    orderDate = json['order_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_orders'] = totalOrders;
    data['total_sales'] = totalSales;
    data['order_date'] = orderDate;
    return data;
  }
}
