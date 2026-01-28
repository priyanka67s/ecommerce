
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/model/get_attribute_item_model.dart';
import 'package:wcart_vendor/singleton.dart';

import '../../../../../../http/http_url.dart';

class AttValuesController extends GetxController with StateMixin {
 String title = '';
 TextEditingController titleController = TextEditingController();
  int? selectedIndex = null;
  AttributeManagementResponse viewAttributeItemData =
      AttributeManagementResponse(attribute: [], items: []);

  @override
  void onInit() {
    super.onInit();
    title = Get.arguments['title'];    
    print('-------Muthu-----');
  }

  //! get Attribute items api integration
  Future<void> getAttributeItems(String attributeslug) async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.getAttributeSubItems, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      "attributeslug": attributeslug,
    }).then(
      (value) {
        print(value);
        if (value['status']) {
          viewAttributeItemData =
              AttributeManagementResponse.fromJson(value['data']);
        } else {
          print('error');
        }
      },
    );
    change(viewAttributeItemData, status: RxStatus.success());
  }

  //! add Attribute items api integration
  addAttribute() async {
    change(null, status: RxStatus.loading());
    final addAttribute = {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      'itemname': titleController.text,
      'attributeslug': Get.arguments['slug'],
    };

    debugPrint(selectedIndex.toString());
    if (selectedIndex != null) {
      addAttribute['id'] =
          viewAttributeItemData.items![selectedIndex!].id.toString();
    }
    await HttpClint.urlEncoded(HttpUrl.addAttributeSubItem, body: addAttribute)
        .then((value) {
      print(value);
      if (value['status']) {
        showSuccessSnackBar(value['data']['message']);
        getAttributeItems(Get.arguments['slug']);
      } else {
        showInfoSnackBar(value['data']['message']);
        getAttributeItems(Get.arguments['slug']);
      }
    });
    change(viewAttributeItemData, status: RxStatus.success());
  }

  //! delete Attribute items api integration
  deleteAttributeItem(int index) async {
    change(null, status: RxStatus.loading());
    final addAttribute = {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      'itemname': titleController.text,
      'attributeslug': Get.arguments['slug'],
    };

    debugPrint(selectedIndex.toString());
    if (selectedIndex != null) {
      addAttribute['id'] =
          viewAttributeItemData.items![selectedIndex!].id.toString();
    }
    await HttpClint.urlEncoded(HttpUrl.addAttributeSubItem, body: addAttribute)
        .then((value) {
      print(value);
      if (value['status']) {
        showSuccessSnackBar(value['data']['message']);
        getAttributeItems(Get.arguments['slug']);
      } else {
        showInfoSnackBar(value['data']['message']);
        getAttributeItems(Get.arguments['slug']);
      }
    });
    change(viewAttributeItemData, status: RxStatus.success());
  }  

  void editAttribute(
      BuildContext context, AttributeItem? attribute, int index) {
    selectedIndex = index;
    titleController.text = attribute!.itemname!;
    change(titleController, status: RxStatus.success());
    change(selectedIndex, status: RxStatus.success());
  }

  void clearValues() {
    selectedIndex = null;
    titleController.clear();
    change(titleController, status: RxStatus.success());
    change(selectedIndex, status: RxStatus.success());
  }
}
