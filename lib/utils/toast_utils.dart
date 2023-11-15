import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:woomin/widgets/toast_item.dart';

class ToastUtils {
  static late FToast fToast;

  static void init(BuildContext context) {
    fToast = FToast();
    fToast.init(context);
  }

  static void showToast(String msg, ToastType type) {
    fToast.showToast(
      child: ToastItem(
        message: msg,
        type: type,
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
