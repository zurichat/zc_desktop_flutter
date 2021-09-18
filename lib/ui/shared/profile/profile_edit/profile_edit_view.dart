import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'profile_edit_viewmodel.dart';

class ProfileEditView extends StatefulWidget {
  const ProfileEditView({Key? key}) : super(key: key);

  @override
  _ProfileEditViewState createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  File? image;

  Future pickerImage(ImageSource gallery) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

// final imageTemporary = File(image.path);

// setState(() {

// this.image = imageTemporary;

// });

      final imagePermanent = await saveImagePermanently(image.path);

      setState(() {
        this.image = imagePermanent;
      });
    }

// on PlatformException catch (e) {

// print("Failed to pick image: $e");

    on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();

    final name = basename(imagePath);

    final image = File('${directory.path}/$name');

    return File(imagePath).copy(imagePath);
  }

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();

    return ViewModelBuilder<ProfileEditViewModel>.reactive(
      builder: (context, model, child) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          height: 750.h,
          width: 830.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Edit Profile",
                    style: heading3Style,
                  ),
                  IconButton(
                    onPressed: () {
                      model.closeDialog();
                    },
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
              Divider(),
              SingleChildScrollView(
                controller: _scrollController,
                child: Container(
                  height: 800.h,
                  width: 830.w,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AuthInputField(
                                  label: 'Full Name',
                                  onChanged: (value) {},
                                  errorText:
                                      "Unfortunately, you can’t leave this blank.",
                                  keyboardType: TextInputType.emailAddress,
                                  hintPlaceHolder: 'Full Name',
                                ),

                                verticalSpaceRegular,

                                AuthInputField(
                                  label: 'Display Name',

                                  onChanged: (value) {},

                                  // helperText:
                                  //     "This could be your first name, or a nickname — however you’d like people to refer to you in Slack.",

// errorText: model.emailErrorText,

                                  keyboardType: TextInputType.emailAddress,

                                  hintPlaceHolder: 'Display Name',
                                ),

                                verticalSpaceRegular,

                                Text(
                                  "Custom rules for this workspace:",
                                  style: subtitle2,
                                ),

                                verticalSpaceRegular,

                                Text(
                                  "Please use as ingle firstname or a permanent nickname. If someone uses your name, please change it",
                                  style: subtitle2,
                                ),

                                verticalSpaceRegular,

                                verticalSpaceLarge,

                                AuthInputField(
                                  label: 'What I do',
                                  onChanged: (value) {},
                                  // helperText:
                                  //     "Let people know what you do at Zuri x I4G.",
                                  keyboardType: TextInputType.emailAddress,
                                  hintPlaceHolder: 'What I do',
                                ),

// verticalSpaceRegular,

// AuthInputField(

// label: 'Pronouns',

// onChanged: (value) {},

// helperText: "gfdfdfgdfgg",

// // errorText: model.emailErrorText,

// keyboardType: TextInputType.emailAddress,

// hintPlaceHolder: 'Ex.they/them/theirs',

// ),

// verticalSpaceRegular,

// AuthInputField(

// label: 'Phone Numder',

// onChanged: (value) {},

// helperText: "gfdfdfgdfgg",

// // errorText: model.emailErrorText,

// keyboardType: TextInputType.emailAddress,

// hintPlaceHolder: '(123) 555-5555',

// ),

// verticalSpaceRegular,

// AuthInputField(

// label: 'Time Zone',

// onChanged: (value) {},

// helperText: "gfdfdfgdfgg",

// // errorText: model.emailErrorText,

// keyboardType: TextInputType.emailAddress,

// hintPlaceHolder: 'Please Select an option',

// ),
                              ],
                            ),
                          ),
                          horizontalSpaceRegular,
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,

// crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  "Profile Photo",
                                  style: heading3Style,
                                ),
                                verticalSpaceMedium,
                                Container(
                                    child: image != null
                                        ? Container(
                                            height: 200.h,
                                            width: 200.w,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              image: DecorationImage(
                                                  image: FileImage(image!)),
                                            ),
                                          )
                                        : Container(
                                            height: 200.h,
                                            width: 200.w,
                                            decoration: BoxDecoration(

// color: kcSuccessColor,

                                                ),
                                            child: Image.asset(
                                                'assets/images/download.png'),
                                          )),
                                verticalSpaceRegular,
                                Center(
                                  child: ElevatedButton(
                                      onPressed: () {
                                        pickerImage(ImageSource.gallery);
                                      },
                                      child: Text("Upload an image")),
                                ),
                                verticalSpaceRegular,
                                Center(
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Remove photo",
                                        style: subheadingStyle,
                                      )),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    OutlineButton(
                        child: Text(
                          "Cancel",
                          style: subheadingStyle,
                        ),
                        onPressed: () {}),
                    horizontalSpaceSmall,
                    AuthButton(label: "Save Changes")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => ProfileEditViewModel(),
    );
  }
}

// child: Container(

// height: 750.h,

// width: 830.w,

// child:

// Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

// Padding(

// padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),

// child: Row(

// mainAxisAlignment: MainAxisAlignment.spaceBetween,

// children: [

// ZcdeskText.headingThree('Edit Profile'),

// IconButton(

// onPressed: () {

// model.closeDialog();

// },

// icon: Icon(Icons.close),

// ),

// ],

// ),

// ),

// Divider(),

// // Container(

// // width: 200.w,

// // padding: const EdgeInsets.only(left: 10.0, right: 10),

// // child: SingleChildScrollView(

// // // controller: _rightSideBarController,

// // child: Row(

// // children: [

// // Column(

// // crossAxisAlignment: CrossAxisAlignment.start,

// // children: [

// // Text(

// // "Full name",

// // style: subheadingStyle,

// // ),

// // verticalSpaceRegular,

// // AuthInputField(

// // label: 'Email',

// // onChanged: (value) {},

// // // errorText: model.emailErrorText,

// // keyboardType: TextInputType.emailAddress,

// // hintPlaceHolder: 'someone@gmail.com',

// // ),

// // verticalSpaceRegular,

// // Container(

// // child: TextFormField(

// // decoration: InputDecoration(

// // hintText: "Display Name",

// // border:

// // OutlineInputBorder(borderSide: BorderSide()),

// // enabledBorder: OutlineInputBorder(

// // borderSide: BorderSide(color: leftNavBarColor),

// // ),

// // focusedBorder: OutlineInputBorder(

// // borderSide: BorderSide(

// // color: Colors.blue,

// // ),

// // ),

// // helperText:

// // "This could be your first name, or a nickname — however you’d like people to refer to you in Slack.",

// // ),

// // ),

// // ),

// // verticalSpaceRegular,

// // Text("data"),

// // verticalSpaceRegular,

// // Text("data"),

// // Container(

// // child: TextFormField(

// // decoration: InputDecoration(

// // hintText: "What You Do",

// // border:

// // OutlineInputBorder(borderSide: BorderSide()),

// // enabledBorder: OutlineInputBorder(

// // borderSide: BorderSide(color: leftNavBarColor),

// // ),

// // focusedBorder: OutlineInputBorder(

// // borderSide: BorderSide(

// // color: Colors.blue,

// // ),

// // ),

// // helperText:

// // "Let people know what you do at Zuri x I4G.",

// // ),

// // ),

// // ),

// // verticalSpaceRegular,

// // Text("data"),

// // TextFormField(

// // decoration: InputDecoration(

// // hintText: "Ex.they/them/theirs",

// // border:

// // OutlineInputBorder(borderSide: BorderSide()),

// // enabledBorder: OutlineInputBorder(

// // borderSide: BorderSide(color: leftNavBarColor),

// // ),

// // focusedBorder: OutlineInputBorder(

// // borderSide: BorderSide(

// // color: Colors.blue,

// // ),

// // ),

// // helperText:

// // "Let people know which pronouns you use.",

// // ),

// // ),

// // verticalSpaceRegular,

// // Text("data"),

// // Container(

// // child: TextFormField(

// // decoration: InputDecoration(

// // hintText: "(123) 555-5555",

// // border:

// // OutlineInputBorder(borderSide: BorderSide()),

// // enabledBorder: OutlineInputBorder(

// // borderSide: BorderSide(color: leftNavBarColor),

// // ),

// // focusedBorder: OutlineInputBorder(

// // borderSide: BorderSide(

// // color: Colors.blue,

// // ),

// // ),

// // helperText: "Enter a phone number.",

// // ),

// // ),

// // ),

// // verticalSpaceRegular,

// // Text("data"),

// // TextFormField(

// // decoration: InputDecoration(

// // hintText: "Time Zone",

// // border:

// // OutlineInputBorder(borderSide: BorderSide()),

// // enabledBorder: OutlineInputBorder(

// // borderSide: BorderSide(color: leftNavBarColor),

// // ),

// // focusedBorder: OutlineInputBorder(

// // borderSide: BorderSide(

// // color: Colors.blue,

// // ),

// // ),

// // helperText:

// // "Your current time zone. Used to send summary and notification emails, for times in your activity feeds, and for reminders.",

// // ),

// // ),

// // verticalSpaceRegular,

// // Text("data"),

// // TextFormField(

// // decoration: InputDecoration(

// // hintText: "https://",

// // border:

// // OutlineInputBorder(borderSide: BorderSide()),

// // enabledBorder: OutlineInputBorder(

// // borderSide: BorderSide(color: leftNavBarColor),

// // ),

// // focusedBorder: OutlineInputBorder(

// // borderSide: BorderSide(

// // color: Colors.blue,

// // ),

// // ),

// // helperText: "Follow me on twitter :).",

// // ),

// // ),

// // verticalSpaceRegular,

// // Text("data"),

// // TextFormField(

// // decoration: InputDecoration(

// // hintText: "https://",

// // border:

// // OutlineInputBorder(borderSide: BorderSide()),

// // enabledBorder: OutlineInputBorder(

// // borderSide: BorderSide(color: leftNavBarColor),

// // ),

// // focusedBorder: OutlineInputBorder(

// // borderSide: BorderSide(

// // color: Colors.blue,

// // ),

// // ),

// // helperText: "Follow me on twitter",

// // ),

// // ),

// ],

// ),

// ],

// ),
