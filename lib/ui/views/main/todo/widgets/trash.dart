import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/todo_viewmodel.dart';

class TrashView extends StatelessWidget {
  const TrashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TodoViewModel>.nonReactive(
      viewModelBuilder: () => TodoViewModel(),
      builder: (
        BuildContext context,
        TodoViewModel model,
        Widget? child,
      ) {
        return Center(
          child: Text(
            'TRASH',
            style: kHeading1TextStyle,
          ),
        );
      },
    );
  }
}
