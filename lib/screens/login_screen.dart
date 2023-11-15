import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:woomin/services/api.dart';
import 'package:woomin/utils/toast_utils.dart';
import 'package:woomin/widgets/toast_item.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ToastUtils.init(context); // ToastUtils 초기화
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF3F4F6),
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            FontAwesomeIcons.x,
            size: 20,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            child: Center(
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '우아',
                        style: TextStyle(
                          fontFamily: 'HANNA Pro',
                          fontSize: 60,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '의',
                        style: TextStyle(
                          fontFamily: 'HANNA Pro',
                          fontSize: 32,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '민족',
                        style: TextStyle(
                          fontFamily: 'HANNA Pro',
                          fontSize: 60,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 80,
                        child: Image.asset('assets/images/duo.png'),
                      ),
                    ],
                  ),
                  TextField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    style: const TextStyle(
                      decorationThickness: 0,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(
                            0xffD0D5DD,
                          ),
                        ),
                      ),
                      labelText: '아이디(이메일)',
                      floatingLabelStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    style: const TextStyle(
                      decorationThickness: 0,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(
                            0xffD0D5DD,
                          ),
                        ),
                      ),
                      labelText: '비밀번호',
                      floatingLabelStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 70,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).cardColor,
                        minimumSize: const Size.fromHeight(70),
                        elevation: 0,
                      ),
                      onPressed: () async {
                        final statusCode = await ApiService.postLogin(
                          emailController.text,
                          passwordController.text,
                        );

                        if (statusCode == 200) {
                          ToastUtils.showToast('로그인 성공', ToastType.success);
                        } else {
                          ToastUtils.showToast(
                              '아이디와 비밀번호를 확인해주세요', ToastType.error);
                        }
                      },
                      child: const Text(
                        '로그인',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/join');
                    },
                    child: const Text(
                      '회원가입하기',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
