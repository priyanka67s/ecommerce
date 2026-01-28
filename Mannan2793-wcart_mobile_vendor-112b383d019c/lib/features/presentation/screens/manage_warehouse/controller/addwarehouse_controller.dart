import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_warehouse/listwarehouse_page.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/activeterritory_model.dart';
import 'package:wcart_vendor/model/addwarehouse_model.dart';
import 'package:wcart_vendor/model/editwarehouse_model.dart';
import 'package:wcart_vendor/model/viewpincode_model.dart';
import 'package:wcart_vendor/singleton.dart';
import 'package:wcart_vendor/util/constants.dart';
import 'package:wcart_vendor/util/preference_helper.dart';
import 'package:wcart_vendor/util/string_resources.dart';

class AddWareHouseController extends GetxController with StateMixin {
  List<String> wareHouseStatusValueList = ['Active', 'InActive'];
  List<String> locationStatusValueList = ['Active', 'InActive'];
  List<String> defaultLocationValueList = ['Active', 'InActive'];
  String? wareHouseSelectedStatusValueList;
  String? locationSelectedStatusValueList;
  String? defaultSelectedLocationValueList;
  List<String> territoryDropdownList = [];
  String? selectedTerritory;
  int? territoryId;

  ViewPinCodeModel viewPinCode = ViewPinCodeModel();

  // String value = "Enable";
  AddWarehouseModel manageWarehouse = AddWarehouseModel();
  ViewEditWarehouseModel viewWarehouseDate = ViewEditWarehouseModel();
  // ViewWareHouseModel viewWarehouseData = ViewWareHouseModel();
  ActiveTerriToryModel activeTerritoryData = ActiveTerriToryModel();
  // updateWarehouseModel updateWarehouseLocationDate = updateWarehouseModel();

  TextEditingController contactPersonNameController = TextEditingController();
  TextEditingController locationTileController = TextEditingController();
  TextEditingController addressLine1Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController googleMapUrlController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController lCountryCodeController = TextEditingController();
  TextEditingController lStateCodeController = TextEditingController();
  TextEditingController landLineNumberController = TextEditingController();
  TextEditingController priceMarginController = TextEditingController();
  // UpdateCustomerStatusModel updateCustomerStatusData =
  //     UpdateCustomerStatusModel();

  String warehouseStatusValue = '';
  String locationStatusValue = '';
  String defaultLocationValue = '';

  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    {
      // Here get view the tag data
      super.onInit();
      activeterritory();
    }
    warehouseStatusValue = wareHouseStatusValueList[0];
    locationStatusValue = locationStatusValueList[0];
    defaultLocationValue = defaultLocationValueList[0];
    
  }

  addWarehouse({int? territoryid, BuildContext? context}) async {
    change(null, status: RxStatus.loading());
    dynamic addwareHouseField = {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      "store_staff_id": "",
      "location_title": locationTileController.text,
      "conatct_person_name": contactPersonNameController.text,
      "addressline1": addressLine1Controller.text,
      "city": cityController.text,
      "state": stateController.text,
      "country": countryController.text,
      "pincode": pinCodeController.text,
      "google_map_url": googleMapUrlController.text,
      "email_id": emailIdController.text,
      "country_code": "+91",
      "phone_no": phoneNoController.text,
      "price_margin": "",
      "l_country_code": lCountryCodeController.text,
      "l_state_code": lStateCodeController.text,
      "landline_number": landLineNumberController.text,
      "warehouse_status": '1',
      //  warehouseStatusValue,
      "default_location": '1',
      // defaultLocationValue,
      "location_order": '1',
      // defaultLocationValue,
      "territory_id": '1',
    };
    String url = HttpUrl.addWarehouse;
    //!update
    if (Get.arguments['fromScreen'] == StringResources.editWareHouse) {
      addwareHouseField['warehouse_id'] =
          Get.arguments['warehouse_id'].toString();
      url = HttpUrl.editWarehouse;
    }

    print(addwareHouseField);
    await HttpClint.urlEncoded(url, body: addwareHouseField).then((value) {
      print("---------muthuvel----------");
      print(value);

      if (value['status']) {
        manageWarehouse = AddWarehouseModel.fromJson(value['data']);

        Get.back();
        getWarehouse(context!);
        // change(null, status: RxStatus.success());
        showInfoSnackBar(manageWarehouse.message ?? '');
      } else {
        showInfoSnackBar(manageWarehouse.message ?? '');
      }
    });

    change(manageWarehouse, status: RxStatus.success());
  }

  updateWarehouseData(BuildContext context) async {
    change(null, status: RxStatus.loading());
    debugPrint(Get.arguments['warehouse_id'].toString());
    // try {
    await HttpClint.urlEncoded(HttpUrl.viewWareHouseData, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      "warehouse_id": Get.arguments['warehouse_id'].toString(),
      'store_staff_id': "",
    }).then((value) {
      print(value);
      if (value['status']) {
        viewWarehouseDate = ViewEditWarehouseModel.fromJson(value['data']);
        locationTileController.text =
            viewWarehouseDate.viewWarehouseAddress?[0].locationTitle ?? "";

        contactPersonNameController.text =
            viewWarehouseDate.viewWarehouseAddress?[0].conatctPersonName ?? "";
        addressLine1Controller.text =
            viewWarehouseDate.viewWarehouseAddress?[0].addressline1 ?? "";
        cityController.text =
            viewWarehouseDate.viewWarehouseAddress?[0].city ?? "";
        stateController.text =
            viewWarehouseDate.viewWarehouseAddress?[0].state ?? "";
        pinCodeController.text =
            viewWarehouseDate.viewWarehouseAddress?[0].pincode ?? "";
        countryController.text =
            viewWarehouseDate.viewWarehouseAddress?[0].country ?? "";
        phoneNoController.text =
            viewWarehouseDate.viewWarehouseAddress?[0].phoneNo ?? "";
        priceMarginController.text =
            viewWarehouseDate.viewWarehouseAddress?[0].pricemargin.toString() ??
                "";
        lCountryCodeController.text =
            viewWarehouseDate.viewWarehouseAddress?[0].lCountryCode ?? "";
        emailIdController.text =
            viewWarehouseDate.viewWarehouseAddress?[0].emailId ?? "";
        lStateCodeController.text =
            viewWarehouseDate.viewWarehouseAddress?[0].lStateCode ?? "";
        landLineNumberController.text =
            viewWarehouseDate.viewWarehouseAddress?[0].landlineNumber ?? "";

        locationStatusValue = locationStatusValueList[
            viewWarehouseDate.viewWarehouseAddress![0].locationOrder! == 1
                ? 0
                : 1];
        defaultLocationValue = defaultLocationValueList[
            viewWarehouseDate.viewWarehouseAddress![0].defaultLocation!];
        warehouseStatusValue = wareHouseStatusValueList[
            viewWarehouseDate.viewWarehouseAddress![0].warehouseStatus!];
      } else {
        getWarehouse(context);
        showInfoSnackBar(viewWarehouseDate.message!);
      }
    });
    // } catch (e) {}    
    change(null, status: RxStatus.success());
  }

  activeterritory() async {
    change(null, status: RxStatus.loading());
    print('-------');
    await HttpClint.urlEncoded(HttpUrl.activeTerritory, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
    }).then((value) {
      print(value);
      if (value['status']) {
        activeTerritoryData = ActiveTerriToryModel.fromJson(value['data']);
        activeTerritoryData.activeTerritoryLocations?.forEach((element) {
          territoryDropdownList.add(element.territoryName ?? '');
        });
      } else {
        print('error');
      }
      change(territoryDropdownList);
    });
    change(activeTerritoryData, status: RxStatus.success());
  }

  updateSeletedterritory(String value) {
    change(selectedTerritory = value);
  }

  viewPinCodeCheck() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.viewPinCode, body: {
      'pincode': pinCodeController.text,
    }).then((value) async {
      print('muthuvel');
      print(value);
      if (value['status']) {
        viewPinCode = ViewPinCodeModel.fromJson(value['data']);
        if (viewPinCode.status == "true") {
          // Save pin code to shared preferences
          await PreferenceHelper.setString(
            Constants.pinCode,
            viewPinCode.viewPincode?.pincode.toString() ?? '',
          );
          cityController.text = viewPinCode.viewPincode?.cityCode ?? "";
          countryController.text = viewPinCode.viewPincode?.countryCode ?? "";
          stateController.text = viewPinCode.viewPincode?.cityCode ?? "";
        } else {
          print('error');
        }
      }
    });
    change(viewPinCode, status: RxStatus.success());
  }
}
