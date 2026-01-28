import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/all_category_list_model.dart';
import 'package:wcart_vendor/features/data/model/allstoreproductinventory_model.dart';
import 'package:wcart_vendor/model/liveproduct_model.dart';
import 'package:wcart_vendor/model/posordercreate_model.dart';
import 'package:wcart_vendor/features/data/model/searchcustomer_model.dart';
import 'package:wcart_vendor/model/userId_model.dart';
import 'package:wcart_vendor/model/viewproduct_model.dart';
import 'package:wcart_vendor/singleton.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ViewOrderPosController extends GetxController with StateMixin {
  UserIdModel userIdData = UserIdModel();
  ViewProductModel viewProductData = ViewProductModel();

  PosCreateOrderModel createOrderData = PosCreateOrderModel();
  List<AllInventories> viewProductList = [];
  TextEditingController searchCustomerController = TextEditingController();

  

  FilePickerResult? result;
  File? imageFile;
  String? imageUrl;

  var selectedCustomerId = ''.obs;

  List<Products> selectedData = [];

  TextEditingController productCode = TextEditingController();
  TextEditingController productName = TextEditingController();
  TextEditingController productTax = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController productDiscount = TextEditingController();
  TextEditingController unitPrice = TextEditingController();
  TextEditingController customerGroup = TextEditingController();
  TextEditingController priceGroup = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController vatNumber = TextEditingController();
  TextEditingController gstNumber = TextEditingController();
  TextEditingController company = TextEditingController();
  SearchCustomersModel customerList = SearchCustomersModel();

  @override
  void onInit() {
    change(null, status: RxStatus.loading());

    super.onInit();
  }
  

  List<String> productTaxList = [
    'No Tax',
    'VAT @ 10%',
    'GST @ 0%',
    'GST @ 20%'
  ];

  String? productTaxValueList;
  String? selectedItemValue;
  Customers? selectedCustomerData;
  var warehouseDropDownValue;

  final MultiSelectController<Categories> multiSelectController =
      MultiSelectController();

  barCodeAddToCart(
      {required String productId,
      required String attribute,
      required String warehouseId,
      required String skucode,
      required String barcodeid,
      required String storeid}) async {
    print('-----------------');
    print(warehouseId);
    print(productId);
    print(attribute);
    print(Singleton.instance.vendorId);
    print(
      Singleton.instance.serviceKey,
    );
    print(
      Singleton.instance.storeStaffId,
    );
    print(skucode);
    print(storeid);
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.addToCart, body: {
      'vendorid': Singleton.instance.vendorId,
      'servicekey': Singleton.instance.serviceKey,
      "cart_from": "3",
      "user_id": Singleton.instance.staffId,
      "warehouse_id": Singleton.instance.warehouseId,
      "productid": "",
      "barcode": barcodeid,
      "sku_code": "",
      "store_id": Singleton.instance.storeLocationId,
      "quantity": "1",
      "postal_code": "",
      "country_code": "",
      "state_code": "",
      "city_code": "",
      "store_staff_id": Singleton.instance.storeStaffId,
    }).then((value) {
      print(productId);
      if (value['status']) {
        // Get.snackbar('Message', value['data']['message'],
        //     snackPosition: SnackPosition.BOTTOM);
        //! get view cart data
        // viewCart();
        // addtocartDatas = AddtocartPosmodel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(viewProductData, status: RxStatus.success());
  }
 
  clearCart({
    required String userId,
  }) async {
    await HttpClint.urlEncoded(HttpUrl.clearcart, body: {
      'vendorid': Singleton.instance.vendorId,
      'servicekey': Singleton.instance.serviceKey,
      "cart_from": "2",
      "user_id": userId,
      "warehouse_id": "6",
      // "store_staff_id": "",
    }).then((value) {
      print(value);
      if (value['status']) {
        print('errorclear');
        //! clear cart data
        // viewCartData.cartproducts!.clear();
        //! get view cart data
        // viewCart();
        // Get.snackbar('Message', value['data']['message'],
        //     snackPosition: SnackPosition.BOTTOM);
        Get.back();
      } else {
        print('error');
      }
    });
    // change(viewCartData, status: RxStatus.success());
  }
  

  updateCartDec({
    required int quantity,
    String? cartId,
    required String warehouseId,
    required String userId,
  }) async {
    print('---------update cart----> $cartId');
    change(quantity--);

    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.updatecart, body: {
      'vendorid': Singleton.instance.vendorId,
      'servicekey': Singleton.instance.serviceKey,
      "cart_from": "2",
      "user_id": userId,
      "warehouse_id": warehouseId,
      'cart_id': cartId,
      "quantity": quantity.toString(),
    }).then((value) {
      print(value);
      print('---------update cart load----> $cartId');
      print(quantity);
      if (value['status']) {
        print('---------update cart success----> $cartId');
        //! view cart
        // viewCart(
        //     warehouseId: warehouseId,
        //     userId:userId);
        // Get.snackbar('Message', value['data']['message'],
        //     snackPosition: SnackPosition.BOTTOM);
        //! get view cart data
        // viewCart();
      } else {
        print('error');
      }
    });
    change(createOrderData, status: RxStatus.success());
  }

  Future<dynamic> addCustomer() async {
    try {
      // Create multipart request for POST method
      var request = http.MultipartRequest(
        "POST",
        Uri.parse('https://wcartnode.webnexs.org/vendorapi/add_customer'),
      );

      // Ensure that Singleton.instance.vendorId and Singleton.instance.serviceKey are not null
      String vendorId =
          Singleton.instance.vendorId ?? Get.arguments['vendoreID'];
      String serviceKey =
          Singleton.instance.serviceKey ?? Get.arguments['servicekey'];

      // Add fields to the request
      request.fields["vendorid"] = vendorId;
      request.fields["servicekey"] = serviceKey;
      request.fields["name"] = name.text;
      request.fields["emailid"] = email.text;
      request.fields["country_code"] = '+91';
      request.fields["phone"] = mobile.text;
      request.fields["password"] = "";

      // If imageFile is not null, add it to the request
      if (imageFile != null) {
        var pic = await http.MultipartFile.fromPath(
          "image",
          imageFile!.path,
          contentType: MediaType('image', 'jpeg'),
          filename: imageFile!.path.split('/').last,
        );
        request.files.add(pic);
      }

      // Send the request
      var response = await request.send();

      // Get the response from the server
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      print(responseString);
      var responseJson = jsonDecode(responseString);

      // Extract the status field from the response
      String message = responseJson['status'] ??
          'true'; // Default to 'false' if status is not available

      // Print the message (optional)
      print(message);

      if (response.statusCode == 200 && message.toLowerCase() == 'true') {
        email.clear();
        name.clear();
        mobile.clear();
        //!get customer list
        // searchCustomerList('');
        Get.back(result: true);
        // Show success snackbar
        showSuccessSnackBar(
          'Customer added successfully!',
        );
      } else {
        // Show error snackbar
        showFailureSnackBar(
          'Mobile Number OR Email ID Already Register!!!!',
        );
      }
    } catch (e) {
      // Show error snackbar for unexpected errors
      showFailureSnackBar(
        'An unexpected error occurred: $e',
      );
    }
  }

  addImage() async {
    result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      PlatformFile? file = result?.files.first;

      imageFile = File(file?.path ?? '');

      change(imageFile);
    } else {
      // User canceled the picker
      showFailureSnackBar('Image not selected');
    }
  }
}
