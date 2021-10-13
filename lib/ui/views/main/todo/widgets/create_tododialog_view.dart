import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';

import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_create_channel_input_field.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_text.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/todo_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/widgets/create_tododialog_viewmodel.dart';

class CreateTodoDialogView extends HookWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TodoViewModel todoModel;
  CreateTodoDialogView(this.todoModel);
  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();

    return ViewModelBuilder<CreateTodoDialogModel>.reactive(
      builder: (context, model, child) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        child: Container(
          width: 450.w,
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
                    Text(
                      CreateTodo,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                      padding: EdgeInsets.symmetric(
                          vertical: 8.0.h, horizontal: 8.0.w),
                      iconSize: 22.0,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
                verticalSpaceSmall,
                Text(
                  TodoTextOne,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                ),

                verticalSpaceTinyThree,
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
                      Text(
                        TodoTextTwo,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      CreateChannelInputField(
                        // onChanged: (value) {
                        //   model.settodoName(value);
                        // },
                        borderColor: model.todoName == ''
                            ? lightIconColor
                            : kcPrimaryColor,
                        borderFocusColor: model.todoName == ''
                            ? lightIconColor
                            : kcPrimaryColor,
                        controller: nameController,
                        errorText: model.todoNameError,
                        keyboardType: TextInputType.name,
                        hintPlaceHolder: TodoTextThree,
                        maxLegth: 80,
                      ),
                      verticalSpaceMedium,
                      Row(
                        children: [
                          Text(
                            TodoTextFour,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          horizontalSpaceTiny,
                          ZcdeskText.textCreateChannel(
                            TodoTextFive,
                          ),
                        ],
                      ),
                      CreateChannelInputField(
                        // onChanged: (value) {
                        //   model.settodoDescription(value);
                        // },
                        borderColor: model.todoDescription == ''
                            ? lightIconColor
                            : kcPrimaryColor,
                        borderFocusColor: model.todoDescription == ''
                            ? lightIconColor
                            : kcPrimaryColor,
                        controller: descriptionController,
                        errorText: model.todoDescriptionError,
                        keyboardType: TextInputType.text,
                        hintPlaceHolder: TodoTextTen,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
                verticalSpaceMedium,
                Row(
                  children: [
                    Text(
                      TodoTextSeven,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    horizontalSpaceTiny,
                    ZcdeskText.textCreateChannel(
                      TodoTextFive,
                    ),
                  ],
                ),
                verticalSpaceTiny,
                Container(
                  height: 50,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(color: kcDisplayChannelColor4)),
                  child: ElevatedButton(
                    onPressed: () => showDatePicker(
                            initialDate: DateTime.now(),
                            firstDate: DateTime.utc(DateTime.now().year),
                            lastDate: DateTime.utc(2050),
                            context: context)
                        .then((value) => model.setSelectedDate(value!)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.date_range,
                                  color: Colors.black,
                                  size: 20.0,
                                ),
                                horizontalSpaceTiny,
                                Text(
                                  model.selectedDate,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            Icon(Icons.keyboard_arrow_down_sharp,
                                color: Colors.black),
                          ],
                        )
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: whiteColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                        elevation: 0),
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

                verticalSpaceSmall,
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
                          if (!_formKey.currentState!.validate()) return;
                          await model.runBusyFuture(todoModel.createTodo(
                              title: nameController.text,
                              description: descriptionController.text));
                          Navigator.of(context).pop();
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
