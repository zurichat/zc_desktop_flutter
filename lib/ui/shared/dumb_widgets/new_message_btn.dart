import 'package:flutter/material.dart';

class NewMessageBtn extends StatelessWidget {
  const NewMessageBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 18.0,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(
            'assets/images/new_message.png',
            height: 40,
            width: 40,
          ),
        ),
      ),
    );
  }
}
