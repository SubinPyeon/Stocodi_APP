import 'package:flutter/material.dart';
import '../../widgets/green_long_btn.dart';
import '../login/login.dart';

class SignDone extends StatefulWidget {
  const SignDone({super.key});

  @override
  State<SignDone> createState() => _SignDoneState();
}

class _SignDoneState extends State<SignDone> {
  bool isTyping = false;
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.08,
              MediaQuery.of(context).padding.top +
                  MediaQuery.of(context).size.height * 0.02,
              MediaQuery.of(context).size.width * 0.08,
              MediaQuery.of(context).size.height * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/images/back_toggle.png',
                  width: MediaQuery.of(context).size.width * 0.025,
                  height: MediaQuery.of(context).size.height * 0.022,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.055,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '닉네임 ',
                    style: TextStyle(
                      color: Color(0xFF191919),
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Pretendard Variable',
                    ),
                  ),
                  Text(
                    '님,',
                    style: TextStyle(
                      color: Color(0xFF191919),
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Pretendard Variable',
                    ),
                  ),
                ],
              ),
              const Text(
                '환영해요!',
                style: TextStyle(
                  color: Color(0xFF0ECB81),
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Pretendard Variable',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0067,
              ),
              const Text(
                '회원가입이 완료되었습니다.',
                style: TextStyle(
                  color: Color(0xFF767676),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Pretendard Variable',
                ),
              ),
              const Text(
                'Stocodi 와 함께 새로운 투자 경험을 만들어봐요.',
                style: TextStyle(
                  color: Color(0xFF767676),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Pretendard Variable',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.078,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/fire.png',
                    width: MediaQuery.of(context).size.width * 0.615,
                    height: MediaQuery.of(context).size.width * 0.615,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.203,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, //여기도 다시 수정해야 함
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: GreenLongBtn(
                  text: '메인으로',
                  height: MediaQuery.of(context).size.height * 0.067,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
