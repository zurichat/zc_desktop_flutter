import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WorkSpaceSetting extends StatelessWidget {
  final String? workspaceTitle;

  const WorkSpaceSetting({Key? key, this.workspaceTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      width: 200.w,
      child: Row(
        children: [
          Text(workspaceTitle!,
              style: TextStyle(
                color: Colors.white,
              )),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: SvgPicture.asset('assets/icons/vectordown_icon.svg'))
        ],
      ),
    );
  }
}
