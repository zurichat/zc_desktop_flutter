import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/goto_login_button.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';
import 'package:zc_desktop_flutter/ui/views/main/create_channel/create_channel_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/people_user_group/people_user_view_model.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/todo_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/widgets/archive_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/widgets/create_tododialog_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/widgets/pending_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/widgets/trash.dart';

class TodoView extends StatelessWidget {
  TodoView({Key? key}) : super(key: key);
  final List<Widget> widgetsToShow = [
    PendingView(),
    ArchiveView(),
    TrashView()
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ViewModelBuilder<TodoViewModel>.reactive(
      viewModelBuilder: () => TodoViewModel(),
      builder: (
        BuildContext context,
        TodoViewModel model,
        Widget? child,
      ) {
        return Container(
          color: kcBackgroundColor2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: double.infinity,
                color: kcPrimaryColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '# $TodoList',
                      style: headline7.copyWith(color: kcBackgroundColor2),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.close, color: Colors.white),
                        padding: const EdgeInsets.only(bottom: 18)),
                  ],
                ),
              ),
              verticalSpaceSmall,
              Divider(),
              SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => model.setPageIndex(0),
                          child: Text(
                            PendingText,
                            style: preferenceStyleNormal.copyWith(
                                color: model.pageIndex == 0
                                    ? kcPrimaryColor
                                    : Colors.grey),
                          ),
                        ),
                        horizontalSpaceLarge,
                        GestureDetector(
                          onTap: () => model.setPageIndex(1),
                          child: Text(
                            ArchiveText,
                            style: preferenceStyleNormal.copyWith(
                                color: model.pageIndex != 1
                                    ? Colors.grey
                                    : kcPrimaryColor),
                          ),
                        ),
                        horizontalSpaceLarge,
                        GestureDetector(
                          onTap: () => model.setPageIndex(2),
                          child: Text(
                            TrashText,
                            style: preferenceStyleNormal.copyWith(
                                color: model.pageIndex != 2
                                    ? Colors.grey
                                    : kcPrimaryColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 750),
                          child: GestureDetector(
                            onTap: () {},
                            child: ElevatedButton(
                              onPressed: () =>
                                  // Respond to button press
                                  showDialog(
                                      context: context,
                                      builder: (context) => CreateTodoDialogView()),
                              child: Text('Create a new Todo'),
                              style: ElevatedButton.styleFrom(
                                primary: KStartupContainerColor,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                textStyle: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
              Stack(
                children: [
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(
                        left: !(width >= 1240)
                            ? (model.pageIndex == 0
                                ? 26.w
                                : model.pageIndex == 1
                                    ? 150.w
                                    : 258.w)
                            : (model.pageIndex == 0
                                ? 26.w
                                : model.pageIndex == 1
                                    ? 130.w
                                    : 228.w)),
                    child: Container(
                      height: 4.h,
                      width: 36.w,
                      color: kcPrimaryColor,
                    ),
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: widgetsToShow[model.pageIndex])
            ],
          ),
        );
      },
    );
  }
}


class BuildToDoDialog extends StatelessWidget {
  const BuildToDoDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 400.w,
        height: 600.h,
        child: Column(
          children:[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Create A new Todo'),
                  IconButton(onPressed: (){}, icon: Icon(Icons.close))
                ]
              ),
            ),
            verticalSpaceMedium,
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ZuriDeskInputField(
                label: 'Title',
                hintPlaceHolder: 'Create a prototype'
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ZuriDeskInputField(
                label: 'Description',
                hintPlaceHolder: 'Create a prototype for mobile',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Due Date'),
                ],
              ),
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: kcDisplayChannelColor4),),
              child: GestureDetector(
      onTap: () => showDatePicker(
                context: context,
                initialDate: new DateTime.now(),
                firstDate: new DateTime.now().subtract(new Duration(days: 30)),
                lastDate: new DateTime.now().add(new Duration(days: 30)),
              ),
      
      // showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.utc(2021), lastDate: DateTime.utc(2050)),
       child: ElevatedButton.icon(
        onPressed: () {
          // Respond to button press
        },
        icon: Icon(
          Icons.date_range,
          color: Colors.black,
          size: 20.0,
        ),
        label: Text('${DateTime.now()}', style: TextStyle(color: searchBarColor),),
        style: ElevatedButton.styleFrom(
          primary: whiteColor,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: searchBarColor),
        ),
      ),
    ),
            ),
            // GestureDetector(
            //   onTap: () => showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.utc(2021), lastDate: DateTime.utc(2050)),
            //   child: Container(
            //     child: Text('${DateTime.now()}')
            //   ),
            // )
          ]
        )
      ),
    );
  }
}
