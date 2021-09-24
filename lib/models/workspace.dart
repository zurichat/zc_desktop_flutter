import 'package:zc_desktop_flutter/models/user_model.dart';

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

  Workspace({this.id,
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
