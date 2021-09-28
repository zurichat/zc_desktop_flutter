import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewMessageBtn
 extends StatelessWidget {
  const NewMessageBtn
  ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 25.0,
        child: Image.asset(
          'assets/images/new_message.png',
          height: 30,
          width: 30,
          ),
      ),
    );
  }
}