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

class VariableProductController extends GetxController with StateMixin {
  ViewProductModel viewAllProductData = ViewProductModel();
  AllCategoryListModel allCategoryData = AllCategoryListModel();
  AllBrandModel allBrandData = AllBrandModel();
  // SettingInventoryModel settingInventoryData = SettingInventoryModel();

  AllTagsListModel allTagsData = AllTagsListModel();
  // AllBrandListModel allBrandData = AllBrandListModel();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productRegularPriceController = TextEditingController();
  final TextEditingController productSalePriceController =
      TextEditingController();
  final TextEditingController productShortDescriptionController =
      TextEditingController();
  final TextEditingController productLongDescriptionController =
      TextEditingController();

  // List selectedCategory = [];
  List brands = [];
  var brandDropDownValue;
  ApiClient apiClient = ApiClient();
  File? videoFile;
  String? fileName;
  FilePickerResult? result;
  RxList<File> imageFiles = <File>[].obs;
  String? imageUrl;

  final MultiSelectController<Categories> multiSelectController =
      MultiSelectController();

  // Widget categoryMultiSelectDropDownWidget() {
  //   List<ValueItem<Categories>> optionValue = [];

  //   for (var i = 0; i < (allCategoryData.categories ?? []).length; i++) {
  //     Categories category = (allCategoryData.categories ?? [])[i];
  //     optionValue.add(
  //       ValueItem(
  //         label: category.termName ?? '',
  //         value: category,
  //       ),
  //     );
  //   }
  //   return MultiSelectDropDown<Categories>(
  //     clearIcon: Icon(Icons.close),
  //     controller: multiSelectController,
  //     onOptionSelected: (options) {
  //       debugPrint(options.toString());
  //     },
  //     options: optionValue,
  //     selectionType: SelectionType.multi,
  //     chipConfig: const ChipConfig(
  //       wrapType: WrapType.wrap,
  //       backgroundColor: ColorResource.color203052,
  //     ),
  //     optionTextStyle: const TextStyle(fontSize: 16),
  //     selectedOptionIcon: const Icon(
  //       Icons.check_circle,
  //       color: Colors.grey,
  //     ),
  //     selectedOptionTextColor: Colors.blue,
  //     dropdownMargin: 2,
  //     onOptionRemoved: (index, option) {
  //       debugPrint('Removed: $option');
  //     },
  //     borderRadius: 3,
  //   );
  // }

  @override
  void onInit() {
    allCategory();
    allTags();
    print('-------Muthu-----');
    change(null, status: RxStatus.loading());
    super.onInit();

    // viewProduct();

    allBrand();

    if (Get.arguments['fromScreen'] == StringResources.editProduct) {
      // Here get view the brand data
      getSimpleProduct1Data();
    }
    change(null, status: RxStatus.success());
  }

  // viewProduct() async {
  //   change(null, status: RxStatus.loading());
  //   await HttpClint.urlEncoded(HttpUrl.manageProduct,
  //       body: {"vendorid":  Singleton.instance.vendorId ?? "", "servicekey": "j4el8e9btge"}).then((value) {
  //     // print(value);
  //     if (value['status']) {
  //       viewAllProductData = ViewProductModel.fromJson(value['data']);
  //     } else {
  //       print('error');
  //     }
  //   });
  //   change(viewAllProductData, status: RxStatus.success());
  // }

  Future<void> addProduct() async {
    print('muthu');
    var request = http.MultipartRequest(
      "POST",
      Uri.parse('https://wcartnode.webnexs.org/vendorapi/add_variable_product'),
    );

    request.fields["vendorid"] = Singleton.instance.vendorId ?? "";
    request.fields["servicekey"] = Singleton.instance.serviceKey ?? "";
    request.fields["store_staff_id"] = "0";
    request.fields["title"] = productNameController.text;
    request.fields["terms"] = '3';
    request.fields["protags"] = '1';
    request.fields["procatid"] = '3';
    request.fields["pro_brand"] = brandDropDownValue.toString();
    request.fields["price"] = productRegularPriceController.text;
    request.fields["saleprice"] = productSalePriceController.text;
    request.fields["description"] = productShortDescriptionController.text;
    request.fields["longdescription"] = productLongDescriptionController.text;

    for (var element in imageFiles) {
      var pic = await http.MultipartFile.fromPath(
        "uploader1",
        element.path,
        contentType: MediaType('image', 'jpeg'),
        filename: element.path.split('/').last,
      );
      request.files.add(pic);
    }

    if (videoFile != null) {
      var video = await http.MultipartFile.fromPath(
        "uploader6",
        videoFile!.path,
        // contentType: MediaType('video', 'mp4'), // Adjust as per your video type
        filename: videoFile!.path.split('/').last,
      );
      request.files.add(video);
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      print(responseString);

      Get.toNamed(Routes.attribute);
var jsonData = json.decode(responseString);
      showSuccessSnackBar(jsonData['message']);
    } else {
      // Handle request failure
      print('Failed to upload product. Status code: ${response.statusCode}');
      showInfoSnackBar('Failed to upload product');
    }
  }

  allCategory() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.allCategoryList, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      //  Singleton.instance.vendorId,
      "servicekey": "j4el8e9btge"
      // Singleton.instance.serviceKey,
    }).then((value) {
      print('{allcatergorei---------------------------} ${value['data']}');
      // print(value);
      if (value['status']) {
        allCategoryData = AllCategoryListModel.fromJson(value['data']);
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
      "servicekey": "j4el8e9btge"
      // Singleton.instance.serviceKey,
    }).then((value) {
      // print(value);
      if (value['status']) {
        allTagsData = AllTagsListModel.fromJson(value['data']);
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
      "servicekey": "j4el8e9btge"
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
    result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: true);
    if (result != null) {
      for (var element in result!.files) {
        var val = File(element.path ?? '');
        imageFiles.add(val);
      }

      print('nandha------');
      print(imageFiles);

      change(imageFiles);
    } else {
      // User canceled the picker
      showFailureSnackBar('Image not selected');
    }
  }

  void removeImageFromSelectedImageList(int index) {
    imageFiles.removeAt(index);
    change(imageFiles);
    update();
  }

  // Future<void> addVideo() async {
  //   result = await FilePicker.platform.pickFiles(type: FileType.video);
  //   if (result != null) {
  //     PlatformFile? file = result?.files.first;

  //     videoFile = File(file?.path ?? '');

  //     final fileName = (videoFile?.path.split('/').last);
  //     print(fileName);
  //     setState(() {
  //       selectedFileName = fileName;
  //     });
  //   } else {
  //     // User canceled the picker
  //     Get.snackbar('Canceled', '');
  //   }
  // }
//   settingInventory() async {
//     change(null, status: RxStatus.loading());
//     await HttpClint.urlEncoded(HttpUrl.settinginventory, body: {
//       "vendorid": Singleton.instance.vendorId,
//       "servicekey": Singleton.instance.serviceKey,
//     }).then((value) {
//       // print(value);
//       if (value['status']) {
//         settingInventoryData = SettingInventoryModel.fromJson(value['data']);
//       } else {
//         print('error');
//       }
//     });
//     change(settingInventoryData, status: RxStatus.success());
//   }
// }

  getSimpleProduct1Data() async {
    print('muthuvel');
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
        List<dynamic> optionValue = [viewAllProductData.product?[0].categories];
        print('muthuvel');
        print(optionValue);

        // brandDropDownValue = viewAllProductData.product?[0].brandName ?? 0;
        brandDropDownValue = viewAllProductData.product?[0].brandName ?? 0;
        viewAllProductData.product![0].price.toString();
        productShortDescriptionController.text =
            viewAllProductData.product?[0].description ?? '';
        productLongDescriptionController.text =
            viewAllProductData.product?[0].longDescription ?? '';

        change(imageUrl);
      } else {
        showInfoSnackBar(viewAllProductData.message!);
      }
    });
    // } catch (e) {}
    update();
    change(null, status: RxStatus.success());
  }
}
