import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/core/enums/pre_bar.dart';
import 'package:zc_desktop_flutter/core/enums/pre_sidebar.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/preferences/preferenceswidgets/sidebar/preferences_sidebar_viewmodel.dart';

class SideBarView extends StatelessWidget {
  const SideBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _controller = ScrollController();
    return ViewModelBuilder<SideBarViewModel>.reactive(
      builder: (context, model, child) => Scrollbar(
        controller: _controller,
        isAlwaysShown: true,
        interactive: true,
        scrollbarOrientation: ScrollbarOrientation.right,
        hoverThickness: 8,
        thickness: 5,
        child: SingleChildScrollView(
          controller: _controller,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Always show in the side bar', style: preferenceStyleBold),
                SizedBox(height: 14),
                DisplayCheckBox(
                  value: model.insight,
                  assetName: 'assets/icons/insight.svg',
                  text: 'Insights',
                  // style: headline6.copyWith(fontSize: 13.sp),
                  onChanged: model.togggleInsight,
                ),
                DisplayCheckBox(
                  value: model.thread,
                  assetName: 'assets/icons/threads.svg',
                  text: 'Threads',
                  //style: headline6.copyWith(fontSize: 13.sp),
                  onChanged: model.togggleThread,
                ),
                DisplayCheckBox(
                  value: model.alldm,
                  assetName: 'assets/icons/alldms.svg',
                  text: 'All DMs',
                  //style: headline6.copyWith(fontSize: 13.sp),
                  onChanged: model.togggleAlldm,
                ),
                DisplayCheckBox(
                  value: model.draft,
                  assetName: 'assets/icons/draft.svg',
                  text: 'Draft',
                  //style: headline6.copyWith(fontSize: 13.sp),
                  onChanged: model.togggleDraft,
                ),
                DisplayCheckBox(
                  value: model.file,
                  assetName: 'assets/icons/file.svg',
                  text: 'Files',
                  //style: headline6.copyWith(fontSize: 13.sp),
                  onChanged: model.togggleFile,
                ),
                DisplayCheckBox(
                  value: model.integrate,
                  assetName: 'assets/icons/integrate.svg',
                  text: 'Integrate',
                  //style: headline6.copyWith(fontSize: 13.sp),
                  onChanged: model.togggleIntegrate,
                ),
                DisplayCheckBox(
                  value: model.todo,
                  assetName: 'assets/icons/todo.svg',
                  text: 'To-do',
                  //style: headline6.copyWith(fontSize: 13.sp),
                  onChanged: model.togggleTodo,
                ),
                DisplayCheckBox(
                  value: model.browser,
                  assetName: 'assets/icons/filebrowser.svg',
                  text: 'File browser',
                  // style: headline6.copyWith(fontSize: 13.sp),
                  onChanged: model.togggleBrowser,
                ),
                DisplayCheckBox(
                  value: model.channel,
                  assetName: 'assets/icons/channel.svg',
                  text: 'Channel browser',
                  // style: headline6.copyWith(fontSize: 13.sp),
                  onChanged: model.togggleChannel,
                ),
                SizedBox(height: 5),
                Divider(),
                SizedBox(height: 10),
                Text('Show...', style: preferenceStyleBold),
                DisplayRadio(
                    groupValue: model.sidebar,
                    text: 'All your conversation',
                    onChanged: (value) {
                      model.toggleSidebar((value));
                    },
                    value: PrefSidebar.AllConversation),
                DisplayRadio(
                    groupValue: model.sidebar,
                    text: 'Unread conversation only',
                    onChanged: (value) {
                      model.toggleSidebar((value));
                    },
                    value: PrefSidebar.Unread),
                DisplayRadio(
                    groupValue: model.sidebar,
                    text: 'Custom depending on section',
                    onChanged: (value) {
                      model.toggleSidebar((value));
                    },
                    value: PrefSidebar.Custom),
                SizedBox(height: 5),
                Text('Choose your settings for each section from the sidebar ',
                    style: preferenceStyleNormal),
                Divider(),
                SizedBox(height: 10),
                Text('Sort...', style: preferenceStyleBold),
                DisRadio(
                    groupValue: model.bar,
                    text: 'Alphabetically',
                    onChanged: (value) {
                      model.toggleBar((value));
                    },
                    value: PreBar.Alpha),
                DisRadio(
                    groupValue: model.bar,
                    text: 'By most recent',
                    onChanged: (value) {
                      model.toggleBar((value));
                    },
                    value: PreBar.Recent),
                DisRadio(
                    groupValue: model.bar,
                    text: 'By priority',
                    onChanged: (value) {
                      model.toggleBar((value));
                    },
                    value: PreBar.Priority),
                SizedBox(height: 5),
                Text(
                    'You can also choose how individual section are sorted directly from the sidebar',
                    style: preferenceStyleNormal),
                Divider(),
                SizedBox(height: 10),
                Text('Direct message announcements',
                    style: preferenceStyleBold),
                SizedBox(height: 5),
                DisCheckBox(
                    text: 'Show profile photos next to DM',
                    onChanged: model.togggleshow,
                    value: model.show),
                DisCheckBox(
                    text: 'List private chats separately',
                    onChanged: model.togggleList,
                    value: model.list),
                DisCheckBox(
                    text:
                        'Organize external conversations into the connections section',
                    onChanged: model.togggleOrganize,
                    value: model.organize),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => SideBarViewModel(),
      onModelReady: (model) => model.fetchAndSetSetting(),
      onDispose: (model) => model.saveSettings(),
    );
  }
}

class DisplayCheckBox extends StatelessWidget {
  final String assetName;
  final String text;
  final void Function(bool? value) onChanged;
  final bool value;

  const DisplayCheckBox(
      {Key? key,
      required this.assetName,
      required this.text,
      required this.onChanged,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: kcPrimaryColor,
        ),
        SvgPicture.asset(assetName),
        SizedBox(width: 5),
        Text(text, style: authBtnChannelStyle),
      ],
    );
  }
}



class DisplayRadio extends StatelessWidget {
  final String text;
  final void Function(Object? value) onChanged;
  final PrefSidebar value;
  final Object groupValue;

  const DisplayRadio(
      {Key? key,
      required this.groupValue,
      required this.text,
      required this.onChanged,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          groupValue: groupValue,
          value: value,
          onChanged: onChanged,
          activeColor: KStartupContainerColor,
        ),
        Text(text, style: preferenceStyleNormal),
      ],
    );
  }
}



class DisRadio extends StatelessWidget {
  final String text;
  final void Function(Object? value) onChanged;
  final PreBar value;
  final Object groupValue;

  const DisRadio(
      {Key? key,
      required this.groupValue,
      required this.onChanged,
      required this.text,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: KStartupContainerColor),
        Text(text, style: preferenceStyleNormal),
      ],
    );
  }
}

class DisCheckBox extends StatelessWidget {
  final String text;
  final void Function(bool? value) onChanged;
  final bool value;

  const DisCheckBox(
      {Key? key,
      required this.text,
      required this.onChanged,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: KStartupContainerColor,
        ),
        Text(text, style: preferenceStyleNormal),
      ],
    );
  }
}
