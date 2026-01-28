import 'package:flutter/material.dart';

class VendorFormFieldModel {
  String? status;
  String? message;
  List<AdditionalFields>? additionalFields;

  VendorFormFieldModel({this.status, this.message, this.additionalFields});

  VendorFormFieldModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['additional_fields'] != null) {
      additionalFields = <AdditionalFields>[];
      json['additional_fields'].forEach((v) {
        additionalFields!.add(AdditionalFields.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (additionalFields != null) {
      data['additional_fields'] =
          additionalFields!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdditionalFields {
  int? formFieldId;
  dynamic formFieldName;
  dynamic formFieldDescription;
  int? formFieldType;
  int? formFieldRequired;
  int? formFieldStep;
  int? formFieldStatus;
  dynamic formFieldSlug;
  TextEditingController? textController = TextEditingController();

  AdditionalFields(
      {this.formFieldId,
      this.formFieldName,
      this.formFieldDescription,
      this.formFieldType,
      this.formFieldRequired,
      this.formFieldStep,
      this.formFieldStatus,
      this.formFieldSlug,
      this.textController});

  AdditionalFields.fromJson(Map<String, dynamic> json) {
    formFieldId = json['form_field_id'];
    formFieldName = json['form_field_name'];
    formFieldDescription = json['form_field_description'];
    formFieldType = json['form_field_type'];
    formFieldRequired = json['form_field_required'];
    formFieldStep = json['form_field_step'];
    formFieldStatus = json['form_field_status'];
    formFieldSlug = json['form_field_slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['form_field_id'] = formFieldId;
    data['form_field_name'] = formFieldName;
    data['form_field_description'] = formFieldDescription;
    data['form_field_type'] = formFieldType;
    data['form_field_required'] = formFieldRequired;
    data['form_field_step'] = formFieldStep;
    data['form_field_status'] = formFieldStatus;
    data['form_field_slug'] = formFieldSlug;
    return data;
  }
}
