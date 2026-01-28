import 'package:get/get.dart';
import 'package:wcart_vendor/http/getx_repository.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/reward_transaction_history_model.dart';

class RewardTransactionHistory extends GetxController with StateMixin {
  ApiClient apiClient = ApiClient();

  RewardTransactionHistoryModel rewardTransactionData =
      RewardTransactionHistoryModel();

  // var warehouseDropDownValue;
  @override
  void onInit() {
    print('-------Muthu-----');

    super.onInit();
    rewardTransactionHistory();
  }

  rewardTransactionHistory() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.rewardTransactionHistory, body: {
      "user_id": '211',
      "device_type": 'mobile',
      "entry_id": "23",
    }).then((value) {
      print(value);
      if (value['status']) {
        rewardTransactionData =
            RewardTransactionHistoryModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(rewardTransactionData, status: RxStatus.success());
  }
}
