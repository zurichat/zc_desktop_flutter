import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/channel_desc_edit_item.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/channel_files_item.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zc_desk_button.dart';
import 'package:zc_desktop_flutter/ui/views/main/channels_details/channels_details_viewmodel.dart';

class AboutChannelTab extends HookWidget {
  const AboutChannelTab({Key? key, required this.model}) : super(key: key);
  final ChannelsDetailsViewModel model;

  @override
  Widget build(BuildContext context) {
    final _rightSideBarController = useScrollController();

    return NotificationListener<ScrollNotification>(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0))),
        child: CustomScrollView(
            scrollBehavior: ScrollBehavior(),
            controller: _rightSideBarController,
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  verticalSpaceRegular,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: ChannelDescriptionEdit(
                      model: model,
                    ),
                  ),
                  verticalSpaceRegular,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: ChannelSentFiles(
                      key: key,
                      model: model,
                    ),
                  ),
                  verticalSpaceRegular
                ]),
              ),
            ]),
      ),
      onNotification: (notificationInfo) {
        if (notificationInfo is ScrollStartNotification) {
          // model.onScroll(true);
        } else if (notificationInfo is ScrollEndNotification) {
          // model.onScroll(false);
        }
        return true;
      },
    );
  }
}

class ChannelDescriptionEdit extends StatelessWidget {
  const ChannelDescriptionEdit({Key? key, required this.model})
      : super(key: key);
  final ChannelsDetailsViewModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: fullWidth(context),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey.shade300)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        clipBehavior: Clip.hardEdge,
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            ChannelDescriptionEditItem(
              itemIndex: 0,
              model: model,
              editItem: true,
              onTap: () {},
              title: 'Topic',
              subtitle: 'Add a topic',
            ),
            ChannelDescriptionEditItem(
              itemIndex: 1,
              model: model,
              editItem: true,
              onTap: () {},
              title: 'Description',
              subtitle: 'Add a description',
            ),
            ChannelDescriptionEditItem(
              itemIndex: 2,
              model: model,
              onTap: () {},
              title: 'Created by',
              subtitle: 'Naza on September 23, 2021',
            ),
            ChannelDescriptionEditItem(
              itemIndex: 3,
              model: model,
              onTap: () {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) {
                      return ConfirmLeaveChannelDialog();
                    });
              },
              title: 'Leave channel',
              exitAction: true,
            ),
          ],
        ),
      ),
    );
  }
}

class ChannelSentFiles extends StatelessWidget {
  const ChannelSentFiles({
    Key? key,
    required this.model,
  }) : super(key: key);
  final ChannelsDetailsViewModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey.shade300)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            child: Text(
              'Files',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          Container(
            child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ChannelFilesItem(
                      itemIndex: index,
                      model: model,
                      scrolling: model.scrolling,
                      title: 'bandicam 2021-13-05 09-98-98.jpg',
                      subtitle: 'B4EVA',
                      time: 'Yesterday at 4:20pm',
                      onTap: () {});
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 5.0, left: 15),
            child: Text(
              'Show all',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ConfirmLeaveChannelDialog extends StatelessWidget {
  const ConfirmLeaveChannelDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Container(
        width: fullHeight(context) / 2,
        height: 150,
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Leave channel',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Container(
                  height: 35.0,
                  width: 35.0,
                  child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.clear,
                        size: 14,
                      )),
                )
              ],
            ),
            verticalSpaceSmall,
            Text(
              'You are about to leave this channel',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            verticalSpaceSmall,
            Row(
              children: [
                SizedBox(
                  height: 35,
                  width: 150,
                  child: ZcDeskButton(
                    onPressed: () {
                      //TODO: include function leave channel
                    },
                    fillColor: kcErrorColor,
                    filled: true,
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                horizontalSpaceSmall,
                SizedBox(
                  height: 35,
                  width: 150,
                  child: ZcDeskButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
