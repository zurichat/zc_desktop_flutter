import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/views/main/people_user_group/people_user_view_model.dart';

class ArchiveView extends StatelessWidget {
  const ArchiveView({Key? key}) : super(key: key);

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
            'Archive',
            style: kHeading1TextStyle,
          ),
        );
      },
    );
  }
}
