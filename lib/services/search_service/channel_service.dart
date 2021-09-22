import 'package:stacked/stacked_annotations.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';

import 'package:zc_desktop_flutter/models/channels_model/channels_model.dart';

import 'package:zc_desktop_flutter/services/api/api_service.dart';

@LazySingleton()
class ChannelService {
  final _ApiService = locator<ApiService>();
  List<Channels> _channelList = [
    Channels(id: '1', name: 'team-desktop-client'),
    Channels(id: '2', name: 'socrates'),
    Channels(id: '3', name: 'Hobbes'),
    Channels(id: '4', name: 'Karl'),
    Channels(id: '5', name: 'Newton'),
    Channels(id: '6', name: 'Tolstoy'),
    Channels(id: '7', name: 'Hannibal'),
  ];
  List<Channels> get channelList => [..._channelList];
  // Future<List<Channels>> getData(Uri uri) async {

  //   try {
  //     final response = await _ApiService.get(
  //       uri,
  //     );

  //     final List extractedData = json.decode(response.body) ;
  //     _channelList = extractedData.map((e) => Channels.fromJson(e)).toList();
  //     return _channelList;
  //   } catch (e) {
  //     throw Failure(e.toString());
  //   }
  // }

  int get channelListLength => _channelList.length;
}
