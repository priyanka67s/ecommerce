import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/http/getx_repository.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/activeterritory_model.dart';
import 'package:wcart_vendor/model/addstorelocation_model.dart';
import 'package:wcart_vendor/model/getstorelocation_model.dart';
import 'package:wcart_vendor/model/territorybasedwarehouse_model.dart';
import 'package:wcart_vendor/model/viewpincode_model.dart';
import 'package:wcart_vendor/singleton.dart';
import 'package:wcart_vendor/util/constants.dart';
import 'package:wcart_vendor/util/preference_helper.dart';
import 'package:wcart_vendor/util/string_resources.dart';

class AddStoreLocationController extends GetxController with StateMixin {
  ActiveTerriToryModel activeTerritoryData = ActiveTerriToryModel();
  AddStoreLocationModel addStoreLocationData = AddStoreLocationModel();
  TextEditingController addressLine1Controller = TextEditingController();
  ApiClient apiClient = ApiClient();
  TextEditingController cityController = TextEditingController();
  // AddWarehouseModel manageWarehouse = AddWarehouseModel();

  TextEditingController contactPersonNameController = TextEditingController();

  TextEditingController countryCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  String? defaultLocationTagTypeValue;
  // String locationStatusValue = '';
  String defaultLocationValue = '';
  String? selectedWarehouseId;

  List<String> defaultLocationValueList = ['Active', 'InActive'];
  String? defaultSelectedLocationValueList;
  TextEditingController emailIdController = TextEditingController();
  GetStoreLocationModel getStoreLocationData = GetStoreLocationModel();
  TextEditingController googleMapUrlController = TextEditingController();
  TextEditingController lCountryCodeController = TextEditingController();
  TextEditingController lStateCodeController = TextEditingController();
  TextEditingController landLineNumberController = TextEditingController();
  String? locationSelectedStatusValueList;
  String? locationStatusValue;
  List<String> locationStatusValueList = ['Active', 'InActive'];
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController priceMarginController = TextEditingController();
  String? selectedTerritory;
  String? selectedTerritoryBasedWarehouse;
  String? selectedWarehouse;
  TextEditingController stateController = TextEditingController();
  TextEditingController storeLocationTileController = TextEditingController();
  TerritoryBasedWarehouseModel territoryBasedWarehouseData =
      TerritoryBasedWarehouseModel();

  // UpdateCustomerStatusModel updateCustomerStatusData =
  //     UpdateCustomerStatusModel();

  //  List<String> territoryDropdownList = [];
  // String? selectedTerritory;
  // int? territoryId;

  List<String> territoryBasedWarehouseDropdownList = [];

  List<String> territoryDropdownList = [];
  int? territoryId;
  int? territory_id;
  ViewPinCodeModel viewPinCode = ViewPinCodeModel();
  List<String> wareHouseSelectedStatusValueList = [];
  List<String> wareHouseStatusValueList = ['Active', 'InActive'];
  String warehouseStatusValue = '';

  @override
  void onInit() {
    activeTerritory();
    change(null, status: RxStatus.loading());
    {
      // Here get view the tag data

      if (Get.arguments['fromScreen'] == StringResources.editStoreLocation) {
        // Here get view the tag data
        getStoreLocation();
      }
      super.onInit();
    }

    warehouseStatusValue = wareHouseStatusValueList[0];
    locationStatusValue = locationStatusValueList[0];
    defaultLocationValue = defaultLocationValueList[0];

    change(null, status: RxStatus.success());
  }

  addStoreLocation({int? territoryid, int? territory_id}) async {
    change(null, status: RxStatus.loading());
    print("---------------------New----");

    Map requestBody = {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      // 'store_staff_id': '',
      "location_title": storeLocationTileController.text,
      "conatct_person_name": contactPersonNameController.text,
      "addressline1": addressLine1Controller.text,
      "city": cityController.text,
      "state": stateController.text,
      "country": countryController.text,
      "pincode": pinCodeController.text,
      "google_map_url": googleMapUrlController.text,
      "email_id": emailIdController.text,
      "country_code": countryController.text,      
      "phone_no": phoneNoController.text,
      "store_location_status": "1",
      // locationStatusValue == Constants.active ? '0' : '1',
      "default_store_location": "1",
      // defaultLocationTagTypeValue == Constants.active ? '0' : '1',
      "warehouse_id": selectedWarehouseId,
    };

    activeTerritoryData.activeTerritoryLocations?.forEach(
      (element) {
        if (element.territoryName == selectedTerritory) {
          requestBody.addAll({"territory_id": element.territoryId.toString()});
        }
      },
    );

    // territoryBasedWarehouseData.territoryBasedWarehouse?.forEach(
    //   (element) {
    //     if (element.locationTitle == selectedTerritoryBasedWarehouse) {
    //       requestBody.addAll({"warehouse_id": element.warehouseId.toString()});
    //     }
    //   },
    // );

    await HttpClint.urlEncoded(HttpUrl.addStoreLocation, body: requestBody)
        .then((value) {
      print(value);
      if (value != null) {
        if (value['status']) {
          addStoreLocationData = AddStoreLocationModel.fromJson(value['data']);
          change(null, status: RxStatus.success());
          Get.back();
          showSuccessSnackBar(addStoreLocationData.message ?? '');
        } else {
          showInfoSnackBar(addStoreLocationData.message ?? '');
        }
      } else {
        debugPrint('null');
      }
    });

    change(addStoreLocationData, status: RxStatus.success());
  }

  getStoreLocation() async {
    change(null, status: RxStatus.loading());
    // try {
    await HttpClint.urlEncoded(HttpUrl.getStoreLocation, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      "store_location_id": Get.arguments['storelocation_id'],
    }).then((value) {
      print('---------edit');

      print(value['data']);
      if (value['status']) {
        getStoreLocationData = GetStoreLocationModel.fromJson(value['data']);
        storeLocationTileController.text =
            getStoreLocationData.viewStoreLocation![0].locationTitle!;
        contactPersonNameController.text =
            getStoreLocationData.viewStoreLocation![0].conatctPersonName!;
        addressLine1Controller.text =
            getStoreLocationData.viewStoreLocation![0].addressline1!;
        cityController.text = getStoreLocationData.viewStoreLocation![0].city!;
        stateController.text =
            getStoreLocationData.viewStoreLocation![0].state!;
        phoneNoController.text =
            getStoreLocationData.viewStoreLocation![0].phoneNo!;
        countryController.text =
            getStoreLocationData.viewStoreLocation![0].countryCode!;
        pinCodeController.text =
            getStoreLocationData.viewStoreLocation![0].pincode!;
        googleMapUrlController.text =
            getStoreLocationData.viewStoreLocation![0].googleMapUrl!;
        emailIdController.text =
            getStoreLocationData.viewStoreLocation![0].emailId!;
        phoneNoController.text =
            getStoreLocationData.viewStoreLocation![0].phoneNo!;
        priceMarginController.text = "3203";

        locationStatusValue =
            getStoreLocationData.viewStoreLocation![0].storeLocationStatus == 0
                ? Constants.active
                : Constants.deActive;
        defaultLocationTagTypeValue =
            getStoreLocationData.viewStoreLocation![0].defaultStoreLocation == 0
                ? Constants.yes
                : Constants.no;
      } else {
        showInfoSnackBar(getStoreLocationData.message!);
      }
    });
    // } catch (e) {}
    update();
    change(null, status: RxStatus.success());
  }

  activeTerritory() async {
    change(null, status: RxStatus.loading());
    print('-------');
    await HttpClint.urlEncoded(HttpUrl.activeTerritoryStoreLocation, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
    }).then((value) {
      print(value);
      if (value['status']) {
        print('---------------');
        print(value['data']);
        activeTerritoryData = ActiveTerriToryModel.fromJson(value['data']);
        print(
            '--------------- ${activeTerritoryData.activeTerritoryLocations ?? "empty"}');
        activeTerritoryData.activeTerritoryLocations?.forEach((element) {
          print('--------------- > ${element.territoryName ?? 'empty1'}');
          territoryDropdownList.add(element.territoryName ?? '');
        });
      } else {
        print('error');
      }
      change(territoryDropdownList);
    });
    change(activeTerritoryData, status: RxStatus.success());
  }

  updateSelectTerritory(String value) {
    change(selectedTerritory = value);
    activeTerritoryData.activeTerritoryLocations?.forEach(
      (element) {
        if (element.territoryName == selectedTerritory) {
          territoryBasedWarehouse(element.territoryId);
        }
      },
    );
  }

  updateSelectWarehouseTerritory(String value) {
    final warehouseData =
        territoryBasedWarehouseData.territoryBasedWarehouse!.firstWhere(
      (element) => element.locationTitle == value,
    );
    debugPrint(warehouseData.warehouseId.toString());
    selectedWarehouseId = warehouseData.warehouseId.toString();
    change(selectedTerritoryBasedWarehouse = value);
  }

  territoryBasedWarehouse(int? territoryId) async {        
    change(null, status: RxStatus.loading());
    print('-------');
    await HttpClint.urlEncoded(HttpUrl.territoryBasedWarehouse, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      "territory_id": territoryId.toString(),
    }).then((value) {
      print(value);
      if (value['status']) {
        territoryBasedWarehouseData =
            TerritoryBasedWarehouseModel.fromJson(value['data']);
        if (territoryBasedWarehouseData.territoryBasedWarehouse!.isNotEmpty) {
          territoryBasedWarehouseData.territoryBasedWarehouse
              ?.forEach((element) {
            territoryBasedWarehouseDropdownList
                .add(element.locationTitle ?? '');
          });
        } else {
          territoryBasedWarehouseDropdownList.clear();
        }

        // change(selectedTerritoryBasedWarehouse =
        //     territoryBasedWarehouseDropdownList.first);
      } else {
        print('error');
      }
      change(territoryBasedWarehouseDropdownList);
    });
    change(territoryBasedWarehouseData, status: RxStatus.success());
  }

  // Future<void> viewPinCodeCheck() async {
  //   // Start loading status
  //   change(null, status: RxStatus.loading());
  //   try {
  //     // Send POST request to check pin code
  //     Response getResponse = await apiClient.post(
  //       HttpUrl.viewPinCode,
  //       {
  //         'pincode': pinCodeController.text, // Use the controller's text
  //         // 'user_id': Singleton.instance.userId,
  //       },
  //       headers: {
  //         'Accept': 'application/json',
  //         'Content-Type': 'application/json',
  //         'servicekey': 'by_pass_token'
  //       },
  //     );

  //     print(getResponse.bodyString);

  //     // Parse response
  //     viewPinCode = ViewPinCodeModel.fromJson(
  //       jsonDecode(getResponse.bodyString!) as Map<String, dynamic>,
  //     );

  //     if (viewPinCode.status == "true") {
  //       // Save pin code to shared preferences
  //       await PreferenceHelper.setString(
  //         Constants.pinCode,
  //         viewPinCode.viewPinCode?.pinCode.toString() ?? '',
  //       );
  //       cityController.text = viewPinCode.viewPinCode?.cityCode ?? "";
  //       countryController.text = viewPinCode.viewPinCode?.countryCode ?? "";
  //       stateController.text = viewPinCode.viewPinCode?.cityCode ?? "";
  //       // districtController.text = viewPinCode.viewPinCode?.cityCode ?? "";
  //       // print(Singleton.instance.country);
  //       // controller.pinCodeController.clear();
  //       // Get.back();
  //       // If pin code is valid, navigate to the appropriate screen
  //       // Example:
  //       // Get.offAllNamed(Routes.h
  //     } else {
  //       // Show snackbar if pin code is invalid
  //       Get.snackbar('Message', viewPinCode.message!);
  //       // controller.pinCodeController.clear();
  //       // Get.back();
  //     }

  //     print(viewPinCode);
  //     print(viewPinCode.message);
  //   } catch (e) {
  //     // Handle errors
  //     print('Error: $e');
  //     // Show a generic error message to the user
  //     // Get.snackbar('Error', 'An error occurred. Please try again later.');
  //   }

  //   // Update state with success status
  //   change(viewPinCode, status: RxStatus.success());
  // }

  // Future<void> viewPinCodeCheck() async {
  //   // Start loading status
  //   change(null, status: RxStatus.loading());
  //   try {
  //     // Send POST request to check pin code
  //     Response getResponse = await apiClient.post(
  //       HttpUrl.viewPinCode,
  //       {
  //         'pincode': pinCodeController.text, // Use the controller's text
  //       },
  //     );

  //     // Print response body for debugging
  //     print(getResponse.bodyString);

  //     if (getResponse.bodyString != null) {
  //       // Parse response
  //       var responseJson =
  //           jsonDecode(getResponse.bodyString!) as Map<String, dynamic>;
  //       viewPinCode = ViewPinCodeModel.fromJson(responseJson);

  //       if (viewPinCode.status == "true") {
  //         // Save pin code to shared preferences
  //         await PreferenceHelper.setString(
  //           Constants.pinCode,
  //           viewPinCode.viewPincode?.pincode.toString() ?? '',
  //         );
  //         cityController.text = viewPinCode.viewPincode?.cityCode ?? "";
  //         countryController.text = viewPinCode.viewPincode?.countryCode ?? "";
  //         stateController.text = viewPinCode.viewPincode?.cityCode ?? "";

  //         // If pin code is valid, navigate to the appropriate screen
  //         // Example:
  //         // Get.offAllNamed(Routes.home);
  //       } else {
  //         // Show snackbar if pin code is invalid
  //         Get.snackbar(
  //             'Message', viewPinCode.message ?? 'Unknown error occurred');
  //       }

  //       // Print response for debugging
  //       print(viewPinCode);
  //       print(viewPinCode.message);
  //     } else {
  //       // Handle case where response body is null
  //       print('Error: Response body is null');
  //       Get.snackbar('Error', 'Failed to retrieve data from server.');
  //     }
  //   } catch (e) {
  //     // Handle errors
  //     print('Error: $e');
  //     Get.snackbar('Error', 'An error occurred. Please try again later.');
  //   }

  //   // Update state with success status
  //   change(viewPinCode, status: RxStatus.success());
  // }

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
