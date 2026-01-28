// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:wcart_vendor/util/color_resource.dart';
// import 'package:wcart_vendor/util/validator.dart';

// // ignore: must_be_immutable
// class CustomTextField extends StatefulWidget {
//   final String hintText;
//   final bool obscureText;
//   final TextEditingController controller;
//   final Widget? suffixWidget;
//   final bool isEnable;
//   final bool isReadOnly;
//   final Function? onTapped;
//   final Widget? prefixWidget;
//   final TextInputType keyBoardType;
//   final int? maximumWordCount;
//   final Color titleColor;
//   final Color? borderColor;
//   final Color textColor;
//   final bool isHighlighted;
//   final Color highlightColor;
//   final FocusNode? focusNode;
//   final Color? focusTextColor;
//   final String? descriptionText;
//   final List<TextInputFormatter>? inputformaters;
//   List<String> validationRules = [];
//   Function? oncomplete;
//   final Function? onEditing;
//   final Function(bool)? validatorCallBack;
//   int? minLines;
//   int? maxLines;
//   final bool autovalidateMode;

//   // ignore: avoid_unused_constructor_parameters

//   CustomTextField(
//     // ignore: invalid_required_positional_param
//     @required this.hintText,
//     // ignore: invalid_required_positional_param
//     @required this.controller, {
//     this.obscureText = false,
//     this.suffixWidget,
//     this.prefixWidget,
//     this.isEnable = true,
//     this.onTapped,
//     this.isReadOnly = false,
//     this.maximumWordCount,
//     this.titleColor = ColorResource.colorers,
//     this.textColor = ColorResource.color414b5a,
//     this.borderColor = ColorResource.colorers,
//     this.isHighlighted = false,
//     this.highlightColor = ColorResource.colorers,
//     this.focusNode,
//     this.focusTextColor = ColorResource.colorers,
//     this.keyBoardType = TextInputType.name,
//     this.descriptionText,
//     this.oncomplete,
//     this.validatorCallBack,
//     this.onEditing,
//     this.inputformaters,
//     this.validationRules = const [],
//     this.minLines,
//     this.maxLines,
//     this.autovalidateMode = false,
//   });

//   @override
//   _CustomTextFieldState createState() => _CustomTextFieldState();
// }

// class _CustomTextFieldState extends State<CustomTextField> {
//   @override
//   void initState() {
//     // if (widget.focusNode != null) {
//     //   widget.focusNode!.addListener(() {
//     //     setState(() {
//     //       FocusScope.of(context).requestFocus(widget.focusNode);
//     //     });
//     //   });
//     // }
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       textInputAction: TextInputAction.done,

//       autovalidateMode: widget.autovalidateMode
//           ? AutovalidateMode.onUserInteraction
//           : AutovalidateMode.disabled,

//       validator: (String? value) {
//         if (widget.validationRules.isNotEmpty) {
//           final ValidationState validationStatus =
//               Validator.validate(value ?? '', rules: widget.validationRules);
//           widget.validatorCallBack!(validationStatus.status);
//           if (!validationStatus.status) {
//             return validationStatus.error;
//           }
//         }
//         return null;
//       },

//       onEditingComplete: () {
//         setState(() {});
//         FocusScope.of(context).requestFocus(FocusNode());
//         if (widget.onEditing != null) {
//           widget.onEditing!();
//         }
//       },

//       onFieldSubmitted: (text) {
//         setState(() {});
//         FocusScope.of(context).requestFocus(FocusNode());
//         if (widget.onEditing != null) {
//           widget.onEditing!();
//         }
//       },

//       onTap: () {
//         setState(() {});
//         if (widget.onTapped != null) {
//           widget.onTapped!();
//         }
//       },
//       onChanged: (q) {
//         setState(() {});
//       },
//       // ignore: prefer_const_literals_to_create_immutables
//       // inputFormatters: [
//       //   // if (widget.maximumWordCount != null)
//       //   //   LengthLimitingTextInputFormatter(widget.maximumWordCount),
//       // ],
//       inputFormatters: widget.inputformaters,

//       autocorrect: false,
//       enableSuggestions: false,
//       obscureText: widget.obscureText,
//       controller: widget.controller,
//       readOnly: widget.isReadOnly,
//       enabled: widget.isEnable,
//       keyboardType: widget.keyBoardType,

//       minLines: widget.minLines ?? 1,
//       maxLines: widget.maxLines ?? 1,

//       // maxLines: 1,

//       focusNode: widget.focusNode,
//       style: Theme.of(context).textTheme.bodyText1!.copyWith(
//           color: (widget.focusNode != null && widget.focusNode!.hasFocus)
//               ? widget.focusTextColor
//               : widget.textColor),

//       decoration: InputDecoration(
//           prefix: widget.prefixWidget,
//           fillColor: ColorResource.colorFFFFFF,
//           filled: true,
//           labelText: widget.hintText,
//           isDense: false,
//           counterText: widget.descriptionText,
//           errorMaxLines: 1,
//           errorStyle: Theme.of(context)
//               .textTheme
//               .subtitle1!
//               .copyWith(color: Colors.red, fontSize: 10),
//           counterStyle: TextStyle(
//               color: ColorResource.color000000,
//               fontWeight: FontWeight.normal,
//               fontStyle: FontStyle.normal,
//               fontSize: 12.sp),
//           // errorText: validatePassword(widget.controller.text.trim()),
//           labelStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
//               color: (widget.focusNode != null && widget.focusNode!.hasFocus)
//                   ? ColorResource.color101010
//                   : ColorResource.color203052),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(3),
//               borderSide: BorderSide(color: ColorResource.colorers)),
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(3),
//               borderSide: BorderSide(color: ColorResource.colorers)),
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(3),
//               borderSide: BorderSide(color: ColorResource.colorers)),
//           disabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(3),
//               borderSide: BorderSide(color: ColorResource.colorers)),
//           errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(3),
//               borderSide: const BorderSide(color: Colors.red))),
//     );
//   }

//   String? validatePassword(String value) {
//     if (widget.validationRules.isNotEmpty) {
//       final ValidationState validationStatus =
//           Validator.validate(value, rules: widget.validationRules);
//       if (!validationStatus.status) {
//         return validationStatus.error;
//       }
//     }
//     return null;
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }
// }
