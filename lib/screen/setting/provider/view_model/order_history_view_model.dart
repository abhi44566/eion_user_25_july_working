import 'package:driver_suvidha_user/import.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/model/get_order_detail_model.dart';
import 'package:driver_suvidha_user/screen/setting/provider/repo/history_repository.dart';
import 'package:driver_suvidha_user/screen/setting/provider/model/get_order_history_model.dart';

class OrderHistoryViewModel extends ChangeNotifier {
  final _myRepo = HistoryRepository();
  bool isLoading = false;
  GetOrderHistoryModel? getOrderHistoryRes;
  GetOrderDetailModel? getHistoryDetailRes;
  Future<dynamic> getOrderHistory(BuildContext context, {String? type}) async {
    isLoading = true;
    notifyListeners();
    final userId = await MySharedPreferences.getUserId();
    try {
      getOrderHistoryRes = await _myRepo.getOrderHistoryRepo({
        'user_id': userId,
        'type': type,
      }, context);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<dynamic> getOrderHistoryDetail(BuildContext context,
      {String? bookingId}) async {
    isLoading = true;
    notifyListeners();
    final userId = await MySharedPreferences.getUserId();
    try {
      getHistoryDetailRes = await _myRepo.getBookingHistoryDetailRepo({
        'user_id': userId.toString(),
        'booking_id': bookingId.toString(),
      }, context);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
