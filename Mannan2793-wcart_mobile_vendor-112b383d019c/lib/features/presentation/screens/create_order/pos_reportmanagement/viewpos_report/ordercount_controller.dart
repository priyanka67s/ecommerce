import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/ordercounttotal_model.dart';
import 'package:wcart_vendor/singleton.dart';

class OrderCountReportController extends GetxController with StateMixin {
  OrderCountReportModel orderCountReportData = OrderCountReportModel();
  List<String> selectedPeriodCount = [
    "today",
    'yesterday',
    'thisweek',
    'lastweek',
    'thismonth',
    'lastmonth',
    "custom"
  ];

  String countList = 'today';

  @override
  void onInit() {
    orderCountReport();
    super.onInit();
  }

  Future<void> orderCountReport(
      {String? selectedPeriodCount, String? startDate, String? endDate}) async {
    print(Singleton.instance.vendorId);
    print(Singleton.instance.serviceKey);
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.orderCountTotal, body: {
      'vendorid': Singleton.instance.vendorId,
      'servicekey': Singleton.instance.serviceKey,
      'period': selectedPeriodCount ?? "",
      "store_staff_id": "2",
      // Singleton.instance.storeStaffId,
      "cart_from": "3",
      "startdate": startDate ?? "",
      "enddate": endDate ?? "",
    }).then((value) {
      print("----------------------viewreport---------");
      print(value);
      if (value['status']) {
        orderCountReportData = OrderCountReportModel.fromJson(value['data']);
        change(orderCountReportData);
      } else {
        print('error');
      }
    });
    change(orderCountReportData, status: RxStatus.success());
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

    await orderCountReport(
        selectedPeriodCount: value, startDate: startDate, endDate: endDate);
  }
}
