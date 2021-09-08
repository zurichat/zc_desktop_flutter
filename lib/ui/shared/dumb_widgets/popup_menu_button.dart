import 'package:flutter/material.dart';

PopupMenuButton buildMenuItem(BuildContext context) {
  return PopupMenuButton(
    itemBuilder: (context) => [
      PopupMenuItem<int>(
        value: 0,
        child: Text(
          'Turn off notifications for replies',
          style: TextStyle(
            color: Colors.black,
            fontSize: 13,
          ),
        ),
      ),
      PopupMenuItem<int>(
        value: 1,
        child: Row(
          children: [
            Text(
              'Mark Unread',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
            SizedBox(width: 150),
            Icon(
              Icons.format_underline,
              size: 15,
            ),
          ],
        ),
      ),
      PopupMenuItem<int>(
        value: 2,
        child: Row(
          children: [
            Text(
              'Remind me about this',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
            SizedBox(width: 100),
            Icon(
              Icons.navigate_next_outlined,
              size: 15,
            ),
          ],
        ),
      ),
      PopupMenuItem<int>(
        value: 3,
        child: Text(
          'Copy link',
          style: TextStyle(
            color: Colors.black,
            fontSize: 13,
          ),
        ),
      ),
      PopupMenuItem<int>(
        value: 4,
        child: Row(
          children: [
            Text(
              'Pin to this conversation',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
            SizedBox(width: 90),
            Icon(
              Icons.push_pin_outlined,
              size: 15,
            ),
          ],
        ),
      ),
      PopupMenuItem<int>(
        value: 5,
        child: Text(
          'Turn question into poll',
          style: TextStyle(
            color: Colors.black,
            fontSize: 13,
          ),
        ),
      ),
      PopupMenuItem<int>(
        value: 6,
        child: Row(
          children: [
            Text(
              'More message shortcuts',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
            SizedBox(width: 83),
            Icon(
              Icons.launch,
              size: 15,
            ),
          ],
        ),
      ),
    ],
    onSelected: (item) => selectedItem(context, item),
  );
}

 selectedItem(BuildContext context, item) {
  switch (item) {
    case 0:
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Turn off notification pressed')));
      break;
    case 1:
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Mark unread pressed')));
      break;
    case 2:
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(' Remind me about this pressed')));
      break;
    case 3:
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Copy pressed')));
      break;
    case 4:
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Pin to this conversation pressed')));
      break;
    case 5:
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Turn question into poll pressed')));
      break;
    case 6:
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('More message shortcuts pressed')));
      break;
  }
}
