import 'package:flutter/material.dart';
import 'package:zc_desktop_flutter/custom_widgets/custom_color.dart';


class HomeViewWidget extends StatelessWidget {
  const HomeViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('SideMenuBar')),
        actions: [
          Container(
            height:20,
            width: 1055,
            color: yellow.shade700,
            child: Center(child: Text('AppBar')),
          ),

        ],
        backgroundColor: purple,
        shape:Border.all(color: purple, width: 1.0,style: BorderStyle.none),
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              height: 670,
              width: 265,
              color: red,
              child: Center(child: Text('SideMenuBar Contents'),),

            ),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 60),
            height: 670,
            width: 675,
            color: green,
            child: Center(child: Text('Body')),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 60),
            height: 670,
            width: 380,
            color: blue,
            child: Center(child: Text('Threads')),
          ),

        ],

      ),
      backgroundColor: pink,

    );
  }
}
