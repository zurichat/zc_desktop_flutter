import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/emoji_selector/config.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/emoji_selector/emoji.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/emoji_selector/emoji_picker.dart';

import 'category_icons.dart';

class EmojiWidget extends StatelessWidget {
  const EmojiWidget(
      {Key? key,
      this.leftPosition,
      this.topPositioned,
      required this.onEmojiSelected})
      : super(key: key);
  final double? leftPosition;
  final double? topPositioned;
  final Function(Emoji emoji) onEmojiSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 380,
      width: 320,
      child: Center(
        child: ZcDesktopEmojiPicker(
            onEmojiSelected: (Category category, Emoji emoji) {
              onEmojiSelected(emoji);
              Navigator.pop(context);
            },
            config: EmojiConfig(
                columns: 9,
                emojiSizeMax: 25 * (Platform.isIOS ? 1.0 : 1.0),
                verticalSpacing: 4,
                horizontalSpacing: 0,
                initCategory: Category.RECENT,
                bgColor: const Color(0xFFF2F2F2),
                indicatorColor: kcPrimaryColor,
                iconColor: Colors.grey,
                iconColorSelected: Colors.black,
                progressIndicatorColor: kcPrimaryColor,
                showRecentsTab: true,
                recentsLimit: 28,
                noRecentsText: 'No Recents',
                noRecentsStyle:
                    const TextStyle(fontSize: 20, color: Colors.black26),
                tabIndicatorAnimDuration: kTabScrollDuration,
                categoryIcons: const CategoryIcons(),
                buttonMode: ButtonMode.MATERIAL)),
      ),
    );
  }
}
