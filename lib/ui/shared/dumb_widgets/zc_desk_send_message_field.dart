import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';

class SendMessageInputField extends StatelessWidget {
  const SendMessageInputField({
    Key? key,
    required this.sendMessage,
  }) : super(key: key);
  final Function(String message) sendMessage;
  @override
  Widget build(BuildContext context) {
    final messageController = TextEditingController();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
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
          _SendMessageFunctions(sendMessage: (){
            sendMessage(messageController.text);
          }),
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
    controller: controller,
    keyboardType: TextInputType.multiline,
    decoration: InputDecoration(
      border: UnderlineInputBorder(borderSide: BorderSide.none),
      contentPadding: EdgeInsets.symmetric(vertical: 11),
      hintText: 'Send a channels_page to $placeholder',
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
          icon: 'assets/icons/flash.svg',
          onTap: launchshortCut,
        ),
        SizedBox(width: 13),
        SizedBox(
          height: 19,
          child: const VerticalDivider(width: .5),
        ),
        SizedBox(width: 13),
        _TextFunction(
          icon: 'assets/icons/bold.svg',
          onTap: boldText,
        ),
        horizontalSpaceRegular,
        _TextFunction(
          icon: 'assets/icons/italic.svg',
          onTap: makeItalic,
        ),
        horizontalSpaceRegular,
        _TextFunction(
          icon: 'assets/icons/link.svg',
          onTap: addLink,
        ),
        horizontalSpaceRegular,
        _TextFunction(
          icon: 'assets/icons/list.svg',
          onTap: createOrderedList,
        ),
        Spacer(),
        _TextFunction(
          icon: 'assets/icons/at.svg',
          onTap: mention,
        ),
        horizontalSpaceRegular,
        _TextFunction(
          icon: 'assets/icons/attach.svg',
          onTap: attachFile,
        ),
        horizontalSpaceRegular,
        InkWell(
          onTap: sendMessage,
          hoverColor: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: SvgPicture.asset('assets/icons/send.svg',color: bodyColor,height: 12,
              width: 12,),
          ),
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
      borderRadius: BorderRadius.circular(50),
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(shape: BoxShape.circle,),
        child: Center(
             child: SvgPicture.asset(icon,color: lightIconColor,),
            ),
      ),
    );
  }
}
