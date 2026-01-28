import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/forget_pass/controller/forget_pass_controller.dart';
import 'package:wcart_vendor/features/presentation/screens/forget_pass/forget_pass.dart';
import 'package:wcart_vendor/features/presentation/screens/salemanlogin/salemanContoller.dart';
import 'package:wcart_vendor/features/presentation/screens/login/controller/logincontroller.dart';
import 'screens/signup/controller/singup_step1controller.dart';
import 'screens/login_screen.dart';
import 'screens/signup/signup_screen.dart';
import 'screens/staff_login_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SignUpController signUpController = Get.put(SignUpController());
  ForgetPassController forgetPassController = Get.put(ForgetPassController());

  final formKey = GlobalKey<FormState>();
  LoginController controller = Get.put(LoginController());
  SaleManController saleManController = Get.put(SaleManController());
  bool isSwapped = false; // Controls the animation
  LoginScreenType screenType = LoginScreenType.login;

  void toggleLayers() {
    setState(() {
      isSwapped = !isSwapped; // Toggle positions
    });
  }

  void navigateScreen(
    LoginScreenType screen,
    bool withToggle,
  ) {
    setState(() {
      screenType = screen;
      if (withToggle) {
        toggleLayers();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          UserDeviceType deviceType = getDeviceType(constraints.maxWidth);
          return Row(
            children: [
              (deviceType == UserDeviceType.mobile ||
                      deviceType == UserDeviceType.smallTablet)
                  ? SizedBox()
                  : Expanded(
                      child: AnimatedSlide(
                        duration: Duration(milliseconds: 500),
                        offset: isSwapped ? Offset(1, 0) : Offset(0, 0),
                        child: LayerOne(
                          deviceType: deviceType,
                        ),
                      ),
                    ),
              Expanded(
                child: AnimatedSlide(
                  duration: Duration(milliseconds: 500),
                  offset: isSwapped &&
                          !(deviceType == UserDeviceType.mobile ||
                              deviceType == UserDeviceType.smallTablet)
                      ? Offset(-1, 0)
                      : Offset(0, 0),
                  child: screenType == LoginScreenType.login
                      ? LayerTwo(
                          formKey: formKey,
                          controller: controller,
                          deviceType: deviceType,
                          onTap: (screenType1) {
                            if (deviceType == UserDeviceType.mobile ||
                                deviceType == UserDeviceType.smallTablet) {
                              navigateScreen(screenType1, false);
                            } else {
                              navigateScreen(screenType1, true);
                            }
                          },
                        )
                      : screenType == LoginScreenType.signUp
                          ? signUpScreen(signUpController, context, formKey,
                              () {
                              if (deviceType == UserDeviceType.mobile ||
                                  deviceType == UserDeviceType.smallTablet) {
                                navigateScreen(LoginScreenType.login, false);
                              } else {
                                navigateScreen(LoginScreenType.login, true);
                              }
                            })
                          : screenType == LoginScreenType.forgetPassword
                              ? ForgetPass(
                                  formKey: formKey,
                                  controller: forgetPassController,
                                  deviceType: deviceType,
                                  onTap: (type) {
                                    if (deviceType == UserDeviceType.mobile ||
                                        deviceType ==
                                            UserDeviceType.smallTablet) {
                                      navigateScreen(type, false);
                                    } else {
                                      navigateScreen(type, true);
                                    }
                                  })
                              : staffLogin(
                                  saleManController,
                                  context,
                                  formKey,
                                  () {
                                    if (deviceType == UserDeviceType.mobile ||
                                        deviceType ==
                                            UserDeviceType.smallTablet) {
                                      navigateScreen(
                                          LoginScreenType.login, false);
                                    } else {
                                      navigateScreen(
                                          LoginScreenType.login, true);
                                    }
                                  },
                                  deviceType,
                                ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

Padding continueOrWidget(BuildContext context, UserDeviceType deviceType) {
  final paddingValue = MediaQuery.of(context).size.width * 0.05;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: paddingValue),
    child: Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey.shade400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Or",
            style: TextStyle(
              color: Color(0xFF8A8B8B),
              fontSize: getContentDeviceSize(deviceType, 16),
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey.shade400,
          ),
        ),
      ],
    ),
  );
}

class LayerOne extends StatelessWidget {
  const LayerOne({
    super.key,
    required this.deviceType,
  });
  final UserDeviceType deviceType;

  @override
  Widget build(BuildContext context) {
    final double sizedBoxHeight = getContentDeviceSize(deviceType, 30);
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          getContentPadding(deviceType, 100),
          getContentPadding(deviceType, 80),
          getContentPadding(deviceType, 50),
          getContentPadding(
            deviceType,
            10,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to Wcart the \nLargest Wholesale Marketplace.",
              style: TextStyle(
                fontSize: getContentDeviceSize(deviceType, 24),
                fontWeight: FontWeight.w700,
                // color: ColorResource.color0D5EF8,
              ),
            ),
            SizedBox(
              height: sizedBoxHeight,
            ),
            Text(
              "One -Stop Wholesale Business Solution of Imported \nProducts Quality,On time Delivery and Hassle free Servies.",
              style: TextStyle(
                fontSize: getContentDeviceSize(deviceType, 16),
                fontWeight: FontWeight.w500,
                // color: ColorResource.color0D5EF8,
              ),
            ),
            SizedBox(
              height: sizedBoxHeight,
            ),
            Row(
              children: [
                Container(
                    height: getContentDeviceSize(deviceType, 20),
                    width: getContentDeviceSize(deviceType, 50),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/face.png'),
                        fit: BoxFit.fill,
                      ),
                    )),
                SizedBox(
                  width: getContentDeviceSize(deviceType, 10),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffFFEB85),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: getContentDeviceSize(deviceType, 25),
                  child: Center(
                    child: Text(
                      " 20k + Buyers Joined with us , Now It's Your Turn ",
                      style: TextStyle(
                        fontSize: getContentDeviceSize(deviceType, 14),
                        fontWeight: FontWeight.w500,
                        color: Color(0xfff525252),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: sizedBoxHeight,
            ),
            Container(
              height: deviceType == UserDeviceType.smallTablet ? 150 : 300,
              width: deviceType == UserDeviceType.smallTablet ? 250 : 500,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/login.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

getContentDeviceSize(UserDeviceType deviceType, double value) {
  switch (deviceType) {
    case UserDeviceType.mobile:
      return value / 1.4;
    case UserDeviceType.smallTablet:
      return value / 1;
    case UserDeviceType.largeTablet:
      return value / 1.2;
    case UserDeviceType.desktop:
      return value;
  }
}

//get content padding
double getContentPadding(UserDeviceType deviceType, double value) {
  switch (deviceType) {
    case UserDeviceType.mobile:
      return value / 2;
    case UserDeviceType.smallTablet:
      return value / 3;
    case UserDeviceType.largeTablet:
      return value / 4;
    case UserDeviceType.desktop:
      return value;
  }
}

//enum
enum UserDeviceType {
  mobile,
  smallTablet, // 7-inch tablets
  largeTablet, // 10-inch tablets
  desktop,
}

enum LoginScreenType {
  login,
  signUp,
  staffLogin,
  forgetPassword,
}

UserDeviceType getDeviceType(double width) {
  if (width >= 1200) {
    return UserDeviceType.desktop;
  } else if (width >= 840) {
    return UserDeviceType.largeTablet;
  } else if (width >= 600) {
    return UserDeviceType.smallTablet;
  } else {
    return UserDeviceType.mobile;
  }
}
