import 'package:fmtmimi/constants/strings.dart';
import 'package:fmtmimi/services/api/api_client.dart';
import 'package:http/http.dart' as http;
import 'package:fmtmimi/services/api/app_config.dart';

class ReviewRepo {
  final ApiClient apiClient;

  ReviewRepo({
    required this.apiClient,
  });

  Future<http.Response> getReviewList({
    String id = '0',
  }) async {
    var url = reviewList + '?product=$id&$authCCToken&';

    return await apiClient.getData(url);
  }

  Future<http.Response> getAllReviewList({
    String offset = '1',
  }) async {
    var url = reviewList + '?per_page=10&page=$offset&$authCCToken&';
    return await apiClient.getData(url);
  }
}
