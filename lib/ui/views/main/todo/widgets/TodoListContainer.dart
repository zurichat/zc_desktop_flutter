import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/custom_color.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/widgets/todoButtons.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/widgets/workspace_todo_member.dart';

class TodoContainer extends StatelessWidget {
  final String TodoName;
  final String TodoText1;
  final String Members;
  final bool isActive;
  final String bio;
  final VoidCallback? onTap;
  const TodoContainer(
      {Key? key,
      required this.TodoName,
      required this.TodoText1,
      required this.Members,
      this.onTap,
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
        height: 5,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    TodoName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  horizontalSpaceSmall,
                  IconButton(
                    onPressed: onTap,
                    icon: Icon(
                      Icons.delete,
                      color: red,
                    ),
                  ),
                ],
              ),
            ),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                horizontalSpaceSmall,
                Text(
                  TodoText1,
                  // "Create a Prototype Mobile for \nGet Notification on Slack",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // verticalSpaceMedium,
                  // horizontalSpaceSmall,
                  CreateDateButton(),
                ],
              ),
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
