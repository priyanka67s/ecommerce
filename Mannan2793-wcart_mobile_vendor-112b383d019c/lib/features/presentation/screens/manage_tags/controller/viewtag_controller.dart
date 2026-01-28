import 'package:get/get.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/features/data/model/listtags_model.dart';
import 'package:wcart_vendor/singleton.dart';

class ViewTagsController extends GetxController with StateMixin {
  ViewTagsModel listTagsData = ViewTagsModel();
  @override
  void onInit() {
    print('-------Muthu-----');
    change(null, status: RxStatus.loading());
    viewTags();
    super.onInit();    
  }

  viewTags() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.manageTag, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
    }).then((value) {
      print(value);
      if (value['status']) {
        listTagsData = ViewTagsModel.fromJson(value['data']);
        print('--------muthuvel-----');

        print(listTagsData);
      } else {
        print('error');
      }
    });
    change(listTagsData, status: RxStatus.success());
  }
}
