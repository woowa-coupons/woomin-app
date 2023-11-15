import 'package:flutter/material.dart';
import 'package:woomin/widgets/toast_item.dart';

Color getToastColor(ToastType type) {
  switch (type) {
    case ToastType.info:
      return Colors.blue;
    case ToastType.error:
      return Colors.red;
    case ToastType.success:
      return Colors.green;
    case ToastType.warning:
      return Colors.orange;
    default:
      return Colors.grey;
  }
}
