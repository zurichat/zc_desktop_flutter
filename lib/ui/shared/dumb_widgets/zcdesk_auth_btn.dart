import 'package:flutter/material.dart';
import '../const_text_styles.dart';

class AuthButton extends StatelessWidget {
  late final String label;
  late final VoidCallback? onTap;
  late final bool isBUsy;
  AuthButton({
    required this.label,
    this.onTap,
    this.isBUsy = false
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Color.fromRGBO(0, 184, 124, 1),
        ),
      ),
      onPressed: onTap,
      child: !isBUsy ? Text(
        label,
        style: authBtnStyle,
      ) : Center(child: CircularProgressIndicator(color: Colors.white,),),
    );
  }
}
