import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/close_botton.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zc_desk_button.dart';
import 'package:zc_desktop_flutter/ui/views/main/channels_details/Tabs/about_channel.dart';
import 'package:zc_desktop_flutter/ui/views/main/channels_details/Tabs/channel_integrations.dart';
import 'package:zc_desktop_flutter/ui/views/main/channels_details/Tabs/channel_members.dart';
import 'package:zc_desktop_flutter/ui/views/main/channels_details/Tabs/channel_settings.dart';
import 'package:zc_desktop_flutter/ui/views/main/channels_details/channels_details_viewmodel.dart';

class ChannelsDetailsView extends StatelessWidget {
  const ChannelsDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChannelsDetailsViewModel>.reactive(
        viewModelBuilder: () => ChannelsDetailsViewModel(),
        builder: (context, model, child) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: fullHeight(context)/1.2,
              width: 550,
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    ChannelDescriptionBox(
                      model: model,
                      handleCloseDialog: () => Navigator.pop(context),
                    ),
                    Expanded(
                      flex: 10,
                      child: ChannelDetailTabView(
                            model: model,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class ChannelDescriptionBox extends StatelessWidget {
  const ChannelDescriptionBox(
      {Key? key, required this.model, this.handleCloseDialog})
      : super(key: key);

  final ChannelsDetailsViewModel model;
  final VoidCallback? handleCloseDialog;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),
      width: fullWidth(context),
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
      child: Column(
        children: [
          // channel title and close dialog botton
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ChannelName(),
              CustomCloseButton(
                onTap: handleCloseDialog,
              )
            ],
          ),
          DescriptionActions(),

          Row(
            children: [
              SizedBox(
                width: 400,
                child: ChannelDetailsTab(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChannelName extends StatelessWidget {
  const ChannelName({Key? key, this.channelName = 'team-zuri-desktop-client'})
      : super(key: key);

  final String channelName;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.lock_rounded,
            size: 20,
          ),
          Text(
            channelName,
            style: channelDetailTitleTextStyle,
          ),
          horizontalSpaceTiny,
          Icon(
            Icons.star_border_rounded,
            size: 20,
          ),
        ],
      ),
    );
  }
}

class DescriptionActions extends StatelessWidget {
  const DescriptionActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            height: 30,
            width: 300,
            child: ZcDeskButton(
              onPressed: () {
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.notifications_outlined,
                      size: 14, color: Colors.black54),
                  horizontalSpaceTiny,
                  Text(
                    'Get Notifications for @ Mentions',
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  horizontalSpaceTiny,
                  Icon(Icons.arrow_drop_down_outlined,
                      size: 14, color: Colors.black54),
                ],
              ),
            ),
          ),
          horizontalSpaceTiny,
          SizedBox(
            height: 30,
            width: 130,
            child: ZcDeskButton(
              filled: true,
              fillColor: Colors.grey[300],
              onPressed: () {
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.phone, size: 12, color: Colors.black54),
                  horizontalSpaceTiny,
                  Text(
                    'Start a Call',
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChannelDetailsTab extends StatelessWidget {
  const ChannelDetailsTab({Key? key, this.membersCount = 13}) : super(key: key);

  final int membersCount;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: UnderlineTabIndicator(
          insets: const EdgeInsets.symmetric(horizontal: 30),
          borderSide: BorderSide(
              color: Colors.green, width: 2.0, style: BorderStyle.solid)),
      padding: const EdgeInsets.only(top: 11, right: 0),
      labelColor: Colors.black45,
      labelStyle: TextStyle(
        fontSize: 11,
      ),
      tabs: [
        Tab(
          text: 'About',
        ),
        Tab(
          text: 'Members $membersCount',
        ),
        Tab(
          text: 'Integrations',
        ),
        Tab(
          text: 'Settings',
        )
      ],
    );
  }
}

class ChannelDetailTabView extends StatelessWidget {
  const ChannelDetailTabView({Key? key, required this.model}) : super(key: key);

  final ChannelsDetailsViewModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0))),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0)),
        clipBehavior: Clip.hardEdge,
        child: TabBarView(physics: NeverScrollableScrollPhysics(), children: [
          AboutChannelTab(
            key: UniqueKey(),
            model: model),
          ChannelMembersTab(
            model: model,
          ),
          ChannelIntegrationTab(),
          ChannelSettingTab(),
        ]),
      ),
    );
  }
}
