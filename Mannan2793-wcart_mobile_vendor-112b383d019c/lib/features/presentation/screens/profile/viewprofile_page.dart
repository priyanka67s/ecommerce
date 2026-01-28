import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/profile/controller/viewprofile_controller.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';

class ViewProfilePage extends StatefulWidget {
  const ViewProfilePage({super.key});

  @override
  State<ViewProfilePage> createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {
  ViewProfileController controller = Get.put(ViewProfileController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewProfileController>(
      builder: (controller) {            
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
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorResource.colorffffff,
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(children: [
                              SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Basic Details',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Divider(
                                      thickness: .5,
                                      color: ColorResource.colorDDDDDD,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Name : ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          controller.viewProfileData
                                                      .vendordata ==
                                                  null
                                              ? 'N/A'
                                              : controller.viewProfileData
                                                        .vendordata?.name! ??
                                                    '',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Email Id : ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                            controller.viewProfileData
                                                .vendordata
                                                  ?.emailid ??
                                              '',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[700],
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Phone Number : ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        ),
                                        Text(
                                            controller.viewProfileData
                                                    .vendordata?.phone! ??
                                                '',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[700],
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Address : ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        ),
                                        Text(
                                            controller.viewProfileData
                                                    .vendordata?.address! ??
                                                '',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[700],
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                      ],
                                    ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Brand Details',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Divider(
                                      thickness: .5,
                                      color: ColorResource.colorDDDDDD,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Brand Name : ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                            controller.viewProfileData
                                                .vendordata
                                                  ?.brandname! ??
                                              '',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[700],
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'About Brand : ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                            controller.viewProfileData
                                                .vendordata
                                                  ?.abourbrand ??
                                              '',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[700],
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Business Type : ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                            controller.viewProfileData
                                                .vendordata
                                                  ?.businesstype
                                                  .toString() ??
                                              '',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[700],
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Register Number : ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                            controller.viewProfileData
                                                    .vendordata
                                                    ?.registernumber! ??
                                                '',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[700],
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Website : ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                            controller.viewProfileData
                                                    .vendordata?.website! ??
                                                '',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[700],
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'VAT Number : ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                            controller.viewProfileData
                                                    .vendordata?.vatnumber ??
                                                '',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[700],
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'GST Number : ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                            controller.viewProfileData
                                                    .vendordata?.gstnumber ??
                                                '',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[700],
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ]),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Bank Details',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Divider(
                                      thickness: .5,
                                      color: ColorResource.colorDDDDDD,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Account Holder : ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                            controller.viewProfileData
                                                    .vendordata
                                                    ?.accountholder ??
                                                '',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[700],
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Account Number : ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                            controller.viewProfileData
                                                    .vendordata
                                                    ?.accountnumber! ??
                                                '',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[700],
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Bank Name : ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                            controller.viewProfileData
                                                    .vendordata?.bankname! ??
                                                '',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[700],
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Text(
                                    //       'Business Type:',
                                    //       style: TextStyle(
                                    //           fontSize: 16,
                                    //           color: Colors.black,
                                    //           fontWeight: FontWeight.w500),
                                    //     ),
                                    //      Text(profile[0]['gstnumber'],style: TextStyle(fontSize: 14,color: Colors.grey[700],fontWeight:FontWeight.w700),)
                                    //   ],
                                    // ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Bank Branch : ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                            controller.viewProfileData
                                                    .vendordata?.bankbranch! ??
                                                '',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[700],
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Bank Country : ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                            controller.viewProfileData
                                                    .vendordata?.bankcountry! ??
                                                '',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[700],
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Swift Code : ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                            controller.viewProfileData
                                                    .vendordata?.swiftcode! ??
                                                '',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[700],
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ]),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ]),
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
}
