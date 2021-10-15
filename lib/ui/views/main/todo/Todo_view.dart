import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/todo_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/widgets/archive_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/widgets/create_tododialog_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/widgets/pending_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/widgets/trash.dart';

class TodoView extends StatelessWidget {
  TodoView({Key? key}) : super(key: key);
  List<Widget> widgetsToShow(model) =>
      [PendingView(model: model), ArchiveView(), TrashView()];
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
              Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Container(
                  height: 40,
                  width: double.infinity,
                  color: kcPrimaryColor,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        '# $TodoList',
                        style: headline7.copyWith(color: kcBackgroundColor2),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: whiteColor,
                          ),
                          padding: const EdgeInsets.only(bottom: 18)),
                    ],
                  ),
                ),
              ),
              verticalSpaceSmall,
              Divider(),
              Flexible(
                fit: FlexFit.loose,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 30.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () =>
                              // Respond to button press
                              showDialog(
                            context: context,
                            builder: (context) => CreateTodoDialogView(
                              model,
                              //createToDo: (String title, String description) {  }, isBusy: true,
                            ),
                          ),
                          child: Text(CreateTodo),
                          style: ElevatedButton.styleFrom(
                            primary: KStartupContainerColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            textStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
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
                                ? 28.w
                                : model.pageIndex == 1
                                    ? 150.w
                                    : 258.w)
                            : (model.pageIndex == 0
                                ? 28.w
                                : model.pageIndex == 1
                                    ? 150.w
                                    : 228.w)),
                    child: Container(
                      height: 3.h,
                      width: 38.w,
                      color: kcPrimaryColor,
                    ),
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: widgetsToShow(model)[model.pageIndex])
            ],
          ),
        );
      },
      onModelReady: (model) => model.fetchAndSetTodos(),
    );
  }
}
