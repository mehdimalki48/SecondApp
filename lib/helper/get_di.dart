import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fmtmimi/controllers/address_book_controller.dart';
import 'package:fmtmimi/controllers/auth_controller.dart';
import 'package:fmtmimi/controllers/cart_controller.dart';
import 'package:fmtmimi/controllers/category_controller.dart';
import 'package:fmtmimi/controllers/checkout_controller.dart';
import 'package:fmtmimi/controllers/coupon_controller.dart';
import 'package:fmtmimi/controllers/favorite_controller.dart';
import 'package:fmtmimi/controllers/filter_controller.dart';
import 'package:fmtmimi/controllers/home_controller.dart';
import 'package:fmtmimi/controllers/orders_controller.dart';
import 'package:fmtmimi/controllers/product_controller.dart';
import 'package:fmtmimi/controllers/product_details_controller.dart';
import 'package:fmtmimi/controllers/recent_post_controller.dart';
import 'package:fmtmimi/controllers/review_controller.dart';
import 'package:fmtmimi/controllers/suggestion_controller.dart';
import 'package:fmtmimi/controllers/theme_controller.dart';
import 'package:fmtmimi/main.dart';
import 'package:fmtmimi/services/api/api_client.dart';
import 'package:fmtmimi/services/api/app_config.dart';
import 'package:fmtmimi/services/repository/auth_repo.dart';
import 'package:fmtmimi/services/repository/category_repo.dart';
import 'package:fmtmimi/services/repository/coupon_repo.dart';
import 'package:fmtmimi/services/repository/order_repo.dart';
import 'package:fmtmimi/services/repository/product_details_repo.dart';
import 'package:fmtmimi/services/repository/product_repo.dart';
import 'package:fmtmimi/services/repository/review_repo.dart';

import '../controllers/home_review_controller.dart';
import '../controllers/notifications_controller.dart';
import '../services/repository/notification_repo.dart';

Future<void> init() async {
  /// Core
  prefs = await SharedPreferences.getInstance();
  Get.lazyPut(
    () => prefs,
  );
  Get.lazyPut(() => ApiClient(appBaseUrl: baseUrl), fenix: true);

  /// theme Controller
  Get.lazyPut(
    () => ThemeController(),
    fenix: true,
  );

  /// Repositories
  Get.lazyPut(
    () => ProductRepo(apiClient: Get.find()),
    fenix: true,
  );
  Get.lazyPut(
    () => CategoryRepo(apiClient: Get.find()),
    fenix: true,
  );
  Get.lazyPut(
    () => ProductDetailsRepo(apiClient: Get.find()),
    fenix: true,
  );
  Get.lazyPut(
    () => ReviewRepo(apiClient: Get.find()),
    fenix: true,
  );
  Get.lazyPut(
    () => AuthRepo(apiClient: Get.find()),
    fenix: true,
  );
  Get.lazyPut(
    () => CouponRepo(apiClient: Get.find()),
    fenix: true,
  );
  Get.lazyPut(
    () => OrdersRepo(apiClient: Get.find()),
    fenix: true,
  );
  Get.lazyPut(
      () =>
          NotificationRepo(apiClient: ApiClient(appBaseUrl: kOnesignalListUri)),
      fenix: true);

  /// sqlite database controllers
  Get.lazyPut(
    () => SuggestionController(),
    fenix: true,
  );
  Get.lazyPut(
    () => FavoriteController(),
    fenix: true,
  );
  Get.lazyPut(
    () => AddressBookController(),
    fenix: true,
  );
  Get.lazyPut(
    () => RecentController(apiClient: Get.find()),
    fenix: true,
  );
  Get.lazyPut(
    () => CartController(authRepo: Get.find()),
    fenix: true,
  );

  /// Controllers
  Get.lazyPut(
    () => ProductController(productRepo: Get.find()),
    fenix: true,
  );
  Get.lazyPut(
    () => HomeController(productRepo: Get.find(), authRepo: Get.find()),
    fenix: true,
  );
  Get.lazyPut(
    () => ProductDetailsController(
      productDetailsRepo: Get.find(),
      ordersRepo: Get.find(),
    ),
    fenix: true,
  );
  Get.lazyPut(
    () => CategoryController(categoryRepo: Get.find()),
    fenix: true,
  );
  Get.lazyPut(
    () => FilterController(),
    fenix: true,
  );

  Get.lazyPut(
    () => ReviewController(reviewRepo: Get.find()),
    fenix: true,
  );
  Get.lazyPut(
    () => HomeReviewController(
      reviewRepo: Get.find(),
      productDetailsRepo: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => AuthController(authRepo: Get.find()),
    fenix: true,
  );

  Get.lazyPut(
    () => CouponController(
      authRepo: Get.find(),
      couponRepo: Get.find(),
    ),
    fenix: true,
  );
  Get.lazyPut(
    () => OrdersController(
      authRepo: Get.find(),
      ordersRepo: Get.find(),
    ),
    fenix: true,
  );
  Get.lazyPut(
    () => CheckoutController(
      authRepo: Get.find(),
      orders: Get.find(),
    ),
    fenix: true,
  );
  Get.lazyPut(
    () => NotificationsController(
      notificationRepo: Get.find(),
    ),
    fenix: true,
  );
}
