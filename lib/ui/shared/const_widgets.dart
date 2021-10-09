import 'package:flutter/material.dart';

//TODO: Remove this class and delete the file
class SVGAssetPaths {
  static final channelsListIcon = 'assets/icons/hash_inactive.svg';
  static final linkIcon = 'assets/icons/linkIcon.svg';
  static final dropDownOpenIcon = 'assets/icons/drop_down_open.svg';
  static final dropDownClosedIcon = 'assets/icons/channel_close.svg';
  static final channelDropDown = 'assets/icons/channel_drop_down.svg';
  static final sortIcon = 'assets/icons/sort.svg';
  static final filterDown = 'assets/icons/filter.svg';
  static final activeIcon = 'assets/icons/active.svg';
  static final fluentEmoji = 'assets/icons/fluent_emoji.svg';
  static final shareIcon = 'assets/icons/share.svg';
  static final actionsIcon = 'assets/icons/actions.svg';
  static final bookmarkIcon = 'assets/icons/bookmark.svg';
  static final pinnedIcon = 'assets/icons/pinned.svg';
  static final addIcon = 'assets/icons/add.svg';
  static final thread = 'assets/icons/threads.svg';
  static final newDm = 'assets/icons/new_dm.svg';
  static final right_icon = 'assets/icons/right_icon.svg';
  static final shortcut = 'assets/icons/shortcuts.svg';
  static final add_reaction_container =
      'assets/icons/add_reaction_container.svg';
  static final add_saved_container = 'assets/icons/add_saved_container.svg';
  static final more_actions_container =
      'assets/icons/more_actions_container.svg';
  static final reply_thread_container =
      'assets/icons/reply_thread_container.svg';
  static final share_message_container =
      'assets/icons/share_message_container.svg';
  static final ribbon = 'assets/icons/ribbon.svg';
}

class ShortCuts {
  Widget contain({Widget? child, double h = 17, double w = 30}) {
    return Container(
      constraints: BoxConstraints(
          minWidth: 30, minHeight: 16, maxWidth: w, maxHeight: h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.grey.shade300),
      child: child,
    );
  }

  Widget up() {
    return contain(
      child: Icon(
        Icons.arrow_drop_up,
        size: 20,
        color: Colors.black,
      ),
    );
  }

  Widget ctrl() {
    return contain(
      child: Center(
          child: Text(
        'Ctrl',
        style: TextStyle(color: Colors.black, fontSize: 10),
      )),
    );
  }

  Widget enter() {
    return contain(
      child: Center(
          child: Text(
        'Enter',
        style: TextStyle(color: Colors.black, fontSize: 10),
      )),
    );
  }

  Widget shift() {
    return contain(
      child: Center(
          child: Text(
        'Shift',
        style: TextStyle(color: Colors.black, fontSize: 8),
      )),
    );
  }

  Widget fKey() {
    return contain(
      child: Center(
          child: Text(
        'F',
        style: TextStyle(color: Colors.black, fontSize: 10),
      )),
    );
  }

  Widget kKey() {
    return contain(
      child: Center(
          child: Text(
        'K',
        style: TextStyle(color: Colors.black, fontSize: 10),
      )),
    );
  }

  Widget pageUp() {
    return contain(
      w: 40,
      child: Center(
          child: Text(
        'Page up',
        style: TextStyle(color: Colors.black, fontSize: 9),
      )),
    );
  }

  Widget pageDown() {
    return contain(
      w: 50,
      child: Center(
          child: Text(
        'Page Down',
        style: TextStyle(color: Colors.black, fontSize: 9),
      )),
    );
  }

  Widget home() {
    return contain(
      w: 40,
      child: Center(
          child: Text(
        'Home',
        style: TextStyle(color: Colors.black, fontSize: 9),
      )),
    );
  }

  Widget end() {
    return contain(
      w: 45,
      child: Center(
          child: Text(
        'End',
        style: TextStyle(color: Colors.black, fontSize: 7),
      )),
    );
  }

  Widget slash() {
    return contain(
        child: Center(
      child: Text('/'),
    ));
  }

  Widget esc() {
    return contain(
      child: Center(
        child: Text('ESC'),
      ),
    );
  }

  Widget alt() {
    return contain(
        child: Center(
      child: Text('/'),
    ));
  }
}
