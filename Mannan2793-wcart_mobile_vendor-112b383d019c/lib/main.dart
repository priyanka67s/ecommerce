import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:toastification/toastification.dart';
import 'package:wcart_vendor/di_init.dart';
import 'package:wcart_vendor/features/presentation/screens/add_product/screens/manage_simpleproduct/viewproduct/bloc/view_product_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/add_pos/add_product/bloc/add_desk_top_pos_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/home__page/bloc/home_page_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_attribute/bloc/manage_attribute_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_brand/bloc/manage_brand_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_categories/bloc/manage_category_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_tags/bloc/manage_tags_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_warehouse/bloc/view_warehouse_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/order/bloc/view_order_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/store_productlist/bloc/store_product_list_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/store_setting/bloc/view_store_location_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/vendor_report/sale_by_date/bloc/sales_by_date_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/warehouse_productlist/bloc/view_product_inventory_bloc.dart';
import 'package:wcart_vendor/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/presentation/screens/vendor_report/sales_by_category/bloc/sales_category_bloc.dart';


/// The main entry point of the app.
/// Initializes the dependency injection and runs the app widget tree
/// with the bloc providers.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependency();  
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<HomePageBloc>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<ViewProductBloc>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<ManageTagsBloc>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<ManageBrandBloc>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<ManageCategoryBloc>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<ManageAttributeBloc>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<ViewOrderBloc>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<ViewWarehouseBloc>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<ViewProductInventoryBloc>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<ViewStoreLocationBloc>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<StoreProductListBloc>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<SalesByDateBloc>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<AddDeskTopPosBloc>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<SalesCategoryBloc>(),
        ),
      ],
      child: ToastificationWrapper(
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          locale: const Locale('en', 'US'), // Set default locale
          fallbackLocale: const Locale('en', 'US'),
          localizationsDelegates: const [
            FlutterQuillLocalizations.delegate, // Required for Quill
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'),
          ],
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: Colors.black,
          ),
          initialRoute: '/splash',
          getPages: Routes.routes,
        );
      },
    );
  }
}
