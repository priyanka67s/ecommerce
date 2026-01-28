import 'package:get/get.dart';
import 'package:wcart_vendor/http/getx_repository.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/lowstockproduct_model.dart';
import 'package:wcart_vendor/model/reward_transcation_model.dart';
import 'package:wcart_vendor/model/stafforder_model.dart';
import 'package:wcart_vendor/singleton.dart';

class LowStockController extends GetxController with StateMixin {
  ApiClient apiClient = ApiClient();

  LowStockProductsModel lowStockProductData = LowStockProductsModel();

  StaffOrderReportModel viewStaffOrderData = StaffOrderReportModel();

  RewardPointTransactionModel rewardPointTransactionData =
      RewardPointTransactionModel();

  // var warehouseDropDownValue;
  @override
  void onInit() {
    print('-------Muthu-----');

    super.onInit();
    lowStockQty();
    viewOrder();
    rewardTransaction();
  }

  lowStockQty() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.lowStockProduct, body: {
      'vendorid': Singleton.instance.vendorId ?? "",
      'servicekey': Singleton.instance.serviceKey,
    }).then((value) {
      print(value);
      if (value['status']) {
        lowStockProductData = LowStockProductsModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(lowStockProductData, status: RxStatus.success());
  }

  viewOrder() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.manageOrder, body: {
      'vendorid': Singleton.instance.vendorId ?? "",
      'servicekey': "wkl6b96ilyzt0vmy",
      // Singleton.instance.serviceKey,
      "cart_form": "3",
      "store_staff_id": Singleton.instance.storeStaffId,
      // "2",
      'warehouse_id': Singleton.instance.warehouseId,
      'store_location_id': Singleton.instance.storeLocationId,
      // '8',
      // "is_login": "1"
    }).then((value) {
      print('muthuvel------------------');
      print(value);
      if (value['status']) {
        viewStaffOrderData = StaffOrderReportModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(viewStaffOrderData, status: RxStatus.success());
  }

  rewardTransaction() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.rewardTransaction, body: {
      'user_id': "211",
      // Singleton.instance.vendorId ?? "",
      // 'servicekey': Singleton.instance.serviceKey,
    }).then((value) {
      print(value);
      if (value['status']) {
        rewardPointTransactionData =
            RewardPointTransactionModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(rewardPointTransactionData, status: RxStatus.success());
  }
}
