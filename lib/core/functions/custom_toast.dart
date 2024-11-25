import 'package:first_app/core/utils/app_color.dart';
import 'package:fluttertoast/fluttertoast.dart';

customToast(String msg) {
  Fluttertoast.showToast(msg: msg,
  backgroundColor: AppColors.primaryColor,
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.CENTER);
}
