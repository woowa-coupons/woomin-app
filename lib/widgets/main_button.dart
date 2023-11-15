import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.onTapAction,
    required this.mainTitle,
    required this.firstBody,
    required this.secondBody,
    required this.imagePath,
  });

  final void Function() onTapAction;
  final String mainTitle, firstBody, secondBody, imagePath;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: onTapAction,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8,
              top: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mainTitle,
                  style: const TextStyle(
                    fontFamily: 'HANNA Pro',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  firstBody,
                  style: const TextStyle(
                    fontFamily: 'Noto Sans KR Regular',
                    fontSize: 12,
                    color: Color(0xff232D42),
                  ),
                ),
                Text(
                  secondBody,
                  style: const TextStyle(
                    fontFamily: 'Noto Sans KR Regular',
                    fontSize: 12,
                    color: Color(0xff232D42),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      imagePath,
                      height: 40,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
