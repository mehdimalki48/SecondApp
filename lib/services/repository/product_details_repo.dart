import 'package:fmtmimi/constants/strings.dart';
import 'package:fmtmimi/services/api/api_client.dart';
import 'package:http/http.dart' as http;
import 'package:fmtmimi/services/api/app_config.dart';

class ProductDetailsRepo {
  final ApiClient apiClient;

  ProductDetailsRepo({
    required this.apiClient,
  });

  Future<http.Response> getProductDetails({required String id}) async {
    var url = productList + '/$id?$authCCToken&';

    return await apiClient.getData(url);
  }
}
