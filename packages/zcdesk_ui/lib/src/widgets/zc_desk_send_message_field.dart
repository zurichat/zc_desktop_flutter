import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zcdesk_ui/src/shared/app_colors.dart';
import 'package:zcdesk_ui/src/shared/ui_helpers.dart';

class SendMessageInputField extends StatelessWidget {
  const SendMessageInputField({
    Key? key,
    required this.sendMessage,
  }) : super(key: key);
  final Function() sendMessage;
  @override
  Widget build(BuildContext context) {
    final messageController = TextEditingController();

    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: leftNavBarColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildMessageTextField(
            controller: messageController,
            placeholder: '#designers',
          ),
          _SendMessageFunctions(sendMessage: sendMessage),
          verticalSpaceSmall,
        ],
      ),
    );
  }
}

TextField _buildMessageTextField({
  required String placeholder,
  required TextEditingController controller,
}) {
  return TextField(
    maxLines: null,
    decoration: InputDecoration(
      border: UnderlineInputBorder(borderSide: BorderSide.none),
      contentPadding: EdgeInsets.symmetric(vertical: 11),
      hintText: 'Send a message to $placeholder',
      hintStyle: TextStyle(
        fontSize: 15,
        color: leftNavBarColor,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

class _SendMessageFunctions extends StatelessWidget {
  const _SendMessageFunctions({
    Key? key,
    this.boldText,
    this.launchshortCut,
    this.makeItalic,
    this.addLink,
    this.createOrderedList,
    this.attachFile,
    this.mention,
    required this.sendMessage,
  }) : super(key: key);
  final Function()? boldText;
  final Function()? launchshortCut;
  final Function()? makeItalic;
  final Function()? addLink;
  final Function()? createOrderedList;
  final Function()? attachFile;
  final Function()? mention;
  final Function() sendMessage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _TextFunction(
          icon: 'packages/zcdesk_ui/assets/icons/flash.svg',
          onTap: launchshortCut,
        ),
        SizedBox(width: 13),
        SizedBox(
          height: 19,
          child: const VerticalDivider(width: .5),
        ),
        SizedBox(width: 13),
        _TextFunction(
          icon: 'packages/zcdesk_ui/assets/icons/bold.svg',
          onTap: boldText,
        ),
        horizontalSpaceRegular,
        _TextFunction(
          icon: 'packages/zcdesk_ui/assets/icons/italic.svg',
          onTap: makeItalic,
        ),
        horizontalSpaceRegular,
        _TextFunction(
          icon: 'packages/zcdesk_ui/assets/icons/link.svg',
          onTap: addLink,
        ),
        horizontalSpaceRegular,
        _TextFunction(
          icon: 'packages/zcdesk_ui/assets/icons/list.svg',
          onTap: createOrderedList,
        ),
        Spacer(),
        _TextFunction(
          icon: 'packages/zcdesk_ui/assets/icons/at.svg',
          onTap: mention,
        ),
        horizontalSpaceRegular,
        _TextFunction(
          icon: 'packages/zcdesk_ui/assets/icons/attach.svg',
          onTap: attachFile,
        ),
        horizontalSpaceRegular,
        _TextFunction(
          icon: 'packages/zcdesk_ui/assets/icons/send.svg',
          onTap: sendMessage,
        ),
      ],
    );
  }
}

class _TextFunction extends StatelessWidget {
  const _TextFunction({
    Key? key,
    required this.icon,
    this.onTap,
  }) : super(key: key);
  final String icon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        child: Center(
          child: SvgPicture.asset(icon),
        ),
      ),
    );
  }
}
