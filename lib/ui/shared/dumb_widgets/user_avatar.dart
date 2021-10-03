import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarPlaceHolder extends StatelessWidget {
  const AvatarPlaceHolder({
    Key? key,
     required this.imageUri,
     this.h = 40,
     this.w = 35
     }) : super(key: key);

  final String imageUri;
  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: h.h,
        width: h.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(imageUri)),
        ));
  }
}
