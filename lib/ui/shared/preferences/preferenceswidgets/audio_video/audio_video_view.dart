import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_text.dart';

import '../../../const_app_colors.dart';
import '../../../const_text_styles.dart';
import 'audio_video_viewmodel.dart';
import 'components/components.dart';

class AudioVideoView extends StatelessWidget {
  const AudioVideoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();

    return ViewModelBuilder<AudioVideoViewModel>.reactive(
      onModelReady: (model) => model.fetchSettings(),
      builder: (context, model, child) => Scrollbar(
        controller: _scrollController,
        isAlwaysShown: true,
        interactive: true,
        scrollbarOrientation: ScrollbarOrientation.right,
        hoverThickness: 8,
        thickness: 5,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(title: 'Camera'),
              SizedBox(height: 16),
              Container(
                width: 487.w,
                height: 304,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage('assets/images/camera.png'),
                  ),
                ),
              ),
              SizedBox(height: 16),
              DropDownField<String>(
                options: model.availableCameras,
                getLabel: (String value) => value,
                value: model.selectedCamera,
                onChanged: (String? value) => model.setSelectedCamera(value!),
              ),
              SizedBox(height: 46),
              SectionTitle(title: 'Microphone'),
              SizedBox(height: 8),
              DropDownField<String>(
                options: model.availableSpeakers,
                getLabel: (String value) => value,
                value: model.selectedSpeaker,
                onChanged: (String? value) => model.setSelectedSpeaker(value!),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  ZcdeskText.bodyText('Input Level : '),
                  _buildDummyInputLevel(),
                ],
              ),
              SizedBox(height: 10),
              AudioVideoSetting(
                value: model.settings['speakerEnabled']!,
                onChanged: (value) =>
                    model.toggleSetting(value, 'speakerEnabled'),
                title: 'Enable Speaker',
              ),
              SizedBox(height: 19),
              SectionTitle(title: 'Microphone'),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 366.w,
                    child: DropDownField<String>(
                      options: model.availableSpeakers,
                      getLabel: (String value) => value,
                      value: model.selectedSpeaker,
                      onChanged: (String? value) =>
                          model.setSelectedSpeaker(value!),
                    ),
                  ),
                  SizedBox(width: 19.w),
                  SizedBox(
                    width: 124.w,
                    height: 40,
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                        primary: kcBackgroundColor2,
                        side: BorderSide(
                          color: Color(0xff9b9b9b),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Test Speaker',
                        style: kBodyTextStyle.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 15.w,
                          color: bodyColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 46),
              SectionTitle(title: 'When joining Zurichat call...'),
              SizedBox(height: 17),
              AudioVideoSetting(
                value: model.settings['onCallStatus']!,
                onChanged: (value) =>
                    model.toggleSetting(value, 'onCallStatus'),
                title: 'Set my status to “On a call…”',
                useSubtitle: true,
                subtitle:
                    'If you already have a status set, Zurichat won’t change it.',
              ),
              SizedBox(height: 10),
              AudioVideoSetting(
                value: model.settings['callMicrophoneMuted']!,
                onChanged: (value) =>
                    model.toggleSetting(value, 'callMicrophoneMuted'),
                title: 'Mute my Microphone',
              ),
              SizedBox(height: 26),
              SizedBox(
                width: 487.w,
                child: Divider(),
              ),
              SizedBox(height: 16),
              SectionTitle(title: 'When joining huddle...'),
              SizedBox(height: 17),
              AudioVideoSetting(
                value: model.settings['onHuddleStatus']!,
                onChanged: (value) =>
                    model.toggleSetting(value, 'onHuddleStatus'),
                title: 'Set my status to “In a huddle…”',
                useSubtitle: true,
                subtitle:
                    'If you already have a status set, Zurichat won’t change it.',
              ),
              SizedBox(height: 10),
              AudioVideoSetting(
                value: model.settings['huddleMicrophoneMuted']!,
                onChanged: (value) =>
                    model.toggleSetting(value, 'huddleMicrophoneMuted'),
                title: 'Mute my Microphone',
              ),
              SizedBox(height: 10),
              AudioVideoSetting(
                value: model.settings['captionOnInHuddle']!,
                onChanged: (value) =>
                    model.toggleSetting(value, 'captionOnInHuddle'),
                title: 'Automatically turn on captions when you’re in a huddle',
              ),
              SizedBox(height: 10),
              AudioVideoSetting(
                value: model.settings['warningSentForLargeNumber']!,
                onChanged: (value) =>
                    model.toggleSetting(value, 'warningSentForLargeNumber'),
                title:
                    'Send a warning if you’re starting a huddle in a channel with more than 150 members',
              ),
              SizedBox(height: 10),
              AudioVideoSetting(
                value: model.settings['playMusic']!,
                onChanged: (value) => model.toggleSetting(value, 'playMusic'),
                title:
                    'Play music to let you know when you’re the last one in the huddle',
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => AudioVideoViewModel(),
    );
  }

  Widget _buildDummyInputLevel() {
    return Row(
      children: List.generate(
        15,
        (index) => Container(
          margin: index == 14 ? EdgeInsets.zero : EdgeInsets.only(right: 4.w),
          width: 23.w,
          height: 14.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color:
                index <= 1 ? kcPrimaryColor : Color(0xffc4c4c4).withOpacity(.5),
          ),
        ),
      ),
    );
  }
}
