// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String?,
      role: json['role'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      phone: json['phone'] as String?,
      about: json['about'] as String?,
      timeZone: json['timeZone'] as String?,
      createdAt: json['createdAt'] as String?,
      status: json['status'] as String?,
      profileUrl: json['profileUrl'] as String?,
      isActive: json['isActive'] as bool? ?? false,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'username': instance.username,
      'phone': instance.phone,
      'about': instance.about,
      'timeZone': instance.timeZone,
      'createdAt': instance.createdAt,
      'status': instance.status,
      'profileUrl': instance.profileUrl,
      'isActive': instance.isActive,
    };
