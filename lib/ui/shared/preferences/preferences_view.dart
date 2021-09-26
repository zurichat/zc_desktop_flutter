import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_text.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/preferences_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/preferenceswidgets/accessibility/accessibility_view.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/preferenceswidgets/advanced/advanced_view.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/preferenceswidgets/audio_video/audio_video_view.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/preferenceswidgets/language_region_preference/language_preference_view.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/preferenceswidgets/messages_media_preference/message_media_preferenceview.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/preferenceswidgets/notification/preferences_notification_view.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/preferenceswidgets/sidebar/preferences_sidebar_view.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/preferenceswidgets/mark_as_read/mark_as_read_view.dart';
import 'preferenceswidgets/theme/theme_view.dart';

class PreferenceView extends StatelessWidget {
  const PreferenceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _rightSideBarController = ScrollController();

    //List of datas to be used to populate the leftside and the right side side of the preferences view
    //TODO Update the widgets in map

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
          height: 750.h,
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
                    ZcdeskText.headingTwo('Preferences'),
                    IconButton(
                      onPressed: () {
                        model.closeDialog();
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
                      height: 600.h,
                      width: 244.w,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView.builder(
                            clipBehavior: Clip.none,
                            itemCount: _data.length,
                            itemBuilder: (context, index) {
                              return buildListItem(
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
                            height: 600.h,
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

Widget buildListItem({
  required String text,
  required String assetName,
  required isSelected,
  VoidCallback? onClicked,
}) {
  final hoverColor = Colors.grey[200];
  return ListTile(
    tileColor: isSelected ? KStartupContainerColor : null,
    minLeadingWidth: 5,
    leading: SvgPicture.asset(assetName),
    title: Text(text, style: preferenceStyleNormal),
    hoverColor: isSelected ? KStartupContainerColor : hoverColor,
    onTap: onClicked,
  );
}
