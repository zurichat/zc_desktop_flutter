import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/ui/main/home_page/home_view.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';

Widget buildAppBar(BuildContext context,
    {bool isActive = false,
    bool isSignUp = false,
    bool isSignIn = false,
    String text = ''}) {
  final icon = Icons.menu;
  final icona = Icons.arrow_back;
  final iconb = Icons.arrow_forward;
  final iconc = Icons.watch_later_outlined;
  final icond = Icons.settings_outlined;
  return Container(
    height: 45.h,
    color: Colors.black,
    child: WindowTitleBarBox(
      child: MoveWindow(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                icon,
                size: 20,
                color: lightIconColor,
              ),
            ),
            SizedBox(width: !isSignUp && !isSignIn ? 150.w : 70.w),
            !isSignUp && !isSignIn
                ? IconButton(
                    onPressed: () {},
                    icon: Icon(
                      icona,
                      size: 20,
                      color: lightIconColor,
                    ),
                  )
                : Expanded(
                    child: Text(
                    text,
                    style: TextStyle(color: Colors.white, fontFamily: 'Lato'),
                  )),
            //  SizedBox(width: 10),
            if (!isSignUp && !isSignIn)
              IconButton(
                onPressed: () {},
                icon: Icon(
                  iconb,
                  size: 20,
                  color: lightIconColor,
                ),
              ),
            if (!isSignUp && !isSignIn)
              // SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  iconc,
                  size: 20,
                  color: lightIconColor,
                ),
              ),
            // SizedBox(width: 10),
            if (!isSignUp && !isSignIn)
              Container(
                constraints: BoxConstraints(
                  maxHeight: 18,
                  maxWidth: 350.0,
                ),
                decoration: BoxDecoration(
                  color: bodyColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  cursorHeight: 16,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 15,
                      color: lightIconColor,
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: timeColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: bodyColor,
                    isDense: true,
                    //border: InputBorder.none,
                  ),
                ),
              ),
            //  SizedBox(width: 10),
            // if (!isSignUp && !isSignIn)
            IconButton(
              onPressed: () {
                showDialog(context: context, builder: (_) => PereferenceView());
              },
              icon: Icon(
                icond,
                size: 20,
                color: lightIconColor,
              ),
            ),
            SizedBox(width: 100),
            if (!isSignUp && !isSignIn)
              GestureDetector(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(),
                    Positioned(
                      top: 20,
                      left: 28,
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: isActive ? Colors.green : Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            Align(alignment: Alignment.centerRight, child: WindowsButton())
          ],
        ),
      ),
    ),
  );
}

class WindowsButton extends StatelessWidget {
  const WindowsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colors = WindowButtonColors(
      mouseOver: Color(0xFFD32F2F),
      mouseDown: Color(0xFFB71C1C),
      iconNormal: lightIconColor,
      iconMouseOver: Colors.white,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MinimizeWindowButton(colors: colors),
        MaximizeWindowButton(colors: colors),
        CloseWindowButton(colors: colors)
      ],
    );
  }
}

//View
class PereferenceView extends StatelessWidget {
  const PereferenceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _rightSideBarController = ScrollController();
    //List of datas to be used to populate the leftside and the right side side of the preferences view
    //TODO Update the widgets in map
    final List _data = [
      {
        'text': 'Notifications',
        'icon': Icons.notifications_none_outlined,
        'widget': Container(child: Center(child: ZcdeskText.headline('Notifications'),),)
      },
      {
        'text': 'Sidebar',
        'icon': Icons.grid_view_outlined,
        'widget': Container(child: Center(child: ZcdeskText.headline('Sidebar'),),)
      },
      {
        'text': 'Themes',
        'icon': Icons.remove_red_eye_outlined,
        'widget': Container(child: Center(child: ZcdeskText.headline('Themes'),),)
      },
      {
        'text': 'Message & Media',
        'icon': Icons.messenger_outline,
        'widget': Container(child: Center(child: ZcdeskText.headline('Message & Media'),),)
      },
      {
        'text': 'Language & region',
        'icon': Icons.language_outlined,
        'widget': Container(child: Center(child: ZcdeskText.headline('Language & Region'),),)
      },
      {
        'text': 'Accessibility',
        'icon': Icons.desktop_windows_outlined,
        'widget': Container(child: Center(child: ZcdeskText.headline('Accessibilty'),),)
      },
      {
        'text': 'Mark as read',
        'icon': Icons.launch,
        'widget': Container(child: Center(child: ZcdeskText.headline('Mark as read'),),)
      },
      {
        'text': 'Audio & Video',
        'icon': Icons.videocam_outlined,
        'widget': Container(child: Center(child: ZcdeskText.headline('Audio & Video'),),)
      },
      {
        'text': 'Advanced',
        'icon': Icons.messenger_outline,
        'widget': Container(child: Center(child: ZcdeskText.headline('Advanced'),),)
      }
    ];
    return ViewModelBuilder<PereferenceViewModel>.reactive(
      builder: (context, model, child) => Dialog(
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 706.h,
          width: 827.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ZcdeskText.headingTwo('Preferences'),
                    IconButton(
                      onPressed: () {
                        model.closeDialog();
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                height: 529.h,
                width: 244.w,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    clipBehavior: Clip.none,
                    itemCount: _data.length,
                    itemBuilder: (context, index){
                      return buildListItem(text: _data[index]['text'], icon: _data[index]['icon'], isSelected: model._currentPageIndex == index, onClicked: (){
                        model.updatePageIndex(index);
                      });
                    }),
                )
              ),
              VerticalDivider(width: 8,),
              Scrollbar(
                controller: _rightSideBarController,
                isAlwaysShown: true,
                scrollbarOrientation: ScrollbarOrientation.right,
                thickness: 8,
                showTrackOnHover: true,
                child: SingleChildScrollView(
                  controller: _rightSideBarController,
                  child: Container(
                    height: 529.h,
                    width: (827-274).w,
                    child:_data[model.currentPageIndex]['widget'])
                ),)
                ],
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => PereferenceViewModel(),
    );
  }
}

Widget buildListItem({
  required String text,
  required IconData icon,
  required isSelected,
  VoidCallback? onClicked,
}) {
  const color = Colors.black;
  final hoverColor = Colors.blue;
  return Container(
    color: isSelected ? kcPrimaryColor : Colors.white,
    child: ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    ),
  );
}


//View Model
class PereferenceViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  var _currentPageIndex = 0;

  get currentPageIndex => _currentPageIndex;

  void updatePageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }

  void closeDialog() {
    _navigator.popRepeated(1);
    notifyListeners();
  }
}
