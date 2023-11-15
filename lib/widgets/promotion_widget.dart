import 'package:flutter/material.dart';
import 'package:woomin/models/promotion_model.dart';

class Promotion extends StatelessWidget {
  const Promotion({
    super.key,
    required this.promotion,
    required this.onTap,
  });

  final PromotionModel promotion;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 1000,
        child: Container(
          margin: const EdgeInsets.only(bottom: 15),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: SizedBox(
            height: 100,
            child: Image.network(
              promotion.bannerUrl,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
