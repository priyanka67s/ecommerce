// import 'package:flutter/material.dart';
// import 'package:multi_dropdown/multiselect_dropdown.dart';
// import 'package:wcart_vendor/model/all_category_list_model.dart';
// import 'package:wcart_vendor/util/color_resource.dart';

// class CategoryMultiSelectWidget extends StatelessWidget {
//   final MultiSelectController<Categories> multiSelectController =
//       MultiSelectController();
//   final AllCategoryData allCategoryData; // Assume this is passed to the widget

//   CategoryMultiSelectWidget({required this.allCategoryData});

//   @override
//   Widget build(BuildContext context) {
//     return categoryMultiSelectDropDownWidget();
//   }

//   Widget categoryMultiSelectDropDownWidget() {
//     // Create options for the multi-select dropdown
//     List<ValueItem<Categories>> optionValue =
//         (allCategoryData.categories ?? []).map((category) {
//       return ValueItem(
//         label: category.termName ?? '',
//         value: category,
//       );
//     }).toList();

//     return MultiSelectDropDown<Categories>(
//       clearIcon: const Icon(Icons.close),
//       controller: multiSelectController,
//       onOptionSelected: (options) {
//         debugPrint('Selected options: $options');
//       },
//       options: optionValue,
//       selectionType: SelectionType.multi,
//       chipConfig: const ChipConfig(
//         wrapType: WrapType.wrap,
//         backgroundColor: ColorResource.color203052,
//       ),
//       optionTextStyle: const TextStyle(fontSize: 16),
//       selectedOptionIcon: const Icon(Icons.check_circle, color: Colors.grey),
//       selectedOptionTextColor: Colors.blue,
//       dropdownMargin: 2,
//       onOptionRemoved: (index, option) {
//         debugPrint('Removed: $option');
//       },
//       borderRadius: 3,
//     );
//   }
// }

// class AllCategoryData {
//   get categories => null;
// }
