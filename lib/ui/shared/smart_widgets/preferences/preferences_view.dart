import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/preferences/preferences_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/preferences/preferenceswidgets/accessibility/accessibility_view.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/preferences/preferenceswidgets/advanced/advanced_view.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/preferences/preferenceswidgets/audio_video/audio_video_view.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/preferences/preferenceswidgets/language_region_preference/language_preference_view.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/preferences/preferenceswidgets/mark_as_read/mark_as_read_view.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/preferences/preferenceswidgets/messages_media_preference/message_media_preferenceview.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/preferences/preferenceswidgets/notification/preferences_notification_view.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/preferences/preferenceswidgets/sidebar/preferences_sidebar_view.dart';

import 'preferenceswidgets/theme/theme_view.dart';

class PreferenceView extends StatelessWidget {
  const PreferenceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _rightSideBarController = ScrollController();
    final _height = MediaQuery.of(context).size.height;
    //List of datas to be used to populate the leftside and the right side side of the preferences view

    final List _data = [
      {
        'text': 'Notifications',
        'assetName':
            'assets/icons/notifi.svg', //Icons.notifications_none_outlined,
        'widget': NotificationView(),
      },
      {
        'text': 'Sidebar',
        'assetName': 'assets/icons/sidebar.svg', //Icons.grid_view_outlined,
        'widget': SideBarView(),
      },
      {
        'text': 'Themes',
        'assetName': 'assets/icons/themes.svg', //Icons.remove_red_eye_outlined,
        'widget': ThemeView(),
      },
      {
        'text': 'Message & Media',
        'assetName': 'assets/icons/media.svg',
        'widget': Container(
          child: Center(
            child: MessageMediaPreferenceView(),
          ),
        )
      },
      {
        'text': 'Language & region',
        'assetName': 'assets/icons/lan.svg',
        'widget': Container(
          child: LanguagePreference(),
        )
      },
      {
        'text': 'Accessibility',
        'assetName':
            'assets/icons/access.svg', //Icons.desktop_windows_outlined,
        'widget': AccessibilityView(),
      },
      {
        'text': 'Mark as read',
        'assetName': 'assets/icons/mark.svg', //Icons.launch,
        'widget': Container(
          child: Center(
            child: MarkAsRead(),
          ),
        )
      },
      {
        'text': 'Audio & Video',
        'assetName': 'assets/icons/audio&vido.svg', //Icons.videocam_outlined,
        'widget': AudioVideoView(),
      },
      {
        'text': 'Advanced',
        'assetName': 'assets/icons/advanced.svg', //Icons.messenger_outline,
        'widget': AdvancedView(),
      }
    ];
    return ViewModelBuilder<PreferenceViewModel>.reactive(
      builder: (context, model, child) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.primary),
              borderRadius: BorderRadius.circular(15)),
          height: _height * 0.75,
          width: 827.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Preferences', style: headline6,),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: _height * 0.6,
                      width: 244.w,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView.builder(
                            clipBehavior: Clip.none,
                            itemCount: _data.length,
                            itemBuilder: (context, index) {
                              return BuildListItem(
                                  text: _data[index]['text'],
                                  assetName: _data[index]['assetName'],
                                  isSelected: model.currentPageIndex == index,
                                  onClicked: () {
                                    model.updatePageIndex(index);
                                  });
                            }),
                      )),
                  VerticalDivider(
                    width: 8,
                  ),
                  Scrollbar(
                    controller: _rightSideBarController,
                    isAlwaysShown: true,
                    scrollbarOrientation: ScrollbarOrientation.right,
                    thickness: 10,
                    showTrackOnHover: true,
                    child: SingleChildScrollView(
                        controller: _rightSideBarController,
                        child: Container(
                            height: _height * 0.6,
                            width: (827 - 274).w,
                            child: _data[model.currentPageIndex]['widget'])),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => PreferenceViewModel(),
    );
  }
}

class BuildListItem extends StatelessWidget {
  final String text, assetName;
  final bool isSelected;
  final VoidCallback? onClicked;
  const BuildListItem({ Key? key, required this.text,
  required this.assetName,
  required this.isSelected,
  this.onClicked, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hoverColor = Colors.grey[200];
    final color = isSelected ? Colors.white : null;
  return ListTile(
    tileColor: isSelected ? KStartupContainerColor : null,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    minLeadingWidth: 5,
     leading: SvgPicture.asset(assetName, color: color,),
    title: Text(text, style: leftSideBarPrefTextStyle.copyWith(color: color)),
    hoverColor: isSelected ? KStartupContainerColor : hoverColor,
    onTap: onClicked,
  );
  }
}