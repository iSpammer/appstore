

class MyAccount {
  final String account;
  final String email;
  final String name;
  final String gender;
  final String birthday;
  final String phone;
  final String introduction;
  late String profileImage = "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Cat_poster_1.jpg/2560px-Cat_poster_1.jpg";
  final String backgroundImage;

  MyAccount({
    required this.account,
    required this.email,
    required this.name,
    required this.gender,
    required this.birthday,
    required this.phone,
    required this.introduction,
    required this.profileImage,
    required this.backgroundImage
  });

  factory MyAccount.fromJson(Map<String, dynamic> json) {

    return MyAccount(
        account: json['account'] ?? "",
        email: json['email'] ?? "",
        name: json['name'] ?? "",
        gender: json['gender'] ?? "",
        birthday: json['birthday'] ?? "",
        phone: json['phone'] ?? "",
        introduction: json['introduction'] ?? "",
        profileImage: json['profileImage'] ?? "",
        backgroundImage: json['backgroundImage'] ?? ""
    );
  }
}