// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_asset_paths.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/views/main/add_user_channel/add_user_viewmodel.dart';

class AddUserView extends StatelessWidget {
  AddUserView({Key? key}) : super(key: key);
  OverlayEntry? _floatingDropdown = null;

  OverlayEntry _createFloatingDropdown(model) {
    return OverlayEntry(builder: (context) {
      return BuildSuggestionsList(
        model: model,
        floatingDropdown: _floatingDropdown!,
      );
    });
  }

  void _toggleDropdown({required BuildContext context, required model}) async {
    if (_floatingDropdown == null) {
      this._floatingDropdown = this._createFloatingDropdown(model);
    }
    Overlay.of(context)!.insert(this._floatingDropdown!);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddUserViewModel>.reactive(
      onModelReady: (model) => model.fetchUsers(),
      builder: (context, model, child) => Dialog(
        child: Container(
          width: 600.w,
          height: 310,
          child: Container(
            height: 300.h,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Expanded(
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
                          child: SvgPicture.asset(
                            Cancel,
                            width: 14,
                            height: 14,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25),
                            child: Stack(children: [
                              TextField(
                                onChanged: (value) {
                                  model.search(
                                    value,
                                  );
                                  if (!model.isDropped) {
                                    _toggleDropdown(
                                        context: context, model: model);
                                    model.setIsDropped();
                                  }
                                },
                                onTap: () {
                                  if (!model.isDropped) {
                                    _toggleDropdown(
                                        context: context, model: model);
                                    model.setIsDropped();
                                  }
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: model.usersToBeAdded.isEmpty
                                          ? 10
                                          : ((model.usersToBeAdded.length) *
                                              120.w)),
                                  hintText: AddPeopleHint,
                                  hintStyle: TextStyle(color: lightIconColor),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: bodyColor, width: 2.0),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: bodyColor, width: 2.0),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                              if (model.usersToBeAdded.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      width:
                                          (model.usersToBeAdded.length) * 130.h,
                                      height: 30.h,
                                      child: ListView.builder(
                                        itemCount: model.usersToBeAdded.length,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: BuildSelectedUserContainer(
                                            username: model
                                                .usersToBeAdded[index]
                                                .displayName,
                                            onTap: () => model
                                                .removeUsersToBeAdded(index),
                                            imageUrl: model
                                                    .usersToBeAdded[index]
                                                    .profileImage
                                                    .isEmpty
                                                ? DefaultProfilePictureUrl
                                                : model.usersToBeAdded[index]
                                                    .profileImage,
                                          ),
                                        ),
                                      )),
                                )
                            ]),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: kcPrimaryColor,
                              minimumSize: Size(115.w, 56.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: () async {
                              await model.addUsersToChannel().then((_) =>
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(SnackBarMessageAddUser),
                                    backgroundColor: kcSuccessColor,
                                  )));
                              Navigator.pop(context, true);
                            },
                            child: model.isBusy
                                ? CircularProgressIndicator()
                                : Text(
                                    AddButtonText,
                                    style: TextStyle(
                                        color: kcBackgroundColor1,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Lato'),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => AddUserViewModel(),
      onDispose: (model) {
        if (model.isDropped) {
          _floatingDropdown!.remove();
          _floatingDropdown = null;
        }
      },
    );
  }
}

class BuildSuggestionsList extends StatelessWidget {
  final AddUserViewModel model;
  final OverlayEntry floatingDropdown;
  const BuildSuggestionsList(
      {Key? key, required this.model, required this.floatingDropdown})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        child: Container(
          height: model.searchList.isEmpty ? 0 : 350.h,
          width: 500.w,
          color: Colors.white,
          padding: EdgeInsets.all(8.0),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: model.searchList.length,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    model.setSelectUserIndex(index);
                    floatingDropdown.remove();
                    model.setIsDropped();
                  },
                  child: BuildSuggestion(
                    username: '${model.searchList[index].displayName}',
                    name: '${model.searchList[index].name}',
                    imageUrl: model.searchList[index].profileImage.isEmpty
                        ? DefaultProfilePictureUrl
                        : model.searchList[index].profileImage,
                    isSelected: model.selectedUserIndex == index,
                  ))),
        ),
      ),
    );
  }
}

class BuildSuggestion extends StatelessWidget {
  const BuildSuggestion({
    Key? key,
    required this.imageUrl,
    this.isSelected = false,
    required this.username,
    this.name = '',
  }) : super(key: key);
  final bool isSelected;
  final String username, name, imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        color: isSelected ? kcPrimaryColor : Colors.white,
        height: 40.h,
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              child: Stack(
                children: [
                  Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 20,
                    top: 25,
                    child: CircleAvatar(
                      backgroundColor: kcPrimaryColor,
                      radius: 5,
                    ),
                  )
                ],
              ),
            ),
            horizontalSpaceSmall,
            Expanded(
                child: Text(
              '$username ${name.isEmpty ? '' : '| $name'}',
              style: preferenceStyleNormal,
            ))
          ],
        ),
      ),
    );
  }
}

class BuildSelectedUserContainer extends StatelessWidget {
  final String imageUrl, username;
  final VoidCallback onTap;
  const BuildSelectedUserContainer(
      {Key? key,
      required this.onTap,
      required this.username,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: KaddPeopleBackcolor,
      height: 30,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Stack(
                children: [
                  Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              username,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
            SizedBox(
              width: 4,
            ),
            IconButton(
                icon: Icon(
                  Icons.close,
                  size: 10,
                ),
                onPressed: onTap),
            horizontalSpaceTiny
          ],
        ),
      ),
    );
  }
}
