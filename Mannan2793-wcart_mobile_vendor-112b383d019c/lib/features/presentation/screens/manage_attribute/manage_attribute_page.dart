import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wcart_vendor/features/presentation/screens/login/loginpage.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_attribute/bloc/manage_attribute_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_attribute/widgets/attribute_shimmer.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/model/viewattribute_model.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/string_resources.dart';
import 'package:wcart_vendor/util/svg_icon.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class ViewAttributePage extends StatefulWidget {
  const ViewAttributePage({super.key});

  @override
  State<ViewAttributePage> createState() => _ViewAttributePageState();
}

class _ViewAttributePageState extends State<ViewAttributePage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController slugController = TextEditingController();
  int? selectedIndex = null;
  ViewAttributesModel viewAttributeData = ViewAttributesModel();

  @override
  void initState() {
    viewAttribute(context, true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {    

    return BlocConsumer<ManageAttributeBloc, ManageAttributeState>(
      listener: (context, state) {
        if (state is ManageAttributeLoaded) {
          viewAttributeData = state.manageAttributeModel;
        } else if (state is AttributeEditedState) {
          titleController.text = state.attributeName;
          slugController.text = state.attributeSlug;
          selectedIndex = state.selectedIndex;
        } else if (state is AttributeClearedState) {
          titleController.clear();
          slugController.clear();
          selectedIndex = null;
        } else if (state is AddAttributeLoadedState) {
          if (state.addAttributeModel.status == true) {
            showSuccessSnackBar(state.addAttributeModel.message!);
          } else {
            showWarningSnackBar(state.addAttributeModel.message!);
          }
          viewAttribute(context, true);
        } else if (state is ManageAttributeFailure) {
          showInfoSnackBar(state.failureMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorResource.colorF3F4F8,
          body: LayoutBuilder(builder: (context, constraints) {
            UserDeviceType deviceType = getDeviceType(constraints.maxWidth);
            debugPrint('deviceType: $deviceType');
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomAppBar(
                            titleText: "Manage Attributes",
                            onBackButtonPressed: () {
                              viewAttribute(context, true);
                            },
                            showAction: true,
                            isLoading: state is ManageAttributeLoading,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Container(
                                      height: getCategoryContainerSize(
                                          deviceType, 680),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Column(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Add Attributes",
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Name",
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: ColorResource
                                                        .color252525,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: getCategoryContainerSize(
                                                  deviceType,
                                                  350,
                                                ),
                                                child: CustomTextField(
                                                  validationRules: ['required'],
                                                  "Attribute Name",
                                                  titleController,
                                                  validatorCallBack: (val) {
                                                    print(val);
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          // const SizedBox(
                                          //   height: 10,
                                          // ),
                                          // Column(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.start,
                                          //   crossAxisAlignment:
                                          //       CrossAxisAlignment.start,
                                          //   children: [
                                          //     Padding(
                                          //       padding:
                                          //           const EdgeInsets.all(5.0),
                                          //       child: Text(
                                          //         "Slug",
                                          //         style: TextStyle(
                                          //           fontSize: 12.sp,
                                          //           color:
                                          //               ColorResource.color252525,
                                          //           fontWeight: FontWeight.w500,
                                          //         ),
                                          //       ),
                                          //     ),
                                          //     SizedBox(
                                          //         width: getCategoryContainerSize(
                                          //             deviceType, 350),
                                          //         child: CustomTextField(
                                          //           validationRules: ['required'],
                                          //           "Attribute Slug",
                                          //           controller.slugController,
                                          //           fillColor:
                                          //               ColorResource.colorffffff,
                                          //           validatorCallBack: (val) {
                                          //             print(val);
                                          //           },
                                          //         )),
                                          //   ],
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 25, top: 50),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              spacing: 20,
                                              children: [
                                                selectedIndex != null
                                                    ? MouseRegion(
                                                        cursor:
                                                            SystemMouseCursors
                                                                .click,
                                                        child: MouseRegion(
                                                          cursor:
                                                              SystemMouseCursors
                                                                  .click,
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              clearValues(
                                                                  context);
                                                            },
                                                            child: Container(
                                                              decoration: const BoxDecoration(
                                                                  color: ColorResource
                                                                      .color0D5EF8,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              3.0))),
                                                              height:
                                                                  AppUtils.vs(
                                                                      65,
                                                                      context),
                                                              width:
                                                                  AppUtils.vs(
                                                                      200,
                                                                      context),
                                                              child:
                                                                  const Center(
                                                                child: Text(
                                                                  "Cancel",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : SizedBox(),
                                                MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors.click,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      if (_formKey.currentState!
                                                          .validate()) {
                                                        // controller
                                                        //     .addAttribute();
                                                        selectedIndex != null
                                                            ? updateAttribute(
                                                                context,
                                                                titleController
                                                                    .text,
                                                                (viewAttributeData
                                                                            .attributes?[
                                                                                selectedIndex!]
                                                                            .id)
                                                                        .toString() ??
                                                                    '')
                                                            : addAttribute(
                                                                context,
                                                                titleController
                                                                    .text);
                                                      }
                                                    },
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: ColorResource
                                                            .color0D5EF8,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(
                                                            3.0,
                                                          ),
                                                        ),
                                                      ),
                                                      height: AppUtils.vs(
                                                          65, context),
                                                      width: AppUtils.vs(
                                                          200, context),
                                                      child: Center(
                                                        child: Text(
                                                          selectedIndex != null
                                                              ? "Update"
                                                              : "Add Attribute",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  color: Colors.white,
                                  height:
                                      getCategoryContainerSize(deviceType, 680),
                                  margin:
                                      const EdgeInsets.only(left: 15, right: 7),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                      vertical: 15,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "All Attributes",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Center(
                                                  child: Text(
                                                    "S.NO",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Center(
                                                  child: Text(
                                                    StringResources.name,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Center(
                                                  child: Text(
                                                    "Slug",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child: Center(
                                                      child: Text(
                                                    "Action",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )))
                                            ],
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 0.5,
                                          color: ColorResource.colorDDDDDD,
                                        ),
                                        Expanded(
                                          child: state is ManageAttributeLoading
                                              ? attributeShimmer()
                                              : viewAttributeData.attributes !=
                                                          null &&
                                                      viewAttributeData
                                                          .attributes!
                                                          .isNotEmpty
                                                  ? dataLayer(viewAttributeData)
                                                  : Container(),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
        );
      },
    );
  }

  ListView dataLayer(ViewAttributesModel state) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider(
          color: ColorResource.colorDDDDDD,
          thickness: 0.5,
        );
      },
      itemCount: state.attributes?.length ?? 0,
      itemBuilder: (context, i) {
        int sNo = i + 1;
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    flex: 2,
                    child: Center(
                        child: Text(
                      "$sNo",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ))),
                Expanded(
                    flex: 3,
                    child: Center(
                        child: Text(state.attributes?[i]
                                .attributename ??
                            ''))),
                Expanded(
                    flex: 3,
                    child: Center(
                        child: Text(
                      state.attributes?[i].attributeslug ??
                          '',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ))),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            context.read<ManageAttributeBloc>().add(
                                EditAttributeEvent(
                                    attributes: state.attributes![i],
                                    selectedIndex: i));
                            // controller.editAttribute(context,
                            //     controller.viewAttributeData.attributes?[i], i);
                          },
                          child: const SvgIcon(
                            'assets/icon/svg/edit.svg',
                            
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.attributevalue, arguments: {
                              'title': state
                                  .attributes?[i].attributename,
                              'id': state.attributes?[i].id,
                              'slug': state
                                  .attributes?[i].attributeslug,
                            });
                          },
                          child: Icon(
                            Icons.settings_suggest_sharp,
                            color: Colors.grey[600],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  
  void viewAttribute(BuildContext context, bool isLoading) async {
    context
        .read<ManageAttributeBloc>()
        .add(GetAttributeDataEvent(isLoading: isLoading));
  }

  void clearValues(BuildContext context) async {
    context.read<ManageAttributeBloc>().add(ClearAttributeEvent());
  }

  void addAttribute(BuildContext context, String attributeName) async {
    context
        .read<ManageAttributeBloc>()
        .add(AddAttributeEvent(attributeName: attributeName));
  }

  void updateAttribute(
      BuildContext context, String attributeName, String? id) async {
    context
        .read<ManageAttributeBloc>()
        .add(AddAttributeEvent(attributeName: attributeName, id: id));
  }
}

getCategoryContainerSize(UserDeviceType deviceType, double value) {
  switch (deviceType) {
    case UserDeviceType.mobile:
      return value / 1.5;
    case UserDeviceType.smallTablet:
      return value / 1.3;
    case UserDeviceType.largeTablet:
      return value / 1.3;
    case UserDeviceType.desktop:
      return value;
  }
}
