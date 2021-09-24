import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zc_desktop_flutter/ui/main/dm/hover_actions_view.dart';
import 'package:zc_desktop_flutter/ui/shared/const_widgets.dart';

import '../const_app_colors.dart';

class OnHoverWidget extends StatelessWidget {
  final  model;

  OnHoverWidget({required this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 50.h,
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
                  icon: SVGAssetPaths.fluentEmoji,
                  onHover: (event) {
                    model.onHoverActionsHovered(
                        true, SVGAssetPaths.add_reaction_container, -45);
                  },
                  onTap: () {}),
              SizedBox(
                width: 10.w,
              ),
              HoverItem(
                  model: model,
                  icon: SVGAssetPaths.thread,
                  onHover: (event) {
                    model.onHoverActionsHovered(
                        true, SVGAssetPaths.reply_thread_container, -15);
                  },
                  onTap: () {}),
              SizedBox(
                width: 10.w,
              ),
              HoverItem(
                  model: model,
                  icon: SVGAssetPaths.shareIcon,
                  onHover: (event) {
                    model.onHoverActionsHovered(
                        true, SVGAssetPaths.share_message_container, 15);
                  },
                  onTap: () {}),
              SizedBox(
                width: 10.w,
              ),
              HoverItem(
                  model: model,
                  icon: SVGAssetPaths.bookmarkIcon,
                  onHover: (event) {
                    model.onHoverActionsHovered(
                        true, SVGAssetPaths.add_saved_container, 45);
                  },
                  onTap: () {}),
              SizedBox(
                width: 10.w,
              ),
              HoverItem(
                  model: model,
                  icon: SVGAssetPaths.actionsIcon,
                  onHover: (event) {
                    model.onHoverActionsHovered(
                        true, SVGAssetPaths.more_actions_container, 50);
                  },
                  onTap: () {
                    showDialog(
                        context: context,
                        useSafeArea: false,
                        builder: (context) {
                          return AlertDialog(
                            content: MoreActions(),
                            contentPadding: EdgeInsets.all(20),
                            scrollable: true,
                            insetPadding: EdgeInsets.all(0),
                          );
                        });
                  }),
            ],
          ),
        ),
        model.onHoverActionsHover
            ? Positioned(
                top: -40,
                left: model.hoverWidth,
                child: HoverInfo(
                    action: model.hoverAction, width: model.hoverWidth))
            : SizedBox()
      ],
    );
  }
}

class HoverItem extends StatelessWidget {
  final Function() onTap;
  final Function(PointerHoverEvent event) onHover;
  final String icon;
  final  model;

  HoverItem(
      {required this.icon,
      required this.onHover,
      required this.model,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      key: UniqueKey(),
      onHover: onHover,
      onExit: (event) {
        model.onHoverActionsHovered(false, '', 0);
      },
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            foregroundDecoration: BoxDecoration(color: Colors.transparent),
            child: SvgPicture.asset(
              icon,
              height: 30.h,
              width: 30.w,
              fit: BoxFit.fill,
            )),
      ),
    );
  }
}
