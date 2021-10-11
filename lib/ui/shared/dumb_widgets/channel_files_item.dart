import 'package:flutter/material.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/user_avatar.dart';
import 'package:zc_desktop_flutter/ui/views/main/channels_details/channels_details_viewmodel.dart';

import '../const_app_colors.dart';
import '../const_ui_helpers.dart';
import 'channel_file_more_action_widget.dart';

class ChannelFilesItem extends StatelessWidget {
  const ChannelFilesItem(
      {Key? key,
      this.itemIndex = 0,
      required this.model,
      required this.onTap,
      this.title,
      this.subtitle = '',
      this.time = '',
      this.editItem = false,
      this.exitAction = false,
      this.scrolling = false})
      : super(key: key);
  final int itemIndex;
  final ChannelsDetailsViewModel model;
  final String? title;
  final String subtitle;
  final String time;
  final VoidCallback onTap;
  final bool editItem;
  final bool exitAction;
  final bool scrolling;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: InkWell(
        onTap: onTap,
        onHover: (event) {
          model.onFileTileHovered(event, itemIndex);
        },
        child: Container(
          height: 65.5,
          width: fullWidth(context),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          foregroundDecoration: BoxDecoration(
              color: model.onFileTileHover &&
                      model.onFileTileHoveredIndex == itemIndex
                  ? hoverColor
                  : Colors.transparent),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AvatarPlaceHolder(
                    h: 38,
                    w: 38,
                    imageUri: 'assets/images/Triadic.png',
                  ),
                  horizontalSpaceTiny,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title!,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: exitAction ? kcAccentColor : null),
                      ),
                      verticalSpaceSmall,
                      Row(
                        children: [
                          Text(
                            subtitle,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                          horizontalSpaceTiny,
                          Text(
                            time,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.grey,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Visibility(
                  visible: (model.onFileTileHover &&
                      model.onFileTileHoveredIndex == itemIndex),
                  child: ChannelFileMoreAction(
                    model: model,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
