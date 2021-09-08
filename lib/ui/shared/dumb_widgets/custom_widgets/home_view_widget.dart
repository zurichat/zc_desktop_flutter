import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/ui/main/leftSideBar/leftSideBarView.dart';
import 'package:zc_desktop_flutter/ui/main/message/message_view.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/appbar/app_bar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/custom_widgets/custom_color.dart';

class HomeViewWidget extends StatelessWidget {
  const HomeViewWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(child: buildAppBar(context, isActive: true)),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 670.h,
                  width: 265.w,
                  child: LeftSideBarView(),
                ),
              ),

              Container(
                margin: EdgeInsets.only(bottom: 60),
                height: 670.h,
                width: 675.w,
                color: green,
                child: MessageView(),
              ),

              Container(
                margin: EdgeInsets.only(bottom: 60),
                height: 670.h,
                width: 380.w,
                color: blue,
                child: Center(child: Text('Threads')),
              ),

            ],

          ),
        ],
      ),
      backgroundColor: pink,

    );
  }
}
