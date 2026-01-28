import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';

import 'package:wcart_vendor/http/getx_repository.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/all_category_list_model.dart';

import 'package:wcart_vendor/model/all_tagslist_model.dart';
import 'package:wcart_vendor/model/allbrand_model.dart';
import 'package:wcart_vendor/model/viewproduct_model.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/singleton.dart';
import 'package:wcart_vendor/util/string_resources.dart';

class SimpleProductController extends GetxController with StateMixin {
  ViewProductModel viewAllProductData = ViewProductModel();
  AllCategoryListModel allCategoryData = AllCategoryListModel();
  AllBrandModel allBrandData = AllBrandModel();
  // SettingInventoryModel settingInventoryData = SettingInventoryModel();

  AllTagsListModel allTagsData = AllTagsListModel();
  // AllBrandListModel allBrandData = AllBrandListModel();
  TextEditingController productNameController = TextEditingController();
  TextEditingController primaryCat = TextEditingController();
  TextEditingController productRegularPriceController = TextEditingController();
  final TextEditingController productSalePriceController =
      TextEditingController();
  final TextEditingController productShortDescriptionController =
      TextEditingController();
  final TextEditingController productLongDescriptionController =
      TextEditingController();
//!image list
  RxList<String> networkImageList = <String>[].obs;

  //!dropdown controller
  MultiSelectController<String> categoriesController =
      MultiSelectController<String>();
  MultiSelectController<String> primaryCategoriesController =
      MultiSelectController<String>();
  MultiSelectController<String> tagsController =
      MultiSelectController<String>();
  MultiSelectController<String> brandController =
      MultiSelectController<String>();

  // List selectedCategory = [];
  List brands = [];
  var brandDropDownValue;
  ApiClient apiClient = ApiClient();
  File? videoFile;
  String? fileName;
  FilePickerResult? result;
  RxList<File> imageFiles = <File>[].obs;
  String? imageUrl;

  
  //! primary category list
  List<DropdownItem<String>> primaryCategoryList = [];

  @override
  void onClose() {
    print("Controller is being deleted");
    super.onClose();
  }

  @override
  void onInit() {
    print('-------Muthu-----');
    change(null, status: RxStatus.loading());
    super.onInit();
    // viewProduct();
    if (Get.arguments['fromScreen'] == StringResources.editProduct) {
      getSimpleProduct1Data();
    } else {
      allCategory();
      allTags();
      allBrand();
    }    
  }

  Future<void> addProduct() async {
    change(null, status: RxStatus.loading());
    try {
      String productBrand = '';
      String productCategory = '';
      debugPrint('${Singleton.instance.vendorId}');
      debugPrint('${Singleton.instance.serviceKey}');
      debugPrint(productNameController.text);
      for (var element in brandController.selectedItems) {
        productBrand = element.value.toString();
        debugPrint(element.value.toString());
      }
      for (var element in categoriesController.selectedItems) {
        productCategory =
            "${element.value.toString()},${productCategory.toString()}";
      }
      debugPrint(productRegularPriceController.text);
      debugPrint(productSalePriceController.text);
      debugPrint(productShortDescriptionController.text);
      debugPrint(productLongDescriptionController.text);
      Get.arguments['toScreen'] == StringResources.simpleProduct
          ? debugPrint('simple product')
          : debugPrint('variable product');
      var request = http.MultipartRequest(
        "POST",
        Uri.parse(Get.arguments['toScreen'] == StringResources.simpleProduct
            ? 'https://wcartnode.webnexs.org/vendorapi/add_simple_product'
            : 'https://wcartnode.webnexs.org/vendorapi/add_variable_product'),
      );

      // Add form fields
      request.fields["vendorid"] = Singleton.instance.vendorId ?? "";
      request.fields["servicekey"] = Singleton.instance.serviceKey ?? "";
      request.fields["store_staff_id"] = "0";
      request.fields["title"] = productNameController.text;
      request.fields["terms"] = productCategory;
      request.fields["protags"] = tagsController.selectedItems[0].value;
      request.fields["procatid"] = categoriesController.selectedItems[0].value;
      request.fields["pro_brand"] = brandController.selectedItems[0].value;
      request.fields["price"] = productRegularPriceController.text;
      request.fields["saleprice"] = productSalePriceController.text;
      request.fields["description"] = productShortDescriptionController.text;
      request.fields["longdescription"] = productLongDescriptionController.text;
      // Add image files
      for (int i = 0; i < imageFiles.length; i++) {
        var pic = await http.MultipartFile.fromPath(
          "uploader${i + 1}",
          imageFiles[i].path,
          contentType: MediaType('image', 'jpeg'),
        );
        debugPrint('${imageFiles[i].path}');
        request.files.add(pic);
        // debugPrint('${element.path}');
      }

      // Add video file if available
      if (videoFile != null) {
        var video = await http.MultipartFile.fromPath(
          "uploader6",
          videoFile!.path,
          contentType:
              MediaType('video', 'mp4'), // Adjust as per your video type
        );
        debugPrint(videoFile!.path);
        request.files.add(video);
      }
      var response = await request.send();
      debugPrint(response.statusCode.toString());
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);

      // Directly decode the responseString
      Map<String, dynamic> valueMap = jsonDecode(responseString);
      if (response.statusCode == 200 && valueMap['status'] == "true") {
        print(valueMap['status']);
        print(valueMap['message']);
        print(valueMap['productData']['productid']);
        change(null, status: RxStatus.success());
        //!navigation
        Get.arguments['toScreen'] == StringResources.simpleProduct
            ? Get.offNamed(Routes.productInventoryStep2, arguments: {
                'fromScreen': StringResources.addInventory,
                'productId': "${valueMap['productData']['productid']}",
              })
            : Get.toNamed(Routes.attribute, arguments: {
                'edit': false,
                'productId': "${valueMap['productData']['productid']}",
              });
        // Get.snackbar(
        //   'Message',
        //   responseString
        //       .replaceAll('{"status":"true","message":"', '')
        //       .replaceAll('"}', ''),
        // );
      } else {
        // Handle request failure
        print('Failed to upload product. Status code: ${response.statusCode}');
        showInfoSnackBar(valueMap['message'].toString());
        change(null, status: RxStatus.success());
      }
    } catch (e) {
      // Handle any exceptions
      print('Error: $e');
      showInfoSnackBar(e.toString());
      change(null, status: RxStatus.success());
    }
    
  }

  allCategory() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.allCategoryList, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      //  Singleton.instance.vendorId,
      "servicekey": Singleton.instance.serviceKey ?? "",
      // Singleton.instance.serviceKey,
    }).then((value) {
      print('{allcatergorei---------------------------} ${value['data']}');
      // print(value);
      if (value['status']) {
        allCategoryData = AllCategoryListModel.fromJson(value['data']);
        allBrand();
      } else {
        print('error');
      }
      change(allCategoryData);
    });
    change(allCategoryData, status: RxStatus.success());
  }

  allTags() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.allTagsList, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey ?? ""
      // Singleton.instance.serviceKey,
    }).then((value) {
      // print(value);
      if (value['status']) {
        allTagsData = AllTagsListModel.fromJson(value['data']);
        allBrand();
      } else {
        print('error');
      }
    });
    change(allTagsData, status: RxStatus.success());
  }

  allBrand() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.allBrandList, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey ?? "",
    }).then((value) {
      // print(value);
      if (value['status']) {
        allBrandData = AllBrandModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(allBrandData, status: RxStatus.success());
  }

  addImage() async {
    result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      for (var element in result!.files) {
        var val = File(element.path ?? '');
        imageFiles.add(val);
      }

      print(imageFiles);

      change(imageFiles);
    } else {
      // User canceled the picker
      showFailureSnackBar('No Image Selected');
    }
  }

  void removeImageFromSelectedImageList(int index) {
    imageFiles.removeAt(index);
    change(imageFiles);
    update();
  }

  getSimpleProduct1Data() async {
    print('muthuvel ${Get.arguments["productID"].toString()}');
    change(null, status: RxStatus.loading());
    // try {
    await HttpClint.urlEncoded(HttpUrl.viewAllProduct, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      "productid": Get.arguments["productID"].toString()
    }).then((value) {
      print(value);
      if (value['status']) {
        viewAllProductData = ViewProductModel.fromJson(value['data']);
        productNameController.text = viewAllProductData.product![0].name ?? "";
        productRegularPriceController.text =
            viewAllProductData.product![0].price.toString();
        productSalePriceController.text =
            viewAllProductData.product![0].saleprice.toString();
        List<dynamic> optionValue = [viewAllProductData.product?[0].categories];
        print('muthuvel');
        print(optionValue);

        // brandDropDownValue = viewAllProductData.product?[0].brandName ?? 0;
        for (int i = 0; i < 3; i++) {
          if (i == 0) {
            debugPrint(
                'networkImageList: ${viewAllProductData.product?[0].gallery1 ?? ""}');
            if (viewAllProductData.product?[0].gallery1 != '0') {
              networkImageList
                  .add(viewAllProductData.product?[0].gallery1 ?? "");
            } else {
              networkImageList.add(viewAllProductData.product?[0].image ?? "");
            }
          }
          if (i == 1) {
            networkImageList.add(viewAllProductData.product?[0].gallery2 ?? "");
          }
          if (i == 2) {
            networkImageList.add(viewAllProductData.product?[0].gallery3 ?? "");
          }        
        }
        debugPrint('networkImageList: ${networkImageList}');
        viewAllProductData.product![0].price.toString();
        productShortDescriptionController.text =
            viewAllProductData.product?[0].description ?? '';
        productLongDescriptionController.text =
            viewAllProductData.product?[0].longDescription ?? '';            
        change(imageUrl);
        allCategory();
        allTags();
        allBrand();
      } else {
        showInfoSnackBar(viewAllProductData.message!);
      }
    });
    // } catch (e) {}
    update();
    change(null, status: RxStatus.success());
  }

  bool getIsCategorySelected(String termName, String value) {
    debugPrint(
        "TermName Bhuvan  $termName: ${viewAllProductData.product?[0].categories}");
    if (termName.toLowerCase() ==
        viewAllProductData.product?[0].categories
            .toString() 
            .split(',')
            .first
            .toLowerCase()) {
      bool isSelected = primaryCategoryList.isEmpty ? true : false;
      primaryCategoryList.add(
        DropdownItem<String>(
          value: termName,
          label: termName,
          selected: isSelected,
        ),
      );
      return true;
    }
    return false;
  }

  bool getIsTagsSelected(String tagName) {
    if (tagName.toLowerCase() ==
        viewAllProductData.product?[0].productTags
            .toString()
            .split(',')
            .first
            .toLowerCase()) {
      return true;
    }
    return false;
  }

  bool getIsBrandSelected(String brandName) {
    if (brandName.toLowerCase() ==
        viewAllProductData.product?[0].brandName
            .toString()
            .split(',')
            .first
            .toLowerCase()) {
      return true;
    }
    return false;
  }

  updateProduct() async {
    change(null, status: RxStatus.loading());
    try {
      String productBrand = '';
      String productCategory = '';
      debugPrint('${Singleton.instance.vendorId}');
      debugPrint('${Singleton.instance.serviceKey}');
      debugPrint(productNameController.text);
      for (var element in brandController.selectedItems) {
        productBrand = element.value.toString();
        debugPrint(element.value.toString());
      }
      for (var element in categoriesController.selectedItems) {
        productCategory =
            "${element.value.toString()},${productCategory.toString()}";
      }
      debugPrint(productRegularPriceController.text);
      debugPrint(productSalePriceController.text);
      debugPrint(productShortDescriptionController.text);
      debugPrint(productLongDescriptionController.text);
      Get.arguments['toScreen'] == StringResources.simpleProduct
          ? debugPrint('simple product')
          : debugPrint('variable product');

      var request = http.MultipartRequest(
        "POST",
        Uri.parse(viewAllProductData.product?[0].producttype.toString() == '1'
            ? 'https://wcartnode.webnexs.org/vendorapi/update_simple_product'
            : 'https://wcartnode.webnexs.org/vendorapi/update_variable_product'),
      );

      // Add form fields
      request.fields["vendorid"] = Singleton.instance.vendorId ?? "";
      request.fields["servicekey"] = Singleton.instance.serviceKey ?? "";
      request.fields["store_staff_id"] = "0";
      request.fields["title"] = productNameController.text;
      request.fields["terms"] = productCategory;
      request.fields["protags"] = tagsController.selectedItems[0].value;
      request.fields["procatid"] =
          categoriesController.selectedItems[0].value;
      request.fields["pro_brand"] = brandController.selectedItems[0].value;
      request.fields["price"] = productRegularPriceController.text;
      request.fields["saleprice"] = productSalePriceController.text;
      request.fields["description"] = productShortDescriptionController.text;
      request.fields["longdescription"] = productLongDescriptionController.text;
      request.fields["productid"] =
          viewAllProductData.product![0].productid.toString();
      request.fields["product_image"] =
          viewAllProductData.product![0].image.toString();
      request.fields["product_thumb"] =
          viewAllProductData.product![0].thumbnail.toString();
      request.fields["product_small"] =
          viewAllProductData.product![0].smallimage.toString();
      request.fields["product_gallery1"] =
          viewAllProductData.product![0].gallery1.toString();
      request.fields["product_gallery2"] =
          viewAllProductData.product![0].gallery2.toString();
      request.fields["product_gallery3"] =
          viewAllProductData.product![0].gallery3.toString();
      request.fields["product_gallery4"] =
          viewAllProductData.product![0].gallery4.toString();
      request.fields["product_video"] =
          viewAllProductData.product![0].video.toString();
      // Add image files
      for (int i = 0; i < imageFiles.length; i++) {
        var pic = await http.MultipartFile.fromPath(
          "uploader${i + 1}",
          imageFiles[i].path,
          contentType: MediaType('image', 'jpeg'),
        );
        debugPrint('${imageFiles[i].path}');
        request.files.add(pic);
        // debugPrint('${element.path}');
      }

      // Add video file if available
      if (videoFile != null) {
        var video = await http.MultipartFile.fromPath(
          "uploader6",
          videoFile!.path,
          contentType:
              MediaType('video', 'mp4'), // Adjust as per your video type
        );
        debugPrint(videoFile!.path);
        request.files.add(video);
      }
      var response = await request.send();
      debugPrint(response.statusCode.toString());
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);

      // Directly decode the responseString
      Map<String, dynamic> valueMap = jsonDecode(responseString);
      if (response.statusCode == 200 && valueMap['status'] == "true") {
        print(valueMap['status']);
        print(valueMap['message']);
        //!navigation
        viewAllProductData.product![0].producttype.toString() == '1'
            ? Get.offNamed(Routes.productInventoryStep2, arguments: {
                'fromScreen': StringResources.addInventory,
                'productId':
                    "${viewAllProductData.product![0].productid.toString()}",
                'edit': true,                        
              })
            : Get.toNamed(Routes.attribute, arguments: {
                'edit': true,
                'productId':
                    "${viewAllProductData.product![0].productid.toString()}",
              });
        // Get.snackbar(
        //   'Message',
        //   responseString
        //       .replaceAll('{"status":"true","message":"', '')
        //       .replaceAll('"}', ''),
        // );
      } else {
        // Handle request failure
        print('Failed to upload product. Status code: ${response.statusCode}');
        showInfoSnackBar(valueMap['message'].toString());
      }
    } catch (e) {
      // Handle any exceptions
      print('Error: $e');
      showFailureSnackBar("An error occurred while uploading product");
    }
    change(null, status: RxStatus.success());
  }

  
  
}
