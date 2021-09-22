import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/models/workspace_model/workspace.dart';

class ChannelService {
  final log = getLogger("ChannelService");
  Channel _channel = Channel(name: "");

  void setChannel(Channel channel) {
    _channel = channel;
  }

  Future<Channel> getChannel() async {
    await Future.delayed(Duration(seconds: 2));
    return this._channel;
  }
}
