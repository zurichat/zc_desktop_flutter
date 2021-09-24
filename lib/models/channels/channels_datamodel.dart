import 'dart:convert';

class ChannelsDataModel {
  String name;
  String owner;
  String description;
  bool private;

  ChannelsDataModel({
    required this.name,
    required this.owner,
    required this.description,
    required this.private,
  });

  factory ChannelsDataModel.fromMap(Map<String, dynamic> map) {
    return ChannelsDataModel(
      name: map['name'],
      owner: map['owner'],
      description: map['description'],
      private: map['private'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'owner': owner,
      'description': description,
      'private': private,
    };
  }

  String toJson() => json.encode(toMap());

  factory ChannelsDataModel.fromJson(String source) =>
      ChannelsDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChannelsDataModel(name: $name, owner: $owner, description: $description, private: $private)';
  }
}
