// import 'dart:math' as math show pi;
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:wcart_vendor/router.dart';
// import 'package:wcart_vendor/features/presentation/screens/addproductpage.dart';
// import 'package:wcart_vendor/features/presentation/screens/homepage.dart';
// import 'package:wcart_vendor/features/presentation/screens/itemspage/items_screen.dart';
// import 'package:wcart_vendor/features/presentation/screens/manage_client/client_listpage.dart';
// import 'package:wcart_vendor/features/presentation/screens/manage_client/tax_listpage.dart';
// import 'package:wcart_vendor/features/presentation/screens/manage_customer/view_customer.dart';
// import 'package:wcart_vendor/features/presentation/screens/manage_attribute/manageattribute_page.dart';
// import 'package:wcart_vendor/features/presentation/screens/manage_brand/brandpage.dart';
// import 'package:wcart_vendor/features/presentation/screens/manage_categories/list_categoriespage.dart';
// import 'package:wcart_vendor/features/presentation/screens/manage_quotation/add_quotation.dart';
// import 'package:wcart_vendor/features/presentation/screens/manage_quotation/quotation_page.dart';
// import 'package:wcart_vendor/features/presentation/screens/manage_roles/listofpermissionpage.dart';
// import 'package:wcart_vendor/features/presentation/screens/manage_roles/viewmanagerolepage.dart';
// import 'package:wcart_vendor/features/presentation/screens/manage_simpleproduct/viewproduct_page.dart';
// import 'package:wcart_vendor/features/presentation/screens/manage_staff/liststaffpage.dart';
// import 'package:wcart_vendor/features/presentation/screens/manage_tags/list_tagspage.dart';
// import 'package:wcart_vendor/features/presentation/screens/manage_warehouse/listwarehouse_page.dart';
// import 'package:wcart_vendor/features/presentation/screens/order/storereportpage.dart';
// // import 'package:wcart_vendor/screens/order/storereportpage.dart';
// import 'package:wcart_vendor/features/presentation/screens/order/vendor_reportpage.dart';
// import 'package:wcart_vendor/features/presentation/screens/order/vieworderpage.dart';
// import 'package:wcart_vendor/features/presentation/screens/pos/multistore_inventory.dart';
// import 'package:wcart_vendor/features/presentation/screens/pos_method/add_pos/desktopaddpos.dart';
// import 'package:wcart_vendor/features/presentation/screens/pos_method/pos_reportmanagement/customer_reward.dart';
// import 'package:wcart_vendor/features/presentation/screens/pos_method/pos_reportmanagement/lowstockproduct.dart';
// import 'package:wcart_vendor/features/presentation/screens/pos_method/pos_reportmanagement/ordercountsalepage.dart';
// import 'package:wcart_vendor/features/presentation/screens/pos_method/pos_reportmanagement/profitandloss_report.dart';

// import 'package:wcart_vendor/features/presentation/screens/pos_method/pos_reportmanagement/staffbasedreport.dart';
// import 'package:wcart_vendor/features/presentation/screens/pos_method/pos_reportmanagement/viewpos_report/desktopview_posreport.dart';
// // import 'package:wcart_vendor/screens/pos_method/pos_reportmanagement/viewpos_report/desktopview_posreport.dart';
// import 'package:wcart_vendor/features/presentation/screens/profile/editprofile_page.dart';
// import 'package:wcart_vendor/features/presentation/screens/profile/paidpayoutspage.dart';
// import 'package:wcart_vendor/features/presentation/screens/profile/processingpayouts_page.dart';
// import 'package:wcart_vendor/features/presentation/screens/profile/vendorearning_page.dart';
// import 'package:wcart_vendor/features/presentation/screens/profile/viewprofile_page.dart';
// import 'package:wcart_vendor/features/presentation/screens/store_productlist/liststore_productlist.dart';
// import 'package:wcart_vendor/features/presentation/screens/store_setting/storelocationpage.dart';
// import 'package:wcart_vendor/features/presentation/screens/store_setting/viewstorelocationpage.dart';
// import 'package:wcart_vendor/features/presentation/screens/vendor_report/low_stock_product.dart';
// import 'package:wcart_vendor/features/presentation/screens/vendor_report/out_of_stock_page.dart';
// import 'package:wcart_vendor/features/presentation/screens/vendor_report/sales_by_category.dart';
// import 'package:wcart_vendor/features/presentation/screens/vendor_report/sales_by_date.dart';
// import 'package:wcart_vendor/features/presentation/screens/vendor_report/sales_by_product_page.dart';
// import 'package:wcart_vendor/features/presentation/screens/vendor_report/vendor_overview_page.dart';
// import 'package:wcart_vendor/features/presentation/screens/warehouse_productlist/listwarehouseproduct.dart';
// import 'package:wcart_vendor/util/color_resource.dart';
// import 'package:wcart_vendor/util/constants.dart';
// import 'package:wcart_vendor/util/preference_helper.dart';
// import 'package:wcart_vendor/features/presentation/widgets/collapsible_sidebar.dart';
// import 'package:wcart_vendor/features/presentation/widgets/collapsible_sidebar/collapsible_item.dart';

// class SidebarPage extends StatefulWidget {
//   static const routeName = '/desktop_sidehome';

//   @override
//   _SidebarPageState createState() => _SidebarPageState();
// }

// class _SidebarPageState extends State<SidebarPage> {
//   Widget showSelectedScreen = HomePage();

//   AssetImage _avatarImg = const AssetImage('assets/images/logo.png');
//   List<CollapsibleItem> _items = [];

//   @override
//   void initState() {
//     super.initState();
//     usertype();
//     _items = _generateItems;
//   }

//   usertype() async {
//     var userType = await PreferenceHelper.getStringValue(Constants.userType);

//     if (userType != null && userType == Constants.staffLogin) {
//       setState(() {
//         _items = _generateItemsStaff;
//       });
//     } else {
//       setState(() {
//         _items = _generateItems;
//       });
//     }
//   }

//   Widget body(Size size, BuildContext context) {
//     return SizedBox(
//       height: double.infinity,
//       width: double.infinity,
//       // color: Colors.blueGrey[50],
//       child: Center(
//         child: Transform.rotate(
//           angle: math.pi / 2,
//           child: Transform.translate(
//             offset: Offset(-size.height * 0.3, -size.width * 0.23),
//           ),
//         ),
//       ),
//     );
//   }

//   List<CollapsibleItem> get _generateItems {
//     return [
//       CollapsibleItem(
//         text: Constants.home,
//         icon: 'assets/icon/svg/dashboard 17.svg',
//         onPressed: () {
//           setState(() {
//             showSelectedScreen = HomePage();
//           });
//         },
//         isSelected: true,
//       ),

//       CollapsibleItem(
//           text: Constants.ManageProduct,
//           icon: 'assets/icon/svg/Products 17.svg',
//           onPressed: () {
//             // setState(() {
//             //   showSelectedScreen = desktopviewcategory();
//             // });
//           },
//           expandedList: [
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/invertery.svg',
//                 expandedListString: "All Product",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const ViewAllProductPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/invertery.svg',
//                 expandedListString: "Add Product",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const AddProductPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Manage Tags",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const ListTagsPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Manage Brand ",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const ListBrandPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/list.svg',
//                 expandedListString: "Manage Categories",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const ListCategoriesPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Manage Attributes",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const ViewAttributePage();
//                   });
//                 }),
//           ]),

//       CollapsibleItem(
//         text: Constants.order,
//         icon: 'assets/icon/svg/orders 17.svg',
//         onPressed: () {
//           setState(() {
//             showSelectedScreen = const ViewOrderPage();
//           });
//         },
//       ),
//       CollapsibleItem(
//           text: Constants.inventoryManagement,
//           icon: 'assets/icon/svg/inventory 17.svg',
//           onPressed: () {
//             // setState(() {
//             //   showSelectedScreen = desktopviewcategory();
//             // });
//           },
//           expandedList: [
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Warehouse",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const ListWarehousePage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Warehouse Product List ",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const ListWarehouseProductListPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Store Setting",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const StoreLocationPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Store Location",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const ViewStoreLocationPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Store Product List",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const ListStoreProductListPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Multi Store Inventory",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const MultiStoreInventoryPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Quotation",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const QuotationPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Create Quotation",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const AddQuotationPage();
//                   });
//                 }),
//           ]),
//       CollapsibleItem(
//           text: Constants.report,
//           icon: 'assets/icon/svg/Advertiser 17.svg',
//           onPressed: () {
//             // setState(() {
//             //   showSelectedScreen = desktopviewcategory();
//             // });
//           },
//           expandedList: [
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/invertery.svg',
//                 expandedListString: "Overview",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const VendorOverviewReportPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Sales by Date",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const SalesByDatePage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Product View Count",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const StoreReportPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Sales by Product",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const VendorSalesByProductPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Sales by Category",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const SalesByCategoryPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Low Stock Report",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const LowStockVendorProductPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Out of Stock Report",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const OutOfStockProductPage();
//                   });
//                 }),
//           ]),

//       // CollapsibleItem(
//       //     text: Constants.pos,
//       //     icon: 'assets/icon/svg/Advertiser 17.svg',
//       //     onPressed: () {
//       //       // setState(() {
//       //       //   showSelectedScreen = desktopviewcategory();
//       //       // });
//       //     },
//       //     expandedList: [
//       //       ExpansionListValues(
//       //           icon: 'assets/icon/svg/camer.svg',
//       //           expandedListString: "Create Order",
//       //           onPressed: () {
//       //             setState(() {
//       //               showSelectedScreen = const DesktopAddPos();
//       //             });
//       //           }),
//       //       // ExpansionListValues(
//       //       //     icon: 'assets/icon/svg/camer.svg',
//       //       //     expandedListString: "View Order",
//       //       //     onPressed: () {
//       //       //       setState(() {
//       //       //         showSelectedScreen = const WarehouseReportPage();
//       //       //       });
//       //       //     }),
//       //       ExpansionListValues(
//       //           icon: 'assets/icon/svg/camer.svg',
//       //           expandedListString: "View Customer",
//       //           onPressed: () {
//       //             setState(() {
//       //               showSelectedScreen = const ViewCustomerPage();
//       //             });
//       //           }),
//       //     ]),

//       // CollapsibleItem(
//       //     text: Constants.rolesAndPermission,
//       //     icon: Icons.group,
//       //     onPressed: () {
//       //       // setState(() {
//       //       //   showSelectedScreen = desktopviewcategory();
//       //       // });
//       //     },
//       //     expandedList: [
//       //       ExpansionListValues(
//       //           icon: Icons.group,
//       //           expandedListString: "Manage Staffs",
//       //           onPressed: () {
//       //             setState(() {
//       //               showSelectedScreen = DesktopViewTags();
//       //             });
//       //           }),
//       //       ExpansionListValues(
//       //           icon: Icons.group,
//       //           expandedListString: "Manage Roles",
//       //           onPressed: () {
//       //             setState(() {
//       //               showSelectedScreen = DesktopViewBrand();
//       //             });
//       //           }),
//       //       ExpansionListValues(
//       //           icon: Icons.group,
//       //           expandedListString: "View List of Permission",
//       //           onPressed: () {
//       //             setState(() {
//       //               showSelectedScreen = desktopviewcategory();
//       //             });
//       //           }),
//       //     ]),

//       // CollapsibleItem(
//       //   text: Constants.items,
//       //   icon: Icons.list,
//       //   onPressed: () {
//       //     setState(() {
//       //       showSelectedScreen = desktopviewproduct();
//       //     });
//       //   },
//       // ),
//       // CollapsibleItem(
//       //   text: Constants.businessbashboard,
//       //   icon: Icons.dashboard,
//       //   onPressed: () {
//       //     setState(() {
//       //       showSelectedScreen = Desktopviewbrand();
//       //     });
//       //   },
//       // ),
//       // CollapsibleItem(
//       //   text: Constants.reports,
//       //   icon: Icons.report,
//       //   onPressed: () {
//       //     setState(() {
//       //       showSelectedScreen = DesktopViewtags();
//       //     });
//       //   },
//       // ),
//       // CollapsibleItem(
//       //   text: Constants.sales,
//       //   icon: Icons.scale_sharp,
//       //   onPressed: () {
//       //     setState(() {
//       //       showSelectedScreen = Desktopvieworder();
//       //     });
//       //   },
//       // ),
//       // CollapsibleItem(
//       //   text: Constants.Managewarehouse,
//       //   icon: Icons.poll_rounded,
//       //   onPressed: () {
//       //     setState(() {
//       //       showSelectedScreen = Desktopviewwarehouse();
//       //     });
//       //   },
//       // ),
//       // CollapsibleItem(
//       //   text: Constants.inventory,
//       //   icon: Icons.shopping_cart,
//       //   onPressed: () {
//       //     setState(() {
//       //       showSelectedScreen = Desktopproductinventory();
//       //     });
//       //   },
//       // ),
//       // CollapsibleItem(
//       //   text: Constants.storebasedlist,
//       //   icon: Icons.shopping_cart,
//       //   onPressed: () {
//       //     setState(() {
//       //       showSelectedScreen = Desktopviewstorebasedlist();
//       //     });
//       //   },
//       // ),
//       // CollapsibleItem(
//       //   text: Constants.expenses,
//       //   icon: Icons.account_balance_wallet,
//       //   onPressed: () {},
//       // ),
//       // CollapsibleItem(
//       //   text: Constants.cashbank,
//       //   icon: Icons.account_balance,
//       //   onPressed: () {
//       //     setState(() {
//       //       showSelectedScreen = Desktoppos_salesdetails();
//       //     });
//       //   },
//       // ),
//       // CollapsibleItem(
//       //   text: Constants.myonlinestore,
//       //   icon: Icons.storefront,
//       //   onPressed: () {
//       //     setState(() {
//       //       showSelectedScreen = Desktopsalesignup();
//       //     });
//       //   },
//       // ),
//       // CollapsibleItem(
//       //   text: Constants.settings,
//       //   icon: Icons.settings,
//       //   onPressed: () {
//       //     setState(() {
//       //       showSelectedScreen = Desktopviewprofile();
//       //     });
//       //   },
//       // ),
//       // CollapsibleItem(
//       //   text: Constants.pos,
//       //   icon: Icons.business_sharp,
//       //   onPressed: () {
//       //     setState(() {
//       //       showSelectedScreen = Desktopaddpos();
//       //     });
//       //   },
//       // ),

//       // CollapsibleItem(
//       //   text: Constants.posreport,
//       //   icon: Icons.business_sharp,
//       //   onPressed: () {
//       //     setState(() {
//       //       showSelectedScreen = Desktopviewposreport();
//       //     });
//       //   },
//       // ),
//       // CollapsibleItem(
//       //   text: Constants.POSaddress,
//       //   icon: Icons.business_sharp,
//       //   onPressed: () {
//       //     setState(() {
//       //       showSelectedScreen = Desktopviewposaddress();
//       //     });
//       //   },
//       // ),
//       // CollapsibleItem(
//       //   text: Constants.posstore,
//       //   icon: Icons.store_mall_directory,
//       //   onPressed: () {
//       //     setState(() {
//       //       showSelectedScreen = Desktop_viewstoredetails();
//       //     });
//       //   },
//       // ),
//       // CollapsibleItem(
//       //   text: Constants.Managecustomer,
//       //   icon: Icons.dashboard_customize,
//       //   onPressed: () {
//       //     setState(() {
//       //       showSelectedScreen = Desktopviewcustomer();
//       //     });
//       //   },
//       // ),
//       CollapsibleItem(
//           text: Constants.RoleAndPermission,
//           icon: 'assets/icon/svg/permission 17.svg',
//           onPressed: () {
//             // setState(() {
//             //   showSelectedScreen = desktopviewcategory();
//             // });
//           },
//           expandedList: [
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: 'Manage Staff',
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const ListStaffPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: 'Manage Roles',
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const ViewRolesPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: 'Manage Permissions',
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const ListOfPermissionPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: 'Manage Client',
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const ClientPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: 'Manage Taxes',
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const TaxesListPage();
//                   });
//                 }),
//           ]),

//       CollapsibleItem(
//           text: Constants.profile,
//           icon: 'assets/icon/svg/chat history 17.svg',
//           onPressed: () {
//             // setState(() {
//             //   showSelectedScreen = desktopviewcategory();
//             // });
//           },
//           expandedList: [
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "View Profile",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const ViewProfilePage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Edit Profile",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const EditProfilePage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Vendor Earnings",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const VendorEarningsPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Processing Payouts",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const ProcessingPayOutsPage();
//                   });
//                 }),
//             ExpansionListValues(
//               icon: 'assets/icon/svg/camer.svg',
//               expandedListString: "Paid Payouts",
//               onPressed: () {
//                 setState(
//                   () {
//                     showSelectedScreen = const PaidPayoutsPage();
//                   },
//                 );
//               },
//             ),
//           ]),
//       CollapsibleItem(
//         text: Constants.signOut,
//         icon: 'assets/icon/svg/logout.svg',
//         onPressed: () async {
//           SharedPreferences preferences = await SharedPreferences.getInstance();
//           await preferences.clear();
//           Get.offNamedUntil(Routes.login, (route) => false);
//         },
//       ),
//     ];
//   }

//   List<CollapsibleItem> get _generateItemsStaff {
//     return [
//       CollapsibleItem(
//         text: Constants.home,
//         icon: 'assets/icon/svg/dashboard 17.svg',
//         onPressed: () {
//           setState(() {
//             showSelectedScreen = DesktopAddPos();
//           });
//         },
//         isSelected: true,
//       ),
//       // CollapsibleItem(
//       //   text: Constants.inventory,
//       //   icon: 'assets/icon/svg/Products 17.svg',
//       //   onPressed: () {
//       //     setState(() {
//       //       showSelectedScreen = HomePage();
//       //     });
//       //   },
//       // ),
//       CollapsibleItem(
//           text: Constants.pos,
//           icon: 'assets/icon/svg/orders 17.svg',
//           onPressed: () {
//             // setState(() {
//             //   showSelectedScreen = desktopviewcategory();
//             // });
//           },
//           expandedList: [
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/invertery.svg',
//                 expandedListString: "Create Order",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const DesktopAddPos();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "View Order",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const StaffBasedReportPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "View Customer",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const ViewCustomerPage();
//                   });
//                 }),
//           ]),
//       CollapsibleItem(
//           text: Constants.posReport,
//           icon: 'assets/icon/svg/Advertiser 17.svg',
//           onPressed: () {
//             // setState(() {
//             //   showSelectedScreen = desktopviewcategory();
//             // });
//           },
//           expandedList: [
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/invertery.svg',
//                 expandedListString: "Overview",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const DesktopViewPosReport();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Sales by Date",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const OrderCountTotalPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Store Order",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const StoreReportPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Staff Order",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const StaffBasedReportPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Product Stock",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const LowStockProductPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Profit Report",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const ProfitAndLossPage();
//                   });
//                 }),
//             ExpansionListValues(
//                 icon: 'assets/icon/svg/camer.svg',
//                 expandedListString: "Reward Points",
//                 onPressed: () {
//                   setState(() {
//                     showSelectedScreen = const CustomerRewardPage();
//                   });
//                 }),
//           ]),

//       // CollapsibleItem(
//       //   text: Constants.posReport,
//       //   icon: 'assets/icon/svg/Advertiser 17.svg',
//       //   onPressed: () {
//       //     setState(() {
//       //       showSelectedScreen = const DesktopViewPosReport();
//       //     });
//       //   },
//       // ),
//       CollapsibleItem(
//           text: Constants.signOut,
//           icon: 'assets/icon/svg/logout.svg',
//           onPressed: () {
//             setState(
//               () async {
//                 SharedPreferences preferences =
//                     await SharedPreferences.getInstance();
//                 await preferences.clear();
//                 Get.offNamedUntil(Routes.login, (route) => false);
//               },
//             );
//           })
//     ];
//   }

//   // Widget navigateToRespectiveScreen(String value) {
//   //   switch (value) {
//   //     case Constants.home:
//   //       return Homepagedesktop();

//   //     default:
//   //       return const SizedBox();
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // var size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: CollapsibleSidebar(
//         isCollapsed: false,
//         items: _items,
//         avatarImg: _avatarImg,
//         title: 'Wcart Vendor',
//         showTitle: true,
//         iconSize: 20,
//         screenPadding: 0,
//         borderRadius: 0,
//         sidebarBoxShadow: const [
//           BoxShadow(
//             // color: Colors.grey,
//             // blurRadius: .1,
//             spreadRadius: 0.01,
//             // offset: Offset(2, 2),
//           ),
//         ],
//         onTitleTap: () {
//           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//               content: Text('Yay! Flutter Collapsible Sidebar!')));
//         },
//         body: Container(
//           margin: const EdgeInsets.all(1),
//           color: ColorResource.colorffffff,
//           child: showSelectedScreen,
//         ),
//         // _body(size, context),
//         backgroundColor: Colors.white,
//         // selectedTextColor: Colors.limeAccent,
//         textStyle: const TextStyle(fontSize: 15),
//         titleStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         toggleTitleStyle:
//             const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }
