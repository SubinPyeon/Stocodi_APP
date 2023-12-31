import 'package:flutter/material.dart';
import '../../../API/retrofit/auth_manager.dart';
import '../../../model/lecture/request/comment_model.dart';
import '../../../model/lecture/response/comment_response.dart';
import '../Item/comment_item.dart';

class LectureComment extends StatefulWidget  {
  final int lectureId;
  final Function(int) onCommentCountChanged;
  const LectureComment(this.lectureId, {required this.onCommentCountChanged, Key? key}) : super(key: key);
  @override
  _LectureCommentState createState() => _LectureCommentState();
}

class _LectureCommentState extends State<LectureComment> {
  late List<CommentResponse> commentList = [];

  get lectureId => null; // Initialize courseList as an empty list

  @override
  void initState() {
    super.initState();
    setCommentList(); // Call setCourseList when the widget is initialized
  }

  Future<void> setCommentList() async {
    try {
      final authenticationManager = AuthenticationManager();
      final fetchedCourseList = await authenticationManager.getComments(widget.lectureId);
      setState(() {
        commentList = fetchedCourseList ?? []; // Use fetchedCourseList or an empty list if null
        widget.onCommentCountChanged(commentList.length);
      });
    } catch (e) {
      print('Error fetching comment list: $e');
      // Handle error, show a snackbar, etc.
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: 65,
              child: LectureMyComment(
                imageUrl: 'assets/kakao.jpg',
                lectureId: widget.lectureId,
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isNarrowScreen = constraints.maxWidth < 600; // 예시 너비 (조정 가능)

                  return ListView.builder( //여기에 commentList를 해서 보내고 싶어
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: commentList.length,
                    itemBuilder: (context, index) {
                      CommentResponse comment = commentList[index]; // 각각의 댓글을 가져옴
                      return CommentItem(
                        name: comment.author, // 예시: 댓글 이름
                        profileImage: 'assets/kakao.jpg', // 예시: 프로필 이미지
                        text: comment.content,
                        created: comment.created_at, // 예시: 댓글 텍스트
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LectureMyComment extends StatefulWidget {
  final String imageUrl;
  final int lectureId;

  const LectureMyComment({Key? key, required this.imageUrl, required this.lectureId}) : super(key: key);

  @override
  _LectureMyCommentState createState() => _LectureMyCommentState();
}

class _LectureMyCommentState extends State<LectureMyComment> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(widget.imageUrl),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextField(
                controller: _commentController,
                decoration: const InputDecoration(
                  hintText: '댓글을 입력하세요...',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: const Color(0xFF0ECB81)),
                  ),
                ),
                cursorColor: const Color(0xFF0ECB81),
                maxLines: null, // 여러 줄 텍스트 입력 가능
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                _submitComment(context);
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF0ECB81),
              ),
              child: const Text('입력'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _submitComment(BuildContext context) async {
    String comment = _commentController.text;
    if (comment.isNotEmpty) {
      print('댓글: $comment');
      CommentRequest commentRequest = CommentRequest(
        lecture_id: widget.lectureId,
        content: comment,
      );
      final authenticationManager = AuthenticationManager();
      var commentResponse = await authenticationManager.writeComment(commentRequest);

      if (commentResponse == null) {
        _showErrorDialog(context, '댓글 작성에 실패했어요..');
      }
      _commentController.clear();
    } else {
      _showErrorDialog(context, '댓글을 입력하세요.');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('경고'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('확인'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }
}