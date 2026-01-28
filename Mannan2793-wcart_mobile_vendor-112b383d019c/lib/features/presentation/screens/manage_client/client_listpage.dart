import 'package:flutter/material.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  @override
  Widget build(BuildContext context) {
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
                    titleText: "Client Management",
                    onBackButtonPressed: () {},
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Expanded(
                    flex: 15,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: ColorResource.colorFFFFFF,
                        // border: Border.all(
                        //   color: Color(0xffe3e3e5),
                        // ),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Text(
                                        "Name",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                        "Type",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                        "Contact",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                        'Address #1',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                        'City',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                        "State",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                        "Postal",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 0.5,
                              color: ColorResource.colorDDDDDD,
                            ),
                            Expanded(
                                child: ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return const Divider(
                                        color: ColorResource.colorDDDDDD,
                                        thickness: .5,
                                      );
                                    },
                                    itemCount: 10,
                                    itemBuilder: (context, i) {
                                      return const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                                flex: 5,
                                                child: Text(
                                                  "Gene Smith ",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "Dealer",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "Dave Smith",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "123 Main St",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "Teaxs",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "New York",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "635202",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                          ],
                                        ),
                                      );
                                    }))
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
  }
}
