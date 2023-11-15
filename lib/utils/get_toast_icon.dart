import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:woomin/widgets/toast_item.dart';

IconData getToastIcon(ToastType type) {
  switch (type) {
    case ToastType.info:
      return FontAwesomeIcons.circleInfo;
    case ToastType.error:
      return FontAwesomeIcons.circleXmark;
    case ToastType.success:
      return FontAwesomeIcons.circleCheck;
    case ToastType.warning:
      return FontAwesomeIcons.circleExclamation;
    default:
      return FontAwesomeIcons.circleExclamation;
  }
}
