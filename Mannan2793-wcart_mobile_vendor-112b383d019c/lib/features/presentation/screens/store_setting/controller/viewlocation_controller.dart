import 'package:get/get.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/viewstorelocation_model.dart';
import 'package:wcart_vendor/singleton.dart';

class ViewStoreLocation extends GetxController with StateMixin {
  ViewStoreLocationModel viewStoreLocationData = ViewStoreLocationModel();
  @override
  void onInit() {
    print('-------Muthu-----');
    viewStoreLocation();
    super.onInit();
  }

  viewStoreLocation() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.viewStoreLocation, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      "store_staff_id": '',
    }).then((value) {
      print('muthuvel');
      print(value);
      if (value['status']) {
        viewStoreLocationData = ViewStoreLocationModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(viewStoreLocationData, status: RxStatus.success());
  }
}
