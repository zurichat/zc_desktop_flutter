import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/preferenceswidgets/sidebar/sidebar_view.dart';

class SideBarViewModel extends BaseViewModel {
  PrefSidebar _sidebar = PrefSidebar.AllConversation;
  get sidebar => _sidebar;

  void toggleSidebar(Object? value) {
    _sidebar = (value) as PrefSidebar;
    notifyListeners();
  }

  PreBar _bar = PreBar.Alpha;
  get bar => _bar;

  void toggleBar(Object? value) {
    _bar = (value) as PreBar;
    notifyListeners();
  }

  bool _insight = true;
  bool get insight => _insight;

  void togggleInsight(bool? value) {
    _insight = value!;
    notifyListeners();
  }

  bool _thread = true;
  bool get thread => _thread;

  void togggleThread(bool? value) {
    _thread = value!;
    notifyListeners();
  }

  bool _alldm = true;
  bool get alldm => _alldm;

  void togggleAlldm(bool? value) {
    _alldm = value!;
    notifyListeners();
  }

  bool _draft = true;
  bool get draft => _draft;

  void togggleDraft(bool? value) {
    _draft = value!;
    notifyListeners();
  }

  bool _file = true;
  bool get file => _file;

  void togggleFile(bool? value) {
    _file = value!;
    notifyListeners();
  }

  bool _integrate = true;
  bool get integrate => _integrate;

  void togggleIntegrate(bool? value) {
    _integrate = value!;
    notifyListeners();
  }

  bool _todo = true;
  bool get todo => _todo;

  void togggleTodo(bool? value) {
    _todo = value!;
    notifyListeners();
  }

  bool _browser = false;
  bool get browser => _browser;

  void togggleBrowser(bool? value) {
    _browser = value!;
    notifyListeners();
  }

  bool _channel = false;
  bool get channel => _channel;

  void togggleChannel(bool? value) {
    _channel = value!;
    notifyListeners();
  }

  bool _show = true;
  bool get show => _show;

  void togggleshow(bool? value) {
    _show = value!;
    notifyListeners();
  }

  bool _list = false;
  bool get list => _list;

  void togggleList(bool? value) {
    _list = value!;
    notifyListeners();
  }

  bool _organize = true;
  bool get organize => _organize;

  void togggleOrganize(bool? value) {
    _organize = value!;
    notifyListeners();
  }
}
