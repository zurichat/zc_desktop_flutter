class User {
  final String? name;
  final String? profileImage;

  User({this.name, this.profileImage});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(name: json['name'], profileImage: json['profileImage']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'profileImage': profileImage,
      };
}
