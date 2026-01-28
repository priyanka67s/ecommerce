import 'package:flutter/material.dart';
import 'package:wcart_vendor/features/presentation/widgets/collapsible_sidebar/collapsible_item.dart';

import 'collapsible_item_widget.dart';

class CollapsibleMultiLevelItemWidget extends StatefulWidget {
  const CollapsibleMultiLevelItemWidget({
    super.key,
    required this.onHoverPointer,
    required this.textStyle,
    required this.padding,
    required this.offsetX,
    required this.scale,
    required this.mainLevel,
    required this.subItems,
    required this.items,
    required this.extendable,
    required this.disable,
    this.iconColor,
    this.iconSize,
    this.onTapMainLevel,
    this.onHold,
    this.isCollapsed,
    this.isSelected,
    this.minWidth,
    this.parentComponent,
  });

  final Widget mainLevel;
  final MouseCursor onHoverPointer;
  final TextStyle textStyle;
  final double offsetX, scale, padding;
  final bool? isCollapsed;
  final bool? isSelected;
  final double? minWidth;
  final List<CollapsibleItem> subItems;
  final List<CollapsibleItem> items;
  final bool extendable;
  final bool? disable;
  final double? iconSize;
  final Color? iconColor;
  final VoidCallback? onTapMainLevel, onHold;
  final bool? parentComponent;

  @override
  _CollapsibleMultiLevelItemWidgetState createState() =>
      _CollapsibleMultiLevelItemWidgetState();
}

class _CollapsibleMultiLevelItemWidgetState
    extends State<CollapsibleMultiLevelItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.parentComponent == true &&
        (widget.isSelected == false || widget.isSelected == null) &&
        isOpen == true) {
      setState(() {
        isOpen = false;
      });
    }
    return Column(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              if (widget.onTapMainLevel != null) {
                widget.onTapMainLevel!();
              }
              setState(() {
                isOpen = !isOpen;
              });
            },
            onLongPress: widget.onHold,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: widget.mainLevel,
                ),
                if (widget.disable != null && widget.disable == false)
                  Icon(
                    isOpen ? Icons.expand_less : Icons.expand_more,
                    color: widget.iconColor,
                  )
              ],
            ),
          ),
        ),
        if (widget.disable != null && widget.disable == false)
          AnimatedSize(
            duration: Duration(milliseconds: 200),
            child: SizedBox(
              height: widget.extendable == true && isOpen ? null : 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: widget.subItems
                      .map((subItem) => CollapsibleItemWidget(
                            onHoverPointer: widget.onHoverPointer,
                            padding: widget.padding,
                            offsetX: widget.offsetX,
                            isSelected: subItem.isSelected,
                            scale: widget.scale,
                            leading: subItem.iconImage != null
                                ? CircleAvatar(
                                    radius: widget.iconSize! / 2,
                                    backgroundImage: subItem.iconImage,
                                    backgroundColor: Colors.transparent,
                                  )
                                : (subItem.icon != null
                                    ? Icon(
                                        subItem.icon,
                                        size: widget.iconSize,
                                        color: widget.iconColor,
                                      )
                                    : SizedBox(
                                        width: widget.iconSize,
                                        height: widget.iconSize,
                                      )),
                            iconSize: widget.iconSize,
                            iconColor: widget.iconColor,
                            title: subItem.text,
                            textStyle: widget.textStyle.copyWith(
                              color: subItem.isSelected == true
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                            isCollapsed: widget.isCollapsed,
                            minWidth: widget.minWidth,
                            onTap: () {
                              setupItemsSelection(subItem);
                              debugPrint('subItem ${subItem.text}');
                              subItem.onPressed();
                            },
                            onLongPress: () {
                              if (subItem.onHold != null) {
                                subItem.onHold!();
                              }
                            },
                            subItems: subItem.subItems,
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
      ],
    );
  }
  
  void setupItemsSelection(CollapsibleItem subItem) {
    setState(() {
      widget.items.forEach((element) {
        if (element.subItems != null && element.subItems!.isNotEmpty) {
          element.subItems!.forEach((element) {
            subItem.text == element.text
                ? element.isSelected = true
                : element.isSelected = false;
          });
        }
      });
    });
  }
}
