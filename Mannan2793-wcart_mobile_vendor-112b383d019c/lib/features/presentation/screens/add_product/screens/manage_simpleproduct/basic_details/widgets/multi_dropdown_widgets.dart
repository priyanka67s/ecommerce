import 'package:flutter/material.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:wcart_vendor/util/color_resource.dart';

MultiDropdown<String> multiDropDownWidget({
    required List<DropdownItem<String>> items,
    MultiSelectController<String>? controller,
    required Function(List<String>)? onSelectionChange,
    required String title,
  singleSelect = false,
  searchEnabled = true,
  isValidate = false,    
  }) {
    return MultiDropdown<String>(
    singleSelect: singleSelect,
      items: items, // Handle null or empty list case
    controller: controller ?? controller,
      enabled: true,
    searchEnabled: searchEnabled,
      chipDecoration: ChipDecoration(
        backgroundColor: Colors.grey[200],
        wrap: true,
        runSpacing: 2,
        spacing: 10,
      ),
      fieldDecoration: FieldDecoration(
      hintText: 'Select $title',        
      hintStyle: const TextStyle(
        color: ColorResource.colorBBBBBB,
        fontWeight: FontWeight.w400,
        fontSize: 15,
      ),
      showClearIcon: false,        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: ColorResource.colorC4CACD),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: ColorResource.colorC4CACD,
          ),
        ),
      ),
    dropdownDecoration: DropdownDecoration(     
      marginTop: 5,
      maxHeight: 300,
      borderRadius: BorderRadius.circular(5),
      elevation: 10,      
      ),
    dropdownItemDecoration: DropdownItemDecoration(        
        selectedIcon: const Icon(Icons.check_box, color: Colors.green),
        disabledIcon: Icon(Icons.lock, color: Colors.grey.shade300),
      ),
      validator: (value) {
      if (isValidate) {
        if (value == null || value.isEmpty) {
          return 'Please select ';
        } else {
          return null;
        }
      } else {
        return null;
      }              
    },      
    onSelectionChange: onSelectionChange,
    );
  }