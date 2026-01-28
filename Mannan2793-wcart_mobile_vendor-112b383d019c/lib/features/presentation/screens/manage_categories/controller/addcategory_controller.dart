import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_categories/list_categoriespage.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_tags/controller/tags_controller.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/http/getx_repository.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/allcategory_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:wcart_vendor/features/data/model/listcategory_model.dart';
import 'package:wcart_vendor/model/viewattribute_model.dart';
import 'package:wcart_vendor/model/viewcategory_model.dart';
import 'package:wcart_vendor/singleton.dart';
import 'package:wcart_vendor/util/string_resources.dart';

class CategoryController extends GetxController with StateMixin {
  AllCategoryModel allCategoryData = AllCategoryModel();
  // List<String> statusDropdownList = ['Enable', "Disable"];
  String allowSearch = 'Yes(Default)';  

  List<String> allowSearchDropdownList = ['Yes(Default)', "No"];
  ApiClient apiClient = ApiClient();
  TextEditingController categoryDescriptionController = TextEditingController();
  MultiSelectController<String> categoryTypesController =
      MultiSelectController<String>();
  final MultiSelectController<String> attributesController =
      MultiSelectController<String>();
  var categoryDropdownValue;
  TextEditingController categorySlugController = TextEditingController();
  TextEditingController categoryTitleController = TextEditingController();
  List<String> featuredCategoryDropdownList = ['Yes', "No"];
  String featuredCategoryValue = 'Yes';
  File? imageFile1;
  File? imageFile2;
  File? imageFile3;
  File? imageFile4;
  File? imageFile5;
  File? imageFile6;
  String? imageUrl1;
  String? imageUrl2;
  String? imageUrl3;
  String? imageUrl4;
  String? imageUrl5;
  String? imageUrl6;
  TextEditingController metaDescriptionController = TextEditingController();
  TextEditingController metaKeywordController = TextEditingController();
  TextEditingController metaTitleController = TextEditingController();
  FilePickerResult? result;
  String searchFollow = 'Yes(Default)';
  List<String> searchFollowDropdownList = ['Yes(Default)', "No"];
  List selectedCategory = [];
  List<String> statusDropdownList = ['Enable', "Disable"];
  String statusTag = 'Basic';
  String statusValue = 'Enable';
  List<String> tagDropdownList = ['Basic', "Offer", "Deals"];
  ViewAttributesModel viewAttributeData = ViewAttributesModel();
  ViewCategoryModel viewcategoryData = ViewCategoryModel();

  @override
  void onInit() {
    print('-------Muthu-----');
    change(null, status: RxStatus.loading());
    super.onInit();        
    if (Get.arguments['fromScreen'] == StringResources.editCategory) {
      getCategoryData();
    } else {
      allCategory();
      viewAttribute();
      change(null, status: RxStatus.success());
    }
    
  }

  Future<http.MultipartFile> getMultiPartFile(
      String request, File? tempFile) async {
    var returnPic = await http.MultipartFile.fromPath(
        "term_image", tempFile?.path ?? '',
        contentType: MediaType('image', 'jpeg'),
        filename: (tempFile?.path ?? '').split('/').last);
    return returnPic;
  }

  viewAttribute() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.viewAttribute, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
    }).then((value) {
      print(value);
      if (value['status']) {
        viewAttributeData = ViewAttributesModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(viewAttributeData, status: RxStatus.success());
  }
  Future<void> addCategory({required BuildContext context}) async {    
    change(null, status: RxStatus.loading());
    try {
      var request = http.MultipartRequest(
        "POST",
        Uri.parse('https://wcartnode.webnexs.org/vendorapi/update_category'),
      );

      // Add form fields
      request.fields["vendorid"] = Singleton.instance.vendorId ?? "";
      request.fields["servicekey"] = Singleton.instance.serviceKey ?? "";
      request.fields["store_staff_id"] = '0';
      request.fields["term_name"] = categoryTitleController.text;
      request.fields["term_slug"] = categorySlugController.text;
      request.fields["term_status"] = (statusValue == 'Enable') ? '1' : '0';
      // statusDropdownList.first;
      request.fields["description"] = categoryDescriptionController.text;
      request.fields["term_featured"] =
          (featuredCategoryValue == 'Yes') ? '1' : '0';
      request.fields["parent"] =
          categoryTypesController.selectedItems[0].value.toString();
      request.fields["cat_attribute"] =
          // viewcategoryData.viewCategory?[0].catAttribute ?? '0';
          attributesController.selectedItems[0].value.toString();

//! termImage Download      
File? termImage;

      // Add image files if available
      if (imageFile1 != null) {
        var pic = await getMultiPartFile('term_image', imageFile1);
        request.files.add(pic);
      } else {
        termImage = await getPlaceholderFile(imageUrl1!);
        var placeholderPic = await http.MultipartFile.fromPath(
          "term_image",
          termImage.path,
          contentType: MediaType('image', 'jpeg'),
          filename: 'placeholder.jpg',
        );
        request.files.add(placeholderPic);
      }
//! update later

      // if (imageFile6 != null) {
      //   var pic6 = await getMultiPartFile('term_icon', imageFile6);
      //   request.files.add(pic6);
      // }

      // if (imageFile2 != null) {
      //   var pic1 = await getMultiPartFile('term_banner', imageFile2);
      //   request.files.add(pic1);
      // }

      // if (imageFile3 != null) {
      //   var pic2 = await getMultiPartFile('term_banner_mobile', imageFile3);
      //   request.files.add(pic2);
      // }

      // if (imageFile4 != null) {
      //   var pic3 = await getMultiPartFile('term_offer_banner', imageFile4);
      //   request.files.add(pic3);
      // }

      // if (imageFile5 != null) {
      //   var pic4 =
      //       await getMultiPartFile('term_offer_banner_mobile', imageFile5);
      //   request.files.add(pic4);
      // }

      if (Get.arguments['fromScreen'] == StringResources.editCategory) {
        request.fields["term_id"] = Get.arguments['categoryId'].toString();        
        request.fields["canonical_url"] =
            viewcategoryData.viewCategory?[0].canonicalUrl ?? '';
        request.fields["seo_id"] =
            viewcategoryData.viewCategory?[0].seoId.toString() ?? '0';
        request.fields["seo_index"] =
            viewcategoryData.viewCategory?[0].seoIndex ?? 'index';
        request.fields["seo_follow"] =
            viewcategoryData.viewCategory?[0].seoFollow ?? 'follow';
        request.fields["seo_title"] =
            viewcategoryData.viewCategory?[0].seoTitle ?? '';

        // if (imageFile1 == null) {
        //   request.fields["update_term_image"] = 'default.png';
        // }

        request.fields["update_term_image"] = 'default.png';
        request.fields["update_term_thumbnail"] = 'default.png';
        request.fields["update_term_catalog"] = 'default.png';
        request.fields["update_term_icon"] = 'default.png';
        request.fields["update_term_banner"] = 'default.png';
        request.fields["update_term_banner_mobile"] = 'default.png';
        request.fields["update_term_offer_banner"] = 'default.png';
        request.fields["update_term_offer_banner_mobile"] = 'default.png';            
      }


      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);
        print(responseString);
        // Assuming the responseString is in JSON format, you can parse it if needed
        // var jsonResponse = jsonDecode(responseString);
        // Handle response accordingly                
        getManageCategoryData(context);
        // Delete the downloaded image after successful upload
        if (termImage != null && termImage.existsSync()) {
          await termImage.delete();
          print("Downloaded image deleted successfully.");
        }
        Get.back(result: true);
        
        var jsonData = json.decode(responseString);
        showSuccessSnackBar(
          jsonData['message'],
        );
      } else {
        var responseData = await response.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);
        print(responseString);
        // Handle non-200 status code
        showInfoSnackBar('Failed to add category. Please try again.');
      }
    } catch (e) {
      // Handle any exceptions
      print('Error: $e');
      showFailureSnackBar('An error occurred. Please try again later.');
    }

    change(null, status: RxStatus.success());
  }

  addImage() async {
    result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      PlatformFile? file = result?.files.first;

      imageFile1 = File(file?.path ?? '');

      change(imageFile1.toString());
    } else {
      // User canceled the picker
      showFailureSnackBar('Image not selected');
    }
  }

  addIcon() async {
    result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      PlatformFile? file = result?.files.first;
      imageFile6 = File(file?.path ?? '');
      change(imageFile6.toString());
    } else {
      // User canceled the picker
      showFailureSnackBar('Image not selected');
    }
  }

  addBanner() async {
    result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      PlatformFile? file = result?.files.first;
      imageFile2 = File(file?.path ?? '');
      change(imageFile2.toString());
    } else {
      // User canceled the picker
      showFailureSnackBar('Image not selected');
    }
  }

  addBannerMobile() async {
    result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      PlatformFile? file = result?.files.first;

      imageFile3 = File(file?.path ?? '');

      change(imageFile3.toString());
    } else {
      // User canceled the picker
      showFailureSnackBar('Image not selected');
    }
  }

  addOfferBanner() async {
    result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      PlatformFile? file = result?.files.first;

      imageFile4 = File(file?.path ?? '');

      change(imageFile4.toString());
    } else {
      // User canceled the picker
      showFailureSnackBar('Image not selected');
    }
  }

  addOfferBannerMobile() async {
    result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      PlatformFile? file = result?.files.first;

      imageFile5 = File(file?.path ?? '');

      change(imageFile5.toString());
    } else {
      // User canceled the picker
      showFailureSnackBar('Image not selected');
    }
  }

  allCategory() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.allCategoryList, body: {
      'vendorid': Singleton.instance.vendorId ?? "",
      'servicekey': Singleton.instance.serviceKey,
    }).then((value) {
      print('{allcatergorei---------------------------}');
      // print(value);
      if (value['status']) {
        allCategoryData = AllCategoryModel.fromJson(value['data']);
      } else {
        print('error');
      }
      change(allCategoryData);
    });
    change(allCategoryData, status: RxStatus.success());
  }

  getCategoryData() async {
    change(null, status: RxStatus.loading());
    // try {
    await HttpClint.urlEncoded(HttpUrl.viewCategoryList, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      "term_id": Get.arguments['categoryId'].toString(),
    }).then((value) {
      print(value);
      if (value['status']) {
        viewcategoryData = ViewCategoryModel.fromJson(value['data']);
        allCategory();
        viewAttribute();
        categoryTitleController.text =
            viewcategoryData.viewCategory![0].termName ?? "";
        categoryDescriptionController.text =
            viewcategoryData.viewCategory![0].description ?? "";
        categorySlugController.text =
            viewcategoryData.viewCategory![0].termSlug ?? "";
        metaTitleController.text =
            viewcategoryData.viewCategory![0].postTitle ?? "";
        metaKeywordController.text =
            viewcategoryData.viewCategory![0].seoKeyword ?? "";
        metaDescriptionController.text =
            viewcategoryData.viewCategory![0].seoDescription ?? "";
        statusValue =
            statusDropdownList[
            viewcategoryData.viewCategory![0].termStatus! - 1 <= 0 ? 0 : 1];
        featuredCategoryValue = featuredCategoryDropdownList[
            viewcategoryData.viewCategory![0].termStatus! - 1 <= 0 ? 0 : 1];
        imageUrl1 =
            '${viewcategoryData.viewCategory![0].imageUrl}${viewcategoryData.viewCategory![0].termImage}';
        change(imageUrl1);
        imageUrl2 =
            '${viewcategoryData.viewCategory![0].imageUrl}${viewcategoryData.viewCategory![0].termBanner}';
        change(imageUrl2);
        imageUrl3 =
            '${viewcategoryData.viewCategory![0].imageUrl}${viewcategoryData.viewCategory![0].termBannerMobile}';
        change(imageUrl3);
        imageUrl4 =
            '${viewcategoryData.viewCategory![0].imageUrl}${viewcategoryData.viewCategory![0].termOfferBanner}';
        change(imageUrl4);
        imageUrl5 =
            '${viewcategoryData.viewCategory![0].imageUrl}${viewcategoryData.viewCategory![0].termOfferBannerMobile}';
        change(imageUrl5);
        
      } else {
        // Get.snackbar('message', viewcategoryData.message!);
      }
    });
    // } catch (e) {}    
    change(null, status: RxStatus.success());
  }
}
