import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/preferenceswidgets/notification/notification_view.dart';

class NotificationViewModel extends BaseViewModel {
  PrefMessageNotification _messageNotification =
      PrefMessageNotification.AllMessages;
  bool _isSameForMobile = false;
  bool _isMeetingSet = true;
  bool _isRepliesInThread = false;
  List<String> _scheduleList = ['Duration', 'Everyday', 'Weekend', 'Custom'];
  String _scheduleValue = 'Duration';

  List<String> _timeSchedule = [
    'From',
    'To',
    '12:00 AM',
    '12:30 AM',
    '1:00 AM',
    '1:30 AM',
    '2:00 AM',
    '2:30 AM',
    '3:00 AM',
    '3:30 AM',
    '4:00 AM',
    '4:30 AM',
    '5:00 AM',
    '5:30 AM',
    '6:00 AM',
    '6:30 AM',
    '7:00 AM',
    '7:30 AM',
    '8:00 AM',
    '8:30 AM',
    '9:00 AM',
    '9:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
    '1:00 PM',
    '1:30 PM',
    '2:00 PM',
    '2:30 PM',
    '3:00 PM',
    '3:30 PM',
    '4:00 PM',
    '4:30 PM',
    '5:00 PM',
    '5:30 PM',
    '6:00 PM',
    '6:30 PM',
    '7:00 PM',
    '7:30 PM',
    '8:00 PM',
    '8:30 PM',
    '9:00 PM',
    '9:30 PM',
    '10:00 PM',
    '10:30 PM',
    '11:00 PM',
    '11:30 PM',
    'Midnight'
  ];
  String _schedule1Value = 'From';
  String _schedule2Value = 'To';

  get scheduleList => _scheduleList;
  get timeSchedule => _timeSchedule;
  get scheduleValue => _scheduleValue;
  get schedule1Value => _schedule1Value;
  get schedule2Value => _schedule2Value;

  void setScheduleValue(String value) {
    _scheduleValue = value;
    notifyListeners();
  }

  void setSchedule1Value(String value) {
    _schedule1Value = value;
    notifyListeners();
  }

  void setSchedule2Value(String value) {
    _schedule2Value = value;
    notifyListeners();
  }

  get isSameForMobile => _isSameForMobile;
  get isMeetingSet => _isMeetingSet;
  get isRepliedInThred => _isRepliesInThread;

  get messageNotification => _messageNotification;

  void setMessageNotification(Object? value) {
    _messageNotification = (value) as PrefMessageNotification;
    notifyListeners();
  }

  void setISRepliedInThread() {
    _isRepliesInThread = !_isRepliesInThread;
    notifyListeners();
  }

  void setIsmeetingSet() {
    _isMeetingSet = !_isMeetingSet;
    notifyListeners();
  }

  void setIsSameForMobile() {
    _isSameForMobile = !_isSameForMobile;
    notifyListeners();
  }
}
