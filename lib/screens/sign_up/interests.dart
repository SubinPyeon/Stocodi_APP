import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/sign_up/signup_done.dart';
import '../../API/retrofit/auth_manager.dart';
import '../../model/auth/request/members_model.dart';
import '../../widgets/green_long_btn.dart';
import '../../widgets/interest_Box.dart';

class Interest extends StatefulWidget {
  final String enteredEmail;
  final String enteredPwd;
  final String enteredName;
  final String enteredPhone;
  final String enteredBirth;
  final String enteredNickName;

  const Interest({
    Key? key,
    required this.enteredEmail,
    required this.enteredPwd,
    required this.enteredName,
    required this.enteredPhone,
    required this.enteredBirth,
    required this.enteredNickName,
  }) : super(key: key);

  @override
  State<Interest> createState() => _InterestState();
}

class _InterestState extends State<Interest> {
  final List<InterestItem> interestItems = [
    InterestItem('의료', 'medical'),
    InterestItem('금융', 'money'),
    InterestItem('IT', 'laptop'),
    InterestItem('통신서비스', 'chat'),
    InterestItem('유틸리티', 'util'),
    InterestItem('에너지', 'energy'),
    InterestItem('소재', 'material'),
    InterestItem('산업재', 'material'),
    InterestItem('경기소비재', 'material'),
    InterestItem('종목', 'util'),
    InterestItem('종목', 'util'),
    InterestItem('종목', 'util'),
    InterestItem('종목', 'util'),
    InterestItem('종목', 'util'),
    InterestItem('종목', 'util'),
  ];

  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.08,
          MediaQuery.of(context).padding.top +
              MediaQuery.of(context).size.height * 0.02,
          MediaQuery.of(context).size.width * 0.08,
          MediaQuery.of(context).size.height * 0.03,
        ),
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
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text(
              '관심종목이 있나요?',
              style: TextStyle(
                color: Color(0xFF191919),
                fontSize: 28,
                fontWeight: FontWeight.w600,
                fontFamily: 'Pretendard Variable',
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.013,
            ),
            const Text(
              '관심 종목을 선택한 후 맞춤화된 서비스를 만나보세요!',
              style: TextStyle(
                color: Color(0xFF767676),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Pretendard Variable',
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.033,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: buildInterestRows(),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            GestureDetector(
              onTap: () async {
                final authenticationManager = AuthenticationManager();

                // Create a MembersRequest object
                MembersRequest membersRequest = MembersRequest(
                  email: widget.enteredEmail,
                  password: widget.enteredPwd,
                  name: widget.enteredName,
                  nickname: widget.enteredNickName,
                  gender: 'male', // 이부분 ui에 실제 반영안됨!! 다시 수정해야함!
                  interest_categories: selectedItems,
                  birth_date: widget.enteredBirth,
                );

                await authenticationManager.signUp(membersRequest);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignDone(),
                  ),
                );
              },
              child: GreenLongBtn(
                text: '다음으로',
                height: MediaQuery.of(context).size.height * 0.067,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildInterestRows() {
    List<Widget> rows = [];

    for (int i = 0; i < interestItems.length; i += 3) {
      List<Widget> rowChildren = [];
      for (int j = i; j < i + 3 && j < interestItems.length; j++) {
        rowChildren.add(
          InterestBox(
            imgName: interestItems[j].imgName,
            text: interestItems[j].text,
            length: MediaQuery.of(context).size.width * 0.24,
            howmuch: MediaQuery.of(context).size.height * 0.01,
            isSelected: interestItems[j].isSelected,
            onTap: () {
              // Update selectedItems list based on item selection
              setState(() {
                interestItems[j].isSelected = !interestItems[j].isSelected;

                if (interestItems[j].isSelected) {
                  selectedItems.add(interestItems[j].text);
                } else {
                  selectedItems.remove(interestItems[j].text);
                }
              });
            },
          ),
        );
      }

      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: rowChildren,
        ),
      );

      if (i + 3 < interestItems.length) {
        rows.add(
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
        );
      }
    }

    return rows;
  }
}

class InterestItem {
  final String text;
  final String imgName;
  bool isSelected;

  InterestItem(this.text, this.imgName, {bool? isSelected})
      : isSelected = isSelected ?? false;
}
