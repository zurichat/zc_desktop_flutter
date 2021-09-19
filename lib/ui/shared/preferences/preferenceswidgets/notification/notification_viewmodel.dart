import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/core/enums/flash_windows.dart';
import 'package:zc_desktop_flutter/core/enums/pref_message.dart';

class NotificationViewModel extends BaseViewModel {
  PrefMessageNotification _messageNotification =
      PrefMessageNotification.AllMessages;
  //FlashWindows _flashWindows = FlashWindows.WhenIdle;

  bool _isSameForMobile = false;
  bool _isMeetingSet = true;
  bool _isPreviewMessage = true;
  bool _isMute = false;
  bool _isEmail = false;
  bool _isRepliesInThread = false;
  String _schedule1Value = 'From';
  String _schedule2Value = 'To';
  String _scheduleValue = 'Duration';
  String _messageSoundValue = 'Pick sound';
  String _lougeSoundValue = 'Pick sound';
  String _notificationSoundValue = 'Pick sound';
  String _sendNotificationValue = 'as soon as I\'m inactive';

  List<String> _scheduleList = ['Duration', 'Everyday', 'Weekend', 'Custom'];
  List<String> _sendNotificationTo = [
    'immidiately, even if I\'m active',
    'as soon as I\'m inactive',
    'after have been inactive for 1 minute',
    'after have been inactive for 2 minutes',
    'after have been inactive for 5 minutes',
    'after have been inactive for 10 minutes',
    'after have been inactive for 15 minutes',
    'after have been inactive for 20 minutes',
    'after have been inactive for 30 minutes',
  ];
  List<String> _sound = [
    'Pick sound',
    'Ding',
    'Boing',
    'Drop',
    'Ta-da',
    'Plink',
    'Wow',
    'Here you go',
    'Hi',
    'Knock Brush',
    'Whoa!',
    'Yoink',
    'Hummus'
  ];
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

  get scheduleList => _scheduleList;
  get timeSchedule => _timeSchedule;
  get sound => _sound;
  get scheduleValue => _scheduleValue;
  get schedule1Value => _schedule1Value;
  get schedule2Value => _schedule2Value;
  get messageSoundValue => _messageSoundValue;
  get lougeSoundValue => _lougeSoundValue;
  get isPreviewMessage => _isPreviewMessage;
  get isMute => _isMute;
  get isEmail => _isEmail;
  get notificationSoundValue => _notificationSoundValue;
  get sendNotificationTo => _sendNotificationTo;
  get sendNotificationValue => _sendNotificationValue;

  void setIsEmail() {
    _isEmail = !_isEmail;
    notifyListeners();
  }

  void setNotificationValue(String value) {
    _sendNotificationValue = value;
    notifyListeners();
  }

  void setIsPreviewMessage() {
    _isPreviewMessage = !_isPreviewMessage;
    notifyListeners();
  }

  void setIsMute() {
    _isMute = !_isMute;
    notifyListeners();
  }

  void setScheduleValue(String value) {
    _scheduleValue = value;
    notifyListeners();
  }

  void setMessageSoundValue(String value) {
    _messageSoundValue = value;
    notifyListeners();
  }

  void setLougeSoundValue(String value) {
    _lougeSoundValue = value;
    notifyListeners();
  }

  void setNotificationSoundValue(String value) {
    _notificationSoundValue = value;
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
  // get flashWindows => _flashWindows;

  void setMessageNotification(Object? value) {
    _messageNotification = (value) as PrefMessageNotification;
    notifyListeners();
  }

  void setFlashWindows(Object? value) {
    //_flashWindows = (value) as FlashWindows;
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
