import 'package:flutter/material.dart';
import 'package:zcdesk_ui/src/shared/styles.dart';
import 'package:zcdesk_ui/src/shared/app_colors.dart';
import 'package:zcdesk_ui/src/shared/ui_helpers.dart';
class AuthInputField extends StatefulWidget {
  const AuthInputField(
      {Key? key,
      this.onSaved,
      this.filledColor = kcBackgroundColor2,
      this.hintText,
      this.label,
      this.maxLines,
      this.inputType,
      this.suffix,
      this.controller})
      : super(key: key);

  final String? hintText;
  final Color? filledColor;
  final ValueChanged<String?>? onSaved;
  final String? label;
  final int? maxLines;
  final TextInputType? inputType;
  final Widget? suffix;
  final TextEditingController? controller;

  @override
  _AuthInputFieldState createState() => _AuthInputFieldState();
}

class _AuthInputFieldState extends State<AuthInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        // if label is empty, label text will not be visible
        Visibility(
          visible: widget.label == null ? false : true,
          child: Text(widget.label ?? '',
              style: subheadingStyle),
        ),

        // spacing
        verticalSpaceSmall,


           TextFormField(
            keyboardType: TextInputType.text,
            autofocus: false,
            cursorColor: Theme.of(context).accentColor,
            textInputAction: TextInputAction.done,
            maxLines: widget.maxLines ?? 1,
            style: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              fillColor: widget.filledColor,
              filled: false,
              suffix: widget.suffix,
              contentPadding:
                 const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: bodyColor,
                ),
              ),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                  color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),
              focusColor: Colors.red,
              labelStyle: TextStyle(color: Colors.red),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: bodyColor,
                ),
              ),
            ),
            onSaved: widget.onSaved,
            validator: (value) {
              if (value == '') {
                return 'Field cannot be empty';
              }
              return null;
            },
          ),

      ],
    );
  }
}
