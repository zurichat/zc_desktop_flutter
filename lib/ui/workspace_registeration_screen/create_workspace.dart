import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_auth_btn.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';

import 'create_workspace_viewmodel.dart';

class CreateWorkspaceView extends StatelessWidget {
  const CreateWorkspaceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool check = false;
    return ViewModelBuilder<CreateWorkspaceViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Container(
            width: model.formWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    verticalSpaceLarge,
                    verticalSpaceLarge,
                    SvgPicture.asset(model.logoUrl),
                    verticalSpaceMedium,
                    Text(
                      model.signInText,
                      style: kHeading2TextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    verticalSpaceSmall,
                    Text(
                      model.signInText2,
                      style: kLeftSideBarStyle.copyWith(color: Colors.black),
                    ),
                    verticalSpaceRegular,
                    AuthInputField(
                      onChanged: (value) {
                        model.setEmail(value);
                      },
                      onSaved: (value) {
                        model.setEmail(value);
                      },
                      // errorText: model.emailErrorText,
                      keyboardType: TextInputType.emailAddress,
                      hintPlaceHolder: 'example@work.com',
                    ),
                    verticalSpaceMedium,
                    Container(
                      width: double.infinity,
                      height: model.authButtonHeight,
                      child: AuthButton(
                        label: model.btnText,
                        isBusy: model.isBusy,
                        onTap: () {
                          model.goToStage1();
                        },
                      ),
                    ),
                    verticalSpaceRegular,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          splashRadius: 0.0,
                          value: model.acceptEmails,
                          activeColor: kcSuccessColor,
                          onChanged: (value) {
                            model.checkAcceptEmails();
                          },
                        ),
                        Text(model.policy, style: boldCaptionStyle),
                      ],
                    ),
                    verticalSpaceRegular,
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        model.signInPolicySubtext,
                        style: boldCaptionStyle,
                      ),
                    )
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        model.privacy,
                        style: subtitle2.copyWith(color: leftNavBarColor),
                      ),
                      Text(
                        model.contactUs,
                        style: subtitle2.copyWith(color: leftNavBarColor),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(model.worldLogoUrl),
                          ),
                          Text(
                            model.changeRegion,
                            style: subtitle2.copyWith(color: leftNavBarColor),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(model.arrowDown),
                          ),
                        ],
                      )
                    ]),
                verticalSpaceMedium,
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => CreateWorkspaceViewModel(),
    );
  }
}
