import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_widgets.dart';

class NewDmView extends StatelessWidget {
  final String userName;
  NewDmView({required this.userName});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: avatarColor3,
                child: SvgPicture.asset(SVGAssetPaths.newDm,
                                    ),
              ),
            ),
            title: Text(
                'This conversation is just between you and ${userName} no one else can see it'),
            subtitle: Text('Here you can send messages and share files with @${userName}'),
          ),
          SizedBox(height:30.h),

        ],
      ),
    );
  }
}
