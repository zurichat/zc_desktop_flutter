import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';

import 'profile_show_viewmodel.dart';

class ProfileShowView extends StatelessWidget {
  ProfileShowView({Key? key}) : super(key: key);

  final scrollcontroller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileShowViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Profile View",
                      style: kHeading3TextStyle,
                    ),
                    IconButton(
                      color: kcSuccessColor,
                      onPressed: () {
                        model.closeDialog();
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              Divider(),
              Expanded(
                child: Scrollbar(
                  controller: scrollcontroller,
                  isAlwaysShown: true,
                  thickness: 10,
                  showTrackOnHover: true,
                  child: SingleChildScrollView(
                    controller: scrollcontroller,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 200.h,
                                width: 200.w,
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle),
                                child: Image.asset(
                                    'assets/images/profile_placeholder.jpg'),
                              ),
                              verticalSpaceRegular,
                              Text(
                                "tobi",
                                style: kHeading4TextStyle,
                              ),
                              Text(
                                "Beginner Flutter Mobile Dev || UI/UX Designer",
                                style: kSubHeadingTextStyle,
                              ),
                              Text(
                                'Him/He',
                                style: subtitle2,
                              ),
                              verticalSpaceMedium,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 60.w,
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: kcPrimaryColor,
                                        ),
                                        child: Icon(
                                          Icons.call,
                                          size: 30,
                                          color: kcBackgroundColor2,
                                        ),
                                      ),
                                      verticalSpaceSmall,
                                      Text(
                                        'Voice Call',
                                      )
                                    ],
                                  ),
                                  horizontalSpaceRegular,
                                  Column(
                                    children: [
                                      Container(
                                        width: 80.w,
                                        height: 80.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: kcSuccessColor,
                                        ),
                                      ),
                                      verticalSpaceSmall,
                                      Text(
                                        'Video Call',
                                      )
                                    ],
                                  ),
                                  horizontalSpaceSmall,
                                  Column(
                                    children: [
                                      Container(
                                        width: 60.w,
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: kcPrimaryColor,
                                        ),
                                        child: Icon(
                                          Icons.more_horiz,
                                          size: 30,
                                          color: kcBackgroundColor2,
                                        ),
                                      ),
                                      verticalSpaceSmall,
                                      Text(
                                        'More',
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        verticalSpaceMedium,
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Display Name"),
                              verticalSpaceSmall,
                              Text("tobi", style: kHeading4TextStyle),
                              verticalSpaceMedium,
                              Divider(),
                              verticalSpaceRegular,
                              Text("Email Adress"),
                              verticalSpaceSmall,
                              Text("tobi@gmail.com", style: kHeading4TextStyle),
                              verticalSpaceMedium,
                              Divider(),
                              verticalSpaceRegular,
                              Text("Phone Number"),
                              verticalSpaceSmall,
                              Text("+234 601 788 9991",
                                  style: kHeading4TextStyle),
                              verticalSpaceMedium,
                              Divider(),
                              verticalSpaceRegular,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.edit),
                                  ),
                                  horizontalSpaceSmall,
                                  Text(
                                    'Edit Profile',
                                    style: kHeading4TextStyle,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => ProfileShowViewModel(),
    );
  }
}
