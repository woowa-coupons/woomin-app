import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:woomin/screens/auth_equired_screen.dart';
import 'package:woomin/screens/event_screen.dart';
import 'package:woomin/screens/home_screen.dart';
import 'package:woomin/screens/join_screen.dart';
import 'package:woomin/screens/login_screen.dart';
import 'package:woomin/screens/mypage_screen.dart';
import 'package:woomin/screens/coming_soon_screen.dart';

void main() async {
  await Future.delayed(const Duration(seconds: 2));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: FToastBuilder(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xFFF3F4F6),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'HANNA Pro',
            fontSize: 60,
            color: Colors.white,
          ),
          displayMedium: TextStyle(
            fontFamily: 'HANNA Pro',
            fontSize: 32,
            color: Colors.white,
          ),
          displaySmall: TextStyle(
            fontFamily: 'HANNA Pro',
            fontSize: 20,
            color: Colors.white,
          ),
          headlineLarge: TextStyle(
            fontFamily: 'Noto Sans KR Bold',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Noto Sans KR Regular',
            fontSize: 14,
            color: Color(0xFF848181),
          ),
        ),
        cardColor: const Color(0xFF2AC1BC),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomeScreen(),
          transition: Transition.native,
          transitionDuration: const Duration(
            milliseconds: 300,
          ),
        ),
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(
          name: '/join',
          page: () => const JoinScreen(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(
            milliseconds: 300,
          ),
        ),
        GetPage(
          name: '/event',
          page: () => const EventScreen(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(
            milliseconds: 300,
          ),
        ),
        GetPage(
          name: '/my',
          page: () => const MyPageScreen(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(
            milliseconds: 300,
          ),
        ),
        GetPage(
          name: '/soon',
          page: () => const ComingSoonScreen(),
          transition: Transition.downToUp,
          transitionDuration: const Duration(
            milliseconds: 200,
          ),
        ),
        GetPage(
          name: '/unauth',
          page: () => const AuthRequiredScreen(),
          transition: Transition.downToUp,
          transitionDuration: const Duration(
            milliseconds: 200,
          ),
        ),
      ],
    );
  }
}
