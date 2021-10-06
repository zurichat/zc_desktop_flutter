import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_create_channel_input_field.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_text.dart';
// import 'package:zc_desktop_flutter/ui/views/main/create_channel/create_channel_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/widgets/create_tododialog_viewmodel.dart';

class CreateTodoDialogView extends HookWidget {
  // const ChannelsCreationView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();

    return ViewModelBuilder<CreateTodoDialogModel>.reactive(
      builder: (context, model, child) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        child: Container(
          height: ( //model.isCreateTodoNotSuccessful == true ||
                  // model.isCreateTodoSuccessful == true ||
                  model.todoNameError != null)
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
                    ZcdeskText.headingCreateChannel(CreateTodo),
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
                  TodoTextOne,
                ),
                verticalSpaceTinyThree,
                ZcdeskText.textCreateChannel("TodoTextTwo"),
                verticalSpaceMedium,
                // if (model.isCreateTodoSuccessful)
                // Text(TodoTextTen,
                //     style: headline7.copyWith(color: kcSuccessColor)),
                // if (model.isCreateTodoNotSuccessful)
                Text(model.errorMessage,
                    style: headline7.copyWith(color: kcErrorColor)),
                verticalSpaceTinyThree,
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ZcdeskText.headingSmallCreateChannel(
                        TodoTextThree,
                      ),
                      CreateChannelInputField(
                        onChanged: (value) {
                          model.settodoName(value);
                        },
                        borderColor: model.todoName == ''
                            ? lightIconColor
                            : kcPrimaryColor,
                        borderFocusColor: model.todoName == ''
                            ? lightIconColor
                            : kcPrimaryColor,
                        controller: nameController,
                        errorText: model.todoNameError,
                        keyboardType: TextInputType.name,
                        hintPlaceHolder: '',
                      ),
                      verticalSpaceMedium,
                      Row(
                        children: [
                          ZcdeskText.headingSmallCreateChannel(
                            TodoTextFour,
                          ),
                          ZcdeskText.textCreateChannel(
                            TodoTextFive,
                          ),
                        ],
                      ),
                      CreateChannelInputField(
                        onChanged: (value) {
                          model.settodoDescription(value);
                        },
                        borderColor: model.todoDescription == ''
                            ? lightIconColor
                            : kcPrimaryColor,
                        borderFocusColor: model.todoDescription == ''
                            ? lightIconColor
                            : kcPrimaryColor,
                        controller: descriptionController,
                        errorText: model.todoDescriptionError,
                        keyboardType: TextInputType.text,
                        hintPlaceHolder: '',
                      ),
                    ],
                  ),
                ),
                verticalSpaceMedium,
                Row(
                  children: [
                    ZcdeskText.headingSmallCreateChannel(
                      TodoTextFour,
                    ),
                    ZcdeskText.textCreateChannel(
                      TodoTextFive,
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: 400,
                  child: GestureDetector(
                    onTap: () {},
                    child: ElevatedButton(
                      onPressed: () => {
                        DateFormat("yyyy-MM-dd").format(
                          DateTime.now(),
                        ),
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.date_range,
                            color: Colors.black,
                            size: 20.0,
                          ),
                          Text(
                            'Sept 18, 2021',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: whiteColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                verticalSpaceMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ZcdeskText.headingSmallCreateChannel(
                      TodoTextSix,
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
                // verticalSpaceSmall,
                // ZcdeskText.textCreateChannel(
                //   TodoTextSeven,
                // ),
                verticalSpaceTinyTwo,
                // ZcdeskText.textCreateChannel(
                //   TodoTextEight,
                // ),
                // Center(
                //   child: Text(
                //     DateFormat("yyyy-MM-dd").format(
                //       DateTime.now(),
                //     ),
                //   ),
                // ),
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
                              (model.todoName == '' &&
                                      model.todoDescription == '')
                                  ? kcCreateChannelColor
                                  : kcPrimaryColor,
                            )),
                        onPressed: () async {
                          // await model.validateAndCreateChannel();

                          if (!_formKey.currentState!.validate()) return;

                          // await model.createtodos(
                          //   nameController.text,
                          //   model.userEmail(),
                          //   descriptionController.text,
                          //   model.isPrivate,
                          // );
                        },
                        child: !model.isBusy
                            ? Padding(
                                padding: EdgeInsets.only(bottom: 3.0.h),
                                child: Text(
                                  TodoTextNine,
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
      viewModelBuilder: () => CreateTodoDialogModel(),
    );
  }
}
