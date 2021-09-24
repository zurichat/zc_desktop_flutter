class User {
  final String? name;
  final int? id;
  final String? profileImage;

  User({this.name, this.profileImage,this.id=1});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(name: json['name'], profileImage: json['profileImage'],id: json['id']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'profileImage': profileImage,
        'id':id,
      };
}
