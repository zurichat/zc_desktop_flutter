import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/core/enums/pre_bar.dart';
import 'package:zc_desktop_flutter/core/enums/pre_sidebar.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';


class SideBarViewModel extends BaseViewModel {
  final _localStorage = locator<LocalStorageService>();
  var _sideBar = SideBar();
  PrefSidebar _sidebar = PrefSidebar.AllConversation;
  get sidebar => _sidebar;

  void toggleSidebar(Object? value) {
    _sidebar = (value) as PrefSidebar;
    _sideBar = _sideBar.copyWith(showConversation: _sidebar);
    notifyListeners();
  }

  PreBar _bar = PreBar.Alpha;
  get bar => _bar;

  void toggleBar(Object? value) {
    _bar = (value) as PreBar;
    _sideBar = _sideBar.copyWith(sort: _bar);
    notifyListeners();
  }

  bool _insight = true;
  bool get insight => _insight;

  void togggleInsight(bool? value) {
    _insight = value!;
    _sideBar = _sideBar.copyWith(showInsights: _insight);
    notifyListeners();
  }

  bool _thread = true;
  bool get thread => _thread;

  void togggleThread(bool? value) {
    _thread = value!;
    _sideBar = _sideBar.copyWith(showThreads: _thread);
    notifyListeners();
  }

  bool _alldm = true;
  bool get alldm => _alldm;

  void togggleAlldm(bool? value) {
    _alldm = value!;
    _sideBar = _sideBar.copyWith(showAllDms: _alldm);
    notifyListeners();
  }

  bool _draft = true;
  bool get draft => _draft;

  void togggleDraft(bool? value) {
    _draft = value!;
    _sideBar = _sideBar.copyWith(showDrafts: _draft);
    notifyListeners();
  }

  bool _file = true;
  bool get file => _file;

  void togggleFile(bool? value) {
    _file = value!;
    _sideBar = _sideBar.copyWith(showFiles: _file);
    notifyListeners();
  }

  bool _integrate = true;
  bool get integrate => _integrate;

  void togggleIntegrate(bool? value) {
    _integrate = value!;
    _sideBar = _sideBar.copyWith(showIntegrate: _integrate);
    notifyListeners();
  }

  bool _todo = true;
  bool get todo => _todo;

  void togggleTodo(bool? value) {
    _todo = value!;
    _sideBar = _sideBar.copyWith(showToDo: _todo);
    notifyListeners();
  }

  bool _browser = false;
  bool get browser => _browser;

  void togggleBrowser(bool? value) {
    _browser = value!;
     _sideBar = _sideBar.copyWith(showFileBrowser: _browser);
    _sideBar = _sideBar.copyWith(showFileBrowser: _browser);
    notifyListeners();
  }

  bool _channel = false;
  bool get channel => _channel;

  void togggleChannel(bool? value) {
    _channel = value!;
    _sideBar = _sideBar.copyWith(showChannelBrowser: _channel);
    notifyListeners();
  }

  bool _show = true;
  bool get show => _show;

  void togggleshow(bool? value) {
    _show = value!;
    _sideBar = _sideBar.copyWith(showPictureNextToDm: _show);
    notifyListeners();
  }

  bool _list = false;
  bool get list => _list;

  void togggleList(bool? value) {
    _list = value!;
    _sideBar = _sideBar.copyWith(listPrivateChannelSeperatley: _list);
    notifyListeners();
  }

  bool _organize = true;
  bool get organize => _organize;

  void togggleOrganize(bool? value) {
    _organize = value!;
    _sideBar = _sideBar.copyWith(organizeExternalConversation: _organize);
    notifyListeners();
  }

  void saveSettings() {
    _localStorage.setSideBar(_sideBar);
  }


  void fetchAndSetSetting() async {
    _sideBar = await _localStorage.sideBar as SideBar;
    _insight = _sideBar.showInsights;
    _draft = _sideBar.showDrafts;
    _file = _sideBar.showFiles;
    _thread = _sideBar.showThreads;
    _todo = _sideBar.showToDo;
    _browser = _sideBar.showFileBrowser;
    _channel = _sideBar.showChannelBrowser;
    _alldm = _sideBar.showAllDms;
    _integrate = _sideBar.showIntegrate;
    _bar = _sideBar.sort;
    _organize = _sideBar.organizeExternalConversation;
    _list = _sideBar.listPrivateChannelSeperatley;
    _show = _sideBar.showPictureNextToDm;
    _sidebar = _sideBar.showConversation;

    notifyListeners();
  }
}
