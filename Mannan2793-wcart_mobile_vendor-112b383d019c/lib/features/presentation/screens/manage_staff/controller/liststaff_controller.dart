import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/allstaffs_model.dart';
import 'package:wcart_vendor/singleton.dart';

class ListStaffController extends GetxController with StateMixin {
  AllStaffsModel allStaffData = AllStaffsModel();
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    print('-------Muthu-----');
    super.onInit();
    allStaff();    
  }

  allStaff() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.viewVendorStaff, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      "store_staff_id": ''
    }).then((value) {
      print(value);
      if (value['status']) {
        allStaffData = AllStaffsModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(allStaffData, status: RxStatus.success());
  }

  Future<void> deleteStaff(
      {
    required String staffId,
  }) async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.deleteVendorStaff, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey ?? "",
      "store_staff_id": "0",
      "edit_store_staff_id": staffId,
    }).then((value) {
      print(value);
      if (value['status']) {
        allStaff();
      } else {
        print('error');
      }
    });
  }
}
