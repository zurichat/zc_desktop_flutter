import 'package:stacked/stacked.dart';

class DmViewModel extends BaseViewModel {
  List<Message> _messages = [
    Message(message: 'Hey its a good morning', time: '9.06 pm', userDisplayName: 'Dedan', userProfileUrl: 'url'),
    Message(message: 'Hey its a good morning', time: '9.06 pm', userDisplayName: 'Dedan', userProfileUrl: 'url'),
    Message(message: 'Hey its a good morning', time: '9.06 pm', userDisplayName: 'Dedan', userProfileUrl: 'url'),
    Message(message: 'Hey its a good morning', time: '9.06 pm', userDisplayName: 'Dedan', userProfileUrl: 'url'),
    Message(message: 'Hey its a good morning', time: '9.06 pm', userDisplayName: 'Dedan', userProfileUrl: 'url'),
    Message(message: 'Hey its a good morning', time: '9.06 pm', userDisplayName: 'Dedan', userProfileUrl: 'url'),
    Message(message: 'Hey its a good morning', time: '9.06 pm', userDisplayName: 'Dedan', userProfileUrl: 'url'),
    Message(message: 'Hey its a good morning', time: '9.06 pm', userDisplayName: 'Dedan', userProfileUrl: 'url'),
    Message(message: 'Hey its a good morning', time: '9.06 pm', userDisplayName: 'Dedan', userProfileUrl: 'url'),
    Message(message: 'Hey its a good morning', time: '9.06 pm', userDisplayName: 'Dedan', userProfileUrl: 'url'),
    Message(message: 'Hey its a good morning', time: '9.06 pm', userDisplayName: 'Dedan', userProfileUrl: 'url'),
    Message(message: 'Hey its a good morning', time: '9.06 pm', userDisplayName: 'Dedan', userProfileUrl: 'url'),
    Message(message: 'Hey its a good morning', time: '9.06 pm', userDisplayName: 'Dedan', userProfileUrl: 'url'),
    Message(message: 'Hey its a good morning', time: '9.06 pm', userDisplayName: 'Dedan', userProfileUrl: 'url'),
    Message(message: 'Hey its a good morning', time: '9.06 pm', userDisplayName: 'Dedan', userProfileUrl: 'url'),
    Message(message: 'Hey its a good morning', time: '9.06 pm', userDisplayName: 'Dedan', userProfileUrl: 'url'),
    Message(message: 'Hey its a good morning', time: '9.06 pm', userDisplayName: 'Dedan', userProfileUrl: 'url'),
    Message(message: 'Hey its a good morning', time: '9.06 pm', userDisplayName: 'Dedan', userProfileUrl: 'url'),
    Message(message: 'Hey its a good morning', time: '9.06 pm', userDisplayName: 'Dedan', userProfileUrl: 'url'),
    Message(message: 'Hey its a good morning', time: '9.06 pm', userDisplayName: 'Dedan', userProfileUrl: 'url'),
  ];

  List<Message> get messages => _messages;
}

class Message {
  final String userProfileUrl;
  final String userDisplayName;
  final String message;
  final String time;

  Message(
      {required this.message,
      required this.time,
      required this.userDisplayName,
      required this.userProfileUrl});
}
