import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stocodi_app/app.dart';
import 'package:stocodi_app/retrofit/HttpService.dart';
import 'package:stocodi_app/sign_up/signup.dart';
import 'package:stocodi_app/widgets/green_longbtn.dart';
import 'package:stocodi_app/widgets/new_inputfield.dart';
import '../home/home.dart';
import '../retrofit/httpdto/request/auth/login_model.dart';
import 'package:stocodi_app/app.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String enteredEmail = '';
  String enteredPassword = '';
  bool? _isChecked = false;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadSavedEmail();
  }

  Future<void> _loadSavedEmail() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      enteredEmail = _prefs.getString('savedEmail') ?? '';
      _isChecked = enteredEmail.isNotEmpty;
    });
  }

  void _saveEmail() {
    if (_isChecked == true) {
      _prefs.setString('savedEmail', enteredEmail);
    } else {
      _prefs.remove('savedEmail');
    }
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  leading: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: IconButton(
                      icon: Image.asset(
                        'assets/images/back.png',
                        width: 10,
                        height: 20,
                      ),
                      onPressed: null,
                    ),
                  ),
                  title: Text(
                    "로그인",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                margin: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    NewInputField(
                      focus: true,
                      image: Icon(Icons.mail, size: 20),
                      text: "메일을 입력해주세요",
                      obscure: false,
                      inputtype: TextInputType.emailAddress,
                      // onTextChanged 콜백을 통해 입력된 텍스트 업데이트
                      onTextChanged: (email) {
                        setState(() {
                          enteredEmail = email;
                        });
                      },
                    ),
                    SizedBox(height: 12),
                    NewInputField(
                      focus: true,
                      image: Icon(Icons.lock, size: 20),
                      text: '비밀번호를 입력해주세요',
                      obscure: true,
                      inputtype: TextInputType.text,
                      // onTextChanged 콜백을 통해 입력된 텍스트 업데이트
                      onTextChanged: (password) {
                        setState(() {
                          enteredPassword = password;
                        });
                      },
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Transform.scale(
                                  scale: 1.2,
                                  child: Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Color(0xFF9EB2AC),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    value: _isChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        _isChecked = value;
                                        _saveEmail(); // 이메일 저장
                                      });
                                    },
                                    side: BorderSide(
                                      color: Color(0xFF9EB2AC),
                                      strokeAlign: 0,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                                Text(
                                  "아이디 저장",
                                  style: TextStyle(
                                      color: Color(0xFF9EB2AC), fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "아이디/비밀번호 찾기",
                            style: TextStyle(
                                color: Color(0xFF9EB2AC), fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final authenticationManager = AuthenticationManager();
                        LoginRequest tologin = LoginRequest(
                          email: enteredEmail,
                          password: enteredPassword,
                        );
                        try {
                          // 로그인 요청
                          var loginResponse =
                              await authenticationManager.login(tologin);

                          // 로그인이 실패하면 토스트 메시지를 표시
                          if (loginResponse == null) {
                            showToast('로그인 정보가 일치하지 않습니다.');
                          } else {
                            print(
                                "이메일 : $enteredEmail 비밀번호 : $enteredPassword");
                            // 로그인 성공 시 현재 화면을 AppScreen으로 대체, 로그인하면 login 페이지 못 가게 다 막기
                            Navigator.pop(context);

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AppScreen(),
                              ),
                            );
                          }
                        } catch (e) {
                          // Dio 오류 또는 다른 예외가 발생한 경우
                          print('오류 발생: $e');
                          showToast('로그인 중 오류가 발생했습니다.');
                        }
                      },
                      child: GreenLongBtn(
                        text: '다음으로',
                        height: 60,
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AppScreen()),
                            );
                          },
                          child: Container(
                            width: 70,
                            height: 56,
                            padding: EdgeInsets.all(17),
                            margin: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Color(0xFFEBEBEB)),
                              image: DecorationImage(
                                image: AssetImage("assets/images/Google.png"),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AppScreen()),
                            );
                          },
                          child: Container(
                            width: 70,
                            height: 56,
                            padding: EdgeInsets.all(17),
                            margin: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Color(0xFFEBEBEB)),
                              image: DecorationImage(
                                image: AssetImage("assets/images/Naver.png"),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AppScreen()),
                            );
                          },
                          child: Container(
                            width: 70,
                            height: 56,
                            padding: EdgeInsets.all(17),
                            margin: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Color(0xFFEBEBEB)),
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/KakaoTalk.png"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("아직 계정이 없다면"),
                          SizedBox(width: 7),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Signup(), // Signup 화면으로 이동
                                ),
                              );
                            },
                            child: Text(
                              "회원가입",
                              style: TextStyle(
                                color: Color(0xFF0ECB81),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
