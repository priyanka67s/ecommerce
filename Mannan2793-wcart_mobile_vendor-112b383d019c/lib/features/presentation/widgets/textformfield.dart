import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/features/presentation/widgets/validator.dart';
class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final Widget? suffixWidget;
  final bool isEnable;
  final bool isReadOnly;
  final Function? onTapped;
  final Widget? prefixWidget;
  final TextInputType keyBoardType;
  final int? maximumWordCount;
  final Color titleColor;
  final Color? borderColor;
  final Color textColor;
  final bool isHighlighted;
  final Color highlightColor;
  final FocusNode? focusNode;
  final Color? focusTextColor;
  final String? descriptionText;
  final List<TextInputFormatter>? inputformaters;
  final List<String> validationRules;
  final Function? oncomplete;
  final Function? onEditing;
  final Function(bool)? validatorCallBack;
  final Function(String)? onChanged;
  final int? minLines;
  final int? maxLines;
  final bool autovalidateMode;
  final Color? labelColor;
  final Color? fillColor; // Add this field for fill color

  // ignore: avoid_unused_constructor_parameters
  const CustomTextField(
    // ignore: invalid_required_positional_param
    @required this.hintText,
    // ignore: invalid_required_positional_param
    @required this.controller, {
    super.key,
    this.obscureText = false,
    this.suffixWidget,
    this.prefixWidget,
    this.isEnable = true,
    this.onTapped,
    this.isReadOnly = false,
    this.maximumWordCount,
    this.titleColor = ColorResource.colorBBBBBB,
    this.textColor = ColorResource.color000000,
    this.borderColor = ColorResource.colorC4CACD,
    this.isHighlighted = false,
    this.highlightColor = ColorResource.colorC4CACD,
    this.focusNode,
    this.focusTextColor = ColorResource.color0D5EF8,
    this.keyBoardType = TextInputType.name,
    this.descriptionText,
    this.oncomplete,
    this.validatorCallBack,
    this.onChanged,
    this.onEditing,
    this.inputformaters,
    this.validationRules = const [],
    this.minLines,
    this.maxLines,
    this.autovalidateMode = false,
    this.labelColor,
    this.fillColor, // Initialize the fill color
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      textInputAction: TextInputAction.done,
      autovalidateMode: widget.autovalidateMode
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      validator: (String? value) {
        if (widget.validationRules.isNotEmpty) {
          final ValidationState validationStatus =
              Validator.validate(value ?? '', rules: widget.validationRules);
          widget.validatorCallBack!(validationStatus.status);
          if (!validationStatus.status) {
            return validationStatus.error;
          }
        }
        return null;
      },
      onEditingComplete: () {
        setState(() {});
        FocusScope.of(context).requestFocus(FocusNode());
        if (widget.onEditing != null) {
          widget.onEditing!();
        }
      },
      onFieldSubmitted: (text) {
        setState(() {});
        FocusScope.of(context).requestFocus(FocusNode());
        if (widget.onEditing != null) {
          widget.onEditing!();
        }
      },
      onTap: () {
        setState(() {});
        if (widget.onTapped != null) {
          widget.onTapped!();
        }
      },
      onChanged: (q) {
        setState(() {});
        if (widget.onChanged != null) {
          widget.onChanged!(q);
        }
      },
      inputFormatters: widget.inputformaters,
      autocorrect: false,
      enableSuggestions: false,
      obscureText: widget.obscureText,
      controller: widget.controller,
      readOnly: widget.isReadOnly,
      enabled: widget.isEnable,
      keyboardType: widget.keyBoardType,
      minLines: widget.minLines ?? 1,
      maxLines: widget.maxLines ?? 1,
      
      maxLength: widget.maximumWordCount ?? null,
      focusNode: widget.focusNode,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: (widget.focusNode != null && widget.focusNode!.hasFocus)
              ? widget.focusTextColor
              : widget.textColor),
      decoration: InputDecoration(
        
        prefixIcon: widget.prefixWidget,
        fillColor:
            widget.fillColor ?? ColorResource.colorFFFFFF, // Set the fill color
        filled: true,
        labelText: widget.hintText,
        hintStyle: const TextStyle(
          color: ColorResource.colorBBBBBB,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
        isDense: false,
        counterText:
            widget.maximumWordCount != null ? '' : widget.descriptionText,
        errorMaxLines: 1,
        errorStyle: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Colors.red, fontSize: 10),
        counterStyle: const TextStyle(
            color: ColorResource.color414b5a,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            fontSize: 14),
        labelStyle: const TextStyle(
            color: ColorResource.colorBBBBBB,
            fontWeight: FontWeight.w400,
            fontSize: 14),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: ColorResource.color0D5EF8,
              width: .5,
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: ColorResource.colorC4CACD,
              width: .5,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: ColorResource.colorC4CACD,
              width: .5,
            )),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: ColorResource.colorC4CACD,
              width: .5,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Colors.red)),
      ),
    );
  }

  String? validatePassword(String value) {
    if (widget.validationRules.isNotEmpty) {
      final ValidationState validationStatus =
          Validator.validate(value, rules: widget.validationRules);
      if (!validationStatus.status) {
        return validationStatus.error;
      }
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
