import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_create_channel_input_field.dart';
import 'package:zc_desktop_flutter/ui/views/main/create_channel/create_channel_viewmodel.dart';

class CreateChannelView extends HookWidget {
  // const ChannelsCreationView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final _appLocalization = AppLocalizations.of(context)!;

    return ViewModelBuilder<CreateChannelViewModel>.reactive(
      
      builder: (context, model, child) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        child: Container(
          height: (model.isCreateChannelNotSuccessful == true ||
                  model.isCreateChannelSuccessful == true ||
                  model.channelNameError != null ||
                  model.channelDescriptionError != null)
              ? 660.h
              : 560.h,
          width: 410.w,
          child: Padding(
            padding: EdgeInsets.only(
              top: 10.0.h,
              left: 15.0.w,
              right: 17.0.w,
              bottom: 10.0.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ZcdeskText.headingCreateChannel(model.createChannel),
                    Text(
                      _appLocalization.createAccounText,
                      style: createChannelHeaderStyle,
                    ),
                    Builder(
                      builder: (context) {
                        return IconButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0.h, horizontal: 8.0.w),
                          iconSize: 22.0,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.close),
                        );
                      },
                    ),
                  ],
                ),
                Text(
                  _appLocalization.channelTextOne,
                  style: createChannelTextStyle,
                ),
                verticalSpaceTinyThree,
                Text(
                  _appLocalization.channelTextTwo,
                  style: createChannelTextStyle,
                ),
                // ZcdeskText.textCreateChannel(channelTextTwo),
                verticalSpaceSmall,
                verticalSpaceSmall,
                if (model.isCreateChannelSuccessful)
                  Text(_appLocalization.channelTextTen,
                      style: headline7.copyWith(color: kcSuccessColor)),
                if (model.isCreateChannelNotSuccessful)
                  Text(model.errorMessage,
                      style: headline7.copyWith(color: kcErrorColor)),
                verticalSpaceTinyThree,
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       _appLocalization.channelTextThree,
                        style: createChannelSmallHeaderStyle,
                      ),
                      CreateChannelInputField(
                        onChanged: (value) {
                          model.setchannelName(value);
                        },
                        borderColor: model.channelName == ''
                            ? lightIconColor
                            : kcPrimaryColor,
                        borderFocusColor: model.channelName == ''
                            ? lightIconColor
                            : kcPrimaryColor,
                        controller: nameController,
                        errorText: model.channelNameError,
                        keyboardType: TextInputType.name,
                        hintPlaceHolder: '',
                      ),
                      verticalSpaceRegular,
                      Row(
                        children: [
                          Text(
                            //todoTextFour still holds the value 'Description'
                           _appLocalization.todoTextFour,
                            style: createChannelSmallHeaderStyle,
                          ),
                          Text(
                           _appLocalization.todoTextFive,
                            style: createChannelTextStyle,
                          ),
                        ],
                      ),
                      CreateChannelInputField(
                        onChanged: (value) {
                          model.setchannelDescription(value);
                        },
                        borderColor: model.channelDescription == ''
                            ? lightIconColor
                            : kcPrimaryColor,
                        borderFocusColor: model.channelDescription == ''
                            ? lightIconColor
                            : kcPrimaryColor,
                        controller: descriptionController,
                        errorText: model.channelDescriptionError,
                        keyboardType: TextInputType.text,
                        hintPlaceHolder: '',
                      ),
                    ],
                  ),
                ),
                verticalSpaceMediumTwo,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     _appLocalization.channelTextSix,
                      style: createChannelSmallHeaderStyle,
                    ),
                    Switch(
                      value: model.isSwitched,
                      onChanged: (value) {
                        model.setIsSwitched(value);
                      },
                      activeTrackColor: kcCreateChannelHoverColor,
                      inactiveTrackColor: kcBackgroundColor1,
                      activeColor: kcPrimaryColor,
                    ),
                  ],
                ),
                verticalSpaceSmall,
                Text(
                 _appLocalization.channelTextSeven,
                  style: createChannelTextStyle,
                ),
                verticalSpaceTinyTwo,
                Text(
                 _appLocalization.channelTextEight,
                  style: createChannelTextStyle,
                ),
                verticalSpaceLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 48.0.h,
                      width: 152.0.w,
                      child: TextButton(
                        style: ButtonStyle(
                            mouseCursor: MaterialStateMouseCursor.clickable,
                            backgroundColor: MaterialStateProperty.all(
                              (model.channelName == '' &&
                                      model.channelDescription == '')
                                  ? kcCreateChannelColor
                                  : kcPrimaryColor,
                            )),
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) return;

                          await model.createchannels(
                              nameController.text,
                              model.userDisplayName(),
                              descriptionController.text,
                              model.isPrivate,
                              nameController.text,
                              model.isPrivate,
                              context);
                        },
                        child: !model.isBusy
                            ? Padding(
                                padding: EdgeInsets.only(bottom: 3.0.h),
                                child: Text(
                                 _appLocalization.channelTextNine,
                                  style: authBtnChannelStyle,
                                ),
                              )
                            : CircularProgressIndicator(
                                strokeWidth: 4.0,
                                color: whiteColor,
                              ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => CreateChannelViewModel(),
    );
  }
}
