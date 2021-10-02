import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';

class ChannelSettingTab extends HookWidget {
  const ChannelSettingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _rightSideBarController = useScrollController();

    return Container(
      color: Colors.grey[100],
      child: SingleChildScrollView(
        controller: _rightSideBarController,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(10.0))),
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [verticalSpaceRegular, Setting()],
          ),
        ),
      ),
    );
  }
}

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fullWidth(context),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13.0),
          border: Border.all(color: Colors.grey.shade300)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.archive),
          horizontalSpaceTiny,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Archive channel for everyone',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                verticalSpaceTiny,
                Text.rich(
                  TextSpan(
                      text:
                          'You do not have permission to archive this channel. if you need help please contact a ',
                      children: [
                        TextSpan(
                            text: 'Workspace owner',
                            style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.blue,
                                decoration: TextDecoration.underline))
                      ]),
                  style: TextStyle(fontSize: 13.0),
                ),
                verticalSpaceSmall,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
