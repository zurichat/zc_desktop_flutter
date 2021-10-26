import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/dm_service.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/services/organization_service.dart';

class AllDmsViewModel extends BaseViewModel {
  final log = getLogger('AllDmViewModel');
  final _dmService = locator<DMService>();
  final _navigationService = locator<NavigationService>();
  final _organizationService = locator<OrganizationService>();

  List<Users> _users = [];
  List<Users> get users => _users;

  List<DM> _dms = [];
  List<DM> get dms => _dms;

  void setup() {
    runTask();
  }

  void runTask() async {
    //_users = await runBusyFuture(_dmService.fetchAllUsersForDm());
    await runBusyFuture(getDMs());
    notifyListeners();
  }

  Future<void> getDMs() async {
    _dms = [];
    Auth auth = _organizationService.auth;
    List<DMRoomsResponse> res =
        await _dmService.getDMs(_organizationService.getOrganizationId());
    for (var room in res) {
      UserProfile userProfile = await _organizationService.getUserProfile(
          _organizationService.getOrganizationId(), room.roomUserIds.last);
      DM dm = DM(
          otherUserProfile: userProfile,
          roomInfo: room,
          currentUserProfile: UserProfile(
              firstName: auth.user!.firstName,
              lastName: auth.user!.lastName,
              displayName: auth.user!.displayName,
              imageUrl: auth.user!.displayName,
              userName: auth.user!.displayName,
              userId: auth.user!.id,
              phone: auth.user!.phone,
              pronouns: auth.user!.displayName,
              bio: auth.user!.displayName,
              status: UserStatus()));
      _dms.add(dm);
    }
    log.i('${_dms}');
  }

  void goToDmView(int index) {
    //_dmService.setUser(_users.elementAt(index));
    _dmService.setExistingRoomInfo(_dms[index]);
    _navigationService.navigateTo(OrganizationViewRoutes.dmView, id: 1);
  }
}