import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/widgets/start_shimmer.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/features/presentation/screens/profile/controller/viewpayouts_controller.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';

class PaidPayoutsPage extends StatefulWidget {
  const PaidPayoutsPage({super.key});

  @override
  State<PaidPayoutsPage> createState() => _PaidPayoutsPageState();
}

class _PaidPayoutsPageState extends State<PaidPayoutsPage> {
  ViewPayoutsController controller = Get.put(ViewPayoutsController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewPayoutsController>(builder: (controller) {
        print('screen status ---> ${controller.status.isLoading}');      
      return Scaffold(
        backgroundColor: ColorResource.colorF3F4F8,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CustomAppBar(
                        titleText: "Paid Payouts",
                        onBackButtonPressed: () {},
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Expanded(
                        child: Container(
                        decoration: const BoxDecoration(
                          color: ColorResource.colorFFFFFF,
                          // border: Border.all(
                          //   color: Color(0xffe3e3e5),
                          // ),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Paid Payouts List",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                          "Process ID",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                          'Processed Date',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                          "Total Payouts",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          "View",
                                          style: TextStyle(
                                              fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 0.5,
                                color: ColorResource.colorDDDDDD,
                              ),
                              Expanded(
                                  child: controller.status.isLoading ||
                                          controller
                                                  .viewPaidPayoutsData.status ==
                                              false ||
                                          controller
                                                  .viewPaidPayoutsData.status ==
                                              null
                                      ? shimmerLayer()
                                      : dataLayer(controller),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

//!Shimmer Layer
  ListView shimmerLayer() {
    return ListView.builder(
        itemCount: 15,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        height: 20,
                        width: 100,
                        child: StartShimmer(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        height: 20,
                        width: 100,
                        child: StartShimmer(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        height: 20,
                        width: 100,
                        child: StartShimmer(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,

                      child: GestureDetector(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: ColorResource.color0D5EF8,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          height: AppUtils.vs(55, context),
                          width: AppUtils.vs(100, context),
                          child: const Center(
                            child: Text(
                              'View Payouts',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

//! Data Layer
  ListView dataLayer(ViewPayoutsController controller) {
    return ListView.builder(
        itemCount: controller.viewPaidPayoutsData.result?.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    flex: 3,
                    child: Text(controller
                            .viewPaidPayoutsData.result?[i].processId
                            .toString() ??
                        '')),
                Expanded(
                    flex: 3,
                    child: Text(
                      controller.viewPaidPayoutsData.result?[i].processed ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    )),
                Expanded(
                    flex: 3,
                    child: Text(
                      controller.viewPaidPayoutsData.result?[i].totalpayouts
                              .toString() ??
                          '',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    )),
                Expanded(
                  flex: 1,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.listPaidPayoutsPage);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: ColorResource.color0D5EF8,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        height: AppUtils.vs(55, context),
                        width: AppUtils.vs(100, context),
                        child: const Center(
                          child: Text(
                            'View Payouts',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
