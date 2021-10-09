import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/emoji_builder.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/emoji_selector/emoji.dart';
import 'formatter.dart';
import 'message_action.dart';

class SendMessageInputField extends StatefulWidget {
  const SendMessageInputField({
    Key? key,
    required this.sendMessage,
    required this.placeHolder,
  }) : super(key: key);
  final Function(String message) sendMessage;
  final String placeHolder;

  @override
  State<SendMessageInputField> createState() => _SendMessageInputFieldState();
}

class _SendMessageInputFieldState extends State<SendMessageInputField> {
  late FocusNode _focus;
  final _messageController = TextEditingController();
  late bool hasFocus;
  late bool isTyping;
  @override
  void initState() {
    super.initState();
    hasFocus = false;
    isTyping = false;
    _focus = new FocusNode();
    _focus.addListener(_onFocusChange);
    _messageController.addListener(
      () {
        setState(
          () => isTyping = _messageController.text.isNotEmpty ? true : false,
        );
      },
    );
  }

  @override
  void dispose() {
    _focus.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      hasFocus = _focus.hasFocus;
    });
  }

  void keepFocusActive() {
    _focus.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kcBackgroundColor1,
      ),
      child: Container(
        margin: EdgeInsets.only(
          left: 12,
          right: 12,
          bottom: 10,
          top: 6,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: hasFocus ? Colors.black : leftNavBarColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildMessageTextField(
              placeholder: widget.placeHolder,
            ),
            _SendMessageFunctions(
              isActive: hasFocus,
              isTyping: isTyping,
              messageController: _messageController,
              shortcutPressed: () {
                keepFocusActive();
              },
              formatPressed: () {
                keepFocusActive();
              },
              tagPressed: () {
                keepFocusActive();
              },
              attachPressed: () {
                keepFocusActive();
              },
              sendPressed: () {
                keepFocusActive();
                widget.sendMessage(_messageController.text);
              },
              schedulePressed: () {
                keepFocusActive();
              },
            ),
          ],
        ),
      ),
    );
  }

  TextField _buildMessageTextField({required String placeholder}) {
    return TextField(
      maxLines: null,
      controller: _messageController,
      focusNode: _focus,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        border: UnderlineInputBorder(borderSide: BorderSide.none),
        contentPadding: EdgeInsets.all(5),
        hintText: 'Send a message to $placeholder',
        hintStyle: TextStyle(
          fontSize: 15,
          color: leftNavBarColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _SendMessageFunctions extends StatelessWidget {
  const _SendMessageFunctions(
      {Key? key,
      required this.isActive,
      required this.isTyping,
      required this.sendPressed,
      required this.messageController,
      this.shortcutPressed,
      this.tagPressed,
      this.attachPressed,
      this.schedulePressed,
      this.formatPressed,
      this.emojiPressed})
      : super(key: key);
  final bool isActive;
  final bool isTyping;
  final Function() sendPressed;
  final Function()? shortcutPressed;
  final Function()? tagPressed;
  final Function()? attachPressed;
  final Function()? schedulePressed;
  final Function()? formatPressed;
  final Function()? emojiPressed;
  final TextEditingController? messageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border(
          top: isActive
              ? BorderSide(color: leftNavBarColor.withOpacity(.2))
              : BorderSide.none,
        ),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              MessageAction(
                onTap: shortcutPressed!,
                icon: 'assets/icons/flash.svg',
                hoverColor: kcSecondaryColor,
                iconHoverColor: whiteColor,
              ),
              SizedBox(width: 13),
              SizedBox(
                height: 19,
                child: const VerticalDivider(width: .5),
              ),
              SizedBox(width: 13),
              ...List.generate(
                MarkDown.values.length,
                (index) {
                  final markdowns = MarkDown.values;
                  return Padding(
                    padding: const EdgeInsets.only(right: 13),
                    child: TextFormatterButton(
                      markDown: markdowns[index],
                      isActive: isActive,
                      onTap: formatPressed!,
                    ),
                  );
                },
              ),
              Spacer(),
              MessageAction(
                onTap: tagPressed!,
                icon: 'assets/icons/at.svg',
              ),
              EmojiBuilder(
                icon: 'assets/icons/emoji_icon.svg',
                width: 20,
                onEmojiSelected: _onEmojiSelected,
              ),
              MessageAction(
                onTap: attachPressed!,
                icon: 'assets/icons/attach.svg',
              ),
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: isTyping ? kcPrimaryColor : whiteColor,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Row(
                  children: [
                    AbsorbPointer(
                      absorbing: isTyping ? false : true,
                      child: MessageAction(
                        onTap: sendPressed,
                        hoverColor: kcPrimaryColor,
                        iconHoverColor: whiteColor,
                        icon: 'assets/icons/send.svg',
                        iconColor: isTyping ? whiteColor : lightIconColor,
                      ),
                    ),
                    SizedBox(width: 12),
                    SizedBox(
                      height: 19,
                      child: VerticalDivider(
                        width: .5,
                        color: isTyping ? whiteColor : Color(0xff616061),
                      ),
                    ),
                    SizedBox(width: 12),
                    AbsorbPointer(
                      absorbing: isTyping ? false : true,
                      child: MessageAction(
                        onTap: schedulePressed!,
                        hoverColor: lightIconColor,
                        iconHoverColor: whiteColor,
                        icon: 'assets/icons/drop_down_open.svg',
                        iconColor: isTyping ? whiteColor : lightIconColor,
                        width: 15,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  _onEmojiSelected(Emoji emoji) {
    messageController!
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: messageController!.text.length));
  }
}
