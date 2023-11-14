import 'package:json_annotation/json_annotation.dart';

// 터미널 명령어 -> flutter pub run build_runner build
part 'Register.g.dart'; // 현재 파일 이름과 같아야 함!!!

@JsonSerializable()
class Register {
  final String email;
  final String password;
  final String name;
  final String nickname;
  final String birth_date;
  final String gender;
  final List<String> interest_categories;


  Register(this.email, this.password, this.name, this.nickname, this.birth_date,
      this.gender, this.interest_categories); // JSON 직렬화를 위한 메서드

  Map<String, dynamic> toJson() => _$RegisterToJson(this);

  // JSON 역직렬화를 위한 팩토리 생성자
  factory Register.fromJson(Map<String, dynamic> json) =>
      _$RegisterFromJson(json);
}
