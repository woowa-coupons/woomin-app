import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:woomin/screens/home_screen.dart';
import 'package:woomin/utils/app_storage.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key});

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  bool isLogin = false;

  Future<void> checkToken() async {
    final accessToken = await AppStorage().read('accessToken');

    if (accessToken == null) {
      isLogin = false;
      setState(() {});
    } else {
      isLogin = true;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    checkToken(); // 페이지 진입 시 토큰 확인
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF3F4F6),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'my우민',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  IconButton(
                    visualDensity: const VisualDensity(
                      horizontal: -4.0,
                      vertical: -4.0,
                    ),
                    onPressed: () {
                      Get.offAll(const HomeScreen());
                    },
                    icon: const Icon(
                      FontAwesomeIcons.house,
                      size: 20,
                    ),
                  ),
                  isLogin
                      ? IconButton(
                          visualDensity: const VisualDensity(
                            horizontal: -4.0,
                            vertical: -4.0,
                          ),
                          onPressed: () {
                            AppStorage().delete("accessToken");
                            Get.toNamed('/');
                          },
                          icon: const Icon(
                            FontAwesomeIcons.rightFromBracket,
                            size: 20,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/user.png',
                                  height: 60,
                                ),
                                TextButton(
                                  onPressed: () {
                                    isLogin
                                        ? Get.toNamed('/soon')
                                        : Get.toNamed('/login');
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        isLogin ? '더귀한분, litae' : '로그인하고 시작하기',
                                        style: const TextStyle(
                                          fontFamily: 'Noto Sans KR Regular',
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(
                                        FontAwesomeIcons.chevronRight,
                                        size: 16,
                                        color: Color(0xff848181),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    isLogin
                                        ? Get.toNamed('/soon')
                                        : Get.toNamed('/unauth');
                                  },
                                  child: Column(children: [
                                    Image.asset(
                                      'assets/icons/list.png',
                                      height: 35,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      '주문내역',
                                      style: TextStyle(
                                        fontFamily: 'Noto Sans KR Regular',
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ]),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    isLogin
                                        ? Get.toNamed('/soon')
                                        : Get.toNamed('/unauth');
                                  },
                                  child: Column(children: [
                                    Image.asset(
                                      'assets/icons/heart.png',
                                      height: 35,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      '나의 찜',
                                      style: TextStyle(
                                        fontFamily: 'Noto Sans KR Regular',
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ]),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    isLogin
                                        ? Get.toNamed('/soon')
                                        : Get.toNamed('/unauth');
                                  },
                                  child: Column(children: [
                                    Image.asset(
                                      'assets/icons/reviews.png',
                                      height: 35,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      '리뷰 관리',
                                      style: TextStyle(
                                        fontFamily: 'Noto Sans KR Regular',
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ]),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 20, right: 20, bottom: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: const Color(0xffD0D5DD)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    isLogin
                                        ? Get.toNamed('/soon')
                                        : Get.toNamed('/unauth');
                                  },
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/icons/coupon.png',
                                          height: 35,
                                        ),
                                        Text(
                                          isLogin ? '5장' : '',
                                          style: const TextStyle(
                                            fontFamily: 'Noto Sans KR Bold',
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const Text(
                                          '쿠폰함',
                                          style: TextStyle(
                                            fontFamily: 'Noto Sans KR Regular',
                                            fontSize: 14,
                                            color: Color(0xff848181),
                                          ),
                                        ),
                                      ]),
                                ),
                                Container(
                                  width: 1,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                      color: Color(0xffF3F4F6)),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    isLogin
                                        ? Get.toNamed('/soon')
                                        : Get.toNamed('/unauth');
                                  },
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/icons/point.png',
                                          height: 35,
                                        ),
                                        Text(
                                          isLogin ? '3270원' : '',
                                          style: const TextStyle(
                                            fontFamily: 'Noto Sans KR Bold',
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const Text(
                                          '포인트',
                                          style: TextStyle(
                                            fontFamily: 'Noto Sans KR Regular',
                                            fontSize: 14,
                                            color: Color(0xff848181),
                                          ),
                                        ),
                                      ]),
                                ),
                                Container(
                                  width: 1,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                      color: Color(0xffF3F4F6)),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    isLogin
                                        ? Get.toNamed('/soon')
                                        : Get.toNamed('/unauth');
                                  },
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/icons/gift.png',
                                          height: 35,
                                        ),
                                        Text(
                                          isLogin ? '0원' : '',
                                          style: const TextStyle(
                                            fontFamily: 'Noto Sans KR Bold',
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const Text(
                                          '받은 선물',
                                          style: TextStyle(
                                            fontFamily: 'Noto Sans KR Regular',
                                            fontSize: 14,
                                            color: Color(0xff848181),
                                          ),
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              isLogin
                                  ? Get.toNamed('/soon')
                                  : Get.toNamed('/unauth');
                            },
                            child: Container(
                                clipBehavior: Clip.hardEdge,
                                height: 120,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: const Color(0xffD0D5DD)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 70,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.asset(
                                                'assets/images/woomin_pay.png'),
                                            const SizedBox(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    '충전하기',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'Noto Sans KR Bold',
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Icon(
                                                    FontAwesomeIcons
                                                        .chevronRight,
                                                    size: 16,
                                                    color: Color(0xff848181),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 48,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: Color.fromRGBO(
                                                76, 161, 222, 0.1)),
                                        child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '머니로 결제하고',
                                                style: TextStyle(
                                                  fontFamily:
                                                      'Noto Sans KR Bold',
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                '포인트',
                                                style: TextStyle(
                                                  fontFamily:
                                                      'Noto Sans KR Bold',
                                                  fontSize: 14,
                                                  color: Color(0xff4A6CC3),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                '적립 받으세요',
                                                style: TextStyle(
                                                  fontFamily:
                                                      'Noto Sans KR Bold',
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                              )
                                            ]),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              isLogin
                                  ? Get.toNamed('/soon')
                                  : Get.toNamed('/unauth');
                            },
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              height: 120,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: const Color(0xffD0D5DD)),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 59,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                              'assets/images/family_account.png'),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1,
                                                color: const Color.fromARGB(
                                                    255, 225, 232, 244),
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(16)),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 4,
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    '더 알아보기',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'Noto Sans KR Regular',
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  Icon(
                                                    FontAwesomeIcons
                                                        .chevronRight,
                                                    size: 12,
                                                    color: Color(0xff848181),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      height: 59,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 20),
                                            child: Column(
                                              children: [
                                                Text(
                                                  '가족의 끼니를 더 쉽게 챙겨줄 수 있어요',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'Noto Sans KR Regular',
                                                      fontSize: 11,
                                                      color: Color(0xff848181)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Image.asset(
                                            'assets/images/duo.png',
                                            height: 59,
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
