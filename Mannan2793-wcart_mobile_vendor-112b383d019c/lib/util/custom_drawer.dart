import 'package:flutter/material.dart';
import 'package:wcart_vendor/util/color_resource.dart';

import 'package:wcart_vendor/util/font_size.dart';

import 'custom_text.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: [
      Container(
        height: 60,
        width: double.infinity,
        margin: EdgeInsets.only(top: 15, right: 35, left: 25, bottom: 15),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: ColorResource.colorF3F4F8),
        child: Row(
          children: [
            Container(
              height: 50,
              padding: EdgeInsets.all(10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 158, 185, 231),
              ),
              child: const Icon(
                Icons.card_giftcard,
                size: 20,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Bala',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Text(
                  'Welcome to WCart',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            )
          ],
        ),
      ),
      ListTile(
        leading: Icon(Icons.home),
        title: CustomText(
          'Home',
          fontSize: FontSize.sixteen,
        ),
        //  Text(
        //   "All parties",
        //   style: TextStyle(fontSize: 16),
        // ),
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => HomePageDesktop()),
          // );
        },
      ),
      ListTile(
        leading: Icon(Icons.group),
        title: CustomText(
          'All parties',
          fontSize: FontSize.sixteen,
        ),
        //  Text(
        //   "All parties",
        //   style: TextStyle(fontSize: 16),
        // ),
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Creditpage()),
          // );
        },
      ),

      ExpansionTile(
          leading: Icon(Icons.settings),
          title: const Text(
            "Items",
            style: TextStyle(fontSize: 16),
          ),
          children: [
            Column(children: [
              ListTile(
                leading: const Icon(
                  Icons.person,
                ),
                title: const Text(
                  "Business Dashboards",
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => SplachScreen()),
                  // );
                },
              ),
            ]),
          ]),

      // ExpansionTile(
      //   leading: Icon(Icons.list),
      //   title: Text(
      //     "Items",
      //     style: TextStyle(fontSize: 16),
      //   ),
      //   children: [
      //     // Column(
      //     //   children: [
      //     //     ListTile(
      //     //       title: Text(
      //     //         "Stock Items",
      //     //         style: TextStyle(fontSize: 16),
      //     //       ),
      //     //       onTap: () {
      //     //         Get.toNamed(DesktopViewProduct.routeName);
      //     //       },
      //     //     ),
      //     //     ExpansionTile(
      //     //         title: Text(
      //     //           "Manage",
      //     //           style: TextStyle(fontSize: 16),
      //     //         ),
      //     //         children: [
      //     //           ListTile(
      //     //             title: Text("Manage Category",
      //     //                 style: TextStyle(fontSize: 16)),
      //     //             onTap: () {
      //     //               Get.toNamed(desktopviewcategory.routeName);
      //     //             },
      //     //           ),
      //     //           ListTile(
      //     //             title:
      //     //                 Text("Manage Tags", style: TextStyle(fontSize: 16)),
      //     //             onTap: () {
      //     //               Get.toNamed(DesktopViewTags.routeName);
      //     //             },
      //     //           ),
      //     //           ListTile(
      //     //             title:
      //     //                 Text("Manage Brands", style: TextStyle(fontSize: 16)),
      //     //             onTap: () {
      //     //               Navigator.push(
      //     //                 context,
      //     //                 MaterialPageRoute(
      //     //                     builder: (context) => DesktopViewBrand()),
      //     //               );
      //     //             },
      //     //           ),
      //     //           ListTile(
      //     //             title: Text("Manage Attributes",
      //     //                 style: TextStyle(fontSize: 16)),
      //     //             onTap: () {
      //     //               Get.toNamed(Desktopviewattribute.routeName);
      //     //             },
      //     //           ),
      //     //         ])
      //     //   ],
      //     // )
      //   ],
      // ),

      ListTile(
        leading: Icon(Icons.dashboard, size: 16),
        title: Text(
          "Business ",
          style: TextStyle(fontSize: 16),
        ),
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => BusinessDashboard()),
          // );
        },
      ),
      ListTile(
        leading: const Icon(Icons.report, size: 18),
        title: Text(
          "Reports",
          style: TextStyle(fontSize: 16),
        ),
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => salesDesktop()),
          // );
        },
      ),
      ListTile(
        leading: const Icon(Icons.scale_sharp, size: 16),
        title: const Text(
          "Sales",
          style: TextStyle(fontSize: 16),
        ),
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => serviceDesktop()),
          // );
        },
      ),
      ListTile(
        leading: Icon(Icons.poll_rounded, size: 16),
        title: const Text(
          "Other Product",
          style: TextStyle(fontSize: 16),
        ),
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => serviceDesktop()),
          // );
        },
      ),
      ListTile(
        leading: Icon(Icons.shopping_cart),
        title: const Text(
          "Inventory",
          style: TextStyle(fontSize: 16),
        ),
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => serviceDesktop()),
          // );
        },
      ),
      ListTile(
        leading: const Icon(Icons.account_balance_wallet),
        title: const Text(
          "Expenses",
          style: TextStyle(fontSize: 16),
        ),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.account_balance),
        title: const Text(
          "Cash & Bank",
          style: TextStyle(fontSize: 16),
        ),
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => serviceDesktop()),
          // );
        },
      ),
      ListTile(
        leading: Icon(Icons.storefront),
        title: const Text(
          "My Online Store",
          style: TextStyle(fontSize: 16),
        ),
        onTap: () {},
      ),
      ExpansionTile(
          leading: const Icon(Icons.settings),
          title: const Text(
            "Settings",
            style: TextStyle(fontSize: 16),
          ),
          children: [
            Column(children: [
              ListTile(
                leading: const Icon(
                  Icons.person,
                ),
                title: const Text(
                  "View Profile",
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => SplachScreen()),
                  // );
                },
              ),
            ]),
          ]),

      ListTile(
        leading: const Icon(Icons.settings_backup_restore),
        title: const Text(
          "Backup/Restore",
          style: TextStyle(fontSize: 16),
        ),
        onTap: () {},
      ),
      // Divider(
      //   color: Colors.grey[350],
      //   thickness: 1,
      // ),
      // ListTile(
      //   // leading: FaIcon(FontAwesomeIcons.whatsapp),
      //   title: Text(
      //     "WhatsApp Greetings",
      //     style: TextStyle(fontSize: 16),
      //   ),
      //   onTap: () {},
      // ),
      // ListTile(
      //   // leading: FaIcon(FontAwesomeIcons.gift),
      //   title: Text(
      //     "Refer & Earn",
      //     style: TextStyle(fontSize: 16),
      //   ),
      //   onTap: () {},
      // ),
      // ListTile(
      //   // leading: FaIcon(FontAwesomeIcons.toolbox),
      //   title: Text(
      //     "Utilities",
      //     style: TextStyle(fontSize: 16),
      //   ),
      //   onTap: () {},
      // ),
      ListTile(
        leading: const Icon(Icons.support_agent_outlined, size: 20),
        title: const Text(
          "Help & Support",
          style: TextStyle(fontSize: 16),
        ),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.video_collection_sharp, size: 20),
        title: const Text(
          "Request A Demo",
          style: TextStyle(fontSize: 16),
        ),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.logout, size: 20),
        title: const Text(
          "Share Feedback",
          style: TextStyle(fontSize: 16),
        ),
        onTap: () async {
          //  _logOutFB();

          // Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(builder: (context) => SplachScreen()),
          //     (route) => false);
        },
      ),
    ]))));
    // Drawer(
    //   backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    //   elevation: 0,
    //   child: Column(
    //     children: [
    //       Container(
    //         height: 60,
    //         width: double.infinity,
    //         margin: EdgeInsets.only(top: 15, right: 35, left: 28),
    //         padding: EdgeInsets.all(8),
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(18),
    //           color: const Color.fromARGB(255, 209, 222, 245),
    //         ),
    //         child: Row(
    //           children: [
    //             Container(
    //               height: 50,
    //               padding: EdgeInsets.all(10),
    //               decoration: const BoxDecoration(
    //                 shape: BoxShape.circle,
    //                 color: Color.fromARGB(255, 158, 185, 231),
    //               ),
    //               child: const Icon(
    //                 Icons.card_giftcard,
    //                 size: 20,
    //                 color: Colors.blue,
    //               ),
    //             ),
    //             const SizedBox(
    //               width: 10,
    //             ),
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: const [
    //                 Text(
    //                   'Jack',
    //                   style:
    //                       TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
    //                 ),
    //                 Text(
    //                   'Welcome to WCart',
    //                   style: TextStyle(fontSize: 12),
    //                 ),
    //               ],
    //             )
    //           ],
    //         ),
    //       ),
    //       const SizedBox(
    //         height: 25,
    //       ),
    //       Expanded(
    //           child: ListView.builder(
    //               itemCount: 5,
    //               itemBuilder: (context, index) {
    //                 return ListTile(
    //                     tileColor: selectedIndex == index
    //                         ? const Color.fromARGB(255, 211, 221, 238)
    //                         : Colors.transparent,
    //                     leading: const Icon(Icons.home),
    //                     trailing: const Icon(Icons.arrow_forward_ios),
    //                     title: Text(
    //                       'H O M E',
    //                       style: drawerTextColor,
    //                     ),
    //                     onTap: () {
    //                       setState(() {
    //                         selectedIndex = index;
    //                       });
    //                     });
    //               })),
    //     ],
    //   ),
    // );
  }
}
