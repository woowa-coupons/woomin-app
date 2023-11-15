import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.categoryTitle,
    required this.urlPath,
    required this.categoryIconPath,
  });

  final String categoryTitle, urlPath, categoryIconPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(urlPath);
      },
      child: Column(children: [
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            color: Color(0xffF3F4F6),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Center(
            child: Image.asset(
              categoryIconPath,
              height: 35,
            ),
          ),
        ),
        Text(
          categoryTitle,
          style: const TextStyle(
            fontFamily: 'Noto Sans KR Regular',
            fontSize: 12,
            color: Colors.black,
          ),
        )
      ]),
    );
  }
}
