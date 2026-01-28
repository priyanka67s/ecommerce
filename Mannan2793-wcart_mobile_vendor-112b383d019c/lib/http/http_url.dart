class HttpUrl {
  static const String appBaseUrl = 'https://wcartnode.webnexs.org';
  // static const String appBaseUrl = 'https://webnexs-store.wcart.io';
  // static const String appBaseUrl = 'https://ecommerce.webnexs.org';

  static const String appSettings = '/vendor/general_settings';
  static const String homePage = '/vendorapi/dashboard';
  static const String verifyEmail = '/vendorapi/email_verify';
  static const String register = '/vendorapi/register';
  static const String login = '/vendorapi/email_login';
  static const String forgotPassword = '/vendorapi/forgot-password-with-mail';
  static const String addTags = '/vendorapi/update_tag';
  static const String viewTags = '/vendorapi/view_tag';
  static const String addBrand = '/vendorapi/update_brand';
  static const String viewBrand = '/vendorapi/view_brand';
  static const String manageBrand = '/vendorapi//manage_brands';
  static const String manageTag = '/vendorapi/manage_tags';
  static const String viewAttribute = '/vendorapi/manage_attributes';
  static const String getAttributeItems = '/vendorapi/get_attribute_items';
  static const String viewConfigureItem = '/vendorapi/view_attribute_item';
  static const String addAttribute = '/vendorapi/update_attribute';
  static const String addConfigureItem = '/vendorapi/update_configureitem';
  static const String viewcategory = '/vendorapi/manage_categories';
  static const String viewCategoryList = '/vendorapi/view_category';
  static const String addCategory = '/vendorapi/update_category';
  static const String deleteTag = '/vendorapi/remove_tag';
  static const String allCategory = '/vendorapi/categories';
  static const String manageProduct = '/vendorapi/manage_products';
  static const String addInventory =
      '/vendorapi/update_product_inventory_shipping';
  static const String metaProduct = '/vendorapi/update_product_additional_info';
  static const String viewAllProduct = '/vendorapi/view_product';
  static const String allCategoryList = '/vendorapi/categories';
  static const String allTagsList = '/vendorapi/tags';
  static const String allBrandList = '/vendorapi/brands';
  static const String editAttribute = '/vendorapi/view_attribute';
  static const String addAttribute2 = '/vendorapi/save_product_attribute_items';
  static const String manageOrder = '/vendorapi/manage_orders';
  static const String viewOrder = '/vendorapi/view-order';
  static const String removeBrand = '/vendorapi/remove_brand';
  static const String removeCategory = '/vendorapi/remove_category';
  static const String removeAttribute = '/vendorapi/remove_attribute';
  static const String manageCustomer = '/vendorapi/manage_customers';
  static const String searchCustomer = '/vendorapi/search_customers';
  static const String updateCustomerStatus =
      '/vendorapi/update_customer_status';
  static const String viewWarehouse = '/vendorapi/manage_warehouse_address';
  static const String addWarehouse = '/vendorapi/add_warehouse_address';
  static const String editWarehouse = '/vendorapi/update_warehouse_address';
  static const String viewWareHouseData = '/vendorapi/view_warehouse_address';
  static const String addToCart = '/vendorapi/backorder_add_to_cart';
  static const String removeWareHouseData =
      '/vendorapi/delete_warehouse_address';
  static const String viewCart = '/vendorapi/backorder_view_cart';
  static const String removeCart = '/vendorapi/backorder_remove_cart';
  static const String clearCart = '/vendorapi/backorder_clear_cart';
  static const String updateCart = '/vendorapi/backorder_update_cart';
  static const String createOrder = '/vendorapi/backorder_create_order';
  static const String razorpayLinkSuccess =
      '/vendorapi/backorder_razorpay_link_success';
  static const String razorpayLinkFailed =
      '/vendorapi/backorder_razorpay_link_failed';
  static const String vendoreFormFiled =
      'https://wcartnode.webnexs.org/userapi/vendor_form_field';

  static const String rewardTransaction = '/userapi/reward_transactions';
  static const String rewardTransactionHistory =
      '/userapi/reward_transactions_history';
  static const String viewPinCode = '/userapi/view_pincode';
  static const String stepOneCustomFiled = '/vendorapi/listfields';

  static const String settingInventory = '/vendorapi/inventory_settings';
  static const String viewProfile = '/vendorapi/profile';
  static const String changePass = '/vendorapi/change_password';
  static const String viewStoreLocation = '/vendorapi/manage_store_locations';
  static const String addStoreLocation = '/vendorapi/add_store_location';
  static const String removeStoreLocation = '/vendorapi/delete_store_location';
  static const String getStoreLocation = '/vendorapi/view_store_location';
  static const String updateStoreLocation = '/vendorapi/update_store_location';
  static const String activeStoreLocation = '/vendorapi/active_store_locations';
  static const String activeTerritoryStoreLocation =
      '/vendorapi/active_territory_locations';
  static const String viewStaffRole = '/vendorapi/staff_roles';
  static const String addStaffRole = '/vendorapi/add_staff_role';
  static const String getStaffRole = '/vendorapi/view_staff_role';
  static const String updateStaffRole = '/vendorapi/update_staff_role';
  static const String removeStaffRole = '/vendorapi/remove_staff_role';
  static const String viewVendorStaff = '/vendorapi/vendor_staffs';
  static const String activeWarehouse = '/vendorapi/active_warehouse';
  static const String staffRoles = '/vendorapi/staff_roles';
  static const String selectedWarehouse = '/vendorapi/selected_warehouse';
  static const String viewInventory = '/vendorapi/all_inventories';
  static const String viewAllInventory = '/vendorapi/view_inventory';
  static const String increaseInventory = '/vendorapi/increase_inventory';
  static const String decreaseInventory = '/vendorapi/decrease_inventory';
  static const String staffLogin = '/vendorapi/staff_login';
  static const String addPosAddress = '/userapi/add_new_address';
  static const String viewPosAddress = '/userapi/view_address_data';
  static const String updatePosAddress = '/userapi/update_address_data';
  static const String deletePosAddress = '/userapi/delete_address_data';
  static const String activeTerritory = '/vendorapi/active_territory_locations';
  static const String territoryBasedWarehouse =
      '/vendorapi/territory_based_warehouse';
  static const String inventoryLocationAdd =
      '/vendorapi/inventory_location_add';
  static const String inventoryLocationRemove =
      "/vendorapi/inventory_location_remove";
  static const String inventoryLocationUpdate =
      '/vendorapi/inventory_locations_update';
  static const String selectedStoreLocation =
      '/vendorapi/selected_store_location';
  static const String storeLocationAdd = '/vendorapi/store_location_add';
  static const String allStoreProductList =
      '/vendorapi/store_based_inventories';
  static const String activeStore = '/vendorapi/active_store_locations';
  static const String vendorViewStaff = '/vendorapi/vendor_view_staff';
  static const String reportPerformance = '/vendorapi/performance_report';
  static const String updateOrderStatus = '/vendorapi/update_order_status';
  static const String addOrderNote = '/vendorapi/add_order_note';
  static const String removeOrderNote = '/vendorapi/delete_order_note';
  static const String updateConfigureItem = '/vendorapi/update_configureitem';
  static const String liveProducts = '/vendorapi/live_products';
  static const String updateProducts = '/vendorapi/update_product_variance';
  static const String createCombination =
      '/vendorapi/create_product_combination';
  static const String increaseStoreBaseInventory =
      '/vendorapi/increase_store_based_inventory';
  static const String decreaseStoreBaseInventory =
      '/vendorapi/decrease_store_based_inventory';
  // static const String increaseStoreBaseInventory =
  //     '/vendorapi/update_product_variance';

  static const String viewStoreInventoryDetails =
      '/vendorapi/store_view_inventory';

  static const String staffPermission = '/vendorapi/staff_permissions';

  static const String vendorChangePassword =
      '/vendorapi/vendor_change_staff_password';
  static const String unpaidEarnings = '/vendorapi/unpaid_earnings';
  static const String processingPayouts = '/vendorapi/processing-payouts-list';
  static const String viewPayouts = '/vendorapi/processing-payouts';
  static const String viewPaidPayouts = '/vendorapi/paid_payouts_list';
  static const String saveStoreSetting = '/vendorapi/update_store_settings';
  static const String allstoreproductlist =
      '/vendorapi/store_based_inventories';
  static const String activeStoreBasedInventories =
      '/vendorapi/active_store_based_inventories';
  static const String searchcustomer = '/vendorapi/search_customers';
  static const String viewcart = '/vendorapi/backorder_view_cart';
  static const String removecart = '/vendorapi/backorder_remove_cart';
  static const String removeCustomer = '/vendorapi/remove_customer';
  static const String clearcart = '/vendorapi/backorder_clear_cart';
  static const String updatecart = '/vendorapi/backorder_update_cart';
  static const String createorder = '/vendorapi/backorder_create_order';
  static const String stafflogin = '/vendorapi/staff_login';
  static const String performanceReport = '/vendorapi/performance_report';
  static const String orderCountTotal = '/vendorapi/order_count_total';
  static const String salesByCategory = '/vendorapi/sales_by_category';
  static const String lowStockProduct = '/vendorapi/low_quantity_product';
  static const String rewardClaim = '/userapi/claim-reward-point';
  static String deleteVendorStaff = '/vendorapi/vendor_remove_staff';

  //! get attribute items
  static const String getAttributeSubItems = '/vendorapi/attribute_items';
  static const String addAttributeSubItem = '/vendorapi/update_configureitem';

  static const String verifyOtp = '/vendorapi/set_password';
}
