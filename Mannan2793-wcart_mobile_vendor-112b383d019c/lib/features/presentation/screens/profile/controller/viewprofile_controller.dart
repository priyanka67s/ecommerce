import 'package:get/get.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/viewprofile_model.dart';
import 'package:wcart_vendor/singleton.dart';
class ViewProfileController extends GetxController with StateMixin {
  ViewProfileModel viewProfileData = ViewProfileModel();

  @override
  void onInit() {
    super.onInit();
    viewProfile();    
  }

  viewProfile() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.viewProfile, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
    }).then((value) {
      print(value);
      if (value['status']) {
        viewProfileData = ViewProfileModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(viewProfileData, status: RxStatus.success());
  }
}
