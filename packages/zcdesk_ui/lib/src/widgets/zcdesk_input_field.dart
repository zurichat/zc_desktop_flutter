import 'package:flutter/material.dart';
import '../../zcdesk_ui.dart';

class AuthInputField extends StatelessWidget {
  final String hintPlaceHolder;
  final Color? filledColor;
  final ValueChanged<String?>? onSaved;
  final String? label;
  final int? maxLines;
  final Widget? trailing;
  final TextInputType? inputType;
  final bool password ;
  final TextEditingController? controller;
  final void Function()? onTrailingTapped;

  const AuthInputField(
      {Key? key,
      this.onSaved,
      this.filledColor = kcBackgroundColor2,
      this.hintPlaceHolder = '',
      this.label,
      this.maxLines,
      this.inputType,
      this.trailing,
      this.onTrailingTapped,
      this.password = false,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // if label is empty, label text will not be visible
        Visibility(
          visible: label == null ? false : true,
          child: ZcdeskText.subheading(label ?? ''),
        ),

        // spacing
        verticalSpaceSmall,

        TextField(
          keyboardType: TextInputType.text,
          autofocus: false,
          obscureText: password,
          cursorColor: Theme.of(context).accentColor,
          textInputAction: TextInputAction.done,
          maxLines: maxLines ?? 1,
          style: TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            fillColor: filledColor,
            filled: false,
            suffixIcon: trailing != null
                ? GestureDetector(
                    onTap: onTrailingTapped,
                    child: trailing,
                  )
                : null,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            hintText: hintPlaceHolder,
            hintStyle: TextStyle(
                color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: bodyColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: bodyColor),
            ),
          ),
        ),
      ],
    );
  }
}
