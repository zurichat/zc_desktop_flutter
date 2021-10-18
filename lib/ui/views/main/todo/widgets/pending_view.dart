import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/todo_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/widgets/TodoListContainer.dart';

class PendingView extends StatelessWidget {
  final TodoViewModel model;
  PendingView({Key? key, required this.model}) : super(key: key);
  // final _controller = ScrollController();
  
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
  
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
                  Container(
                    height: height < 1000 ? height * 0.6 : height * 0.7,
                    padding: EdgeInsets.only(
                      right: 30,
                    ),
                    child: GridView.builder(
                      addAutomaticKeepAlives: true,
                      // controller: _controller,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 60,
                          childAspectRatio: 1.2,
                          mainAxisSpacing: 70),
                      itemCount: model.todoList.length,
                      itemBuilder: (context, index) => TodoContainer(
                        Members: '', TodoName: model.todoList[index].title,
                        onTap: ()=>model.deleteTodo(index),
                        TodoText1:
                            model.todoList[index].description,
                        
                      ),
                    ),
                  )
                ],
              );
     
  }
}
