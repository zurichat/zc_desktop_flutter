import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/const_widgets.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_checkbox.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/preferenceswidgets/mark_as_read/mark_as_read_viewModel.dart';

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
        Text(model.msg),
        verticalSpaceRegular,
        Text(model.boldMsg, style: headline6.copyWith(fontSize: 15.sp)),
        verticalSpaceRegular,
        ViewChannelOptions(model: model),
        verticalSpaceRegular,
        Text(model.sBoldMsg, style: headline6.copyWith(fontSize: 15.sp)),
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
        title: Text('Start me where I left off, and mark the channel read',
            style: headline6.copyWith(fontSize: 14.sp)),
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
        title: Text('Start me at the newest message, and mark the channel read',
            style: headline6.copyWith(fontSize: 14.sp)),
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
            'Start me at the newest message, but leave unseen messages unread',
            style: headline6.copyWith(fontSize: 14.sp)),
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
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ZcCheckBox(
        value: model.markAll,
        onChanged: (v) {
          model.setMarkAll = v;
        },
      ),
      horizontalSpaceTiny,
      Flexible(
          child: Text(model.clickMarkAll,
              style: headline6.copyWith(fontSize: 14.sp))),
    ]);
  }
}

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
          // key short cut setting
          Text('Keyboard Shortcuts',
              style: headline6.copyWith(fontSize: 15.sp)),
          verticalSpaceRegular,
          Row(
            children: [
              Text(model.fShortCutMsg,
                  style: headline6.copyWith(fontSize: 15.sp)),
              horizontalSpaceTiny,
              ShortCuts().esc(),
              horizontalSpaceTiny,
            ],
          ),
          verticalSpaceSmall,
          Row(
            children: [
              Text(model.sShortCutMsg,
                  style: headline6.copyWith(fontSize: 15.sp)),
              horizontalSpaceTiny,
              ShortCuts().shift(),
              verticalSpaceTiny,
              ShortCuts().esc(),
              horizontalSpaceTiny,
            ],
          ),
          Row(
            children: [
              Text(model.tShortCutMsg,
                  style: headline6.copyWith(fontSize: 15.sp)),
              horizontalSpaceTiny,
              ShortCuts().alt(),
              horizontalSpaceTiny,
            ],
          ),
          Row(
            children: [
              Text('To view the full list of keyboard shortcuts, just press',
                  style: headline6.copyWith(fontSize: 15.sp)),
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
