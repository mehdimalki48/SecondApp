import 'package:http/http.dart' as http;
import 'package:fmtmimi/constants/strings.dart';
import 'package:fmtmimi/services/api/api_client.dart';
import 'package:fmtmimi/services/api/app_config.dart';

class CouponRepo {
  final ApiClient apiClient;

  CouponRepo({required this.apiClient});

  ///Fetch Coupon list
  Future<http.Response> getCouponList(
    String offset, {
    String perPage = '15',
    String code = '',
  }) async {
    var url =
        couponUri + '?page=$offset&per_page=$perPage&code=$code&$authCCToken&';
    return await apiClient.getData(
      url,
    );
  }
}
