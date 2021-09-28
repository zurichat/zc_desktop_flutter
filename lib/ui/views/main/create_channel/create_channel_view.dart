import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_create_channel_input_field.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_text.dart';
import 'package:zc_desktop_flutter/ui/views/main/create_channel/create_channel_viewmodel.dart';

class CreateChannelView extends HookWidget {
  // const ChannelsCreationView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();

    return ViewModelBuilder<CreateChannelViewModel>.reactive(
      builder: (context, model, child) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        child: Container(
          height: (model.isCreateChannelNotSuccessful == true ||
                  model.isCreateChannelSuccessful == true ||
                  model.channelNameError != null)
              ? 725.h
              : 680.h,
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
                    ZcdeskText.headingCreateChannel(model.createChannel),
                    IconButton(
                      padding: EdgeInsets.symmetric(
                          vertical: 8.0.h, horizontal: 8.0.w),
                      iconSize: 22.0,
                      onPressed: () {
                        model.closeDialog();
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
                verticalSpaceRegularOne,
                ZcdeskText.textCreateChannel(
                  model.channelTextOne,
                ),
                verticalSpaceTinyThree,
                ZcdeskText.textCreateChannel(model.channelTextTwo),
                verticalSpaceMedium,
                if (model.isCreateChannelSuccessful)
                  Text(model.channelTextTen,
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
                      ZcdeskText.headingSmallCreateChannel(
                        model.channelTextThree,
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
                      verticalSpaceMedium,
                      Row(
                        children: [
                          ZcdeskText.headingSmallCreateChannel(
                            model.channelTextFour,
                          ),
                          ZcdeskText.textCreateChannel(
                            model.channelTextFive,
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
                    ZcdeskText.headingSmallCreateChannel(
                      model.channelTextSix,
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
                ZcdeskText.textCreateChannel(
                  model.channelTextSeven,
                ),
                verticalSpaceTinyTwo,
                ZcdeskText.textCreateChannel(
                  model.channelTextEight,
                ),
                verticalSpaceLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 55.0.h,
                      width: 155.0.w,
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
                          // await model.validateAndCreateChannel();

                          if (!_formKey.currentState!.validate()) return;

                          await model.createchannels(
                            nameController.text,
                            model.userEmail(),
                            descriptionController.text,
                            model.isPrivate,
                          );
                        },
                        child: !model.isBusy
                            ? Padding(
                                padding: EdgeInsets.only(bottom: 3.0.h),
                                child: Text(
                                  model.channelTextNine,
                                  style: authBtnChannelStyle,
                                ),
                              )
                            : CircularProgressIndicator(
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
