import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';

import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';

import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/views/main/people_user_group/people_user_view_model.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/todo_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/widgets/TodoListContainer.dart';

class PendingView extends StatelessWidget {
  PendingView({Key? key}) : super(key: key);
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ViewModelBuilder<TodoViewModel>.reactive(
      viewModelBuilder: () => TodoViewModel(),
      builder: (
        BuildContext context,
        TodoViewModel model,
        Widget? child,
      ) {
        return model.isLoading
            ? SizedBox(
                height: 300.h,
                child: Center(
                  child: CircularProgressIndicator(
                    color: kcPrimaryColor,
                  ),
                ),
              )
            : Column(
                children: [
                  verticalSpaceMediumTwo,
                  verticalSpaceSmallOne,
                  Scrollbar(
                    controller: _controller,
                    isAlwaysShown: true,
                    child: Container(
                      height: height < 1000 ? height * 0.6 : height * 0.7,
                      padding: EdgeInsets.only(
                        right: 20,
                      ),
                      child: GridView.builder(
                        addAutomaticKeepAlives: true,
                        controller: _controller,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 40,
                            childAspectRatio: 1.8,
                            mainAxisSpacing: 20),
                        itemCount: 6,
                        itemBuilder: (context, index) => TodoContainer(
                          Members: '', TodoName: 'Create a Prototype',
                          TodoText1:
                              'Create a Prototype Mobile for \nGet Notification on Zuri',
                          // TodoName: model.suggestionList[index].displayName,
                          // TodoText1:
                          //     model.suggestionList[index].displayImage,
                          // bio: model.suggestionList[index].bio,
                          // isActive: model.suggestionList[index].isActive,
                        ),
                      ),
                    ),
                  )
                ],
              );
      },
    );
  }
}
