import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/main/profile_dialog/profile_dialog_view.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';

import 'message_viewmodel.dart';

class MessageView extends StatefulWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  final ScrollController _controllerOne = ScrollController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MessageViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 9.0),
          padding: EdgeInsets.all(9.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Scrollbar(
              controller: _controllerOne,
              child: SingleChildScrollView(
                controller: _controllerOne,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MessageHeader(
                      userDefaultImageUrl: 'assets/images/mark.jpg',
                      userDisplayName: model.userDisplayName,
                    ),
                    horizontalSpaceTiny,
                    Padding(
                        padding: const EdgeInsets.only(left: 51),
                        child: InkWell(
                            onTap: () {
                              print("Thread opened");
                            },
                            onLongPress: () {
                              print("More options menu opened");
                            },
                            child: SelectableText(model.userPost))),
                    verticalSpaceSmall,
                    Padding(
                      padding: const EdgeInsets.only(left: 51.0),
                      child: Row(
                        children: [
                          MessageReactions(
                            emojiIconPath: 'assets/images/🤘🏻.png',
                          ),
                          horizontalSpaceSmall,
                          MessageReactions(emojiIconPath: 'assets/images/🎉.png'),
                          horizontalSpaceSmall,
                          MessageReactions(emojiIconPath: 'assets/images/🔥.png'),
                        ],
                      ),
                    ),
                    verticalSpaceMedium,
                    MessageHeader(
                      userDefaultImageUrl: 'assets/images/2.png',
                      userDisplayName: 'Naza',
                    ),
                    horizontalSpaceTiny,
                    Padding(
                        padding: const EdgeInsets.only(left: 51),
                        child: InkWell(
                            onTap: () {
                              print("Thread opened");
                            },
                            onLongPress: () {
                              print("More options menu opened");
                            },
                            child: SelectableText(model.userPost))),
                    verticalSpaceMedium,
                    MessageHeader(
                      userDefaultImageUrl: 'assets/images/2.png',
                      userDisplayName: 'Naza',
                    ),
                    horizontalSpaceTiny,
                    Padding(
                        padding: const EdgeInsets.only(left: 51),
                        child: InkWell(
                            onTap: () {
                              print("Thread opened");
                            },
                            onLongPress: () {
                              print("More options menu opened");
                            },
                            child: SelectableText(model.userPost))),
                    verticalSpaceSmall,
                    Padding(
                      padding: const EdgeInsets.only(left: 51.0),
                      child: Row(
                        children: [
                          MessageReactions(
                            emojiIconPath: 'assets/images/🤘🏻.png',
                          ),
                          horizontalSpaceSmall,
                          MessageReactions(emojiIconPath: 'assets/images/🎉.png'),
                          horizontalSpaceSmall,
                          MessageReactions(emojiIconPath: 'assets/images/🔥.png'),
                        ],
                      ),
                    ),
                    verticalSpaceMedium,
                    MessageHeader(
                      userDefaultImageUrl: 'assets/images/6.png',
                      userDisplayName: 'Nonso',
                    ),
                    horizontalSpaceTiny,
                    Padding(
                        padding: const EdgeInsets.only(left: 51),
                        child: InkWell(
                            onTap: () {
                              print("Thread opened");
                            },
                            onLongPress: () {
                              print("More options menu opened");
                            },
                            child: SelectableText(model.userPost))),
                    verticalSpaceSmall,
                    Padding(
                      padding: const EdgeInsets.only(left: 51.0),
                      child: MessageReplies(
                        numberOfReplies: model.numberOfReplies,
                      ),
                    ),
                    verticalSpaceMedium,
                  ],
                ),
              ),
            ),
          ),
          //color: Colors.green,
        ),
      ),
      viewModelBuilder: () => MessageViewModel(),
    );
  }
}

class MessageHeader extends StatelessWidget {
  final String userDefaultImageUrl;
  final String userDisplayName;
  MessageHeader({
    Key? key,
    required this.userDefaultImageUrl,
    required this.userDisplayName,
  }) : super(key: key);
  final DateTime currentMessageTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MessageViewModel>.reactive(
      builder: (context, model, child) => Row(children: [
        GestureDetector(
          onTap: (){
            showDialog(context: context, builder: (_)=>ProfileDialogView(profileImgUrl: userDefaultImageUrl, userName: userDisplayName,));
          },
          child: CircleAvatar(
            backgroundImage: AssetImage(userDefaultImageUrl),
            radius: 22,
          ),
        ),
        SizedBox(
          width: 6.w,
        ),
        Text(userDisplayName,
            style: TextStyle(
                fontSize: 20.sp, color: headerColor, fontFamily: 'Lato')),
        SizedBox(
          width: 6.w,
        ),
        Text('${currentMessageTime.hour}:${currentMessageTime.minute}',
            style:
                TextStyle(fontSize: 20.sp, color: timeColor, fontFamily: 'Lato')),
      ]),
      viewModelBuilder: () => MessageViewModel(),
    );
  }
}

class MessageReactions extends StatefulWidget {
  final String emojiIconPath;

  const MessageReactions({
    Key? key,
    required this.emojiIconPath,
  }) : super(key: key);

  @override
  State<MessageReactions> createState() => _MessageReactionsState();
}

class _MessageReactionsState extends State<MessageReactions> {
  int _numberOfReactions = 0;
  void _increaseReactionNumber() {
    setState(() {
      _numberOfReactions++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MessageViewModel>.reactive(
      builder: (context, model, child) => Column(children: [
        Row(
          children: [
            InkWell(
              child: Container(
                //width: 30,
                decoration: BoxDecoration(
                    color: kcBackgroundColor1,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(children: [
                    Image.asset(widget.emojiIconPath, height: 15, width: 15),
                    horizontalSpaceTiny,
                    Text('$_numberOfReactions'),
                  ]),
                ),
              ),
              onTap: () {
                print("reaction incremented");
                _increaseReactionNumber();
                //increment reaction
              },
            ),
          ],
        ),
        verticalSpaceSmall,
      ]),
      viewModelBuilder: () => MessageViewModel(),
    );
  }
}

class MessageReplies extends StatelessWidget {
  final int numberOfReplies;

  const MessageReplies({
    Key? key,
    required this.numberOfReplies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Threads opened");
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            constructRepliesHighLightAvatars(
                userDefaultImageUrl: 'assets/images/4.png'),
            constructRepliesHighLightAvatars(
                userDefaultImageUrl: 'assets/images/mark.jpg'),
            constructRepliesHighLightAvatars(
                userDefaultImageUrl: 'assets/images/7.png'),
            constructRepliesHighLightAvatars(
                userDefaultImageUrl: MessageViewModel().userDefaultImageUrl),
            horizontalSpaceTiny,
            //TODO: Get message time of last reply in a thread
            Text('${MessageViewModel().numberOfReplies} replies',
                style: TextStyle(color: kcSecondaryColor)),
            horizontalSpaceTiny,
            Text('Last reply yesterday at 9:12PM')
          ],
        ),
      ),
    );
  }
}

Widget constructRepliesHighLightAvatars({
  required String userDefaultImageUrl,
  int? numberOfReplies,
}) {
  return InkWell(
    onTap: () {
      print("Threads opened");
    },
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: Image.asset(
                userDefaultImageUrl,
                height: 27,
                width: 27,
              )),
          horizontalSpaceTiny,
        ],
      ),
    ),
  );
}
