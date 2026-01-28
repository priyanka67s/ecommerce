import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class AddPartiesScreen extends StatefulWidget {
  const AddPartiesScreen({super.key});

  @override
  State<AddPartiesScreen> createState() => _AddPartiesScreenState();
}

class _AddPartiesScreenState extends State<AddPartiesScreen> {
  List<String> listValue = ['Without Tax', 'two', 'three'];
  String value = 'Without Tax';
  // bool _switchValue = true;
  bool isChecked = false;
  TextEditingController partyNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResource.colorF3F4F8,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                CustomAppBar(
                  titleText: 'Welcome to WCart',
                  onBackButtonPressed: () {},
                ),                
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 7),
                    height: AppUtils.vs(946, context),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
                          child: Row(
                            children: [
                              Text(
                                "Add Party",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: ColorResource.color252525,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.5,
                          color: ColorResource.colorDDDDDD,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SizedBox(
                                  height: 40,
                                  width: 230,
                                  child: CustomTextField(
                                      "Party Name", partyNameController)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SizedBox(
                                  height: 40,
                                  width: 230,
                                  child: CustomTextField(
                                      "GSTIN", partyNameController)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SizedBox(
                                  height: 40,
                                  width: 230,
                                  child: CustomTextField(
                                      "Phone Number", partyNameController)),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                          child: Row(
                            children: [
                              Text("GST & Address"),
                              SizedBox(width: 15),
                              Text("Credit & Balance"),
                              SizedBox(width: 15),
                              Text("Additional Fields"),
                              SizedBox(width: 15),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                          child: Row(
                            children: [
                              Container(
                                height: 2,
                                width: 100,
                                color: ColorResource.colorED1A3B,
                              )
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: .5,
                          color: ColorResource.colorDDDDDD,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Checkbox(
                                      activeColor: Colors.grey,
                                      value: isChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      }),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                        height: 40,
                                        width: 300,
                                        child: CustomTextField(
                                            "Additional Field Name 1 ",
                                            partyNameController)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Checkbox(
                                      activeColor: Colors.grey,
                                      value: isChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      }),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                        height: 40,
                                        width: 300,
                                        child: CustomTextField(
                                            "Additional Field Name 2 ",
                                            partyNameController)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Checkbox(
                                      activeColor: Colors.grey,
                                      value: isChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      }),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                        height: 40,
                                        width: 300,
                                        child: CustomTextField(
                                            "Additional Field Name 3 ",
                                            partyNameController)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Checkbox(
                                      activeColor: Colors.grey,
                                      value: isChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      }),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                        height: 40,
                                        width: 300,
                                        child: CustomTextField(
                                            "Additional Field Name 4 ",
                                            partyNameController)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: ColorResource.color0D5EF8
                                      .withOpacity(0.07),
                                  spreadRadius: 0.0,
                                  blurRadius: 25.0,
                                  offset: const Offset(0.0, 8.0)),
                            ],
                            color: Colors.white,
                          ),
                          height: 139,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: AppUtils.vs(65, context),
                                  width: AppUtils.vs(200, context),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: ColorResource.color0D5EF8),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(3.0))),
                                  child: Center(
                                    child: const Text(
                                      "Save & New",
                                      style: TextStyle(
                                          color: Color(0xFF1D4ED8),
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: ColorResource.color0D5EF8,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(3.0))),
                                      height: AppUtils.vs(65, context),
                                      width: AppUtils.vs(200, context),
                                      child: Center(
                                        child: const Text(
                                          "Save",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
