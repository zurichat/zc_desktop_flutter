import 'dart:convert';

class ChannelsDataModel {
  String id;
  String name;
  String owner;
  String description;
  bool private;

  ChannelsDataModel({
    required this.id,
    required this.name,
    required this.owner,
    required this.description,
    required this.private,
  });

  factory ChannelsDataModel.fromMap(Map<String, dynamic> map) {
    return ChannelsDataModel(
      id: map['_id'],
      name: map['name'],
      owner: map['owner'],
      description: map['description'],
      private: map['private'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
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
    return 'ChannelsDataModel(id: $id, name: $name, owner: $owner, description: $description, private: $private)';
  }
}
