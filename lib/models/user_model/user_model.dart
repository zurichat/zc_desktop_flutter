import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

// The channel Datamodel Generator. Using freezed to auto generate the need code
@freezed
class User with _$User {
   const factory User({
    required String? id,
    required String? name,
    required String? email,
    required String? username,
    required String? phoneNumber,
    required String? about,
    required String? status,
    required String? profileUrl,
    @Default(false) bool isActive,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
