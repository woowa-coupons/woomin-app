import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:woomin/constants/category_data.dart';
import 'package:woomin/utils/toast_utils.dart';
import 'package:woomin/widgets/category_button.dart';
import 'package:woomin/widgets/main_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _bottomNavIndex = 0;

  void _onTap(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
    if (_bottomNavIndex == 3) {
      Get.toNamed('/my');
    } else {
      Get.toNamed('/soon');
    }
  }

  final iconList = <IconData>[
    FontAwesomeIcons.magnifyingGlass,
    FontAwesomeIcons.heart,
    FontAwesomeIcons.list,
    FontAwesomeIcons.faceSmile,
  ];

  @override
  void initState() {
    super.initState();
    ToastUtils.init(context); // ToastUtils 초기화
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: Theme.of(context).cardColor,
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text(
                  '우리집',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const Icon(
                  Icons.arrow_drop_down_rounded,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
        leadingWidth: 300,
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
                    Get.toNamed('/soon');
                  },
                  icon: const Icon(
                    Icons.grid_view_outlined,
                    size: 24,
                  ),
                ),
                IconButton(
                  visualDensity: const VisualDensity(
                    horizontal: -4.0,
                    vertical: -4.0,
                  ),
                  onPressed: () {
                    Get.toNamed('/soon');
                  },
                  icon: const Icon(
                    Icons.notifications_none_rounded,
                    size: 24,
                  ),
                ),
                IconButton(
                  visualDensity: const VisualDensity(
                    horizontal: -4.0,
                    vertical: -4.0,
                  ),
                  onPressed: () {
                    Get.toNamed('/soon');
                  },
                  icon: const Icon(
                    Icons.shopping_basket_outlined,
                    size: 24,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 20,
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed('/soon');
                  },
                  child: Container(
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 2,
                          spreadRadius: 0,
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.magnifyingGlass,
                            size: 20,
                            color: Color(0xff2AC1BC),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('닭볶음탕 나와라 뚝딱!!')
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 20,
                right: 20,
                bottom: 30,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/event');
                    },
                    child: Container(
                      height: 60,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF2AC1BC),
                            Color(0xFF36A5B2),
                            Color(0xFF7A0075),
                            Color(0xFF1100D1),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Center(
                          child: Container(
                            height: 58,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('역대급 혜택 ',
                                    style: TextStyle(
                                      fontFamily: 'Noto Sans KR Regular',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff232D42),
                                    )),
                                const Text('17,000원 쿠폰팩',
                                    style: TextStyle(
                                      fontFamily: 'Noto Sans KR Regular',
                                      fontSize: 14,
                                      color: Color(0xff232D42),
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  'assets/icons/coupon.png',
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 110,
                    child: Row(
                      children: [
                        MainButton(
                          onTapAction: () {
                            Get.toNamed('/soon');
                          },
                          mainTitle: '배민',
                          firstBody: '요즘 우민',
                          secondBody: '맛집은?',
                          imagePath: 'assets/images/delivery.png',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        MainButton(
                          onTapAction: () {
                            Get.toNamed('/soon');
                          },
                          mainTitle: 'W마트',
                          firstBody: '슈퍼W마트데이',
                          secondBody: '역대급 혜택',
                          imagePath: 'assets/icons/mart.png',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        MainButton(
                          onTapAction: () {
                            Get.toNamed('/soon');
                          },
                          mainTitle: '우민스토어',
                          firstBody: '홈플익스프레스',
                          secondBody: '신선 장보기',
                          imagePath: 'assets/images/store.png',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                      height: 220,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            bottom: 12,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed('/soon');
                                  },
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '알뜰∙한집배달',
                                            style: TextStyle(
                                              fontFamily: 'HANNA Pro',
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '매일 드려요 할인 쿠폰',
                                            style: TextStyle(
                                              fontFamily:
                                                  'Noto Sans KR Regular',
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                      Icon(
                                        FontAwesomeIcons.chevronRight,
                                        size: 15,
                                        color: Color(0xff4E4E4E),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: categoryData[0]
                                        .map((category) => CategoryButton(
                                              categoryTitle:
                                                  category['title'] as String,
                                              urlPath:
                                                  category['urlPath'] as String,
                                              categoryIconPath:
                                                  category['iconPath']
                                                      as String,
                                            ))
                                        .toList(),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: categoryData[1]
                                        .map((category) => CategoryButton(
                                              categoryTitle:
                                                  category['title'] as String,
                                              urlPath:
                                                  category['urlPath'] as String,
                                              categoryIconPath:
                                                  category['iconPath']
                                                      as String,
                                            ))
                                        .toList(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).cardColor,
        child: Text(
          '우민',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Colors.white,
        icons: const [
          FontAwesomeIcons.magnifyingGlass,
          FontAwesomeIcons.heart,
          FontAwesomeIcons.list,
          FontAwesomeIcons.faceSmile,
        ],
        activeIndex: _bottomNavIndex,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: _onTap,
      ),
    );
  }
}
