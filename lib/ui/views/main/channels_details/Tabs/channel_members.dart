import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/user_avatar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';

import '../channels_details_viewmodel.dart';

class ChannelMembersTab extends HookWidget {
  ChannelMembersTab({Key? key, required this.model}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final ChannelsDetailsViewModel model;

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();

    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            height: 60,
            padding: const EdgeInsets.fromLTRB(18, 5, 18, 5),
            decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(color: Colors.grey.shade300))),
            child: Form(
              key: _formKey,
              child: Container(
                height: 26,
                child: ZuriDeskInputField(
                  focusColor: kcPrimaryColor,
                  prefix: Icon(
                    Icons.search,
                    size: 20,
                  ),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintPlaceHolder: 'Find members',
                ),
              ),
            ),
          ),
          Expanded(
              flex: 9,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MembersListItem(
                        itemIndex: 0,
                        model: model,
                        name: 'Add people ',
                        addPeople: true,
                        onTap: () {}),
                    Container(
                      child: ListView.builder(
                          itemCount: 20,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return MembersListItem(
                                itemIndex: index,
                                model: model,
                                name: 'Fikun ',
                                status: 'Backend Developer || Django',
                                fullName: 'Oluwafikunayomi Ade-Ayinla',
                                onTap: () {});
                          }),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class MembersListItem extends StatelessWidget {
  const MembersListItem(
      {Key? key,
      this.itemIndex = 0,
      required this.model,
      required this.onTap,
      this.name,
      this.status = '',
      this.fullName = '',
      this.admin = false,
      this.addPeople = false})
      : super(key: key);
  final int itemIndex;
  final ChannelsDetailsViewModel model;
  final String? name;
  final String status;
  final String fullName;
  final VoidCallback onTap;
  final bool admin;
  final bool addPeople;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onTap,
          onHover: (event) {
            model.onFileTileHovered(event, itemIndex);
          },
          child: Container(
            height: 70.5,
            width: fullWidth(context),
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                horizontalSpaceSmall,
                addPeople
                    ? AddPeopleIcon()
                    : AvatarPlaceHolder(
                        h: 38,
                        w: 38,
                        imageUri: 'assets/images/mark.jpg',
                      ),
                horizontalSpaceSmall,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: status == ''
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(text: name!, children: [
                        TextSpan(
                          text: fullName,
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 14,
                          ),
                        ),
                      ]),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    verticalSpaceTiny,
                    Visibility(
                      visible: !(status == ''),
                      child: Text(
                        status,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black87,
                          fontSize: 14,
                        ),
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

class AddPeopleIcon extends StatelessWidget {
  const AddPeopleIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 36,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: kcPrimaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(5)),
      child: Image.asset(
        'assets/images/activeadd.png',
        height: 10,
        width: 10,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
