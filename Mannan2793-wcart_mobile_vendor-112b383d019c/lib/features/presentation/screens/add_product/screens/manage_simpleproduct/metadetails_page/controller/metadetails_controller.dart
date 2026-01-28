import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:wcart_vendor/features/presentation/screens/add_product/screens/manage_simpleproduct/viewproduct/viewproduct_page.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/liveproduct_model.dart';
import 'package:wcart_vendor/model/metaproduct_model.dart';
import 'package:wcart_vendor/model/viewproduct_model.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/singleton.dart';
import 'package:wcart_vendor/util/string_resources.dart';
import 'package:http/http.dart' as http;


class MetaProductController extends GetxController with StateMixin {

  MetaProductModel addMetaData = MetaProductModel();
  LiveProductModel liveProductData = LiveProductModel();
  ViewProductModel viewAllProductData = ViewProductModel();
  List selectedActiveProducts = [];

  TextEditingController metaTitleController = TextEditingController();
  TextEditingController metaKeywordsController = TextEditingController();
  TextEditingController metaDescriptionController = TextEditingController();
  TextEditingController trendingController = TextEditingController();
  TextEditingController canonicalUrl = TextEditingController();
  List<String> allowSearchDownList = ['Yes(Default)', "No"];
  String allowSearch = 'Yes(Default)';
  List<String> searchFollowDownList = ['Yes(Default)', "No"];
  String searchFollow = 'Yes(Default)';

  //!dropdown controller
  final crossSellController = MultiSelectController<String>();
  final upSellController = MultiSelectController<String>();
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    if (Get.arguments['fromScreen'] == StringResources.addMetaDetails) {
      // Here get view the brand data
      //!temproary off
      debugPrint("product id${Get.arguments['productID']}");
      getSimpleProduct3Data();
    }

    liveProduct();
    super.onInit();    
  }

  addMetaProduct(String productId, BuildContext context) async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.metaProduct, body: {
      "vendorid": Singleton.instance.vendorId,
      "servicekey": Singleton.instance.serviceKey,
      "store_staff_id": "",
      'productid': productId,
      'post_id': '',
      'product_status': '',
      'upsell_products': '',
      'cross_sell_products': '',
      'seo_title': metaTitleController.text,
      'seo_description': metaDescriptionController.text,
      'seo_keyword': metaKeywordsController.text,
      'trending': '1',
      'status': '1',
      "seo_index": '',
      "seo_follow": '',
      "canonical_url": canonicalUrl.text,
      'size_chart': '',
      'chart_type': ""
    }).then((value) {
      print(value);
      if (value['status']) {
        addMetaData = MetaProductModel.fromJson(value['data']);
        showSuccessSnackBar(' Updated Successfully');
        Get.offAllNamed(Routes.sideBar);
        getAllProduct(context);
      } else {
        print('error');
      }
    });
    Get.toNamed(Routes.sideBar);
    change(addMetaData, status: RxStatus.success());
  }

  liveProduct() async {
    change(null, status: RxStatus.loading());
    try {
      await HttpClint.urlEncoded(
        HttpUrl.liveProducts,
        body: {
        "vendorid": "9",
        "servicekey": "wkl6bgljm7smj5f3",
        },
      ).then((value) {
        if (value['status']) {
          debugPrint("value + value.toString()");
          liveProductData = LiveProductModel.fromJson(value['data']);
          // debugPrint("liveProductData + ${liveProductData.products![0].name}");
      } else {
          showInfoSnackBar(liveProductData.message!);
      }
      });
        
    } catch (e) {
      debugPrint("catch$e");
    }    
    change(liveProductData, status: RxStatus.success());
  }

  getSimpleProduct3Data() async {
    change(null, status: RxStatus.loading());
    
    try {      
      await HttpClint.urlEncoded(HttpUrl.viewAllProduct, body: {
        "vendorid": Singleton.instance.vendorId ?? "",
        "servicekey": Singleton.instance.serviceKey,
        "productid": Get.arguments['productID'],
      }).then((value) {
        print("--Muthuvel------");
        print(value);
        if (value['status']) {
          viewAllProductData = ViewProductModel.fromJson(value['data']);
          metaTitleController.text =
              viewAllProductData.seodata!.first.name ?? "";
          metaDescriptionController.text =
              viewAllProductData.seodata!.first.description ?? "";
          metaKeywordsController.text =
              viewAllProductData.seodata!.first.seoKeyword ?? "";
          canonicalUrl.text =
              viewAllProductData.seodata!.first.canonicalUrl ?? "";
        } else {
          showInfoSnackBar(viewAllProductData.message!);
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
    change(null, status: RxStatus.success());
  }

void clearCache() {
    // Clear text controllers
    metaTitleController.clear();
    metaKeywordsController.clear();
    metaDescriptionController.clear();
    trendingController.clear();
    canonicalUrl.clear();

    // Reset dropdown selections
    allowSearch = 'Yes(Default)';
    searchFollow = 'Yes(Default)';

    // Clear selected product list
    selectedActiveProducts.clear();

    // Reset models if needed
    addMetaData = MetaProductModel();
    liveProductData = LiveProductModel();
    viewAllProductData = ViewProductModel();
  }
}
