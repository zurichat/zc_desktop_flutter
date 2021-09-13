import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/preferences_viewmodel.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';

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
        'widget': Container(
          child: Center(
            child: ZcdeskText.headline('Notifications'),
          ),
        )
      },
      {
        'text': 'Sidebar',
        'icon': Icons.grid_view_outlined,
        'widget': Container(
          child: Center(
            child: ZcdeskText.headline('Sidebar'),
          ),
        )
      },
      {
        'text': 'Themes',
        'icon': Icons.remove_red_eye_outlined,
        'widget': Container(
          child: Center(
            child: ZcdeskText.headline('Themes'),
          ),
        )
      },
      {
        'text': 'Message & Media',
        'icon': Icons.messenger_outline,
        'widget': Container(
          child: Center(
            child: ZcdeskText.headline('Message & Media'),
          ),
        )
      },
      {
        'text': 'Language & region',
        'icon': Icons.language_outlined,
        'widget': Container(
          child: Center(
            child: ZcdeskText.headline('Language & Region'),
          ),
        )
      },
      {
        'text': 'Accessibility',
        'icon': Icons.desktop_windows_outlined,
        'widget': Container(
          child: Center(
            child: ZcdeskText.headline('Accessibilty'),
          ),
        )
      },
      {
        'text': 'Mark as read',
        'icon': Icons.launch,
        'widget': Container(
          child: Center(
            child: ZcdeskText.headline('Mark as read'),
          ),
        )
      },
      {
        'text': 'Audio & Video',
        'icon': Icons.videocam_outlined,
        'widget': Container(
          child: Center(
            child: ZcdeskText.headline('Audio & Video'),
          ),
        )
      },
      {
        'text': 'Advanced',
        //This icon will be changed later
        'icon': Icons.messenger_outline,
        'widget': Container(
          child: Center(
            child: ZcdeskText.headline('Advanced'),
          ),
        )
      }
    ];
    return ViewModelBuilder<PereferenceViewModel>.reactive(
      builder: (context, model, child) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          height: 750.h,
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
                      height: 600.h,
                      width: 244.w,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView.builder(
                            clipBehavior: Clip.none,
                            itemCount: _data.length,
                            itemBuilder: (context, index) {
                              return buildListItem(
                                  text: _data[index]['text'],
                                  icon: _data[index]['icon'],
                                  isSelected: model.currentPageIndex == index,
                                  onClicked: () {
                                    model.updatePageIndex(index);
                                  });
                            }),
                      )),
                  VerticalDivider(
                    width: 8,
                  ),
                  Scrollbar(
                    controller: _rightSideBarController,
                    isAlwaysShown: true,
                    scrollbarOrientation: ScrollbarOrientation.right,
                    thickness: 8,
                    showTrackOnHover: true,
                    child: SingleChildScrollView(
                        controller: _rightSideBarController,
                        child: Container(
                            height: 600.h,
                            width: (827 - 274).w,
                            child: _data[model.currentPageIndex]['widget'])),
                  )
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
      title: Text(text,
          style: TextStyle(color: color, fontSize: 16.sp, fontFamily: 'Lato')),
      hoverColor: hoverColor,
      onTap: onClicked,
    ),
  );
}
