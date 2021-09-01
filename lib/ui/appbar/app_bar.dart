import 'package:flutter/material.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';

AppBar buildAppBar(BuildContext context, bool isActive) {
  final icon = Icons.menu;
  final icona = Icons.arrow_back;
  final iconb = Icons.arrow_forward;
  final iconc = Icons.watch_later_outlined;
  final icond = Icons.settings_outlined;
  final iconf = Icons.minimize_outlined;
  final icong = Icons.close;
  final iconi = Icons.filter_none_outlined;

  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: 40,
    leading: IconButton(
      onPressed: () {},
      icon: Icon(
        icon,
        size: 20,
        color: lightIconColor,
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.black,
    centerTitle: true,
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            icona,
            size: 20,
            color: lightIconColor,
          ),
        ),
        SizedBox(width: 10),
        IconButton(
          onPressed: () {},
          icon: Icon(
            iconb,
            size: 20,
            color: lightIconColor,
          ),
        ),
        SizedBox(width: 10),
        IconButton(
          onPressed: () {},
          icon: Icon(
            iconc,
            size: 20,
            color: lightIconColor,
          ),
        ),
        SizedBox(width: 10),
        Container(
          width: 400,
          height: 30,
          decoration: BoxDecoration(
            color: bodyColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            cursorHeight: 25,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                size: 20,
                color: lightIconColor,
              ),
              hintText: 'Search',
              hintStyle: TextStyle(
                color: timeColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        IconButton(
          onPressed: () {},
          icon: Icon(
            icond,
            size: 20,
            color: lightIconColor,
          ),
        ),
      ],
    ),
    actions: [
      GestureDetector(
        child: Stack(
          children: [
            CircleAvatar(),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  decoration: BoxDecoration(
                      color: isActive ? Colors.green : Colors.grey,
                      borderRadius: BorderRadius.circular(50))),
            ),
          ],
        ),
      ),
      SizedBox(width: 10),
      IconButton(
        onPressed: () {},
        icon: Icon(
          iconf,
          size: 20,
          color: lightIconColor,
        ),
      ),
      SizedBox(width: 10),
      IconButton(
        onPressed: () {},
        icon: Icon(
          iconi,
          size: 20,
          color: lightIconColor,
        ),
      ),
      SizedBox(width: 10),
      IconButton(
        onPressed: () {},
        icon: Icon(
          icong,
          size: 20,
          color: lightIconColor,
        ),
      ),
    ],
  );
}
