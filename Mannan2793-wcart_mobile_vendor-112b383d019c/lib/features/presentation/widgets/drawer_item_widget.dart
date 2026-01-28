import 'package:flutter/material.dart';

class DrawerItemWidget extends StatelessWidget {
  final DrawerItem item;
  final bool isSelected;
  final bool isCollapsedSidebar;
  final bool textVisibility;
  final Function() onTap;
  const DrawerItemWidget(
      {super.key,
      required this.item,
      required this.isSelected,
      this.isCollapsedSidebar = false,
      this.textVisibility = true,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 3, 5, 0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF096A36) : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          onTap: onTap,
          selected: isSelected,
          selectedColor: Colors.white,
          // selectedTileColor: Colors.blue.shade100,
          textColor: Colors.white,
          iconColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 3.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          leading: isCollapsedSidebar
              ? AnimatedOpacity(
                  opacity: textVisibility ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 100),
                  child: item.leadingWidget)
              : null,
          trailing: isCollapsedSidebar
              ? AnimatedOpacity(
                  opacity: textVisibility ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: item.trailingWidget)
              : null,
          title: isCollapsedSidebar
              ? AnimatedOpacity(
                  opacity: textVisibility ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    item.title,
                    style: item.textStyle,
                  ),
                )
              : item.leadingWidget,
          subtitle: isCollapsedSidebar && item.subTitle != null
              ? AnimatedOpacity(
                  opacity: textVisibility ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    item.subTitle!,
                    style: item.subTitleTextStyle,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

class DrawerItem {
  final String title;
  final String? subTitle;
  final Function()? onTap;
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final Color? itemSelectedColor;
  // final bool isSelected;
  final TextStyle? textStyle;
  final TextStyle? subTitleTextStyle;

  DrawerItem({
    required this.title,
    this.subTitle,
    required this.onTap,
    this.leadingWidget,
    this.trailingWidget,
    this.itemSelectedColor,
    // this.isSelected = false,
    this.textStyle = const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.0,
        overflow: TextOverflow.visible),
    this.subTitleTextStyle = const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        height: 1.0,
        overflow: TextOverflow.visible),
  });
}
