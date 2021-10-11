import 'package:flutter/material.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_text.dart';

class CreateChannelInputField extends StatelessWidget {
  final String hintPlaceHolder;
  final Color? filledColor;
  final Color borderColor;
  final Color borderFocusColor;
  final ValueChanged<String?>? onSaved;
  final String? label;
  final int? maxLines;
  final int? maxLegth;
  final Widget? trailing;
  final TextInputType? inputType;
  final bool password;
  final bool isFocus;
  final bool isVisible;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function()? onTrailingTapped;
  final void Function()? onVisibilityTap;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  const CreateChannelInputField({
    Key? key,
    this.onSaved,
    this.filledColor = kcBackgroundColor2,
    this.borderColor = bodyColor,
    this.borderFocusColor = bodyColor,
    this.isFocus = false,
    this.hintPlaceHolder = '',
    this.label,
    this.maxLines,
    this.maxLegth,
    this.keyboardType,
    this.inputType,
    this.trailing,
    this.onTrailingTapped,
    this.password = false,
    this.controller,
    this.validator,
    this.onChanged,
    this.errorText,
    this.onVisibilityTap,
    this.isVisible = false,
  }) : super(key: key);

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
        label == null ? verticalSpaceSmall : verticalSpaceRegular,
        Stack(
          children: [
            TextFormField(
              controller: controller,
              validator: validator,
              onChanged: onChanged,
              keyboardType: keyboardType,
              autofocus: isFocus,
              obscureText: isVisible,
              cursorColor: Theme.of(context).colorScheme.secondary,
              textInputAction: TextInputAction.done,
              maxLines: maxLines ?? 1,
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                fillColor: filledColor,
                filled: false,
                errorText: errorText,
                errorStyle: kBodyTextStyle.copyWith(color: kcErrorColor),
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
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderFocusColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                ),
              ),
            ),
            if (password)
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: onVisibilityTap,
                        icon: Icon(isVisible
                            ? Icons.visibility
                            : Icons.visibility_off))),
              )
          ],
        ),
      ],
    );
  }
}
