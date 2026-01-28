import 'package:flutter/material.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_popup_menu.dart';
import 'package:wcart_vendor/features/presentation/widgets/lisner.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final bool? showSettings;
  final bool? showNotification;
  final bool? showProfile;
  final bool? showDownload;
  final bool? showSearch;
  final Color? backgroundColor;
  final OnItemSelected? onItemSelected;
  final OnChange? onChanged;
  final String? titleString;
  final String? subTitle;
  final String? clear;
  final int? notificationCount;
  final IconEnum? iconEnumValues;
  TextEditingController? controller = TextEditingController();
  final TextStyle? style;
  final double? titleSpacing;
  GlobalKey<CustomAppbarState> customAppbarStateKey = GlobalKey();
  List<Widget>? actionsButtons;
  bool? centerTitle;
  double? toolBarHeight;
  Widget? flexibleSpace;

  CustomAppbar(
      {super.key,
      this.titleString,
      this.subTitle,
      this.iconEnumValues = IconEnum.empty,
      this.showNotification = false,
      this.showDownload = false,
      this.clear,
      this.showProfile = false,
      this.showSettings = false,
      this.showSearch = false,
      this.onItemSelected,
      this.onChanged,
      this.notificationCount = 0,
      this.backgroundColor = const Color(0xFF0A8342),
      this.style,
      this.titleSpacing,
      this.controller,
      this.actionsButtons,
      this.centerTitle,
      this.toolBarHeight,
      this.flexibleSpace});

  @override
  CustomAppbarState createState() => CustomAppbarState();

  @override
  Size get preferredSize => throw UnimplementedError();
}

class CustomAppbarState extends State<CustomAppbar> {
  bool showCancel = false;
  bool showSearch = false;
  bool filterImage = false;
  bool isFiltered = false;
  IconEnum icons = IconEnum.empty;
  CustomPopupMenuController menuController = CustomPopupMenuController();
  late List<ItemModel> menuItems;

  @override
  void initState() {
    super.initState();
    menuItems = [
      ItemModel('Profile', const Icon(Icons.person)),
      ItemModel('Logout', const Icon(Icons.logout)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 40,
      elevation: 0.0,
      toolbarHeight: widget.toolBarHeight,
      flexibleSpace: widget.flexibleSpace,
      backgroundColor: widget.backgroundColor,
      automaticallyImplyLeading: false,
      titleSpacing: widget.titleSpacing ?? 0,
      centerTitle: widget.centerTitle,
      title: showSearch
          ? searchBar()
          : widget.titleString != null || widget.titleString != ''
              ? widget.subTitle == null || widget.subTitle == ''
                  ? Text(
                      widget.titleString!,
                      style: widget.style ??
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                    )
                  : Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.titleString!,
                              style: Theme.of(context).textTheme.bodyMedium!),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            widget.subTitle!,
                            style: Theme.of(context).textTheme.bodyMedium!,
                          )
                        ],
                      ),
                    )
              : const SizedBox(),
      actions: widget.actionsButtons ??
          <Widget>[
            searchButton(context),
            notificationButton(context),
            userProfile(context),
            downloadIconButton(context),
            if (widget.clear != null) clearButton(context),
            settingsButton(context),
          ],
      leading: leadingIcon(context),
    );
  }

  void setUpdateState() {
    setState(() {});
  }

  Widget searchBar() {
    showCancel = widget.controller?.text.isNotEmpty == true;
    return Container(
      height: 37,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: TextFormField(
        autofocus: true,
        controller: widget.controller,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintMaxLines: 1,
          hintText: 'Search',
          border: InputBorder.none,
          fillColor: Colors.grey,
          suffixIconConstraints: BoxConstraints.tight(const Size(30, 30)),
          suffixIcon: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.onItemSelected!('');
                  widget.controller?.clear();
                  showSearch = false;
                  if (widget.onChanged != null) widget.onChanged!('');
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.3),
                ),
                padding: const EdgeInsets.all(3.0),
                child: const Center(
                    child: Icon(Icons.clear, size: 18, color: Colors.white)),
              ),
            ),
          ),
          hintStyle: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w400),
        ),
        keyboardType: TextInputType.text,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontWeight: FontWeight.w500),
        onFieldSubmitted: (String stringValues) {
          widget.onItemSelected!(stringValues);
          FocusScope.of(context).requestFocus(FocusNode());
        },
        onChanged: (String stringValues) {
          if (widget.onChanged != null) {
            widget.onChanged!(stringValues);
          }
          if (stringValues.isNotEmpty && !showCancel) {
            widget.onItemSelected!(stringValues);
            setState(() {
              showCancel = true;
            });
          } else if (stringValues.isEmpty) {
            widget.onItemSelected!('');
          } else if (stringValues.isEmpty && showCancel) {
            widget.onItemSelected!('');
            setState(() {
              showCancel = false;
            });
          }
        },
      ),
    );
  }

  Widget searchButton(BuildContext context) {
    return Visibility(
      visible: showSearch
          ? false
          : widget.showSearch == true
              ? true
              : false,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            child: const Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
          ),
          onTap: () {
            setState(() {
              showSearch = true;
              // widget.onItemSelected!('searchTriggering');
            });
          },
        ),
      ),
    );
  }

  Widget settingsButton(BuildContext context) {
    return Visibility(
      visible: showSearch ? false : widget.showSettings!,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            child: const Icon(Icons.settings),
          ),
          onTap: () {
            setState(() {
              widget.onItemSelected!('settingTriggering');
            });
          },
        ),
      ),
    );
  }

  Widget notificationButton(BuildContext context) {
    return Visibility(
      visible: showSearch ? false : widget.showNotification!,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: Container(
            margin: const EdgeInsets.only(right: 4),
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5, right: 10),
                  child: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
                if (widget.notificationCount != 0)
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 19,
                    width: 19,
                    child: Text(
                      widget.notificationCount! > 10
                          ? '10+'
                          : widget.notificationCount.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Colors.orange),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
          onTap: () {
            setState(() {
              widget.onItemSelected!('notificationTriggering');
            });
          },
        ),
      ),
    );
  }

  Widget userProfile(BuildContext context) {
    return CustomPopupMenu(
      pressType: PressType.singleClick,
      controller: menuController,
      menuBuilder: () => ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          color: const Color(0xFF0A8342),
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: menuItems
                  .map(
                    (item) => MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          menuController.hideMenu();
                        },
                        child: Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: <Widget>[
                              item.icon,
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    item.title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.only(right: 8),
        child: Row(
          children: [
            Text(
              'Wcart',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 7),
            CircleAvatar(
              radius: 20.0,
              child: Icon(
                Icons.person_3_sharp,
                color: Colors.orange,
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget downloadIconButton(BuildContext context) {
    return Visibility(
      visible: widget.showDownload!,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Icon(Icons.download),
          ),
          onTap: () {
            setState(() {
              widget.onItemSelected!('download');
            });
          },
        ),
      ),
    );
  }

  Widget clearButton(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          child: Text(
            widget.clear!,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        onTap: () {
          setState(() {
            widget.onItemSelected!('clear');
          });
        },
      ),
    );
  }

  Widget? leadingIcon(BuildContext context) {
    Widget? leadingView;
    if (widget.iconEnumValues!.iconsString != IconEnum.empty.toString()) {
      leadingView = InkResponse(
        onTap: () {
          widget.onItemSelected!(widget.iconEnumValues!.iconsString);
        },
        radius: 22,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: widget.iconEnumValues!.icons,
      );
    }
    return leadingView;
  }
}

enum IconEnum { close, back, menu, empty, mainMenu }

extension IconExtension on IconEnum {
  Widget get icons {
    switch (this) {
      case IconEnum.close:
        return const Icon(
          Icons.close,
          color: Colors.white,
          size: 25,
        );
      case IconEnum.back:
        return Container(
          padding: const EdgeInsets.all(5),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        );
      case IconEnum.mainMenu:
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: const Text('FALCA'),
        );
      case IconEnum.menu:
        return const Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        );
      case IconEnum.empty:
        return const SizedBox();
      default:
        return const SizedBox();
    }
  }

  String get iconsString {
    switch (this) {
      case IconEnum.close:
        return IconEnum.close.toString();
      case IconEnum.back:
        return IconEnum.back.toString();
      case IconEnum.menu:
        return IconEnum.menu.toString();
      case IconEnum.empty:
        return IconEnum.empty.toString();
      case IconEnum.mainMenu:
        return IconEnum.mainMenu.toString();
      default:
        return IconEnum.empty.toString();
    }
  }
}

class ItemModel {
  String title;
  Widget icon;

  ItemModel(this.title, this.icon);
}
