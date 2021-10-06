import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zc_desk_button.dart';

class ChannelIntegrationTab extends HookWidget {
  ChannelIntegrationTab({Key? key}) : super(key: key);

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
            children: [verticalSpaceRegular, PaidFeature()],
          ),
        ),
      ),
    );
  }
}

class PaidFeature extends StatelessWidget {
  const PaidFeature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: fullWidth(context),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13.0),
          border: Border.all(color: Colors.grey.shade300)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Send emails to this channel',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              horizontalSpaceTiny,
              Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      color: kcPrimaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'PAID FEATURE',
                    style: TextStyle(color: kcPrimaryColor, fontSize: 8.0),
                  ))
            ],
          ),
          verticalSpaceTiny,
          Text(
            'Get an email address that post incoming mails to this channel',
            style: TextStyle(fontSize: 13.0),
          ),
          verticalSpaceSmall,
          SizedBox(
            height: 35,
            width: 150,
            child: ZcDeskButton(
              onPressed: () {
              },
              child: Text(
                'See Upgrade Uptions',
                style:
                    TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
