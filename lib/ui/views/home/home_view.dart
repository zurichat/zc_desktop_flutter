import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/appbar/app_bar.dart';
import 'package:zc_desktop_flutter/ui/views/leftSideBar/leftSideBarView.dart';
import 'package:zc_desktop_flutter/ui/views/message/message_view.dart';
import 'package:zc_desktop_flutter/ui/views/widgets/center_list_tile/center_tile.dart';
import 'package:zc_desktop_flutter/ui/views/widgets/popup_menu_button.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';
import 'home_viewmodel.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) =>  
      Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              child: buildAppBar(context, isActive: true)),
            Expanded(child: 
            Row(
              children: [
                Container(
                  height: height - 40,
                  width: 269.w,
                  child: LeftSideBarView()),
                  Container(
                    width: !model.showThread ? 1135.w : 776.w,
                    //height: (height - 200).h,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.stretch,
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Container(
                         height: (height - 10).h,
                         width: !model.showThread ? 1135.w : 776.w,
                         child: MessageView()),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 8.0),
                           child: SendMessageInputField(sendMessage: (){},),
                         )
                     ],
                   ),
                  )
              ],
            ))            
          ],
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );

  }
}


