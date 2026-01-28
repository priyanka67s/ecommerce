import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import '../../../util/custom_appbar.dart';
import '../widgets/custom_dropdown/custom_dropdown_button.dart';

class ItemsDesktop extends StatefulWidget {
  const ItemsDesktop({super.key});

  @override
  State<ItemsDesktop> createState() => _ItemsDesktopState();
}

class _ItemsDesktopState extends State<ItemsDesktop> {
  String dropdownvalue = 'Item 1';
  bool _switchValue = true;
  List<String> listValue = ['Without Tax', "with Tax"];
  String value = 'Without Tax';
  // List of items in our dropdown menu

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResource.colorF3F4F8,
      // appBar: myAppBar,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // open drawer
          // CustomDrawer(),
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
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xffffffffff)),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 35,
                            ),
                            const Text("Add Items"),
                            const SizedBox(
                              width: 35,
                            ),
                            const Text(
                              "Product",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 1,
                            ),
                            Transform.scale(
                              scale: 0.5,
                              child: CupertinoSwitch(
                                activeTrackColor: ColorResource.color0D5EF8,
                                value: _switchValue,
                                onChanged: (bool value) {
                                  setState(() {
                                    _switchValue = value;
                                  });
                                },
                              ),
                            ),
                            const Text(
                              "Service",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          thickness: .5,
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(35, 15, 0, 10),
                              child: textfield1(),
                            ),
                            const SizedBox(
                              width: 0,
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(15, 15, 0, 10),
                              child: textfield1(),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(15, 10, 10, 10),
                              child: SizedBox(
                                height: 40,
                                child: Text(
                                  'Select Unit',
                                  style: TextStyle(color: Colors.grey[50]),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.fromLTRB(35, 0, 10, 10),
                                child: textfield1(),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 15, 10, 10),
                                child: Container(
                                    child: Row(
                                  children: [
                                    Icon(
                                      Icons.camera_enhance,
                                      color: ColorResource.color0D5EF8,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      "Add Items Image",
                                      style: TextStyle(
                                        color: ColorResource.color0D5EF8,
                                      ),
                                    ),
                                  ],
                                )),
                              ),
                            ],
                          ),
                        ),
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(35, 20, 20, 0),
                              child: Row(
                                children: [
                                  Text(
                                    'Pricing',
                                    style: TextStyle(
                                      color: ColorResource.color0D5EF8,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('Stock'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(35, 10, 0, 0),
                          child: Row(
                            children: [
                              Container(
                                height: 2,
                                width: 45,
                                color: ColorResource.color0D5EF8,
                              )
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: .5,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(35, 20, 15, 0),
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(15, 148, 180, 216),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    'Sale Price',
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 1, 1, 0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xffffBBBBBB))),
                                          height: 30,
                                          width: 100,
                                          child: Center(
                                              child: Text(
                                            'Sale Price',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Color(0xffffBBBBBB)),
                                          )),
                                        )),
                                    CustomDropdownButton(
                                      dropdownItems: listValue,
                                      hint: 'Without Tax',
                                      value: value,
                                      onChanged: (val, key) {
                                        setState(() {
                                          value = val;
                                        });
                                        print(val);
                                      },
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffC4CACD))),
                                      height: 30,
                                      width: 100,
                                      child: Center(
                                          child: Text(
                                        'Disc.. on Sale pric.',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xffffBBBBBB)),
                                      )),
                                    ),
                                    SizedBox(
                                      width: 1,
                                    ),
                                    CustomDropdownButton(
                                      dropdownItems: listValue,
                                      hint: 'Without Tax',
                                      value: value,
                                      onChanged: (val, key) {
                                        setState(() {
                                          value = val;
                                        });
                                        print(val);
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                  child: Text(" + Add Wholesale Price",
                                      style: TextStyle(
                                          color: ColorResource.color0D5EF8,
                                          fontSize: 12)),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(35, 20, 10, 20),
                              child: Container(
                                width: 520,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(15, 148, 180, 216),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text('Purchase Price'),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 2, 2, 2),
                                          child: Container(
                                              height: 30,
                                              width: 100,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Color(
                                                            0xffffBBBBBB))),
                                                height: 30,
                                                width: 80,
                                                child: Center(
                                                    child: Text(
                                                  'Sale Price',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Color(0xffffBBBBBB)),
                                                )),
                                              )),
                                        ),
                                        CustomDropdownButton(
                                          dropdownItems: listValue,
                                          hint: 'Without Tax',
                                          value: value,
                                          onChanged: (val, key) {
                                            setState(() {
                                              value = val;
                                            });
                                            print(val);
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 20, 10, 20),
                              child: Container(
                                width: 520,
                                height: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color.fromARGB(15, 148, 180, 216),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text('Taxes'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 0, 0),
                                      child: SizedBox(
                                        height: 30,
                                        width: 180,
                                        child: CustomDropdownButton(
                                          dropdownItems: listValue,
                                          hint: 'Tax Rate',
                                          value: value,
                                          onChanged: (val, key) {
                                            setState(() {
                                              value = val;
                                            });
                                            print(val);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(
                                height: 40,
                                width: 120,
                                // child: FlatButton(
                                //   onPressed: null,
                                //   child: Text('Save & New',
                                //       style: TextStyle(color: Colors.blue)),
                                //   textColor: Colors.white,
                                //   shape: RoundedRectangleBorder(
                                //       side: BorderSide(
                                //           color: Colors.blue,
                                //           width: 1,
                                //           style: BorderStyle.solid),
                                //       borderRadius: BorderRadius.circular(2)),
                                // ),
                              ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.fromLTRB(15, 10, 10, 10),
                              //   child: Container(
                              //     height: 40,
                              //     width: 120,
                              //     child: ElevatedButton(
                              //       style: ElevatedButton.styleFrom(
                              //         primary: ColorResource
                              //             .color0D5EF8, // background
                              //         onPrimary: Colors.white, // foreground
                              //       ),
                              //       onPressed: () {},
                              //       child: Text(
                              //         'Save',
                              //         style: TextStyle(color: Colors.grey[50]),
                              //       ),
                              //     ),
                              //   ),
                              // )
                            ],
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

class textfield1 extends StatelessWidget {
  const textfield1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 35,
      width: 200,
      child: TextField(
        style: TextStyle(fontSize: 12, color: Color(0xffffbbbbbb)),
        decoration: InputDecoration(
          labelText: 'Item Name*',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffC4CACD), width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffC4CACD), width: 0.0),
          ),
        ),
      ),
    );
  }
}
