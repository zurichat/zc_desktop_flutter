import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkSpaceMembers extends StatelessWidget {
  const WorkSpaceMembers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
        decoration:
            BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Colors.white
              ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Positioned(
                    child: MemberAvatar()
                    ),
                   Positioned(
                    right: 20,
                    bottom: 0,
                    top: 0,
                    left: 0,
                     child: MemberAvatar()),

                     Positioned(
                      right: 50,
                      bottom: 0,
                      top: 0,
                      left: 0,
                      child: MemberAvatar())
                  ],
              ),
            ),
            Expanded(flex:1,child: Text('300'))
          ],
        ));
  }
}

class MemberAvatar extends StatelessWidget {
  const MemberAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/1.png')),
          borderRadius: BorderRadius.all(Radius.circular(3.0))),
      height: 40.h,
      width: 40.w,
    );
  }
}
