import 'package:flutter/material.dart';
import 'package:woomin/services/api.dart';
import 'package:woomin/utils/toast_utils.dart';
import 'package:woomin/widgets/toast_item.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nicknameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ToastUtils.init(context); // ToastUtils 초기화
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nicknameController.dispose();
    super.dispose();
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
        title: const Text('회원가입',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 40,
            top: 100,
            right: 40,
            bottom: 40,
          ),
          child: Column(
            children: [
              TextField(
                controller: emailController,
                onChanged: (text) {
                  setState(() {});
                },
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
                onChanged: (text) {
                  setState(() {});
                },
                obscureText: true,
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
                height: 20,
              ),
              TextField(
                controller: confirmPasswordController,
                onChanged: (text) {
                  setState(() {});
                },
                obscureText: true,
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
                  labelText: '비밀번호 확인',
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
                controller: nicknameController,
                onChanged: (text) {
                  setState(() {});
                },
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
                  labelText: '닉네임',
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
                    final statusCode = await ApiService.postJoinRequest(
                      emailController.text,
                      nicknameController.text,
                      passwordController.text,
                    );
                    if (statusCode == 201) {
                      ToastUtils.showToast('회원가입 성공', ToastType.success);
                    } else {
                      ToastUtils.showToast(
                          '회원가입 실패, 다시 시도해주세요', ToastType.error);
                    }
                  },
                  child: const Text(
                    '회원가입',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
