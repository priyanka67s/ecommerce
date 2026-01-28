import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/ordercounttotal_model.dart';
import 'package:wcart_vendor/model/performance_model.dart';
import 'package:wcart_vendor/model/vendor_low_stock_model.dart';
import 'package:wcart_vendor/model/vendorsales_category_model.dart';
import 'package:wcart_vendor/singleton.dart';

class VendorReportController extends GetxController with StateMixin {
  String countList = 'today';
  VendorLowStockModel lowStockVendorProductData = VendorLowStockModel();
  PerformanceReportModel viewReportPerformanceData = PerformanceReportModel();
  List<String> selectedPeriodCount = [
    "today",
    'yesterday',
    'thisweek',
    'lastweek',
    'thismonth',
    'lastmonth',
    "custom"
  ];

  VendorSalesByCategoryModel vendorSalesCategoryData =
      VendorSalesByCategoryModel();

  @override
  void onInit() {
    print('-------Muthu-----');
    super.onInit();
    lowStockQty();
    salesByCategoryReport();
    viewPerformanceReport();
  }

  lowStockQty() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.lowStockProduct, body: {
      'vendorid': Singleton.instance.vendorId ?? "",
      'servicekey': Singleton.instance.serviceKey,
      "store_staff_id": "",
    }).then((value) {
      print(value);
      if (value['status']) {
        lowStockVendorProductData = VendorLowStockModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(lowStockVendorProductData, status: RxStatus.success());
  }

  

  Future<void> salesByCategoryReport(
      {
    String? selectedPeriodCount,
    String? startDate,
    String? endDate,
  }) async {
    print(Singleton.instance.vendorId);
    print(Singleton.instance.serviceKey);
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.salesByCategory, body: {
      'vendorid': Singleton.instance.vendorId,
      'servicekey': Singleton.instance.serviceKey,
      'period': selectedPeriodCount ?? "",
      "store_staff_id": "",
      // Singleton.instance.storeStaffId,
      // "cart_from": "3",
      "startdate": startDate ?? "",
      "enddate": endDate ?? "",
    }).then((value) {
      print("----------------------viewreport---------");
      print(value);
      if (value['status']) {
        vendorSalesCategoryData =
            VendorSalesByCategoryModel.fromJson(value['data']);
        change(vendorSalesCategoryData);
      } else {
        print('error');
      }
    });
    change(vendorSalesCategoryData, status: RxStatus.success());
  }

  Future<void> countRecordListValue(
      {required String value, required BuildContext context}) async {
    change(countList = value);

    String? startDate;
    String? endDate;

    if (value == "custom") {
      DateTimeRange? dateRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );

      if (dateRange != null) {
        startDate = dateRange.start.toIso8601String();
        endDate = dateRange.end.toIso8601String();
      }
    }

    // await orderCountReport(
    //     selectedPeriodCount: value, startDate: startDate, endDate: endDate);
  }

  viewPerformanceReport(
      {String? selectedPeriod, String? startDate, String? endDate}) async {
    print(
      Singleton.instance.serviceKey,
    );
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.performanceReport, body: {
      'vendorid': Singleton.instance.vendorId,
      'servicekey': Singleton.instance.serviceKey,
      'period': selectedPeriod ?? '',
      "startdate": startDate ?? "",
      "enddate": endDate ?? "",
      // "cart_from": "3",
      "store_staff_id": '',
    }).then((value) {
      print("----------------------viewreport---------");
      print(value);
      if (value['status']) {
        viewReportPerformanceData =
            PerformanceReportModel.fromJson(value['data']);
        change(viewReportPerformanceData);
      } else {
        print('error');
      }
    });
    change(viewReportPerformanceData, status: RxStatus.success());
  }
}
