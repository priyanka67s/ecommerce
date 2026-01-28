import 'package:flutter/material.dart';

import 'package:wcart_vendor/features/presentation/widgets/custom_appbar.dart';
import 'package:wcart_vendor/features/presentation/widgets/drawer_item_widget.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int selectedItemIndex = 0;
  ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  bool isCollapsed = true;
  bool isTextVisible = true;

  @override
  void initState() {
    super.initState();
  }

  int index = 0;
  void onSelectItem(int index) {
    setState(() {
      selectedItemIndex = index;
    });
    if (isMobile(context)) {
      Navigator.pop(context);
    }
  }

  void updateSidebarSize() async {
    setState(() {
      isCollapsed = !isCollapsed;
    });
    if (isCollapsed) {
      await Future.delayed(const Duration(milliseconds: 330), () {
        setState(() {
          isTextVisible = true;
        });
      });
    } else {
      setState(() {
        isTextVisible = false;
      });
    }
  }

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 650;
  // static bool isTablet(BuildContext context) =>
  //     MediaQuery.sizeOf(context).width < 1100 &&
  //     MediaQuery.sizeOf(context).width < 650;

  // static bool isDesktop(BuildContext context) =>
  //     MediaQuery.sizeOf(context).width >= 1100;

  List<DrawerItem> drawerItems = [
    DrawerItem(
      title: 'Home',
      leadingWidget: const Icon(Icons.person),
      trailingWidget: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16,
      ),
      itemSelectedColor: Colors.blue,
      onTap: () {},
    ),
    DrawerItem(
      title: 'Shop',
      leadingWidget: const Icon(Icons.shop),
      trailingWidget: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16,
      ),
      itemSelectedColor: Colors.blue,
      onTap: () {
        print('NK');
      },
    ),
    DrawerItem(
      title: 'Sales Person',
      leadingWidget: const Icon(Icons.person),
      trailingWidget: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16,
      ),
      itemSelectedColor: Colors.blue,
      onTap: () {
        print('one');
      },
    ),
    DrawerItem(
      title: 'Reginal Manager',
      leadingWidget: const Icon(Icons.shop),
      trailingWidget: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16,
      ),
      itemSelectedColor: Colors.blue,
      onTap: () {
        print('two');
      },
    ),
    DrawerItem(
      title: 'Sales Person',
      leadingWidget: const Icon(Icons.person),
      trailingWidget: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16,
      ),
      itemSelectedColor: Colors.blue,
      onTap: () {
        print('one');
      },
    ),
    DrawerItem(
      title: 'Reginal Manager',
      leadingWidget: const Icon(Icons.shop),
      trailingWidget: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16,
      ),
      itemSelectedColor: Colors.blue,
      onTap: () {
        print('two');
      },
    ),
    DrawerItem(
      title: 'Sales Person',
      leadingWidget: const Icon(Icons.person),
      trailingWidget: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16,
      ),
      itemSelectedColor: Colors.blue,
      onTap: () {
        print('one');
      },
    ),
    DrawerItem(
      title: 'Reginal Manager',
      leadingWidget: const Icon(Icons.shop),
      trailingWidget: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16,
      ),
      itemSelectedColor: Colors.blue,
      onTap: () {
        print('two');
      },
    ),
    DrawerItem(
      title: 'Sales Person',
      leadingWidget: const Icon(Icons.person),
      trailingWidget: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16,
      ),
      itemSelectedColor: Colors.blue,
      onTap: () {
        print('one');
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          appBar,
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isMobile(context)) sideBarWidget(),
              Expanded(
                child: Scaffold(
                  key: scaffoldkey,
                  drawer: isMobile(context)
                      ? Container(
                          margin: const EdgeInsets.only(top: 1),
                          width: 180.0,
                          color: const Color(0xFF0A8342),
                          child: ListView(
                            children: buildSidebarWidget,
                          ),
                        )
                      : null,
                  body: IndexedStack(
                    index: index,
                    children: const [
                      // CoreWidget(
                      //   loadingStatus: false,
                      //   mobile: Center(
                      //     child: Text('Mobile'),
                      //   ),
                      //   tablet: Center(
                      //     child: Text('Tablet'),
                      //   ),
                      //   desktop: Center(
                      //     child: Text('Desktop'),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
    // IndexedStack(
    //   index: index,
    //   children: [
    //     CoreWidget(
    //       loadingStatus: false,
    //       enableDrawer: true,
    //       drawerItems: drawerList,
    //       mobile: const Center(
    //         child: Text('Mobile'),
    //       ),
    //       tablet: const Center(
    //         child: Text('Tablet'),
    //       ),
    //       desktop: const Center(
    //         child: Text('Desktop'),
    //       ),
    //     ),
    //   ],
    // );
  }

  //Appbar
  Widget get appBar => CustomAppbar(
        titleString: 'Dashboard',
        centerTitle: true,
        showProfile: true,
        // showNotification: true,
        // notificationCount: 15,
        // showSearch: true,
        iconEnumValues: IconEnum.menu,
        onItemSelected: (selectedItem) {
          print(selectedItem);
          //on drawer menu pressed
          if (selectedItem.toString() == IconEnum.menu.toString()) {
            if (isMobile(context)) {
              if (scaffoldkey.currentState!.isDrawerOpen) {
                //if drawer is open, then close the drawer
                Navigator.pop(context);
              } else {
                //Here update the sidebar default actions values.
                setState(() {
                  isCollapsed = true;
                  isTextVisible = true;
                });
                scaffoldkey.currentState!.openDrawer();
                //if drawer is closed then open the drawer.
              }
            } else {
              //here handle the web sidebar
              updateSidebarSize();
            }
          }
        },
      );

  //Sidebar view
  Widget sideBarWidget() {
    final size = MediaQuery.sizeOf(context);

    return AnimatedContainer(
      width: isCollapsed ? 200 : 60,
      height: size.height,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      // margin: widget.screenBorderMargin,
      decoration: BoxDecoration(
          color: const Color(0xFF0A8342),
          borderRadius: BorderRadius.circular(0.0)),
      child: ScrollbarTheme(
        data:
            const ScrollbarThemeData(thickness: WidgetStatePropertyAll(3.0)),
        child: Scrollbar(
          controller: scrollController,
          child: ListView(
            controller: scrollController,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: buildSidebarWidget,
          ),
        ),
      ),
      // Column(
      //   children: [
      //     DrawerItemWidget(
      //       item: DrawerItem(
      //           title: 'FALCA',
      //           subTitle: '+91 9876543210',
      //           textStyle:
      //               const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      //           leadingWidget: const FlutterLogo(
      //             size: 30,
      //           ),
      //           onTap: () {}),
      //       isCollapsedSidebar: isCollapsed,
      //       textVisibility: isTextVisisble,
      //       isSelected: false,
      //       onTap: () {
      //         debugPrint('---- Profile Detail ---->');
      //       },
      //     ),
      //     Expanded(
      //       child: ScrollbarTheme(
      //         data: const ScrollbarThemeData(
      //             thickness: MaterialStatePropertyAll(5.0)),
      //         child: Scrollbar(
      //           controller: scrollController,
      //           child: ListView(
      //             controller: scrollController,
      //             keyboardDismissBehavior:
      //                 ScrollViewKeyboardDismissBehavior.onDrag,
      //             children: buildSidebarWidget,
      //           ),
      //         ),
      //       ),
      //     ),
      //     const Divider(height: 8),
      //     DrawerItemWidget(
      //       item: DrawerItem(
      //           title: 'Collapse',
      //           leadingWidget: isCollapsed
      //               ? const Icon(Icons.arrow_forward_ios_rounded)
      //               : const Icon(Icons.arrow_back_ios_new_rounded),
      //           // trailingWidget:
      //           //     const Icon(Icons.arrow_forward_ios_rounded),
      //           onTap: () {
      //             // updateSidebarSize();
      //           }),
      //       isCollapsedSidebar: isCollapsed,
      //       textVisibility: isTextVisisble,
      //       isSelected: false,
      //       onTap: () {
      //         updateSidebarSize();
      //       },
      //     )
      //   ],
      // ),
    );
  }

  List<Widget> get buildSidebarWidget {
    List<Widget> getWidgets = [];
    for (var i = 0; i < drawerItems.length; i++) {
      getWidgets.add(DrawerItemWidget(
        item: drawerItems[i],
        isSelected: selectedItemIndex == i,
        isCollapsedSidebar: isCollapsed,
        textVisibility: isTextVisible,
        onTap: () {
          onSelectItem(i);
        },
      ));
    }
    return getWidgets;
  }
}
