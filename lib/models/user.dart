class User {
  final String id;
  final String firstName;
  final String lastName;
  final String displayName;
  final String email;
  final String phone;
  final int status;
  final String timeZone;
  final String createdAt;
  final String updatedAt;
  final String token;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.displayName,
    required this.email,
    required this.phone,
    required this.status,
    required this.timeZone,
    required this.createdAt,
    required this.updatedAt,
    required this.token,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      displayName: map['display_name'],
      email: map['email'],
      phone: map['phone'],
      status: map['status'],
      timeZone: map['time_zone'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      token: map['token'],
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "display_name": displayName,
        "email": email,
        "phone": phone,
        "status": status,
        "time_zone": timeZone,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "token": token,
      };

  @override
  String toString() {
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, displayName: $displayName, email: $email, phone: $phone, status: $status, timeZone: $timeZone, createdAt: $createdAt, updatedAt: $updatedAt, token: $token)';
  }
}
