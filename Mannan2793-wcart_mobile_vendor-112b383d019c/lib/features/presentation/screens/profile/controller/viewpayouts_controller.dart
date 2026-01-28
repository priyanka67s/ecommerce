import 'package:get/get.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/viewpaidpayout_model.dart';
import 'package:wcart_vendor/model/viewpayouts_model.dart';
import 'package:wcart_vendor/singleton.dart';

class ViewPayoutsController extends GetxController with StateMixin {
  ViewPayoutModel viewPayoutsData = ViewPayoutModel();

  ViewPaidPayoutModel viewPaidPayoutsData = ViewPaidPayoutModel();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
viewPayouts();
    }
    
    viewPaidPayouts();
  }

  viewPayouts() async {
    print(
      Get.arguments['ProcessId'].toString(),
    );
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.viewPayouts, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      'process_id': Get.arguments['ProcessId'].toString(),      
    }).then((value) {
      print(value);
      if (value['status']) {
        viewPayoutsData = ViewPayoutModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(viewPayoutsData, status: RxStatus.success());
  }

  viewPaidPayouts() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.viewPaidPayouts, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      'store_staff_id': ''
    }).then((value) {
      print(value);
      if (value['status']) {
        viewPaidPayoutsData = ViewPaidPayoutModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(viewPaidPayoutsData, status: RxStatus.success());
  }
}
