import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/add_product/addproductpage.dart';
import 'package:wcart_vendor/features/presentation/screens/home__page/homepage.dart';
import 'package:wcart_vendor/features/presentation/screens/login/loginpage.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_attribute/add_configureitemspage.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_attribute/manage_attribute_page.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_brand/add_brandpage.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_brand/brandpage.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_categories/add_categorypage.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_categories/list_categoriespage.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_roles/updaterolespage.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_roles/viewmanagerolepage.dart';
import 'package:wcart_vendor/features/presentation/screens/add_product/screens/manage_simpleproduct/basic_details/addsimpleproduct_step1.dart';
import 'package:wcart_vendor/features/presentation/screens/add_product/screens/manage_simpleproduct/metadetails_page/metadetails_page.dart';
import 'package:wcart_vendor/features/presentation/screens/add_product/screens/manage_simpleproduct/inventory/productinventory.dart';
import 'package:wcart_vendor/features/presentation/screens/add_product/screens/manage_simpleproduct/viewproduct/viewproduct_page.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_staff/addnewstaffpage.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_staff/addnewstorestaffpage.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_staff/liststaffpage.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_tags/add_tagpage.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_tags/list_tagspage.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_variable/add_variableproduct.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_variable/add_variationspage.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_variable/add_attributepage.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_warehouse/addwarehouse_page.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_warehouse/listwarehouse_page.dart';
import 'package:wcart_vendor/features/presentation/screens/order/orderdetailspage.dart';
import 'package:wcart_vendor/features/presentation/screens/order/vieworderpage.dart';
import 'package:wcart_vendor/features/presentation/screens/pos/multistore_inventory.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/add_pos/add_product/desktopaddpos.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/payment_pos/desktop_payment.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/payment_pos/payment_succes.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/pos_reportmanagement/customer_reward.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/pos_reportmanagement/lowstockproduct.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/pos_reportmanagement/ordercountsalepage.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/pos_reportmanagement/profitandloss_report.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/pos_reportmanagement/staffbasedreport.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/pos_reportmanagement/viewpos_report/reward_transaction_page.dart';
import 'package:wcart_vendor/features/presentation/screens/profile/listpaidpayoutpage.dart';
import 'package:wcart_vendor/features/presentation/screens/profile/paidpayoutspage.dart';
import 'package:wcart_vendor/features/presentation/screens/profile/processingpayouts_page.dart';
import 'package:wcart_vendor/features/presentation/screens/profile/vendorearning_page.dart';
import 'package:wcart_vendor/features/presentation/screens/profile/viewpayoutpage.dart';
import 'package:wcart_vendor/features/presentation/screens/profile/viewprofile_page.dart';
import 'package:wcart_vendor/features/presentation/screens/salemanlogin/desktopsalemanlogin.dart';
import 'package:wcart_vendor/features/presentation/screens/sidebar/side_bar.dart';
import 'package:wcart_vendor/features/presentation/screens/singup_step1/singup_step1page.dart';
import 'package:wcart_vendor/features/presentation/screens/singup_step2/singup_step2page.dart';
import 'package:wcart_vendor/features/presentation/screens/splashscreen/desktopsplashscreen.dart';
import 'package:wcart_vendor/features/presentation/screens/store_productlist/liststore_productlist.dart';
import 'package:wcart_vendor/features/presentation/screens/store_productlist/viewstore_product.dart';
import 'package:wcart_vendor/features/presentation/screens/store_setting/addstorelocationpage.dart';
import 'package:wcart_vendor/features/presentation/screens/store_setting/storelocationpage.dart';
import 'package:wcart_vendor/features/presentation/screens/store_setting/viewstorelocationpage.dart';
import 'package:wcart_vendor/features/presentation/screens/vendor_report/sales_by_category/sales_by_category.dart';
import 'package:wcart_vendor/features/presentation/screens/warehouse_productlist/addinventorydetails.dart';
import 'package:wcart_vendor/features/presentation/screens/warehouse_productlist/listwarehouseproduct.dart';

import 'features/presentation/screens/manage_attribute/attribute_values/att_values.dart';

class Routes {
  static String splash = '/splash';
  static String sideBar = '/sideBar';
  static String home = '/home';
  static String listCategories = '/categories';
  static String addCategories = '/addCategories';
  static String listBrand = '/listBrand';
  static String addBrand = '/addBrand';
  static String listTags = '/listTags';
  static String addTags = '/addTags';
  static String singUp1 = '/singUp1';
  static String singUp2 = '/singUp2';
  static String login = '/login';
  static String viewAttribute = '/viewAttribute';
  static String addConfigureItems = '/configureItems';
  static String viewAllProduct = '/viewAllProduct';
  static String addProduct = '/addProduct';
  static String simpleProductStep1 = '/simpleProductStep1';
  static String variableProductStep1 = '/variableProductStep1';
  static String productInventoryStep2 = '/productInventoryStep2';
  static String metaDetailsStep3 = '/metaDetailsStep3';
  static String attribute = '/addAttribute';  
  static String attributevalue = '/attributevalue';
  static String variation = '/addVariation';
  static String viewOrder = '/viewOrder';
  static String orderDetails = '/orderDetails';
  static String viewWarehouse = '/viewWarehouse';
  static String addWarehouse = '/addWarehouse';
  static String viewWarehouseProductList = '/viewWarehouseProductList';
  static String addInventoryDetails = '/addInventoryDetails';
  static String storeLocation = '/storeLocation';
  static String viewStoreLocation = '/viewStoreLocation';
  static String addStoreLocation = '/addStoreLocation';
  static String listStoreProductList = '/listStoreProduct';
  static String viewStoreProductList = '/viewStoreProduct';
  static String listStaffPage = '/listStaffPage';
  static String addNewStaffWareHousePage = '/addNewStaffWareHouse';
  static String addNewStaffStorePage = '/addNewStaffStorePage';
  static String viewRolesPage = '/viewRolesPage';
  static String updateRolesPage = '/updateRolesPage';
  static String viewProfilePage = '/viewProfilePage';
  static String vendorEarningPage = '/vendorEarningPage';
  static String processingPayoutsPage = '/processingPayoutsPage';
  static String viewPayoutsPage = '/viewPayoutsPage';
  static String paidPayoutsPage = '/paidPayoutsPage';
  static String listPaidPayoutsPage = '/listPaidPayoutsPage';
  static String saleManLoginPage = '/saleManLoginPage';
  static String paymentPage = '/paymentPage';
  static String pdfOnFunctionPage = '/pdfOnFunctionPage';
  static String paymentSuccessPage = '/paymentSuccessPage';
  static String desktopAddPos = '/desktopAddPos';
  static String rewardTransactionHistory = '/rewardTransactionHistory';
  static String salesByCategory = '/salesByCategory';



  //! pos route management
  static String multiStoreInventoryPage = '/multiStoreInventoryPage';
  static String paymentPosPage = '/paymentPosPage';
  static String customerRewardPage = '/customerRewardPage';
  static String lowStockProductPage = '/lowStockProductPage';
  static String orderCountSalesPage = '/orderCountSalesPage';
  static String profitLossPage = '/profitLossPage';
  static String staffBasedReport = '/staffBasedReport';
  static String getHomeRoute() => home;

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => DesktopSplashScreen()),
    GetPage(name: sideBar, page: () => SidebarPageTwo()),
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: listCategories, page: () => const ListCategoriesPage()),
    GetPage(name: addCategories, page: () => const AddCategoryPage()),
    GetPage(name: listTags, page: () => const ListTagsPage()),
    GetPage(name: addTags, page: () => const AddTagsPage()),
    GetPage(name: listBrand, page: () => const ListBrandPage()),
    GetPage(name: addBrand, page: () => const AddBrandPage()),
    GetPage(name: listBrand, page: () => const ListTagsPage()),
    GetPage(name: addBrand, page: () => const AddTagsPage()),
    GetPage(name: singUp1, page: () => const SingUpStep1Page()),
    GetPage(name: singUp2, page: () => const SingUp2Page()),
    GetPage(name: login, page: () => const LoginPage()),
    GetPage(name: viewAttribute, page: () => const ViewAttributePage()),
    GetPage(name: addConfigureItems, page: () => const AddConfigureItemsPage()),
    GetPage(name: viewAllProduct, page: () => const ViewAllProductPage()),
    GetPage(name: addProduct, page: () => const AddProductPage()),
    GetPage(
        name: simpleProductStep1, page: () => const SimpleProductStep1Page()),
    GetPage(name: variableProductStep1, page: () => const AddVariableProduct()),
    GetPage(
        name: productInventoryStep2,
        page: () => const ProductInventoryStep2Page()),
    GetPage(name: metaDetailsStep3, page: () => const MetaDetailsPage()),
    GetPage(name: attribute, page: () => const AddAttributePage()),
    GetPage(name: attributevalue, page: () => AttValues()),
    GetPage(name: variation, page: () => const AddVariationPage()),
    GetPage(name: viewOrder, page: () => const ViewOrderPage()),
    GetPage(name: orderDetails, page: () => const OrderDetailsPage()),
    GetPage(name: viewWarehouse, page: () => const ListWarehousePage()),
    GetPage(name: addWarehouse, page: () => const AddWarehousePage()),
    GetPage(
        name: viewWarehouseProductList,
        page: () => const ListWarehouseProductListPage()),
    GetPage(
        name: addInventoryDetails, page: () => const AddInventoryDetailsPage()),
    // GetPage(name: splash, page: () => SidebarPage()),
    GetPage(name: storeLocation, page: () => const StoreLocationPage()),
    GetPage(name: viewStoreLocation, page: () => const ViewStoreLocationPage()),
    GetPage(name: addStoreLocation, page: () => const AddStoreLocationPage()),
    GetPage(
        name: listStoreProductList,
        page: () => const ListStoreProductListPage()),

    GetPage(name: listStaffPage, page: () => const ListStaffPage()),
    GetPage(name: addNewStaffStorePage, page: () => const AddStoreStaffPage()),
    GetPage(
        name: addNewStaffWareHousePage,
        page: () => const AddNewStaffWareHouse()),
    GetPage(
        name: viewStoreProductList,
        page: () => const ViewStoreProductListPage()),
    GetPage(name: viewRolesPage, page: () => const ViewRolesPage()),
    GetPage(name: updateRolesPage, page: () => const UpdateRolesPage()),
    GetPage(name: viewProfilePage, page: () => const ViewProfilePage()),
    GetPage(name: vendorEarningPage, page: () => const VendorEarningsPage()),
    GetPage(
        name: processingPayoutsPage, page: () => const ProcessingPayOutsPage()),
    GetPage(name: viewPayoutsPage, page: () => const ViewPayoutPage()),
    GetPage(name: paidPayoutsPage, page: () => const PaidPayoutsPage()),
    GetPage(name: listPaidPayoutsPage, page: () => const ListPaidPayoutsPage()),
    GetPage(name: saleManLoginPage, page: () => const DesktopSaleManLogin()),
    GetPage(name: paymentPage, page: () => DesktopPosPayment()),
    GetPage(name: paymentSuccessPage, page: () => PaymentSuccessScreen()),
    GetPage(name: desktopAddPos, page: () => const DesktopAddPos()),
    GetPage(name: salesByCategory, page: () => const SalesByCategoryPage()),
    GetPage(
        name: rewardTransactionHistory,
        page: () => const RewardTransactionHistoryPage()),

    // GetPage(name: pdfOnFunctionPage, page: () => PdfViewerPage()),
    //! pos route management
    GetPage(
        name: multiStoreInventoryPage,
        page: () => const MultiStoreInventoryPage()),
    GetPage(name: paymentPosPage, page: () => const DesktopPosPayment()),
    GetPage(name: customerRewardPage, page: () => const CustomerRewardPage()),
    GetPage(name: lowStockProductPage, page: () => const LowStockProductPage()),
    GetPage(name: orderCountSalesPage, page: () => const OrderCountTotalPage()),
    GetPage(name: staffBasedReport, page: () => const StaffBasedReportPage()),
    GetPage(name: profitLossPage, page: () => const ProfitAndLossPage()),
  ];
}
