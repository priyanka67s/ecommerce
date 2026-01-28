import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/add_product/screens/manage_simpleproduct/viewproduct/viewproduct_page.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/string_resources.dart';
import 'package:wcart_vendor/util/svg_icon.dart';
import '../../../../../../../data/model/manageproduct_model.dart';

ListView products(
  ManageProductModel manageProductModel,
  List<Products> paginatedItems,
) {
  return ListView.separated(
    
    separatorBuilder: (context, index) {
      return const Divider(
        color: ColorResource.colorDDDDDD,
        thickness: 0.5,
      );
    },
    itemCount: paginatedItems.length,
    //  .products?.length ?? 0,
    itemBuilder: (context, i) {
      

      final product = paginatedItems![i];
      int sNo = i + 1;
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                "$sNo",
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: CachedNetworkImage(
                    imageUrl: '${product.imageUrl}${product.image}',
                    errorWidget: (context, url, error) => Image.network(
                      'https://wcartnode.webnexs.org/products/default.png',
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 28.0,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name ?? '',
                      ),
                      Text(
                        "(${product.skuCode ?? ''})",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  manageProductModel.products![i].status == 0
                      ? 'Draft'
                      : manageProductModel.products![i].status == 1
                          ? 'Published'
                          : 'Verification Pending',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  manageProductModel.products![i].producttype == 1
                      ? 'Simple'
                      : 'Variable',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Expanded(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.simpleProductStep1, arguments: {
                              'fromScreen': StringResources.editProduct,
                              'productID':
                                  manageProductModel.products![i].productid,
                              'productType':
                                  manageProductModel.products![i].producttype ==
                                      1
                            })!
                                .then(
                              (value) {
                                if (value ?? false) {
                                  getAllProduct(context);
                                }
                              },
                            );
                          },
                          child: const SvgIcon(
                            'assets/icon/svg/edit.svg',
                            height: 40,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
