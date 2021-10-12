import 'dart:async';
import 'dart:convert';
import 'package:centrifuge/centrifuge.dart' as centrifuge;
import 'package:centrifuge/centrifuge.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';

class CentrifugeService with ReactiveServiceMixin {
  static Client? _client;
  Subscription? _subscription;
  StreamController<String> messageStreamController =
      StreamController.broadcast();
  final log = getLogger('CentrifugeService');
  final websocketUrl = 'wss://realtime.zuri.chat/connection/websocket';

  Future connect() async {
    _client = centrifuge.createClient('$websocketUrl?format=protobuf',
        config: centrifuge.ClientConfig());
      _client!.connectStream.listen((event) {
      log.i('connected to client $event');
    });
_client!.disconnectStream.listen((event) {
      log.e('disconnect from client $event');
    });
    _client!.connect();
  }

  void disconnect() async {
    _client!.disconnect();
  }

  void _showError(dynamic _error) {
    log.e(_error);
  }

  void _showLog(dynamic _message) {
    log.i(_message);
  }

  Future subscribe(String channel) async {
    _subscription = _client!.getSubscription(channel);

    _showLog(_subscription!.channel);

    _subscription!.subscribeErrorStream.listen((event) {
      log.e('Subcribe has error $event');
    });
    _subscription!.subscribeSuccessStream.listen((event) {
      log.i('Subcribe is success $event');
    });
    _subscription!.unsubscribeStream.listen((event) {
      log.e('unsubscribed from stream $event');
    });

    _subscription!.joinStream.listen((event) {
      log.i('Subcribe join stream $event');
    });

    _subscription!.leaveStream.listen((event) {
      log.e('Subcribe leave stream $event');
    });

    _subscription!.publishStream.listen((event) {
      log.i('WORK WORK RIGHT NOW ${json.decode(utf8.decode(event.data))}');

      messageStreamController.sink.add('Message Received');
      //Map user_message = json.decode(utf8.decode(event.data));
    });

    _subscription!.subscribe();
  }
}
