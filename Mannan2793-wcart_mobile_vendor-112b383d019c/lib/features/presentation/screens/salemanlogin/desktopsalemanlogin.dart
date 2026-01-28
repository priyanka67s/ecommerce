import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/salemanlogin/salemanContoller.dart';

class DesktopSaleManLogin extends StatefulWidget {
  const DesktopSaleManLogin({super.key});
  static const String routeName = '/desktop_staff_login';
  @override
  State<DesktopSaleManLogin> createState() => _DesktopSaleManLoginState();
}

class _DesktopSaleManLoginState extends State<DesktopSaleManLogin> {
  SaleManController controller = Get.put(SaleManController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SaleManController>(builder: (controller) {
      print('screen status ---> ${controller.status.isLoading}');
      if (controller.status.isLoading) {
        return Center(child: CircularProgressIndicator());
      }
      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_outlined,
                  color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text(
              " Staff Login",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          body: SingleChildScrollView(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(100, 120, 50, 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Welcome to Wcart the \nLargest Wholesale Marketplace.",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                // color: ColorResource.color0D5EF8,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "One -Stop Wholesale Business Solution of Imported \nProducts Quality,On time Delivery and Hassle free Servies.",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                // color: ColorResource.color0D5EF8,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                    height: 20,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/face.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffFFEB85),
                                      borderRadius: BorderRadius.circular(5)),
                                  height: 25,
                                  child: const Center(
                                    child: Text(
                                      " 20k + Buyers Joined with us , Now It's Your Turn ",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xfff525252)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                                height: 300,
                                width: 500,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/login.png'),
                                    fit: BoxFit.fill,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // staffLogin(
                  //   controller,
                  //   context,
                  //   formKey,
                  //   () {},
                  // ),
                ],
              )
            ],
          )));
    });
  }
}
