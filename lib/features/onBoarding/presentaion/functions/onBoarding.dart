import 'package:first_app/core/database/cach/cach_helper.dart';
import 'package:first_app/core/services/services_locator.dart';

void onBoardingVisited() {
  getIt<CacheHelper>().saveData(key: "isVisitedOnBoardingView", value: true);
}
