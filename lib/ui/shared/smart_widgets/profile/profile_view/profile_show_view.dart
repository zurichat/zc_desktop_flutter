import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_asset_paths.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
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
                      profileView,
                      style: kHeading4TextStyle,
                    ),
                    IconButton(
                      color: kcSuccessColor,
                      onPressed: () {
                        model.closeDialog();
                        Navigator.pop(context);
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
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 200.h,
                                width: 200.w,
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle),
                                child: Image.asset(
                                  profileImage,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              verticalSpaceRegular,
                              Text(
                                model.name,
                                style: headline7,
                              ),
                              Text(
                                model.description,
                                style: headline7,
                              ),
                              Text(
                                model.title,
                                style: headline7,
                              ),
                              verticalSpaceMedium,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 40.w,
                                        height: 40.h,
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
                                      Text(voiceCall)
                                    ],
                                  ),
                                  horizontalSpaceSmall,
                                  Column(
                                    children: [
                                      Container(
                                        width: 40.w,
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: kcPrimaryColor,
                                        ),
                                        child: Icon(
                                          Icons.video_call,
                                          size: 30,
                                          color: kcBackgroundColor2,
                                        ),
                                      ),
                                      verticalSpaceSmall,
                                      Text(
                                        videoCall,
                                      )
                                    ],
                                  ),
                                  horizontalSpaceSmall,
                                  Column(
                                    children: [
                                      Container(
                                        width: 40.w,
                                        height: 40.h,
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
                                        textMore,
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
                              Text(displayName),
                              verticalSpaceSmall,
                              Text(model.name, style: subtitle3b),
                              verticalSpaceMedium,
                              Divider(),
                              verticalSpaceRegular,
                              Text(displayemail),
                              verticalSpaceSmall,
                              Text(model.email, style: subtitle3b),
                              verticalSpaceMedium,
                              Divider(),
                              verticalSpaceRegular,
                              Text(phoneNumber),
                              verticalSpaceSmall,
                              Text(model.phoneNumber, style: subtitle3b),
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
                                    editProfile,
                                    style: subtitle3b,
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
