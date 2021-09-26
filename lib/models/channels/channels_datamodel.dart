import 'dart:convert';

class Channel {
  String id;
  String name;
  String owner;
  String description;
  bool private;

  Channel({
    required this.id,
    required this.name,
    required this.owner,
    required this.description,
    required this.private,
  });

  factory Channel.fromMap(Map<String, dynamic> map) {
    return Channel(
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

  factory Channel.fromJson(String source) =>
      Channel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Channel(id: $id, name: $name, owner: $owner, description: $description, private: $private)';
  }
}
