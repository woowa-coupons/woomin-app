import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AuthRequiredScreen extends StatelessWidget {
  const AuthRequiredScreen({super.key});

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
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                '아직 회원이 아니신가요?',
                style: TextStyle(
                  fontFamily: 'HANNA Pro',
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                '로그인이 필요한 서비스입니다',
                style: TextStyle(
                  fontFamily: 'Noto Sans KR Bold',
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton(
                onPressed: () {
                  Get.toNamed('/login');
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  side: const BorderSide(
                    width: 1,
                    color: Color(0xffD0D5DD),
                  ),
                ),
                child: const Text(
                  '로그인하기',
                  style: TextStyle(
                    fontFamily: 'Noto Sans KR Regular',
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Image.asset('assets/images/unauth.png')
            ],
          ),
        ),
      ),
    );
  }
}
