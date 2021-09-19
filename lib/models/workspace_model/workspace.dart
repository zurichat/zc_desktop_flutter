class Workspace {
  int? id;
  String? name;
  String? url;
  String? logo;
  User? user;
  List<User>? users;
  List<Channel>? channels;
  List<DM>? dms;
  int? currentChannel = 0;
  int? currentDM = -1;

  Workspace(
      {this.id,
      this.name,
      this.url,
      this.logo,
      this.user,
      this.users,
      this.channels,
      this.dms,
      this.currentChannel,
      this.currentDM});
}

class User {
  int? id;
  String? name;
  String? status;
  String? description;
  String? avatar;
  bool? online;

  User(
      {this.id,
      this.name,
      this.status,
      this.description,
      this.avatar,
      this.online});
}

class Channel extends BaseChat {
  String? name;
  String? topic;
  List<User>? users;
  bool? private;

  Channel({
    this.name,
    this.topic,
    this.users,
    this.private,
  });
}

class DM extends BaseChat {
  User? user;

  DM({this.user});
}

class Chat {
  int? timestamp;
  String? text;
  User? user;

  Chat({this.timestamp, this.text, this.user});
}

abstract class BaseChat {
  List<Chat>? chats;
}
