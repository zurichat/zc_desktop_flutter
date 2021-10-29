import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/const_widgets.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_checkbox.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/preferences/preferenceswidgets/mark_as_read/mark_as_read_viewModel.dart';

class MarkAsRead extends StatelessWidget {
  const MarkAsRead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _rightSideBarController = ScrollController();
    return ViewModelBuilder<MarkAsReadViewModel>.reactive(
        viewModelBuilder: () => MarkAsReadViewModel(),
        builder: (context, model, _) {
          return Scrollbar(
            controller: _rightSideBarController,
            isAlwaysShown: true,
            scrollbarOrientation: ScrollbarOrientation.right,
            thickness: 8,
            showTrackOnHover: true,
            child: SingleChildScrollView(
              controller: _rightSideBarController,
              child: Container(
                width: fullWidth(context),
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ViewChannel(model: model),
                    verticalSpaceRegular,
                    KeyBoardSettingsSection(model: model),
                    verticalSpaceRegular,
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class ViewChannel extends StatelessWidget {
  const ViewChannel({Key? key, required this.model}) : super(key: key);
  final MarkAsReadViewModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(model.msg, style: preferenceStyleBold),
        verticalSpaceRegular,
        verticalSpaceRegular,
        Text(model.boldMsg, style: preferenceStyleBold),
        verticalSpaceRegular,
        ViewChannelOptions(model: model),
        verticalSpaceRegular,
        Text(model.sBoldMsg, style: preferenceStyleBold),
        verticalSpaceRegular,
        ViewMarkAll(model: model),
        // Text('Keyboard Shortcuts', style: headline6.copyWith(fontSize: 15.sp)),
      ],
    );
  }
}

class ViewChannelOptions extends StatelessWidget {
  const ViewChannelOptions({Key? key, required this.model}) : super(key: key);

  final MarkAsReadViewModel model;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ListTile(
        title: Text(startWhereILeftOff,
            style: preferenceStyleNormal),
        leading: Radio(
          value: UpButtonsChoice.option1,
          groupValue: model.upButtonsChoice,
          onChanged: (UpButtonsChoice? val) {
            model.setCheckVal = val;
          },
          activeColor: kcPrimaryColor,
        ),
      ),
      ListTile(
        title: Text(startAtNewestMessage,
            style: preferenceStyleNormal),
        leading: Radio(
          value: UpButtonsChoice.option2,
          groupValue: model.upButtonsChoice,
          onChanged: (UpButtonsChoice? val) {
            model.setCheckVal = val;
          },
          activeColor: kcPrimaryColor,
        ),
      ),
      ListTile(
        title: Text(
            startAtNewestMessageUnread,
            style: preferenceStyleNormal),
        leading: Radio(
          value: UpButtonsChoice.option3,
          groupValue: model.upButtonsChoice,
          onChanged: (UpButtonsChoice? val) {
            model.setCheckVal = val;
          },
          activeColor: kcPrimaryColor,
        ),
      ),
    ]);
  }
}

class ViewMarkAll extends StatelessWidget {
  const ViewMarkAll({Key? key, required this.model}) : super(key: key);

  final MarkAsReadViewModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ZcCheckBox(
            value: model.animateValue,
            onChanged: (v) {
              model.setAnimateValue = v;
            }),
        horizontalSpaceTiny,
        Flexible(
            child: Text(promptConfirm, style: preferenceStyleNormal)),
      ],
    );
  }
}

//keyboard Section
class KeyBoardSettingsSection extends StatelessWidget {
  const KeyBoardSettingsSection({Key? key, required this.model})
      : super(key: key);

  final MarkAsReadViewModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(keyboardShortcuts, style: preferenceStyleBold),
          verticalSpaceRegular,
          Row(
            children: [
              Text(model.fShortCutMsg, style: preferenceStyleNormal),
              horizontalSpaceTiny,
              ShortCuts().esc(),
              horizontalSpaceTiny,
            ],
          ),
          verticalSpaceSmall,
          Row(
            children: [
              Text(model.sShortCutMsg, style: preferenceStyleNormal),
              horizontalSpaceTiny,
              ShortCuts().shift(),
              horizontalSpaceTiny,
              ShortCuts().esc(),
              horizontalSpaceTiny,
            ],
          ),
          verticalSpaceSmall,
          Row(
            children: [
              Text(model.tShortCutMsg, style: preferenceStyleNormal),
              horizontalSpaceTiny,
              ShortCuts().alt(),
              horizontalSpaceTiny,
            ],
          ),
          verticalSpaceSmall,
          Row(
            children: [
              verticalSpaceTiny,
              Text(viewFullList,
                  style: preferenceStyleNormal),
              horizontalSpaceTiny,
              ShortCuts().ctrl(),
              horizontalSpaceTiny,
              Text('+'),
              horizontalSpaceTiny,
              ShortCuts().alt(),
            ],
          ),
        ],
      ),
    );
  }
}













