import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyCouponScreen extends StatefulWidget {
  const MyCouponScreen({super.key});

  @override
  State<MyCouponScreen> createState() => _MyCouponScreenState();
}

class _MyCouponScreenState extends State<MyCouponScreen> {
  final data = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text('쿠폰함',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.house),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 7,
                    child: TextField(
                      textInputAction: TextInputAction.done,
                      style: const TextStyle(
                        decorationThickness: 0,
                      ),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: '쿠폰 번호를 입력해주세요',
                        floatingLabelStyle: TextStyle(
                          color: Theme.of(context).cardColor,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).cardColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const SizedBox(
                    height: 50,
                    child: OutlinedButton(
                      onPressed: null,
                      child: Text('쿠폰 등록'),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Text(
                  '보유 쿠폰 2장',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x1A000000),
                          offset: Offset(0, 5),
                          blurRadius: 13,
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: Color(0x0D000000),
                          offset: Offset(0, -3),
                          blurRadius: 5,
                          spreadRadius: 0,
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: const Row(
                      children: [
                        Column(
                          children: [
                            Text('5,000원'),
                            Text('10월 신규회원 할인'),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
