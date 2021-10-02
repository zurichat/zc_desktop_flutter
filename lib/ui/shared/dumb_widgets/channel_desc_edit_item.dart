import 'package:flutter/material.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/action_text.dart';
import 'package:zc_desktop_flutter/ui/views/main/channels_details/channels_details_viewmodel.dart';

import '../const_ui_helpers.dart';

class ChannelDescriptionEditItem extends StatelessWidget {
  const ChannelDescriptionEditItem(
      {Key? key,
      this.itemIndex = 0,
      required this.model,
      required this.onTap,
      this.title,
      this.subtitle = '',
      this.editItem = false,
      this.exitAction = false})
      : super(key: key);
  final int itemIndex;
  final ChannelsDetailsViewModel model;
  final String? title;
  final String subtitle;
  final VoidCallback onTap;
  final bool editItem;
  final bool exitAction;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHover: (event) {
        model.onTileHovered(event, itemIndex);
      },
      child: Container(
        height: 69.5,
        width: fullWidth(context),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
        foregroundDecoration: BoxDecoration(
            color: model.onTileHover && model.onTileHoveredIndex == itemIndex
                ? hoverColor
                : Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: subtitle == ''
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title!,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: exitAction ? kcAccentColor : null),
                ),
                Visibility(
                  visible: editItem,
                  child: MouseRegion(
                    onEnter: (event) {
                      /// ontap event here
                    },
                    onHover: (event) {
                      model.onActionTextHovered(true, itemIndex);
                    },
                    onExit: (event) {
                      model.onActionTextHovered(false, itemIndex);
                    },
                    child: ActionText(
                      textDecoration: model.onActionTextHover &&
                              model.onActionTextHoveredIndex == itemIndex
                          ? TextDecoration.underline
                          : null,
                      text: 'Edit',
                    ),
                  ),
                )
              ],
            ),
            verticalSpaceTiny,
            Visibility(
              visible: !(subtitle == ''),
              child: Text(
                subtitle,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
