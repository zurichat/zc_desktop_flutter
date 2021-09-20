import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/models/workspace_model/workspace.dart';
import 'package:zc_desktop_flutter/ui/main/channels_page/channels_view.dart';
import 'package:zc_desktop_flutter/ui/main/dm/dm_view.dart';
import 'package:zc_desktop_flutter/ui/main/workspace_page/workspace_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/const_widgets.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/app_bar/app_bar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_text.dart';

class WorkspaceView extends StatelessWidget {
  const WorkspaceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WorkspaceViewModel>.reactive(
      onModelReady: (model) {
        model.setup();
      },
      builder: (context, model, child) => Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                child: buildAppBar(
                  context,
                  isActive: true,
                ),
              ),
              verticalSpaceSmall,
              model.isBusy
                  ? Container(
                    height: 790.h,
                    child: Center(
                        child: Container(
                          width: 24.0,
                          height: 24.0,
                          child: CircularProgressIndicator(
                            strokeWidth: 3.0.r,
                            valueColor: AlwaysStoppedAnimation(Colors.grey),
                          ),
                        ),
                      ),
                  )
                  : Expanded(
                      child: Row(
                        children: [
                          //TODO: organization side bar
                          Container(
                            color: kcBackgroundColor2,
                            width: 70.w,
                            height: double.infinity,
                            child: ListView.builder(
                              itemCount: model.workspace.length.toInt(),
                              itemBuilder: (context, index) {
                                return Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      print("Workspace $index tapped");
                                      model.setCurrentWorkspaceIndex(index);
                                    },
                                    child: WorkspaceItem(
                                      workspace: model.workspace[index],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          //TODO: Left side bar
                          Container(
                            width: 260.w,
                            height: double.infinity,
                            child: Column(
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    controller: model.controller,
                                    physics: ScrollPhysics(),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ListView(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          children: [
                                            MenuItem(model),
                                            verticalSpaceRegular,
                                            TitleSection(
                                              title: 'Channels',
                                              addButtonTitle: 'Add channels',
                                              toggleTap: () {
                                                model
                                                    .openChannelsDropDownMenu();
                                              },
                                              show: model.showChannels,
                                              addTap: () {},
                                              list: List.generate(
                                                model.channels.length.toInt(),
                                                (index) => MouseRegion(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(bottom: 16.0,),
                                                    child: InkWell(
                                                      onTap: () {
                                                        print(
                                                            "channel item $index tapped");
                                                        //model.showChannel(index);
                                                        model.getViewToDisplay(
                                                            index: index,
                                                            isChannel: true);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            child: SvgPicture.asset(
                                                                SVGAssetPaths
                                                                    .channelsListIcon),
                                                          ),
                                                          horizontalSpaceSmall,
                                                          ZcdeskText
                                                              .dropDownBodyTextStyle(
                                                                  model
                                                                      .channels[
                                                                          index]
                                                                      .name!),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            verticalSpaceRegular,
                                            TitleSection(
                                              title: 'Direct Messages',
                                              addButtonTitle: 'Add teammates',
                                              show: model.showDMs,
                                              toggleTap: () {
                                                model.openDMsDropDownMenu();
                                              },
                                              addTap: () {},
                                              list: List.generate(
                                                model.directMessages.length
                                                    .toInt(),
                                                (index) => MouseRegion(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(bottom: 16.0,),
                                                    child: InkWell(
                                                      onTap: () {
                                                        print(
                                                            "dm item $index tapped");
                                                        //model.showDM(index);
                                                        model.getViewToDisplay(
                                                            index: index,
                                                            isDM: true);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          CircleAvatar(
                                                            backgroundImage:
                                                                AssetImage(
                                                                    'assets/images/mark.jpg'),
                                                            radius: 18.r,
                                                          ),
                                                          horizontalSpaceRegular,
                                                          ZcdeskText
                                                              .dropDownBodyTextStyle(
                                                                  model
                                                                      .directMessages[
                                                                          index]
                                                                      .user!
                                                                      .name!),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            verticalSpaceRegular,
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //TODO: Center Area
                          Expanded(
                            child: ShowView(model),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => WorkspaceViewModel(),
    );
  }
}

class ShowView extends StatelessWidget {
  final WorkspaceViewModel model;

  const ShowView(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (model.isChannel) {
      return ChannelsView();
    }

    if (model.isDM) {
      return DmView();
    }

    if (model.isThreads) {
      return Scaffold();
    }

    return ChannelsView();
  }
}

class TitleSection extends StatelessWidget {
  final String title;
  final GestureTapCallback toggleTap;
  final bool show;
  final GestureTapCallback addTap;
  final List<Widget>? list;
  final String? addButtonTitle;

  const TitleSection({
    Key? key,
    required this.title,
    required this.toggleTap,
    required this.show,
    required this.addTap,
    this.list, this.addButtonTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: toggleTap,
              child: Container(
                child: show
                    ? Container(
                        height: 12,
                        width: 12,
                        child: SvgPicture.asset(SVGAssetPaths.dropDownOpenIcon),
                      )
                    : Container(
                        height: 12,
                        width: 12,
                        child:
                            SvgPicture.asset(SVGAssetPaths.dropDownClosedIcon),
                      ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Container(
                child: Text(title, style: kLeftSideBarStyle),
              ),
            ),
          ],
        ),
        verticalSpaceSmall,
        if (show)
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  Column(
                    children: list!,
                  ),
                  verticalSpaceTiny,
                  Row(
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Text(addButtonTitle!, style: kLeftSideBarStyle),
                      horizontalSpaceSmall,
                      InkWell(
                        onTap: addTap,
                        child: Container(
                          height: 12,
                          width: 12,
                          child: SvgPicture.asset(
                              "assets/icons/add_dm_channel.svg"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class ReusableMenuItem extends StatelessWidget {
  final String? iconPath;
  final String? text;
  final GestureTapCallback? onTap;

  const ReusableMenuItem({
    Key? key,
    this.iconPath,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 30,
          child: Row(
            children: [
              Container(
                height: 30,
                child: Container(
                  width: 15.0,
                  height: 15.0,
                  child: SvgPicture.asset(iconPath!),
                ),
              ),
              SizedBox(width: 10),
              Container(
                child: Text(text!, style: kLeftSideBarStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final WorkspaceViewModel model;

  const MenuItem(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ReusableMenuItem(
              iconPath: 'assets/icons/threads.svg',
              text: 'Threads',
              onTap: () {
                model.getViewToDisplay(isThreads: true);
              }),
          ReusableMenuItem(
              iconPath: 'assets/icons/alldms.svg',
              text: 'All DMs',
              onTap: () {}),
          ReusableMenuItem(
              iconPath: 'assets/icons/drafts.svg', text: 'Draft', onTap: () {}),
          ReusableMenuItem(
              iconPath: 'assets/icons/files.svg', text: 'Files', onTap: () {}),
          ReusableMenuItem(
            iconPath: 'assets/icons/plugins.svg',
            text: 'Plugins',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class WorkspaceItem extends StatelessWidget {
  final int? index;
  final bool? selected;
  final Workspace? workspace;
  final void Function()? onTap;
  final bool? hover;
  final void Function(PointerHoverEvent)? onHover;
  final void Function(PointerExitEvent)? onExit;

  WorkspaceItem(
      {this.index,
      this.selected,
      this.workspace,
      this.onTap,
      this.hover,
      this.onHover,
      this.onExit});

  /*void selected(bool value) => setState(() => _selected = value);*/

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          MouseRegion(
            onHover: onHover,
            onExit: onExit,
            child: Container(
              padding: const EdgeInsets.all(3),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black.withOpacity(0.2),
                  width: 3,
                ),
                /*border: Border.all(
                    color: selected!
                        ? Colors.white
                        : hover!
                            ? Colors.white.withOpacity(0.2)
                            : Colors.transparent,
                    width: 3),*/
              ),
              child: workspace!.logo == null
                  ? Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Center(
                        child: Text(
                          workspace!.name!,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(5.r),
                      child: Container(
                          width: 38.0,
                          height: 38.0,
                          child: SvgPicture.asset(workspace!.logo!)),
                    ),
            ),
          ),
          /*if (selected!)
            Container(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.topRight,
                child: ClipOval(
                  child: Container(
                    width: 12,
                    height: 12,
                    color: Color(0xFE1D2229),
                    padding: const EdgeInsets.all(3),
                    child: ClipOval(
                      child: Container(
                        width: 12,
                        height: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),*/
        ],
      ),
    );
  }
}
