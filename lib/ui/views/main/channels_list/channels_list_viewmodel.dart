import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/channels_service.dart';
// import 'package:zc_desktop_flutter/services/organization_service.dart';

class ChannelsListViewModel extends BaseViewModel {
  final log = getLogger('ChannelsDisplayViewModel');

  final _channelService = locator<ChannelsService>();
  // final _organizationService = locator<OrganizationService>();

  List<Channel> _channels = [];
  int selectedChannelIndex = 0;
  

  List<Channel> get channels => _channels;
  final _navigationService = locator<NavigationService>();


  bool _isChannelHover = false;
  int? _selectedind;

  var _searchChannel = '';

  bool get isChannelHover => _isChannelHover;

  int? get selectedind => _selectedind;

  setIsChannelHover() {
    _isChannelHover = !_isChannelHover;
    notifyListeners();
  }

  void setIsselectedind(int val) {
    _selectedind = val;
    notifyListeners();
  }

  get searchChannel => _searchChannel;

  bool _isSwitched = false;
  bool get isSwitched => _isSwitched;

  void setIsSwitched() {
    _isSwitched = !_isSwitched;
    notifyListeners();
  }

  void performGetChannel() {
    _channels = _channelService.getChannelList();
    log.d('list of channels ${_channels}');
  }

  void goToChannelsView({int index = 0}) {
    selectedChannelIndex = index;
    notifyListeners();
    _channelService.setChannel(_channels[index]);
    _navigationService.navigateTo(OrganizationViewRoutes.channelsView, id: 1);
  }

}
