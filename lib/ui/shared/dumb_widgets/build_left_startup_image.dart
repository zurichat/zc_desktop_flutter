import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/startup_page/startup_viewmodel.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';
import 'package:zcdesk_ui/src/shared/styles.dart';

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
