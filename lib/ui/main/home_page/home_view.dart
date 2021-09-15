import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/services/authentication/auth_service.dart';
import 'package:zc_desktop_flutter/ui/main/left_side_bar/left_side_bar_view.dart';
import 'package:zc_desktop_flutter/ui/main/message_page/message_view.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/app_bar/app_bar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zc_desk_send_message_field.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 40, child: buildAppBar(context, isActive: true)),
            Expanded(
                child: Row(
              children: [
                Container(
                  height: height - 40,
                  width: 269.w,
                  child: LeftSideBarView(),
                ),
                Container(
                  width: !model.showThread ? 1035 : 776,
                  //height: (height - 200).h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          height: (height * 0.7).h,
                          //width: !model.showThread ? 1135.w : 776.w,
                          child: MessageView(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SendMessageInputField(
                          sendMessage: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
