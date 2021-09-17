import 'package:stacked/stacked.dart';

class AudioVideoViewModel extends BaseViewModel {
  String? _selectedSpeaker;
  String? _selectedCamera;

  var settings = {
    'speakerEnabled': false,
    'onCallStatus': false,
    'callMicrophoneMuted': false,
    'onHuddleStatus': false,
    'huddleMicrophoneMuted': false,
    'captionOnInHuddle': false,
    'warningSentForLargeNumber': false,
    'playMusic': false,
  };

  final List<String> _availableSpeakers = [
    'Default- Microphone(2 - High Definition)',
    'Communications- Microphone(2 - High Definition)',
    'Microphone(2 - High Definition)',
  ];
  final List<String> _availableCameras = [
    'USB 2.0 Camera (064e:a216)',
    'USB 3.0 Camera (064e:a216)',
    'Integrated Camera (04d2:b321)'
  ];

  List<String> get availableCameras => _availableCameras;
  List<String> get availableSpeakers => _availableSpeakers;
  String? get selectedSpeaker => _selectedSpeaker;
  String? get selectedCamera => _selectedCamera;

  void setSelectedSpeaker(String value) {
    _selectedSpeaker = value;
    notifyListeners();
  }

  void setSelectedCamera(String value) {
    _selectedCamera = value;
    notifyListeners();
  }

  void toggleSetting(bool? value, String setting) {
    settings[setting] = value!;
    notifyListeners();
  }
}
