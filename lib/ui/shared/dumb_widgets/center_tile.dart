import 'package:flutter/material.dart';
import 'dart:math' as math;

Container centerTitleCard(BuildContext context) {
  return Container(
    alignment: Alignment.topCenter,
    width: 1136,
    height: 80,
    child: Card(elevation: 5, child: centerListTile(context, 'designers')),
  );
}

ListTile centerListTile(BuildContext context, String channelName) {
  return ListTile(
      contentPadding: EdgeInsets.only(left: 10, right: 10),
      shape:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.black12)),
      title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.tag, color: Color.fromRGBO(0, 184, 124, 1), size: 15),
            SizedBox(
              width: 3,
            ),
            Container(
                padding: EdgeInsets.only(bottom: 3),
                child: Text(
                  channelName,
                  style: TextStyle(color: Color.fromRGBO(0, 184, 124, 1)),
                )),
            SizedBox(
              width: 3,
            ),
            Container(
                padding: EdgeInsets.all(0),
                child: Icon(
                  Icons.star_border_outlined,
                  color: Color.fromRGBO(0, 184, 124, 1),
                  size: 14,
                ))
          ]),
      trailing: Container(
        width: 160,
        height: 40,
        padding: EdgeInsets.all(1),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 38,
              width: 98,
              child: Stack(
                clipBehavior: Clip.none, textDirection: TextDirection.rtl,
                children: positioned(context)!,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              members.length.toString(),
              style: TextStyle(
                  fontSize: 13, color: Color.fromRGBO(0, 184, 124, 1)),
            ),
            SizedBox(
              width: 5,
            ),
            Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: Icon(
                  Icons.person_add_outlined,
                  color: Color.fromRGBO(0, 184, 124, 1),
                  size: 22,
                )),
          ],
        ),
      ));
}

List<Widget>? positioned(BuildContext context) {
  var d = 3;
  var pos = <Widget>[];
  double left = 60;
  var list = new List<int>.generate(d, (i) => i + 1);
  list.forEach((i) {
    pos.add(Positioned(
      left: left,
      child: Container(
          alignment: Alignment.center,
          height: 38,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60.0),
            border: Border.all(color: Color.fromRGBO(0, 184, 124, 1)),
          ),
          child: CircleAvatar(
              radius: 32,
              backgroundImage:
                  AssetImage('assets/${members[members.keys.elementAt(i)]}'))),
    ));
    left = left - 20;
  });
  return pos;
}

final Map<String, String> members = {
  'WilliamTobs': 'images/widgetImages/ava3.png',
  'Geeky_Tobi': 'images/widgetImages/ava.png',
  'Susan': 'images/widgetImages/ava2.jpg',
  'Jay': 'images/widgetImages/ava.png',
  'Jayda': 'images/widgetImages/ava2.jpg',
  'MJ': 'images/widgetImages/ava3.png',
  'Raphael': 'images/widgetImages/ava.png',
  'Jake': 'images/widgetImages/ava.png',
  'Dan': 'images/widgetImages/ava2.jpg',
  'Eri': 'images/widgetImages/ava3.png',
};

