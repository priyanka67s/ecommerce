import 'package:get/get.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/activestorelocation_model.dart';
import 'package:wcart_vendor/model/storebasedproduct_model.dart';
import 'package:wcart_vendor/singleton.dart';

class ListStoreProductListController extends GetxController with StateMixin {
  StoreBasedProductModel viewStoreInventoryData = StoreBasedProductModel();
  ActiveStoreLocationModel activeStoreData = ActiveStoreLocationModel();

  var storeLocationDropDownValue;

  var selectedFilterCategory = ''.obs;

  var selectedSortCategory = ''.obs;

  @override
  void onInit() {
    print('-------Muthu-----');

    super.onInit();
    activeStoreLocation();
    viewStoreProductInventory();
  }

  viewStoreProductInventory({
    String? filter,
    String? filterby,
    String? order,
    String? orderby,
    int? storelocationId,
  }) async {
    print('muthuvel');
    change(null, status: RxStatus.loading());
    print('screen status ---> ${status.isLoading}');
    HttpClint.urlEncoded(HttpUrl.allStoreProductList, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      'store_staff_id': '',
      "order": order ?? "",
      "orderby": orderby ?? "",
      "filter": filter ?? '',
      "filterby": filterby ?? '',
      "store_location_id": storeLocationDropDownValue != null
          ? storeLocationDropDownValue.toString()
          : '',
    }).then((value) {
      print("--------------inventorydata");
      if (value['status']) {
        viewStoreInventoryData = StoreBasedProductModel.fromJson(value['data']);
        change(viewStoreInventoryData);
      } else {
        print('error');
      }
    });
    change(viewStoreInventoryData, status: RxStatus.success());
  }

  activeStoreLocation() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.activeStore, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey ?? "",
    }).then((value) {
      print(value);
      if (value['status']) {
        activeStoreData = ActiveStoreLocationModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(activeStoreData, status: RxStatus.success());
  }
}
