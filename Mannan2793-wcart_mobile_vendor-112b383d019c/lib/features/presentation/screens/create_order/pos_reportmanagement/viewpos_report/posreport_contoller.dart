import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/performance_model.dart';
import 'package:wcart_vendor/singleton.dart';

class ReportPerformanceController extends GetxController with StateMixin {
  PerformanceReportModel viewReportPerformanceData = PerformanceReportModel();
  String countList = 'today';
  List<String> selectedPeriod = [
    "today",
    'yesterday',
    'thisweek',
    'lastweek',
    'thismonth',
    'lastmonth',
    "custom"
  ];

  String? reportlist;

  @override
  void onInit() {
    viewPerformanceReport();
    super.onInit();
  }

  viewPerformanceReport(
      {String? selectedPeriod, String? startDate, String? endDate}) async {
    debugPrint(
      Singleton.instance.serviceKey,
    );
    change(null, status: RxStatus.loading());
    debugPrint("vendorId: ${selectedPeriod ?? ''}");
    debugPrint("serviceKey: ${startDate ?? ''}");
    debugPrint("serviceKey: ${endDate ?? ''}");
    await HttpClint.urlEncoded(HttpUrl.performanceReport, body: {
      'vendorid': Singleton.instance.vendorId,
      'servicekey': Singleton.instance.serviceKey,
      'period': selectedPeriod ?? '',
      "startdate": startDate ?? "",
      "enddate": endDate ?? "",
      "cart_from": "",
      "store_staff_id": '',
    }).then((value) {
        debugPrint(
          "----------------------viewReport---------",
        );
        debugPrint(value.toString());
      if (value['status']) {
        viewReportPerformanceData =
            PerformanceReportModel.fromJson(value['data']);
        change(viewReportPerformanceData);
      } else {
          debugPrint(
            'error',
          );
      }
      },
    );
    change(viewReportPerformanceData, status: RxStatus.success());
  }

  updateRecordListValue({required String value}) {
    change(reportlist = value);
    viewPerformanceReport(selectedPeriod: value);
  }

  Future<void> countRecordListValue(
      {
    required String value,
    required BuildContext context,
  }) async {
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

    await viewPerformanceReport(
        selectedPeriod: value, startDate: startDate, endDate: endDate);
  }
}
