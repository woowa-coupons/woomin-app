import 'package:flutter/material.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          centerTitle: true,
          title: const Text('우민알림센터',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )),
        ),
        body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/no.png',
                height: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Coming Soon',
                style: TextStyle(
                  fontFamily: 'HANNA Pro',
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              const Text(
                '아직 구현하지 못한 기능이에요...',
                style: TextStyle(
                  fontFamily: 'Noto Sans KR Bold',
                  fontSize: 14,
                  color: Colors.black,
                ),
              )
            ],
          )
        ]));
  }
}
