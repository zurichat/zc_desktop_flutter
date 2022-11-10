import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_text.dart';
import 'package:zc_desktop_flutter/ui/views/main/profile_modal/profile_modal_viewmodel.dart';

class ProfileModalView extends StatelessWidget {
  ProfileModalView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => Dialog(
        child: buildContainer(model),
      ),
      viewModelBuilder: () => ProfileModalViewModel(),
    );
  }

  buildContainer(ProfileModalViewModel model) {
    return Container(
      height: 755.h,
      width: 765.w,
      child: Column(
        children: [
          buildHeaderContainer(model),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 45.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 95.w,
                child: Center(
                  child: ZcdeskText.headingThree('About'),
                ),
              ),
            ),
          ),
          Stack(
            children: [
              Divider(
                height: 1.h,
                color: Color.fromRGBO(153, 153, 153, 1),
              ),
              Padding(
                padding: EdgeInsets.only(left: 45.w),
                child: Container(
                    height: 3.h,
                    width: 95.w,
                    color: Color.fromRGBO(0, 184, 124, 1)),
              )
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          buildDetailsContainer(),
          SizedBox(
            height: 12.h,
          ),
          buildFileContainer()
        ],
      ),
    );
  }

  buildHeaderContainer(ProfileModalViewModel model) {
    return Container(
      height: 252.h,
      width: 686.w,
      padding: EdgeInsets.only(left: 15.w, top: 25.w),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        height: 126.h,
                        width: 116.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            model.profileImgUrl,
                            fit: BoxFit.fill,
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ZcdeskText.headingThree(model.userName),
                              IconButton(
                                  onPressed: model.updateFav,
                                  icon: Icon(
                                    !model.fav
                                        ? Icons.star_outline
                                        : Icons.star,
                                    color: Colors.green,
                                  ))
                            ],
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: ZcdeskText.headingFour('FLUTTER DEV'))
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    buildShapedContainer('Mute', Icons.notifications_outlined),
                    SizedBox(
                      width: 15.h,
                    ),
                    buildShapedContainer('Start a call', Icons.call_outlined),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 40.w),
            child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: model.popDialog, icon: Icon(Icons.close))),
          )
        ],
      ),
    );
  }

  buildDetailsContainer() {
    return Container(
      height: 252.h,
      width: 706.w,
      padding: EdgeInsets.only(left: 41.w),
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(153, 153, 153, 1)),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildListTile('19:11 local time', Icons.timer_off, false),
          SizedBox(
            height: 24.h,
          ),
          buildListTile('+2348177765954', Icons.call_outlined, true),
          SizedBox(
            height: 24.h,
          ),
          buildListTile('toxicbishop01@gmail.com', Icons.mail_outline, true),
          SizedBox(
            height: 24.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'View Full Profile',
                style: textStyle(fontWeight: FontWeight.w700),
                textAlign: TextAlign.left,
              ),
            ),
          )
        ],
      ),
    );
  }

  buildFileContainer() {
    return Container(
        height: 154.h,
        width: 706.w,
        padding: EdgeInsets.only(left: 41.w, right: 15.w),
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(153, 153, 153, 1)),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: ZcdeskText.headingTwo('Files')),
            SizedBox(
              height: 19.h,
            ),
            ZcdeskText.subheading(
                'There aren’t any files to see here right now. But there could be - dragand drop any file into the channels_page pane to add it to this conversation.')
          ],
        ));
  }

  buildListTile(String text, IconData icon, bool isColored) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 17,
        ),
        !isColored
            ? ZcdeskText.headingFour(text)
            : Text(
                text,
                style: textStyle(),
                textAlign: TextAlign.right,
              ),
      ],
    );
  }

  TextStyle textStyle({FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        fontSize: 30.sp,
        fontWeight: fontWeight,
        fontFamily: 'Lato',
        color: Color.fromARGB(243, 26, 97, 219));
  }

  buildShapedContainer(String text, IconData icon) {
    return Container(
      height: 49.h,
      padding: EdgeInsets.only(left: 8.0.w, right: 8.0.w),
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(153, 153, 153, 1)),
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey.shade100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          SizedBox(
            width: 12.5.h,
          ),
          Text(
            text,
            style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 18.sp,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
