import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';

class DmView extends StatefulWidget {
  @override
  _DmViewState createState() => _DmViewState();
}

class _DmViewState extends State<DmView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 20, 5),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: kcBackgroundColor2,
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          child: Image.asset('assets/images/4.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Dedan',
                            style: TextStyle(color: kcPrimaryColor),
                          ),
                        ),
                        SvgPicture.asset(
                          SVGAssetPaths.dropDownOpenIcon,
                          height: 5.h,
                          color: bodyColor,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.phone_outlined,
                        color: kcPrimaryColor,
                      ))
                ],
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Container(
                color: kcBackgroundColor2,
                child: ListView.builder(
                    itemCount: 20,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (index == 5 ||
                          index == 10 ||
                          index == 15 ||
                          index == 20) {
                        return DateWidget(date: '20 July 2003',);
                      } else {
                        return MessageTile(
                          userDisplayName: 'dedan kibere',
                          userProfileUrl: 'tree.png',
                          time: '9:06 pm',
                          message: 'Hello baby bello baby',
                        );
                      }
                    }),
              ),
            ),
          ),
          SendMessageInputField(
            sendMessage: () {},
          ),
        ],
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String userProfileUrl;
  final String userDisplayName;
  final String message;
  final String time;

  MessageTile(
      {required this.message,
      required this.time,
      required this.userDisplayName,
      required this.userProfileUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              child: Image.network(userProfileUrl),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          userDisplayName,
                          style: heading1Style.copyWith(fontSize: 15),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          time,
                          style: subtitle2.copyWith(color: timeColor),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                      child: Text(message),
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}

class DateWidget extends StatelessWidget {
  final String date;
  DateWidget({required this.date});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: kcBackgroundColor2,
            shape: BoxShape.rectangle,
            border: Border.all(color: timeColor),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(date,
                style: heading1Style.copyWith(fontSize: 10),
              ),
              SizedBox(
                width: 5.w,
              ),
              SvgPicture.asset(
                SVGAssetPaths.dropDownOpenIcon,
                height: 5.h,
                color: bodyColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}