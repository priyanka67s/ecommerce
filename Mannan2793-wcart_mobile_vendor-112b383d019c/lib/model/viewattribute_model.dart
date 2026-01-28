class ViewAttributesModel {
  String? status;
  String? message;
  List<Attributes>? attributes;

  ViewAttributesModel({this.status, this.message, this.attributes});

  ViewAttributesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(Attributes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (attributes != null) {
      data['attributes'] = attributes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attributes {
  int? id;
  int? addedby;
  String? attributename;
  String? attributeslug;

  Attributes({this.id, this.addedby, this.attributename, this.attributeslug});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addedby = json['addedby'];
    attributename = json['attributename'];
    attributeslug = json['attributeslug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['addedby'] = addedby;
    data['attributename'] = attributename;
    data['attributeslug'] = attributeslug;
    return data;
  }
}
