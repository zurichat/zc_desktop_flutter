import 'package:flutter/material.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({Key? key, this.onTap}) : super(key: key);
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0,
      width: 35.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
      child: InkWell(
        onTap: onTap,
        child: Icon(Icons.clear, size: 14.0),
      ),
    );
  }
}
