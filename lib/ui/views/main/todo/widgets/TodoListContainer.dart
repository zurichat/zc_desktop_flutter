import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/center_tile.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/goto_login_button.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/workspace_members_widget.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/widgets/goto_login_button.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/widgets/workspace_todo_member.dart';


class TodoContainer extends StatelessWidget {
  final String TodoName;
  final String TodoText1;
  final String Members;
  final bool isActive;
  final String bio;
  const TodoContainer(
      {Key? key,
      required this.TodoName,
      required this.TodoText1,
      required this.Members,
      this.bio = '',
      this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: kcDisplayChannelColor4)),
      child: SizedBox(
        height: 10,
        child: Column(
          children: [
            verticalSpaceTiny,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    TodoName,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  horizontalSpaceTiny,
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Icon(
                      Icons.add_circle_outline_rounded,
                      color: Colors.black,
                      size: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    TodoText1,
                    // "Create a Prototype Mobile for \nGet Notification on Slack",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                horizontalSpaceSmall,
                CreateDateButton(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WorkSpaceTodoMembers(),
                  ViewTodo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
