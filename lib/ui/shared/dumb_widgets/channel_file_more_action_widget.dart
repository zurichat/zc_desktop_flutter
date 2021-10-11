import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/ui/views/main/channels_details/channels_details_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/views/main/dm/hover_actions_view.dart';

import '../const_app_colors.dart';
import '../const_widgets.dart';

class ChannelFileMoreAction extends StatelessWidget {
  const ChannelFileMoreAction({required this.model});

  final ChannelsDetailsViewModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 35.0,
          width: 100,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: kcBackgroundColor2,
            shape: BoxShape.rectangle,
            border: Border.all(color: timeColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HoverItem(
                  model: model,
                  icon: Icons.cloud_download_outlined,
                  onHover: (event) {
                    model.onHoverActionsHovered(
                        event, SVGAssetPaths.add_reaction_container, -18);
                  },
                  onTap: () {}),
              SizedBox(
                width: 10.w,
              ),
              HoverItem(
                  model: model,
                  icon: Icons.ios_share,
                  onHover: (event) {
                    model.onHoverActionsHovered(
                        event, SVGAssetPaths.share_message_container, 10);
                  },
                  onTap: () {}),
              SizedBox(
                width: 10.w,
              ),
              HoverItem(
                  model: model,
                  icon: Icons.more_vert_rounded,
                  onHover: (event) {
                    model.onHoverActionsHovered(event, SVGAssetPaths.share_message_container, 30);
                  },
                  onTap: () {}),
            ],
          ),
        ),
        model.onHoverActionsHover
            ? Positioned(
                top: -20,
                left: model.hoverWidth,
                child: SizedBox(
                  height: 35,
                  width: 80,
                  child: HoverInfo(
                      action: model.hoverAction, width: model.hoverWidth),
                ))
            : SizedBox()
      ],
    );
  }
}

class HoverItem extends StatelessWidget {
  final Function() onTap;
  final ValueChanged<bool>? onHover;
  final IconData icon;
  final model;

  HoverItem(
      {required this.icon,
      required this.onHover,
      required this.model,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHover: onHover,
      // onExit: (event) {
      //   model.onHoverActionsHovered(false, '', 0);
      // },
      child: Container(
          foregroundDecoration: BoxDecoration(color: Colors.transparent),
          child: Icon(icon,size: 20,color: Colors.grey,)
          ),
    );
  }
}
