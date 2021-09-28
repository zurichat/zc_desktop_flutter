import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../const_app_colors.dart';

class MessageAction extends StatefulWidget {
  const MessageAction({
    Key? key,
    required this.onTap,
    required this.icon,
    this.hoverColor,
    this.iconHoverColor,
    this.iconColor,
    this.width,
  }) : super(key: key);
  final Function() onTap;

  final String icon;
  final Color? hoverColor;
  final Color? iconHoverColor;
  final Color? iconColor;
  final double? width;
  @override
  State<MessageAction> createState() => _MessageActionState();
}

class _MessageActionState extends State<MessageAction> {
  bool ishovering = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) => setState(() => ishovering = value),
      hoverColor: widget.hoverColor ?? kcBackgroundColor1,
      child: Container(
        height: 30,
        width: widget.width ?? 30,
        padding: EdgeInsets.all(3),
        child: Center(
          child: SvgPicture.asset(
            widget.icon,
            color: ishovering
                ? widget.iconHoverColor ?? Colors.black
                : widget.iconColor ?? Color(0xff616061),
          ),
        ),
      ),
    );
  }
}
