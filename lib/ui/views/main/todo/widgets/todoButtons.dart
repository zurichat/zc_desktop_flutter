import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/widgets/create_tododialog_viewmodel.dart';

class CreateDateButton extends StatelessWidget {
  CreateDateButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateTodoDialogModel>.reactive(
      viewModelBuilder: () => CreateTodoDialogModel(),
      builder: (
        BuildContext context,
        CreateTodoDialogModel model,
        Widget? child,
      ) {
        return  ElevatedButton.icon(
          onPressed: ()=> showDatePicker(
                              initialDate: DateTime.now(),
                              firstDate: DateTime.utc(DateTime.now().year),
                              lastDate: DateTime.utc(2050),
                              context: context)
                          .then((value) => model.setSelectedDate(value!)),
          icon: Icon(
            Icons.date_range,
            color: Colors.white,
            size: 20.0,
          ),
          label: Text(model.selectedDate),
          style: ElevatedButton.styleFrom(
            primary: KStartupContainerColor,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        );
        },
    );
  }
}

class ViewTodo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // final _navigate = locator<NavigationService>();
        // _navigate
        //     .navigateTo(!isHome ? Routes.loginView : Routes.PendingView);
      },
      child: Text(
        'View Task',
        style: headline6.copyWith(fontSize: 15,
          color: Color.fromRGBO(0, 184, 124, 1),
        ),
      ),
    );
  }
}