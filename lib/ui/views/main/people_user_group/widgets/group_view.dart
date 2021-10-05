import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/views/main/people_user_group/people_user_view_model.dart';

class GroupView extends StatelessWidget {
  const GroupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PeopleUserGroupViewModel>.nonReactive(
      viewModelBuilder: () => PeopleUserGroupViewModel(),
      builder: (
        BuildContext context,
        PeopleUserGroupViewModel model,
        Widget? child,
      ) {
        return Center(
          child: Text(
            'Still A Work In Progress. Cheers...',
            style: kHeading1TextStyle,
          ),
        );
      },
    );
  }
}