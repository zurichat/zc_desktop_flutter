import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';

class ChannelService {
  final log = getLogger("ChannelService");
  Channel _channel = Channel(name: "");
  List<Channel> _channelList = [
    Channel(name: 'Socrates'),
    Channel(name: 'Tolstoy'),
    Channel(name: 'Hobbes'),
    Channel(name: 'Karl'),
    Channel(name: 'Hemmingway'),
    Channel(name: 'Team-desktop-client'),
    Channel(name: 'Hermes'),
    Channel(name: 'Solozo'),
    Channel(name: 'Aristotle'),
    Channel(name: 'Anchor'),
  ];

  void setChannel(Channel channel) {
    _channel = channel;
  }

  Future<Channel> getChannel() async {
    await Future.delayed(Duration(seconds: 2));
    return this._channel;
  }

  List<Channel> get channelList => [..._channelList];
  int get channelListLength => _channelList.length;
}
