import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_brand/brandpage.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_tags/controller/tags_controller.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/http/getx_repository.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/editbrand_model.dart';
import 'package:wcart_vendor/singleton.dart';

import 'package:wcart_vendor/util/string_resources.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';

class EditBrandController extends GetxController with StateMixin {
  ApiClient apiClient = ApiClient();
  

  EditBrandModel editBrandData = EditBrandModel();
  FilePickerResult? result;
  File? imageFile;
  String? imageUrl;
  List<String> brandFeaturedDownList = ['Yes', "No"];
  String brandValue = 'Yes';
  List<String> statusDropdownList = ['Enable', "Disable"];
  String statusValue = 'Enable';

  TextEditingController brandNameController = TextEditingController();
  TextEditingController brandSlugController = TextEditingController();
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    print('-------Muthu-----');

    super.onInit();
    if (Get.arguments['fromScreen'] == StringResources.editBrand) {
      // Here get view the brand data
      getBrandData();
    } else {
      change(null, status: RxStatus.success());
    }
  }

  Future<dynamic> addBrand(BuildContext context) async {
    change(null, status: RxStatus.loading());
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest("POST",
        Uri.parse('https://wcartnode.webnexs.org/vendorapi/update_brand'));
    //add text fields
    request.fields["vendorid"] =
        Singleton.instance.vendorId ?? Get.arguments['vendoreID'];
    // Singleton.instance.vendorId ?? "",;
    request.fields["servicekey"] =
        Singleton.instance.serviceKey ?? Get.arguments['servicekey'];
    // "j4el8e9btge";
    request.fields["brand_name"] = brandNameController.text;
    request.fields["brand_slug"] = brandSlugController.text;
    request.fields["brand_status"] =
        statusDropdownList.indexOf(statusValue).toString();
    request.fields["brand_featured"] =
        brandFeaturedDownList.indexOf(brandValue).toString();

    if (Get.arguments != null &&
        Get.arguments['fromScreen'] == StringResources.editBrand) {
      request.fields["brand_id"] = Get.arguments['brandId'].toString();
    }
    File? downloadedImage;

    // var imagetype = imageFile.runtimeType;
    if (imageFile != null) {
    var pic = await http.MultipartFile.fromPath("brand_image", imageFile!.path,
        contentType: MediaType('image', 'jpeg'),
          filename: imageFile!.path.split('/').last);  
      request.files.add(pic);
    } else if (imageUrl != null) {
      downloadedImage = await getPlaceholderFile(imageUrl!);
      var placeholderPic = await http.MultipartFile.fromPath(
        "brand_image",
        downloadedImage.path,
        contentType: MediaType('image', 'jpeg'),
        filename: 'placeholder.jpg',
      );
      request.files.add(placeholderPic);      
    }
    

    //add multipart to request
    
    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
    if (response.statusCode == 200) {
      Get.back(result: true);
      viewBrandData(context);
      if (downloadedImage != null && downloadedImage.existsSync()) {
        await downloadedImage.delete();
        print("Downloaded image deleted successfully.");
      }
      var jsonData = json.decode(responseString);
      showSuccessSnackBar(jsonData['message']
      );
    }

    change(null, status: RxStatus.success());
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

  getBrandData() async {
    change(null, status: RxStatus.loading());
    // try {
    print(Get.arguments['brandId'].toString());
    print(
      Singleton.instance.serviceKey,
    );
    print(
      Singleton.instance.vendorId,
    );
    await HttpClint.urlEncoded(HttpUrl.viewBrand, body: {
      "vendorid": Singleton.instance.vendorId,
      "servicekey": Singleton.instance.serviceKey,
      "brand_id": Get.arguments['brandId'].toString(),
    }).then((value) {
      print(value);
      if (value['status']) {
        editBrandData = EditBrandModel.fromJson(value['data']);
        brandNameController.text = editBrandData.viewBrand![0].brandName ?? "";
        brandValue =
            brandFeaturedDownList[editBrandData.viewBrand![0].brandFeatured!];
        statusValue =
            statusDropdownList[editBrandData.viewBrand![0].brandStatus!];
        imageUrl =
            '${editBrandData.viewBrand![0].imageUrl}${editBrandData.viewBrand![0].brandImage}';
        change(imageUrl);
      } else {
        showInfoSnackBar(editBrandData.message!);
      }
    });
    // } catch (e) {}
    update();
    change(null, status: RxStatus.success());
  }
}
