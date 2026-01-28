import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toastification/toastification.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/http/getx_repository.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/features/data/model/listtags_model.dart';
import 'package:wcart_vendor/model/viewtags_model.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_tags/controller/viewtag_controller.dart';
import 'package:wcart_vendor/singleton.dart';
import 'package:wcart_vendor/util/string_resources.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class TagsController extends GetxController with StateMixin {
  ApiClient apiClient = ApiClient();
  ViewTagsController controller = Get.put(ViewTagsController());

  TextEditingController tagNameController = TextEditingController();
  TextEditingController tagSlugController = TextEditingController();
  TextEditingController metaTitleController = TextEditingController();
  TextEditingController metaKeywordController = TextEditingController();
  TextEditingController metaDescriptionController = TextEditingController();

  List<String> tagDropdownList = ['Basic', "Offer", "Deals"];
  String statusTag = 'Basic';

  List<String> statusDropdownList = ['Enable', "Disable"];
  String statusValue = 'Enable';

  List<String> allowSearchDropdownList = ['Yes(Default)', "No"];
  String allowSearch = 'Yes(Default)';

  List<String> searchFollowDropdownList = ['Yes(Default)', "No"];
  String searchFollow = 'Yes(Default)';

  ViewTagsModel listTagsData = ViewTagsModel();
  EditTagsModel editTagsData = EditTagsModel();
  FilePickerResult? result;
  File? imageFile;
  String? imageUrl;
  @override
  void onInit() {
    change(null, status: RxStatus.loading());

    super.onInit();
    statusValue = statusDropdownList[0];

    if (Get.arguments['fromScreen'] == StringResources.editTag) {
      getTagData();
    }
    change(null, status: RxStatus.success());
  }

  Future<dynamic> addTags() async {
    change(null, status: RxStatus.loading());
    print(Singleton.instance.vendorId);
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(
        'https://wcartnode.webnexs.org/vendorapi/update_tag',
      ),
    );
    //add text fields
    request.fields["vendorid"] =
        Singleton.instance.vendorId ?? Get.arguments['vendoreID'];
    request.fields["servicekey"] = Singleton.instance.serviceKey ?? "";
    request.fields["tagname"] = tagNameController.text;
    request.fields["tagslug"] = tagSlugController.text;
    request.fields["seo_title"] = metaTitleController.text;
    request.fields["seo_keyword"] = metaKeywordController.text;
    request.fields["seo_description"] = metaDescriptionController.text;
    request.fields["status"] = statusValue == "Enable" ? "1" : "0";
    request.fields["tagtype"] = statusTag == "Basic"
        ? "1"
        : statusTag == "Offer"
            ? "2"
            : "0";
    request.fields["seo_index"] = statusTag == "Basic"
        ? "1"
        : statusTag == "Offer"
            ? "2"
            : "0";
    request.fields["seo_follow"] = statusTag == "Basic"
        ? "1"
        : statusTag == "Offer"
            ? "2"
            : "0";
    if (Get.arguments != null &&
        Get.arguments['fromScreen'] == StringResources.editTag) {
      request.fields["tagid"] = Get.arguments['tagId'].toString();
      request.fields['canonical_url'] =
          editTagsData.viewTag![0].canonicalUrl.toString();
    }

//!download image
    File? downloadedImage;

    //create multipart using filepath, string or bytes
    // ignore: unused_local_variablew
    if (imageFile != null) {
      var pic = await http.MultipartFile.fromPath("tagbanner", imageFile!.path,
          contentType: MediaType('image', 'jpeg'),
          filename: imageFile!.path.split('/').last);
      //add multipart to request
      request.files.add(pic);
    } else {
      if (imageUrl != null) {
        // If no image is uploaded, use the placeholder image
        downloadedImage = await getPlaceholderFile(imageUrl!);
        var placeholderPic = await http.MultipartFile.fromPath(
          "tagbanner",
          downloadedImage.path,
          contentType: MediaType('image', 'jpeg'),
          filename: 'placeholder.jpg',
        );
        request.files.add(placeholderPic);
      } else {
        // ✅ Create an empty temporary file
        final tempDir = await getTemporaryDirectory();
        final emptyFile = File('${tempDir.path}/empty.jpg');
        await emptyFile.writeAsBytes([]); // Write zero bytes

        var emptyPic = await http.MultipartFile.fromPath(
          "tagbanner",
          emptyFile.path,
          contentType: MediaType('image', 'jpeg'),
          filename: 'empty.jpg',
        );
        request.files.add(emptyPic);
      }
    }
    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
    if (response.statusCode == 200) {
      controller.viewTags();
      Get.back(result: true);
// Delete the downloaded image after successful upload
      if (downloadedImage != null && downloadedImage.existsSync()) {
        await downloadedImage.delete();
        print("Downloaded image deleted successfully.");
      }
var jsonData = json.decode(responseString);
      showSuccessSnackBar(jsonData['message']);
      // Get.snackbar(
      //   'Message',
      //   responseString
      //       .replaceAll('{"status":"true","message":"', '')
      //       .replaceAll(
      //         '"}',
      //         '',
      //       ),
      // );
    }
    change(null, status: RxStatus.success());
  }

  getTagData() async {
    change(null, status: RxStatus.loading());
    // try {
    print(Singleton.instance.vendorId ?? "");
    print(Get.arguments['tagId'].toString());
    await HttpClint.urlEncoded(HttpUrl.viewTags, body: {
      'vendorid': Singleton.instance.vendorId ?? "",
      'servicekey': Singleton.instance.serviceKey ?? "",
      "tagid": Get.arguments['tagId'].toString(),
    }).then((value) {
      if (value['status']) {
        editTagsData = EditTagsModel.fromJson(value['data']);
        tagNameController.text = editTagsData.viewTag![0].tagname ?? '';
        metaTitleController.text = editTagsData.viewTag![0].metaRobots ?? '';
        metaKeywordController.text = editTagsData.viewTag![0].seoKeyword ?? '';
        metaDescriptionController.text =
            editTagsData.viewTag![0].seoDescription ?? '';
        statusValue = statusDropdownList[editTagsData.viewTag![0].status!];
        statusTag = tagDropdownList[editTagsData.viewTag![0].status!];
        allowSearch = allowSearchDropdownList[editTagsData.viewTag![0].status!];
        searchFollow =
            searchFollowDropdownList[editTagsData.viewTag![0].status!];
        imageUrl =
            '${editTagsData.viewTag![0].imageUrl}${editTagsData.viewTag![0].tagbanner}';
        change(imageUrl);
      } else {
        showInfoSnackBar(editTagsData.message!);
      }
    });
    // } catch (e) {}
    update();
    change(editTagsData, status: RxStatus.success());
  }

  tagImage() async {
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

Future<File> getPlaceholderFile(String url) async {
  // Function to download an image from a URL and save it locally
  final response = await http.get(Uri.parse(url));
  final tempDir = await getTemporaryDirectory();
  final file = File('${tempDir.path}/downloaded_image.jpg');
  await file.writeAsBytes(response.bodyBytes);
  return file;
}
