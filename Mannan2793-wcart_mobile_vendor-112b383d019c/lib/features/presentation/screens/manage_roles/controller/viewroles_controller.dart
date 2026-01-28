import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/addnewrole_model.dart';
import 'package:wcart_vendor/model/viewpermission_model.dart';
import 'package:wcart_vendor/model/viewroles_model.dart';
import 'package:wcart_vendor/singleton.dart';

class ViewRolesController extends GetxController with StateMixin {
  ViewRolesModel viewRolesData = ViewRolesModel();

  TextEditingController RoleNameController = TextEditingController();
  AddStaffRoleModel AddStaffRoleDate = AddStaffRoleModel();

  ViewPermissionModel viewPermissionData = ViewPermissionModel();
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    print('-------Muthu-----');
    super.onInit();
    viewRoles();
    viewStaffPermission();    
  }

  viewRoles() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.viewStaffRole, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      "store_staff_id": ''
    }).then((value) {
      print(value);
      if (value['status']) {
        viewRolesData = ViewRolesModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(ViewRolesModel, status: RxStatus.success());
  }

  viewStaffPermission() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.staffPermission, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      "store_staff_id": ''
    }).then((value) {
      print(value);
      if (value['status']) {
        viewPermissionData = ViewPermissionModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(ViewPermissionModel, status: RxStatus.success());
  }

  addStaffRole() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.addStaffRole, body: {
      "vendorid": Singleton.instance.vendorId,
      "servicekey": Singleton.instance.serviceKey,
      'role_name': RoleNameController.text,
    }).then((value) {
      print("----------");
      print(value);

      if (value['status']) {
        AddStaffRoleDate = AddStaffRoleModel.fromJson(value['data']);

        Get.back();
        viewRoles();
      } else {
        showInfoSnackBar(AddStaffRoleDate.message ?? '');
      }
    });

    change(AddStaffRoleDate, status: RxStatus.success());
  }

  removeStaffRole(int staffRoleId, int index) async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.removeStaffRole, body: {
      "vendorid": Singleton.instance.vendorId,
      "servicekey": Singleton.instance.serviceKey,
      "staff_role_id": staffRoleId.toString(),
    }).then((value) {
      print('---------');
      if (value['status']) {
        viewRolesData.roles?.removeAt(index);
      }
      change(viewRolesData);
      viewRoles();
      debugPrint(value.toString());
    });
    change(viewRolesData, status: RxStatus.success());
  }
}
