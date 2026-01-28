import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/addconfigureitem_model.dart';
import 'package:wcart_vendor/model/viewconfigureitems_model.dart';
import 'package:wcart_vendor/singleton.dart';

class ConfigureItemsController extends GetxController with StateMixin {
  TextEditingController titleController = TextEditingController();
  TextEditingController productSlugController = TextEditingController();
  ViewConfigureItemModel viewConfigureData = ViewConfigureItemModel();
  AddConfigureItemModel addConfigureData = AddConfigureItemModel();
  @override
  void onInit() {
    print('-------Muthu-----');

    super.onInit();
    viewConfigure();
  }

  viewConfigure() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.viewConfigureItem, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      "attributeslug": "width",
      "id": "109"
    }).then((value) {
      print(value);
      if (value['status']) {
        viewConfigureData = ViewConfigureItemModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(viewConfigureData, status: RxStatus.success());
  }

  addConfigureItems() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.addConfigureItem, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      'itemname': titleController.text,
      'attributeslug': productSlugController.text,
      "id": "77"
    }).then((value) {
      print(value);

      if (value['status']) {
        addConfigureData = AddConfigureItemModel.fromJson(value['data']);
        Get.back();
      } else {
        showInfoSnackBar(addConfigureData.message!);
      }
    });

    change(addConfigureData, status: RxStatus.success());
  }
}
