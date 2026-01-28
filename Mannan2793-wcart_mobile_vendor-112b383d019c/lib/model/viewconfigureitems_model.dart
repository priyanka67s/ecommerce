class ViewConfigureItemModel {
  String? status;
  String? message;
  List<ViewConfigureitem>? viewConfigureitem;

  ViewConfigureItemModel({this.status, this.message, this.viewConfigureitem});

  ViewConfigureItemModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['view_configureitem'] != null) {
      viewConfigureitem = <ViewConfigureitem>[];
      json['view_configureitem'].forEach((v) {
        viewConfigureitem!.add(ViewConfigureitem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (viewConfigureitem != null) {
      data['view_configureitem'] =
          viewConfigureitem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ViewConfigureitem {
  int? id;
  int? addedby;
  String? attrSlug;
  String? itemname;
  String? itemslug;

  ViewConfigureitem(
      {this.id, this.addedby, this.attrSlug, this.itemname, this.itemslug});

  ViewConfigureitem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addedby = json['addedby'];
    attrSlug = json['attr_slug'];
    itemname = json['itemname'];
    itemslug = json['itemslug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['addedby'] = addedby;
    data['attr_slug'] = attrSlug;
    data['itemname'] = itemname;
    data['itemslug'] = itemslug;
    return data;
  }
}
