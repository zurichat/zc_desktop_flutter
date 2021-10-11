import 'package:animated_floating_buttons/animated_floating_buttons.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:whiteboard/whiteboard.dart';

import 'package:zc_desktop_flutter/ui/shared/whiteBoard/whiteboard_viewmodel.dart';

import '../const_app_colors.dart';
import '../custom_color.dart';

class WhiteBoardView extends StatelessWidget {
  const WhiteBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WhiteBoardViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Expanded(
                      child: WhiteBoard(
                    // isErasing: true,
                    strokeWidth: 2,
                    strokeColor: model.selectedColor!,
                  )),
                ],
              ),
            ),
            floatingActionButton: AnimatedFloatingActionButton(
              //Color shown when animation starts
              colorStartAnimation: kcPrimaryColor,

              //Color shown when animation ends
              colorEndAnimation: cyan,

              //Icon for FAB. 'X' icon is shown when menu is open.
              animatedIconData: AnimatedIcons.menu_close,
              fabButtons: _fabOption(WhiteBoardViewModel()),
            ));
      },
      viewModelBuilder: () => WhiteBoardViewModel(),
    );
  }

  List<Widget> _fabOption(model) {
    return <Widget>[
      //FAB for choosing stroke
      FloatingActionButton(
        heroTag: 'paint_stroke',
        child: Icon(Icons.brush),
        tooltip: 'Stroke',
        onPressed: () {
          // min: 0, max: 50
          // _pickStroke();
        },
      ),

      //FAB for choosing opacity
      FloatingActionButton(
        heroTag: 'paint_opacity',
        child: Icon(Icons.opacity),
        tooltip: 'Opacity',
        onPressed: () {
          //min:0, max:1
        },
      ),

      //FAB for resetting screen
      FloatingActionButton(
          heroTag: 'erase',
          child: Icon(Icons.clear),
          tooltip: 'Erase',
          onPressed: () {}),

      //FAB for picking red color
      FloatingActionButton(
        child: colorMenuItem(red),
        backgroundColor: Colors.white,
        heroTag: 'color_red',
        tooltip: 'Red',
        onPressed: () {},
      ),

      //FAB for picking green color
      FloatingActionButton(
        child: colorMenuItem(green),
        backgroundColor: Colors.white,
        heroTag: 'color_green',
        tooltip: 'Green',
        onPressed: () {},
      ),

      //FAB for picking pink color
      FloatingActionButton(
        child: colorMenuItem(pink),
        backgroundColor: Colors.white,
        heroTag: 'color_pink',
        tooltip: 'Pink',
        onPressed: () {},
      ),

      //FAB for picking blue color
      FloatingActionButton(
        child: colorMenuItem(blue),
        backgroundColor: Colors.white,
        heroTag: 'color_blue',
        tooltip: 'Blue',
        onPressed: () {},
      ),
    ];
  }

  // Future<void> _pickStroke() async {
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return ClipOval(
  //           child: AlertDialog(
  //             actions: [
  //               TextButton(
  //                   onPressed: () {
  //                     //most transparent
  //                     // opacity = 0.1;
  //                     Navigator.of(context).pop();
  //                   },
  //                   child: Icon(
  //                     Icons.opacity,
  //                     size: 24,
  //                   )),
  //               TextButton(
  //                   onPressed: () {
  //                     //most transparent
  //                     // opacity = 0.5;
  //                     Navigator.of(context).pop();
  //                   },
  //                   child: Icon(
  //                     Icons.opacity,
  //                     size: 40,
  //                   )),
  //               TextButton(
  //                   onPressed: () {
  //                     //most transparent
  //                     // opacity = 1.0;
  //                     Navigator.of(context).pop();
  //                   },
  //                   child: Icon(
  //                     Icons.opacity,
  //                     size: 60,
  //                   )),
  //             ],
  //           ),
  //         );
  //       });
  // }
}

Widget colorMenuItem(
  Color color,
) {
  return GestureDetector(
    onTap: () {},
    child: ClipOval(
      child: Container(
        padding: const EdgeInsets.only(bottom: 8.0),
        height: 36,
        width: 36,
        color: color,
      ),
    ),
  );
}

// Will need some help to finalise functionalities