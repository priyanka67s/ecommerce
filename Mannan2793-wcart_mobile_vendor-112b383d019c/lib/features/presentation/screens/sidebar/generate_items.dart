import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wcart_vendor/features/presentation/screens/add_product/addproductpage.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_brand/brandpage.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/add_pos/add_product/desktopaddpos.dart';
import '../../../../router.dart';
import '../../../../util/constants.dart';
import '../../widgets/collapsible_sidebar/collapsible_item.dart';
import '../home__page/homepage.dart';
import '../manage_attribute/manage_attribute_page.dart';
import '../manage_categories/list_categoriespage.dart';
import '../add_product/screens/manage_simpleproduct/viewproduct/viewproduct_page.dart';
import '../manage_tags/list_tagspage.dart';
import '../manage_warehouse/listwarehouse_page.dart';
import '../order/storereportpage.dart';
import '../order/vieworderpage.dart';
import '../profile/vendorearning_page.dart';
import '../profile/viewprofile_page.dart';
import '../store_productlist/liststore_productlist.dart';
import '../store_setting/viewstorelocationpage.dart';
import '../vendor_report/sales_by_category/sales_by_category.dart';
import '../vendor_report/sale_by_date/sales_by_date.dart';
import '../vendor_report/sales_by_product_page.dart';
import '../warehouse_productlist/listwarehouseproduct.dart';

class GenerateItems {
  static List<CollapsibleItem> getGenerateItems2(
    Function setState,
    Widget Function(Widget) setShowSelectedScreen,
  ) {
    return [
      CollapsibleItem(
        text: Constants.home,
        svgPath: 'assets/icon/svg/dashboard 17.svg',
        onPressed: () {
          setState(() {
            setShowSelectedScreen(HomePage());
          });
        },
        isSelected: true,
      ),

      CollapsibleItem(
        text: Constants.ManageProduct,
        svgPath: 'assets/icon/svg/Products 17.svg',
        onPressed: () {
          // setState(() {
          //   showSelectedScreen = desktopviewcategory();
          // });
        },
        subItems: [
          CollapsibleItem(
            svgPath: 'assets/icon/svg/invertery.svg',
            text: "All Product",
            onPressed: () {
              setState(
                () {
                  setShowSelectedScreen(ViewAllProductPage());
                },
              );
            },
          ),
          CollapsibleItem(
              svgPath: 'assets/icon/svg/invertery.svg',
              text: "Add Product",
              onPressed: () {
                setState(() {
                  setShowSelectedScreen(AddProductPage());
                });
              }),
          CollapsibleItem(
            svgPath: 'assets/icon/svg/camer.svg',
            text: "Manage Tags",
            onPressed: () {
              setState(
                () {
                  setShowSelectedScreen(ListTagsPage());
                },
              );
            },
          ),
          CollapsibleItem(
            svgPath: 'assets/icon/svg/camer.svg',
            text: "Manage Brand ",
            onPressed: () {
              setState(
                () {
                  setShowSelectedScreen(ListBrandPage());
                },
              );
            },
          ),
          CollapsibleItem(
            svgPath: 'assets/icon/svg/list.svg',
            text: "Manage Categories",
            onPressed: () {
              setState(
                () {
                  setShowSelectedScreen(ListCategoriesPage());
                },
              );
            },
          ),
          CollapsibleItem(
            svgPath: 'assets/icon/svg/camer.svg',
            text: "Manage Attributes",
            onPressed: () {
              setState(
                () {
                  setShowSelectedScreen(ViewAttributePage());
                },
              );
            },
          ),
        ],
      ),

      CollapsibleItem(
        text: Constants.order,
        svgPath: 'assets/icon/svg/orders 17.svg',
        onPressed: () {
          setState(() {
            setShowSelectedScreen(ViewOrderPage());
          });
        },
      ),
      //! pos method update later
      CollapsibleItem(
        svgPath: 'assets/icon/svg/pos_icon.svg',
        text: "Create Order",
        onPressed: () {
          setState(
            () {
              setShowSelectedScreen(DesktopAddPos());
            },
          );
        },
      ),
      CollapsibleItem(
        text: Constants.inventoryManagement,
        svgPath: 'assets/icon/svg/inventory 17.svg',
        onPressed: () {
          // setState(() {
          //   showSelectedScreen = desktopviewcategory();
          // });
        },
        subItems: [
          CollapsibleItem(
            svgPath: 'assets/icon/svg/camer.svg',
            text: "Warehouse",
            onPressed: () {
              setState(
                () {
                  setShowSelectedScreen(ListWarehousePage());
                },
              );
            },
          ),
          CollapsibleItem(
            svgPath: 'assets/icon/svg/camer.svg',
            text: "Warehouse Product List ",
            onPressed: () {
              setState(
                () {
                  setShowSelectedScreen(ListWarehouseProductListPage());
                },
              );
            },
          ),
          //   CollapsibleItem(
          //       svgPath: 'assets/icon/svg/camer.svg',
          //       text: "Store Setting",
          //       onPressed: () {
          //         setState(() {
          //           setShowSelectedScreen(StoreLocationPage());
          //       },
          //     );
          //   },
          // ),
          CollapsibleItem(
            svgPath: 'assets/icon/svg/camer.svg',
            text: "Store Location",
            onPressed: () {
              setState(
                () {
                  setShowSelectedScreen(ViewStoreLocationPage());
                },
              );
            },
          ),
          CollapsibleItem(
            svgPath: 'assets/icon/svg/camer.svg',
            text: "Store Product List",
            onPressed: () {
              setState(
                () {
                  setShowSelectedScreen(ListStoreProductListPage());
                },
              );
            },
          ),
          //! (Multi store inventory, create quotation, get quotation) update later
          // CollapsibleItem(
          //     svgPath: 'assets/icon/svg/camer.svg',
          //     text: "Multi Store Inventory",
          //     onPressed: () {
          //       setState(() {
          //         setShowSelectedScreen(MultiStoreInventoryPage());
          //       });
          //     }),
          // CollapsibleItem(
          //     svgPath: 'assets/icon/svg/camer.svg',
          //     text: "Quotation",
          //     onPressed: () {
          //       setState(() {
          //         setShowSelectedScreen(QuotationPage());
          //       });
          //     }),
          // CollapsibleItem(
          //     svgPath: 'assets/icon/svg/camer.svg',
          //     text: "Create Quotation",
          //     onPressed: () {
          //       setState(() {
          //         setShowSelectedScreen(AddQuotationPage());
          //       });
          //     }),
        ],
      ),
      CollapsibleItem(
        text: Constants.report,
        svgPath: 'assets/icon/svg/Advertiser 17.svg',
        onPressed: () {
          // setState(() {
          //   showSelectedScreen = desktopviewcategory();
          // });
        },
        subItems: [
          //! OverView update later
          // CollapsibleItem(
          //     svgPath: 'assets/icon/svg/invertery.svg',
          //     text: "Overview",
          //     onPressed: () {
          //       setState(() {
          //         setShowSelectedScreen(VendorOverviewReportPage());
          //       });
          //     }),
          CollapsibleItem(
            svgPath: 'assets/icon/svg/camer.svg',
            text: "Sales by Date",
            onPressed: () {
              setState(
                () {
                  setShowSelectedScreen(SalesByDatePage());
                },
              );
            },
          ),
          // CollapsibleItem(
          //   svgPath: 'assets/icon/svg/camer.svg',
          //   text: "Product View Count",
          //   onPressed: () {
          //     setState(
          //       () {
          //         setShowSelectedScreen(StoreReportPage());
          //       },
          //     );
          //   },
          // ),
          //! need to integrate api for sales by product
          // CollapsibleItem(
          //   svgPath: 'assets/icon/svg/camer.svg',
          //   text: "Sales by Product",
          //   onPressed: () {
          //     setState(
          //       () {
          //         setShowSelectedScreen(VendorSalesByProductPage());
          //       },
          //     );
          //   },
          // ),
          CollapsibleItem(
            svgPath: 'assets/icon/svg/camer.svg',
            text: "Sales by Category",
            onPressed: () {
              setState(
                () {
                  setShowSelectedScreen(
                    SalesByCategoryPage(),
                  );
                },
              );
            },
          ),
          //   CollapsibleItem(
          //       svgPath: 'assets/icon/svg/camer.svg',
          //       text: "Low Stock Report",
          //       onPressed: () {
          //         setState(() {
          //           setShowSelectedScreen(LowStockVendorProductPage());
          //       },
          //     );
          //   },
          // ),
          //   CollapsibleItem(
          //       svgPath: 'assets/icon/svg/camer.svg',
          //       text: "Out of Stock Report",
          //       onPressed: () {
          //         setState(() {
          //           setShowSelectedScreen(OutOfStockProductPage());
          //       },
          //     );
          //   },
          // ),
        ],
      ),

      // CollapsibleItem(
      //     text: Constants.pos,
      //     svgPath: 'assets/icon/svg/Advertiser 17.svg',
      //     onPressed: () {},
      //     subItems: [
      //       CollapsibleItem(
      //           svgPath: 'assets/icon/svg/camer.svg',
      //           text: "Create Order",
      //           onPressed: () {
      //             setState(() {
      //               setShowSelectedScreen(DesktopAddPos());
      //             });
      //           }),
      //       CollapsibleItem(
      //           svgPath: 'assets/icon/svg/camer.svg',
      //           text: "View Order",
      //           onPressed: () {
      //             setState(() {
      //               setShowSelectedScreen(WarehouseReportPage());
      //             });
      //           }),
      //       CollapsibleItem(
      //           svgPath: 'assets/icon/svg/camer.svg',
      //           text: "View Customer",
      //           onPressed: () {
      //             setState(() {
      //               setShowSelectedScreen(ViewCustomerPage());
      //             });
      //           }),
      //     ]),
      // CollapsibleItem(
      //     text: Constants.rolesAndPermission,
      //     icon: Icons.group,
      //     onPressed: () {
      //       // setState(() {
      //       //   showSelectedScreen = desktopviewcategory();
      //       // });
      //     },
      //     subItems: [
      //       CollapsibleItem(
      //           svgPath: "assets/icon/svg/camer.svg",
      //           text: "Manage Staffs",
      //           onPressed: () {
      //             setState(() {
      //               // setShowSelectedScreen(DesktopViewTags());
      //           },
      //         );
      //       },
      //     ),
      //       CollapsibleItem(
      //           svgPath: "assets/icon/svg/camer.svg",
      //           text: "Manage Roles",
      //           onPressed: () {
      //             setState(() {
      //               // setShowSelectedScreen(DesktopViewBrand());
      //           },
      //         );
      //       },
      //     ),
      //       CollapsibleItem(
      //           svgPath: "assets/icon/svg/camer.svg",
      //           text: "View List of Permission",
      //           onPressed: () {
      //             setState(() {
      //               //  desktopviewcategory();
      //           },
      //         );
      //       },
      //     ),
      //   ],
      // ),

      // CollapsibleItem(
      //   text: Constants.items,
      //   icon: Icons.list,
      //   onPressed: () {
      //     setState(() {
      //       // showSelectedScreen = desktopviewproduct();
      //     });
      //   },
      // ),
      // CollapsibleItem(
      //   text: "assets/icon/svg/camer.svg",
      //   icon: Icons.dashboard,
      //   onPressed: () {
      //     setState(() {
      //       // showSelectedScreen = Desktopviewbrand();
      //     });
      //   },
      // ),
      // CollapsibleItem(
      //   text: Constants.reports,
      //   icon: Icons.report,
      //   onPressed: () {
      //     setState(() {
      //       // showSelectedScreen = DesktopViewtags();
      //     });
      //   },
      // ),
      // CollapsibleItem(
      //   text: "sales by date",
      //   icon: Icons.scale_sharp,
      //   onPressed: () {
      //     setState(() {
      //       // showSelectedScreen = Desktopvieworder();
      //     });
      //   },
      // ),
      // CollapsibleItem(
      //   text: "Managewarehouse",
      //   icon: Icons.poll_rounded,
      //   onPressed: () {
      //     setState(() {
      //       // showSelectedScreen = Desktopviewwarehouse();
      //     });
      //   },
      // ),
      // CollapsibleItem(
      //   text: Constants.inventory,
      //   icon: Icons.shopping_cart,
      //   onPressed: () {
      //     setState(() {
      //       // showSelectedScreen = Desktopproductinventory();
      //     });
      //   },
      // ),
      // CollapsibleItem(
      //   text: "storebasedlist",
      //   icon: Icons.shopping_cart,
      //   onPressed: () {
      //     setState(() {
      //       // showSelectedScreen = Desktopviewstorebasedlist();
      //     });
      //   },
      // ),
      // CollapsibleItem(
      //   text: Constants.expenses,
      //   icon: Icons.account_balance_wallet,
      //   onPressed: () {},
      // ),
      // CollapsibleItem(
      //   text: "cashbank",
      //   icon: Icons.account_balance,
      //   onPressed: () {
      //     setState(() {
      //       // showSelectedScreen = Desktoppos_salesdetails();
      //     });
      //   },
      // ),
      // CollapsibleItem(
      //   text: "myonlinestore",
      //   icon: Icons.storefront,
      //   onPressed: () {
      //     setState(() {
      //       // showSelectedScreen = Desktopsalesignup();
      //     });
      //   },
      // ),
      // CollapsibleItem(
      //   text: Constants.settings,
      //   icon: Icons.settings,
      //   onPressed: () {
      //     setState(() {
      //       // showSelectedScreen = Desktopviewprofile();
      //     });
      //   },
      // ),
      // CollapsibleItem(
      //   text: Constants.pos,
      //   icon: Icons.business_sharp,
      //   onPressed: () {
      //     setState(() {
      //       // showSelectedScreen = Desktopaddpos();
      //     });
      //   },
      // ),

      // CollapsibleItem(
      //   text: "posreport",
      //   icon: Icons.business_sharp,
      //   onPressed: () {
      //     setState(() {
      //       // showSelectedScreen = Desktopviewposreport();
      //     });
      //   },
      // ),
      // CollapsibleItem(
      //   text: Constants.POSaddress,
      //   icon: Icons.business_sharp,
      //   onPressed: () {
      //     setState(() {
      //       // showSelectedScreen = Desktopviewposaddress();
      //     });
      //   },
      // ),
      // CollapsibleItem(
      //   text: "posstore",
      //   icon: Icons.store_mall_directory,
      //   onPressed: () {
      //     setState(() {
      //       // showSelectedScreen = Desktop_viewstoredetails();
      //     });
      //   },
      // ),
      // CollapsibleItem(
      //   text: "Managecustomer",
      //   icon: Icons.dashboard_customize,
      //   onPressed: () {
      //     setState(() {
      //       // showSelectedScreen = Desktopviewcustomer();
      //     });
      //   },
      // ),
      // CollapsibleItem(
      //     text: Constants.RoleAndPermission,
      //     svgPath: 'assets/icon/svg/permission 17.svg',
      //     onPressed: () {
      //       // setState(() {
      //       //   showSelectedScreen = desktopviewcategory();
      //       // });
      //     },
      //     subItems: [
      //       CollapsibleItem(
      //           svgPath: 'assets/icon/svg/camer.svg',
      //           text: 'Manage Staff',
      //           onPressed: () {
      //             setState(() {
      //               setShowSelectedScreen(
      //                 ListStaffPage(),
      //               );
      //               },
      //             );
      //         },
      //       ),
      //       CollapsibleItem(
      //           svgPath: 'assets/icon/svg/camer.svg',
      //           text: 'Manage Roles',
      //           onPressed: () {
      //             setState(() {
      //               setShowSelectedScreen(ViewRolesPage());
      //             },
      //           );
      //         },
      //       ),
      //       CollapsibleItem(
      //           svgPath: 'assets/icon/svg/camer.svg',
      //           text: 'Manage Permissions',
      //           onPressed: () {
      //             setState(() {
      //               setShowSelectedScreen(ListOfPermissionPage());
      //             },
      //           );
      //         },
      //       ),
      //       CollapsibleItem(
      //           svgPath: 'assets/icon/svg/camer.svg',
      //           text: 'Manage Client',
      //           onPressed: () {
      //             setState(() {
      //               setShowSelectedScreen(ViewCustomerPage());
      //             });
      //           }),
      //       // CollapsibleItem(
      //       //     svgPath: 'assets/icon/svg/camer.svg',
      //       //     text: 'Manage Taxes',
      //       //     onPressed: () {
      //       //       setState(() {
      //       //         setShowSelectedScreen(TaxesListPage());
      //       //       });
      //       //     }),
      //   ],
      // ),

      CollapsibleItem(
          text: Constants.profile,
          svgPath: 'assets/icon/svg/chat history 17.svg',
          onPressed: () {
            // setState(() {
            //   showSelectedScreen = desktopviewcategory();
            // });
          },
          subItems: [
            CollapsibleItem(
                svgPath: 'assets/icon/svg/camer.svg',
                text: "View Profile",
                onPressed: () {
                  setState(() {
                    setShowSelectedScreen(ViewProfilePage());
                  });
                }),
            // CollapsibleItem(
            //     svgPath: 'assets/icon/svg/camer.svg',
            //     text: "Edit Profile",
            //     onPressed: () {
            //       setState(() {
            //         setShowSelectedScreen(EditProfilePage());
            //       });
            //     }),
            CollapsibleItem(
                svgPath: 'assets/icon/svg/camer.svg',
                text: "Vendor Earnings",
                onPressed: () {
                  setState(() {
                    setShowSelectedScreen(VendorEarningsPage());
                  });
                }),
            // CollapsibleItem(
            //     svgPath: 'assets/icon/svg/camer.svg',
            //     text: "Processing Payouts",
            //     onPressed: () {
            //       setState(() {
            //         setShowSelectedScreen(ProcessingPayOutsPage());
            //       });
            //     }),
            // CollapsibleItem(
            //   svgPath: 'assets/icon/svg/camer.svg',
            //   text: "Paid Payouts",
            //   onPressed: () {
            //     setState(
            //       () {
            //         setShowSelectedScreen(PaidPayoutsPage());
            //       },
            //     );
            //   },
            // ),
          ]),
      CollapsibleItem(
        text: Constants.signOut,
        svgPath: 'assets/icon/svg/logout.svg',
        onPressed: () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          await preferences.clear();
          Get.offNamedUntil(Routes.login, (route) => false);
        },
      ),
    ];
  }
}
