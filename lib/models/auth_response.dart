import 'package:zc_desktop_flutter/models/user.dart';

class AuthResponse {
  final String sessionID;
  final User user;

  AuthResponse({
    required this.sessionID,
    required this.user,
  });

  factory AuthResponse.fromMap(Map<String, dynamic> map) {
    return AuthResponse(
      sessionID: map['session_id'],
      user: User.fromMap(map['user']),
    );
  }

  Map<String, dynamic> toMap() => {
        "session_id": sessionID,
        "user": user.toMap(),
      };

  @override
  String toString() => 'AuthResponse(sessionID: $sessionID, user: $user)';
}
