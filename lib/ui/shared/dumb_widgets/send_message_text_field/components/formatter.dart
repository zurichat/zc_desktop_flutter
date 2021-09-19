import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum MarkDown { bold, italic, link, list }

class TextFormatterButton extends StatefulWidget {
  const TextFormatterButton({
    Key? key,
    required this.markDown,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);
  final MarkDown markDown;
  final bool isActive;
  final Function() onTap;

  @override
  State<TextFormatterButton> createState() => _TextFormatterButtonState();
}

class _TextFormatterButtonState extends State<TextFormatterButton> {
  bool ishovering = false;
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.isActive ? false : true,
      child: InkWell(
        onTap: widget.onTap,
        onHover: (value) => setState(() => ishovering = value),
        child: Container(
          height: 30,
          width: 30,
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Center(
            child: SvgPicture.asset(
              switchIcon(widget.markDown),
              color: ishovering ? Colors.black : Color(0xff616061),
            ),
          ),
        ),
      ),
    );
  }

  String switchIcon(MarkDown markdown) {
    switch (markdown) {
      case MarkDown.bold:
        return 'assets/icons/bold.svg';
      case MarkDown.italic:
        return 'assets/icons/italic.svg';
      case MarkDown.link:
        return 'assets/icons/link.svg';
      case MarkDown.list:
        return 'assets/icons/list.svg';
    }
  }
}
