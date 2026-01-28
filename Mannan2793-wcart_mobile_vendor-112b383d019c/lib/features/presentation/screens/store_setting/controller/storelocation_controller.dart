import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/activestorelocation_model.dart';
import 'package:wcart_vendor/singleton.dart';

class StoreLocationController extends GetxController with StateMixin {
  List<String> selectStoreStatusValueList = ['Single Store', 'Multi Store'];
  // List<String> locationStatusValueList = ['Active', 'InActive'];

  ActiveStoreLocationModel activeStoreLocationData = ActiveStoreLocationModel();

  String? selectedStoreStatusValueList;
  // String? locationSelectedStatusValueList;

  var storeLocationDropDownValue;

  @override
  void onInit() {
    print('-------Muthu-----');
    activeStoreLocation();
    super.onInit();
  }

  activeStoreLocation() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.activeStoreLocation, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      'store_staff_id': ''
    }).then((value) {
      print('-------muthuvel-------Store Location');
      print(value);
      if (value['status']) {
        activeStoreLocationData =
            ActiveStoreLocationModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(activeStoreLocationData, status: RxStatus.success());
  }

  saveStoreSetting() async {
    await HttpClint.urlEncoded(HttpUrl.saveStoreSetting, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      "store_type": '1',
      // selectedStoreStatusValueList.toString(),
      "default_store_location_id": '1',
      // storeLocationDropDownValue.toString()
    }).then((value) {
      print('muthuvel');
      print(value);
      if (value['status']) {
        showSuccessSnackBar('Store Settings Updated Successfully');
      } else {
        print('error');
      }
    });
  }
}
