import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/updateroles_model.dart';
import 'package:wcart_vendor/model/viewrolepermission_model.dart';
import 'package:wcart_vendor/singleton.dart';

class UpdateRolesController extends GetxController with StateMixin {
  ViewRolePermissionModel viewRolesData = ViewRolePermissionModel();
  UpdateRolesPermissionModel updateRolesData = UpdateRolesPermissionModel();

  TextEditingController addNewRoleNameController = TextEditingController();
  TextEditingController roleNameController = TextEditingController();

  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    print('-------Muthu-----');

    super.onInit();

    viewRolesPermission();

    change(null, status: RxStatus.success());
  }

  viewRolesPermission() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.getStaffRole, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      "staff_role_id": Get.arguments['StaffRoleId'].toString(),
      "store_staff_id": ''
    }).then((value) {
      print(value);
      if (value['status']) {
        viewRolesData = ViewRolePermissionModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(viewRolesData, status: RxStatus.success());
  }

  // updateStaffRole() async {
  //   change(null, status: RxStatus.loading());
  //   await HttpClint.urlEncoded(HttpUrl.updateStaffRole, body: {
  //     "vendorid": Singleton.instance.vendorId ?? "",
  //     "servicekey": Singleton.instance.serviceKey,
  //     "staff_role_id": Get.arguments['StaffRoleId'].toString(),
  //     'store_staff_id': '',
  //     "role_name": roleNameController.text,
  //     "rp_view": '',
  //     "rp_create": '',
  //     "rp_edit": '',
  //     "rp_delete": '',
  //   }).then((value) {
  //     print(value);
  //     if (value['status']) {
  //       updateRolesData = UpdateRolesPermissionModel.fromJson(value['data']);

  //       change(null, status: RxStatus.success());
  //       Get.back();
  //       Get.snackbar('message', updateRolesData.message ?? '');
  //     } else {
  //       print('error');
  //     }
  //   });
  //   change(updateRolesData, status: RxStatus.success());
  // }

  // updateStaffRole() async {
  //   change(null, status: RxStatus.loading());

  //   // Prepare permission data
  //   Map<String, String> permissions = {
  //     "rp_view": "",
  //     "rp_create": "",
  //     "rp_edit": "",
  //     "rp_delete": ""
  //   };

  //   for (var permission in viewRolesData.viewRolePermission!) {
  //     if (permission.perView == 1) {
  //       permissions["rp_view"] = "1";
  //     }
  //     if (permission.perCreate == 1) {
  //       permissions["rp_create"] = "1";
  //     }
  //     if (permission.perEdit == 1) {
  //       permissions["rp_edit"] = "1";
  //     }
  //     if (permission.perDelete == 1) {
  //       permissions["rp_delete"] = "1";
  //     }
  //   }

  //   await HttpClint.urlEncoded(HttpUrl.updateStaffRole, body: {
  //     "vendorid": Singleton.instance.vendorId ?? "",
  //     "servicekey": Singleton.instance.serviceKey,
  //     "staff_role_id": Get.arguments['StaffRoleId'].toString(),
  //     'store_staff_id': '',
  //     "role_name": roleNameController.text,
  //     ...permissions, // Spread the permissions map to include in the body
  //   }).then((value) {
  //     print(value);
  //     if (value['status']) {
  //       updateRolesData = UpdateRolesPermissionModel.fromJson(value['data']);

  //       change(null, status: RxStatus.success());
  //       Get.back();
  //       Get.snackbar('message', updateRolesData.message ?? '');
  //     } else {
  //       print('error');
  //     }
  //   });
  //   change(updateRolesData, status: RxStatus.success());
  // }
  updateStaffRole() async {
    change(null, status: RxStatus.loading());

    // Prepare permission data
    List<String> rpViewList = [];
    List<String> rpCreateList = [];
    List<String> rpEditList = [];
    List<String> rpDeleteList = [];

    for (var permission in viewRolesData.viewRolePermission!) {
      rpViewList.add(permission.perView == 1 ? "1" : "0");
      rpCreateList.add(permission.perCreate == 1 ? "1" : "0");
      rpEditList.add(permission.perEdit == 1 ? "1" : "0");
      rpDeleteList.add(permission.perDelete == 1 ? "1" : "0");
    }

    String rpView = rpViewList.join(',');
    String rpCreate = rpCreateList.join(',');
    String rpEdit = rpEditList.join(',');
    String rpDelete = rpDeleteList.join(',');

    await HttpClint.urlEncoded(HttpUrl.updateStaffRole, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      "staff_role_id": Get.arguments['StaffRoleId'].toString(),
      'store_staff_id': '',
      "role_name": roleNameController.text,
      "rp_view": rpView,
      "rp_create": rpCreate,
      "rp_edit": rpEdit,
      "rp_delete": rpDelete,
    }).then((value) {
      print(value);
      if (value['status']) {
        updateRolesData = UpdateRolesPermissionModel.fromJson(value['data']);

        change(null, status: RxStatus.success());
        viewRolesPermission();
        showInfoSnackBar(updateRolesData.message ?? '');
      } else {
        print('error');
      }
    });
    change(updateRolesData, status: RxStatus.success());
  }
}
