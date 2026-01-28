import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:wcart_vendor/features/presentation/screens/profile/viewprofile_page.dart';
import 'package:wcart_vendor/features/presentation/screens/sidebar/generate_items.dart';
import 'package:wcart_vendor/features/presentation/screens/vendor_report/sale_by_date/sales_by_date.dart';
import '../../../../util/color_resource.dart';
import '../../widgets/collapsible_sidebar.dart';
import '../../widgets/collapsible_sidebar/collapsible_item.dart';
import '../add_product/screens/manage_simpleproduct/viewproduct/viewproduct_page.dart';
import '../home__page/homepage.dart';
import '../order/vieworderpage.dart';


class SidebarPageTwo extends StatefulWidget {
  const SidebarPageTwo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SidebarPageTwoState createState() => _SidebarPageTwoState();
}

class _SidebarPageTwoState extends State<SidebarPageTwo> {
  late List<CollapsibleItem> _items;
  Widget showSelectedScreen = HomePage();

  @override
  void initState() {
    super.initState();
    _items = GenerateItems.getGenerateItems2(setState, _setShowSelectedScreen);
    if (Get.arguments != null) {
      final args = Get.arguments['screen'];
      if (args != null) {
        switch (args) {
          case 'profile':
            
            _setShowSelectedScreen(ViewProfilePage());
            break;
          case 'products':
            _setShowSelectedScreen(ViewAllProductPage());
            break;
          case 'order':
            _setShowSelectedScreen(ViewOrderPage());
            break;
          case 'sales':
            _setShowSelectedScreen(SalesByDatePage());
            break;
          default:
        }

      }
    } else {
      _items.forEach((element) {
        if (element.text == 'Home') {
          element.isSelected = true;
        } else {
          element.isSelected = false;
        }
      });
      // Set default screen to HomePage
showSelectedScreen = HomePage(); // Set default screen
    }
    
    
  }
Widget _setShowSelectedScreen(Widget screen) {
    setState(() {
      showSelectedScreen = screen;
    });
    return screen;
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            CollapsibleSidebar(
              isCollapsed: MediaQuery.of(context).size.width <= 800,
              items: _items,
              collapseOnBodyTap: false,
              title: 'Wcart Vendor',
              selectedIconBox: Colors.grey.shade200,
              selectedIconColor: ColorResource.color000000,
              onTitleTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Yay! Flutter Collapsible Sidebar!'),
                  ),
                );
              },
              body: Container(
                width: 20,
              ),
              minWidth: 105,
              itemPadding: 15,
              backgroundColor: Colors.white,
              selectedTextColor: ColorResource.color000000,
              textStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
              titleStyle: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
              toggleTitleStyle:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: PageView(
                children: [
                  showSelectedScreen,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
