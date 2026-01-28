import 'package:get/get.dart';

class MultiStoreInventoryController extends GetxController with StateMixin{

  @override
  void onInit() {
    super.onInit();
    getMultiStoreInventory();
    change(null, status: RxStatus.success());
  }
  
  void getMultiStoreInventory() {
    // API call to get multi store inventory
    
  }
}