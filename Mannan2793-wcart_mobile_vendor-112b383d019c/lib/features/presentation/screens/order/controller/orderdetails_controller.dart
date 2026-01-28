import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/deleteordernote_model.dart';
import 'package:wcart_vendor/model/orderdetails_model.dart';
import 'package:wcart_vendor/model/updateorder_model.dart';
import 'package:wcart_vendor/model/updateordernote_model.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/singleton.dart';

class AllOrderController extends GetxController with StateMixin {
  ViewManageOrderModel viewAllOrderData = ViewManageOrderModel();
  UpdateOrderStatusModel updateOrderData = UpdateOrderStatusModel();
  TextEditingController orderNoteController = TextEditingController();
  AddOrderNoteModel updateOrderNoteData = AddOrderNoteModel();
  DeleteOrderNoteModel deleteOrderNote = DeleteOrderNoteModel();
  List<String> orderStatusList = [
    'Pending Payment',
    'Processing',
    'Ready to Ship',
    'Ready to Pickup',
    'In Transit',
    'Delivered',
    'Failed',
    'Cancel Initiated By Customer',
    'Cancelled',
    'Refund Initiated By Customer',
    'Initiate Pickup From Customer',
    'Picked Product From Customer',
    'Product Received and Refund Initiated',
    'Refund Completed',
    'Exchange Initiated By Customer',
    'Exchange Accepted By Admin',
    'Initiate Exchange Pickup From Customer',
    'Exchange Product From Customer',
    'Created',
    'Exchange Ready to Ship',
    'Exchange Ready to Pickup',
    'Exchange In Transit',
    'Exchange Delivered',
    'Order Placed',
    'Order Progress After Acceptance'
  ];

  String? manageorderstatusValuelist;
  // To set the order status 0  bcoz initially no data
  var orderId;

  @override
  void onInit() {
    super.onInit();
    print('Get.arguments--------');
    print(Get.arguments);
    getOrderStatusData();
    addAllMangeOrder();
  }

  addAllMangeOrder() async {
    change(orderId = Get.arguments['ordermapId'], status: RxStatus.loading());
    print(
      Singleton.instance.vendorId,
    );
    await HttpClint.urlEncoded(HttpUrl.viewOrder, body: {
      'vendorid': Singleton.instance.vendorId,
      'servicekey': Singleton.instance.serviceKey,
      'id': Get.arguments['ordermapId']
    }).then((value) {
      print('new data ----');
      print(HttpUrl.viewOrder);
      print(value);
      if (value['status']) {
        viewAllOrderData = ViewManageOrderModel.fromJson(value['data']);
        int status = viewAllOrderData.result?[0].productorderstatus ?? 0;
        change(status--);
        change(manageorderstatusValuelist = orderStatusList[status]);
      } else {
        print('error');
      }
    });
    change(viewAllOrderData, status: RxStatus.success());
  }

  getOrderStatusData() {
    print('${Get.arguments['orderstatus']} ----orderstatus--');
    int status = Get.arguments['orderstatus'];
    change(manageorderstatusValuelist = orderStatusList[status--]);
  }

  updateOrderStatus(
      {required String ordervalue, required int selectedOrderStatus}) async {
    change(selectedOrderStatus++, status: RxStatus.loading());
    print('$selectedOrderStatus ----selectedOrderStatus--');
    await HttpClint.urlEncoded(HttpUrl.updateOrderStatus, body: {
      'vendorid': Singleton.instance.vendorId ?? "",
      'servicekey': Singleton.instance.serviceKey,
      'ordermapid': orderId,
      'orderstatus': selectedOrderStatus.toString(),
    }).then((value) {
      print('new data ----');

      print(value);
      if (value['status']) {
        change(manageorderstatusValuelist = ordervalue);
        updateOrderData = UpdateOrderStatusModel.fromJson(value['data']);
        change(updateOrderData, status: RxStatus.success());
        showInfoSnackBar(updateOrderData.message ?? '');
        Navigator.pop(Get.context!);
      } else {
        print('error');
      }
    });
    change(updateOrderData, status: RxStatus.success());
  }

  addOrderNote() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.addOrderNote, body: {
      'vendorid': Singleton.instance.vendorId ?? "",
      'servicekey': Singleton.instance.serviceKey,
      'store_staff_id': '',
      'ordermapid': Get.arguments['ordermapId'],
      'tocustomer': '1',  
      'order_note': orderNoteController.text,
      'name': '',
      'email_id': ''
    }).then((value) {
      print('new data ----');

      print(value);
      if (value['status']) {
        orderNoteController.clear();
        updateOrderNoteData = AddOrderNoteModel.fromJson(value['data']);
        change(updateOrderNoteData, status: RxStatus.success());
        showInfoSnackBar(updateOrderNoteData.message!);
        Get.offAllNamed(Routes.sideBar);
      } else {
        print('error');
      }
    });
    change(updateOrderNoteData, status: RxStatus.success());
  }

  removeOrderNote() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.removeOrderNote, body: {
      'vendorid': Singleton.instance.vendorId ?? "",
      'servicekey': Singleton.instance.serviceKey,
      'store_staff_id': '',
      "note_id": ""
    }).then((value) {
      print(value);
      if (value['status']) {
        deleteOrderNote = DeleteOrderNoteModel.fromJson(value['data']);
        showSuccessSnackBar(deleteOrderNote.message!);
      } else {
        print('error');
      }
    });
    change(deleteOrderNote, status: RxStatus.success());
  }
}
