class StepOneCustomeFiledsModel {
  String? status;
  String? message;
  List<Additionalfrom>? additionalfrom;

  StepOneCustomeFiledsModel({this.status, this.message, this.additionalfrom});

  StepOneCustomeFiledsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['additionalfrom'] != null) {
      additionalfrom = <Additionalfrom>[];
      json['additionalfrom'].forEach((v) {
        additionalfrom!.add(Additionalfrom.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (additionalfrom != null) {
      data['additionalfrom'] =
          additionalfrom!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Additionalfrom {
  int? venFieldId;
  String? formFieldName;
  String? formFieldDescription;
  String? formFieldType;
  int? formFieldRequired;
  int? formFieldStep;
  int? formFieldStatus;
  dynamic formFieldSlug;
  int? adminId;
  int? formFieldGroup;
  String? formFieldLabel;
  dynamic formLabelCss;
  dynamic formInputCss;
  int? formFieldPosition;
  dynamic formFieldValidation;
  String? formErrorMsg;
  String? formFieldOption;
  String? formFieldUpdate;

  Additionalfrom(
      {this.venFieldId,
      this.formFieldName,
      this.formFieldDescription,
      this.formFieldType,
      this.formFieldRequired,
      this.formFieldStep,
      this.formFieldStatus,
      this.formFieldSlug,
      this.adminId,
      this.formFieldGroup,
      this.formFieldLabel,
      this.formLabelCss,
      this.formInputCss,
      this.formFieldPosition,
      this.formFieldValidation,
      this.formErrorMsg,
      this.formFieldOption,
      this.formFieldUpdate});

  Additionalfrom.fromJson(Map<String, dynamic> json) {
    venFieldId = json['ven_field_id'];
    formFieldName = json['form_field_name'];
    formFieldDescription = json['form_field_description'];
    formFieldType = json['form_field_type'];
    formFieldRequired = json['form_field_required'];
    formFieldStep = json['form_field_step'];
    formFieldStatus = json['form_field_status'];
    formFieldSlug = json['form_field_slug'];
    adminId = json['admin_id'];
    formFieldGroup = json['form_field_group'];
    formFieldLabel = json['form_field_label'];
    formLabelCss = json['form_label_css'];
    formInputCss = json['form_input_css'];
    formFieldPosition = json['form_field_position'];
    formFieldValidation = json['form_field_validation'];
    formErrorMsg = json['form_error_msg'];
    formFieldOption = json['form_field_option'];
    formFieldUpdate = json['form_field_update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ven_field_id'] = venFieldId;
    data['form_field_name'] = formFieldName;
    data['form_field_description'] = formFieldDescription;
    data['form_field_type'] = formFieldType;
    data['form_field_required'] = formFieldRequired;
    data['form_field_step'] = formFieldStep;
    data['form_field_status'] = formFieldStatus;
    data['form_field_slug'] = formFieldSlug;
    data['admin_id'] = adminId;
    data['form_field_group'] = formFieldGroup;
    data['form_field_label'] = formFieldLabel;
    data['form_label_css'] = formLabelCss;
    data['form_input_css'] = formInputCss;
    data['form_field_position'] = formFieldPosition;
    data['form_field_validation'] = formFieldValidation;
    data['form_error_msg'] = formErrorMsg;
    data['form_field_option'] = formFieldOption;
    data['form_field_update'] = formFieldUpdate;
    return data;
  }
}
