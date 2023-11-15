import 'package:flutter/material.dart';
import 'package:woomin/utils/get_toast_color.dart';
import 'package:woomin/utils/get_toast_icon.dart';

enum ToastType {
  info,
  error,
  success,
  warning,
}

class ToastItem extends StatelessWidget {
  final String message;
  final ToastType type;

  const ToastItem({
    super.key,
    required this.message,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 0,
            color: Color.fromRGBO(0, 0, 0, 0.3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            getToastIcon(type),
            color: getToastColor(type),
            size: 16,
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            message,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff232D42),
            ),
          )
        ],
      ),
    );
  }
}
