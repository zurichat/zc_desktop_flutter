import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_asset_paths.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/views/main/add_user_channel/add_user_viewmodel.dart';

class AddUserView extends StatelessWidget {
  const AddUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddUserViewModel>.reactive(
      builder: (context, model, child) => Dialog(
        child: Container(
          padding: EdgeInsets.all(20),
          height: 300.h,
          width: 600.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    AddPeopleText,
                    style: addPeopleChannelStyle,
                  ),
                  SizedBox(width: 360.w),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                    child: SvgPicture.asset(Cancel),
                  )
                ],
              ),
              SizedBox(height: 10.h),
              SearchWidget(),
              SizedBox(height: 10.h),
              SizedBox(height: 10.h),
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   ElevatedButton(
              style: ElevatedButton.styleFrom(
                    primary: kcPrimaryColor,
                    minimumSize: Size(100.w, 40.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
              ),
              onPressed: () {Navigator.pop(context, true);},
              child: Text(
                    'Add',
                    style: TextStyle(
                      color: kcBackgroundColor1,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato'
                    ),
              ),
            ),
                 ],
               ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => AddUserViewModel(),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _controller = ScrollController();
    final TextEditingController _controllerText = TextEditingController();
    // final searchTextFieldController = useTextEditingController();
    return Scrollbar(
      controller: _controller,
      isAlwaysShown: true,
      interactive: true,
      scrollbarOrientation: ScrollbarOrientation.right,
      hoverThickness: 8,
      thickness: 3,
      child: SingleChildScrollView(
          controller: _controller,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: TextField(
                    controller: _controllerText,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
                      hintText: 'Enter a name, email or user group',
                      hintStyle: TextStyle(color: lightIconColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: bodyColor, width: 2.0),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: bodyColor, width: 2.0),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

