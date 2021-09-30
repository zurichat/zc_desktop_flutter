import 'package:flutter/material.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';

class AboutChannelTab extends StatelessWidget {
  const AboutChannelTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _rightSideBarController = ScrollController();

    return Scrollbar(
      controller: _rightSideBarController,
      isAlwaysShown: true,
      scrollbarOrientation: ScrollbarOrientation.right,
      thickness: 10,
      showTrackOnHover: true,
      child: SingleChildScrollView(
        controller: _rightSideBarController,
        child: Container(
          height: fullHeight(context),
          width: fullWidth(context),
          decoration: BoxDecoration(
            color: Colors.grey[100],
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(10.0))),
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Column(
            children: [
              Expanded(child: ChannelDescriptionEdit()),
              verticalSpaceRegular,
              Expanded(child: ChannelSentFiles())
            ],
          ),
        ),
      ),
    );
  }
}

class ChannelDescriptionEdit extends StatelessWidget {
  const ChannelDescriptionEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey.shade300)),
    );
  }
}

class ChannelSentFiles extends StatelessWidget {
  const ChannelSentFiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey.shade300)),
    );
  }
}
