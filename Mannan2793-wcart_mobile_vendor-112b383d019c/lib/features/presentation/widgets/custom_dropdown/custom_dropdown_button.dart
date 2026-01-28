import 'package:flutter/material.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/dropdown_button.dart';
class CustomDropdownButton extends StatefulWidget {
  final String hint;
  final String? value;
  final List<String> dropdownItems;
  final Function(String, int)? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset? offset;

  const CustomDropdownButton({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset,
    super.key,
  });

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(        
        isExpanded: true,
        hint: Container(          
          alignment: widget.hintAlignment,
          child: Text(
            widget.hint,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
        value: widget.value,
        
        items: widget.dropdownItems
            .asMap()
            .entries
            .map((item) => DropdownMenuItem<String>(
                  value: item.value,
                  child: Container(
                    alignment: widget.valueAlignment,
                    child: Text(
                      item.value,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
              ),
            )
            .toList(),
        onChanged: (value) {
          widget.onChanged!(
              value.toString(), widget.dropdownItems.indexOf(value.toString()));
        },
        selectedItemBuilder: widget.selectedItemBuilder,
        icon: widget.icon ?? const Icon(Icons.arrow_drop_down),
        iconSize: widget.iconSize ?? 22,
        iconEnabledColor: widget.iconEnabledColor,
        iconDisabledColor: widget.iconDisabledColor,
        buttonHeight: widget.buttonHeight ?? 55,
        buttonWidth: widget.buttonWidth ?? 800,
        buttonPadding:
            widget.buttonPadding ?? const EdgeInsets.only(left: 14, right: 2),
        buttonDecoration: widget.buttonDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(3),              
              border: Border.all(
                color: const Color(0xffC4CACD),
                width: 0.5, // Set the border thickness here
              ),
            ),
        buttonElevation: widget.buttonElevation,
        itemHeight: widget.itemHeight ?? 40,
        itemPadding:
            widget.itemPadding ?? const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: widget.dropdownHeight ?? 350,
        dropdownWidth: widget.dropdownWidth ?? 380,
        dropdownPadding: widget.dropdownPadding,
        dropdownDecoration: widget.dropdownDecoration ??
            BoxDecoration(
              
              borderRadius: BorderRadius.circular(3),
              color: Colors.white,
              border: Border.all(
                color: const Color(0xffC4CACD),
                width: 0.5, // Set the border thickness here
              ),
            ),
        dropdownElevation: widget.dropdownElevation ?? 8,
        scrollbarRadius: widget.scrollbarRadius ?? const Radius.circular(40),
        scrollbarThickness: widget.scrollbarThickness,
        scrollbarAlwaysShow: widget.scrollbarAlwaysShow,
        offset: widget.offset,
        dropdownOverButton: false,
      ),
    );
  }
}
