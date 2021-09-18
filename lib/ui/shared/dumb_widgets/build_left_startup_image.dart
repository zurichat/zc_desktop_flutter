import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/startup_page/startup_viewmodel.dart';

class BuildStartUpImage extends StatelessWidget {
  const BuildStartUpImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      builder: (context, model, child) => Expanded(
        flex: 3,
        child: Container(
          color: KStartupContainerColor,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Image.asset(
                    model.circularImage,
                  ),
                ),
              ),
              Text(
                model.title,
                textAlign: TextAlign.center,
                style: headline6.copyWith(color: Colors.white),
              ),
              verticalSpaceSmall,
              Text(
                model.subTitle,
                textAlign: TextAlign.center,
                style: subtitle2.copyWith(
                  color: Colors.white,
                ),
              ),
              verticalSpaceLarge,
            ],
          ),
        ),
      ),
    );
  }
}
