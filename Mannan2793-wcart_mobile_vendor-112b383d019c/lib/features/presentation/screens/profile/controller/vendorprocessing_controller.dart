import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/processingpayout_model.dart';
import 'package:wcart_vendor/model/vendorearnings_model.dart';
import 'package:wcart_vendor/singleton.dart';

class VendorProcessingController extends GetxController with StateMixin {
  ViewVendorEarningsModel vendorEarningData = ViewVendorEarningsModel();
  ViewProcessingPayoutModel viewProcessingPayoutData =
      ViewProcessingPayoutModel();

  @override
  void onInit() {
    super.onInit();
    vendorEarning();
    vendorProcessingPayouts();
  }

  vendorEarning() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.unpaidEarnings, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
    }).then((value) {
      print(value);
      if (value['status']) {
        vendorEarningData = ViewVendorEarningsModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(vendorEarningData, status: RxStatus.success());
  }

  vendorProcessingPayouts() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.processingPayouts, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
    }).then((value) {
      print(value);
      if (value['status']) {
        debugPrint(value['data'].toString());
        viewProcessingPayoutData =
            ViewProcessingPayoutModel.fromJson(value['data']);
      } else {
        print('error');
      }
      },
    );
    change(viewProcessingPayoutData, status: RxStatus.success());
  }
}
