import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:popover/popover.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/emoji_selector/emoji.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/emoji_selector/emoji_widget.dart';

import '../const_app_colors.dart';

class EmojiBuilder extends StatefulWidget {
  const EmojiBuilder({
    Key? key,
    required this.icon,
    required this.onEmojiSelected,
    this.hoverColor,
    this.iconHoverColor,
    this.iconColor,
    this.width,
  }) : super(key: key);
  final String icon;
  final Color? hoverColor;
  final Color? iconHoverColor;
  final Color? iconColor;
  final double? width;
  final Function(Emoji emoji) onEmojiSelected;

  @override
  State<EmojiBuilder> createState() => _EmojiBuilderState();
}

class _EmojiBuilderState extends State<EmojiBuilder> {
  bool ishovering = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showPopover(
          context: context,
          barrierColor: Colors.transparent,
          transitionDuration: const Duration(milliseconds: 150),
          bodyBuilder: (context) =>  EmojiWidget(
            onEmojiSelected: widget.onEmojiSelected,
          ),
          direction: PopoverDirection.bottom,
          arrowHeight: 0,
          arrowWidth: 0,
        );
      },
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
