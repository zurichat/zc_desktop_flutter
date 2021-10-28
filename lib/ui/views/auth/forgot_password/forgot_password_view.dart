// // ignore_for_file: implementation_imports

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:stacked/stacked.dart';
// import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
// import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
// import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/auth_header.dart';
// import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/goto_login_button.dart';
// import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_auth_btn.dart';
// import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';
// import 'package:zc_desktop_flutter/ui/views/auth/forgot_password/forgot_password_viewmodel.dart';

// class ForgotPasswordView extends StatelessWidget {
//   const ForgotPasswordView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
//       onModelReady: (model) => model.init(),
//       builder: (context, model, child) => Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               children: [
//                 AuthHeader(
//                     title: model.signInText, subTitle: model.signInSubtext),
//                 verticalSpaceLarge,
//                 Container(
//                   width: 440.w,
//                   child: ZuriDeskInputField(
//                     label: 'Email',
//                     controller: TextEditingController(),
//                     keyboardType: TextInputType.emailAddress,
//                     onChanged: (_) {},
//                     hintPlaceHolder: 'password@gmail.com',
//                   ),
//                 ),
//                 verticalSpaceSmall,
//                 Container(
//                     height: 58.h,
//                     width: 440.w,
//                     child: AuthButton(
//                       label: model.btnText,
//                       onTap: model.goToCheckEmailView,
//                     )),
//                 verticalSpaceMedium,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     buildLine(),
//                     Text(
//                       model.orText,
//                       style: TextStyle(
//                           fontSize: 25,
//                           fontWeight: FontWeight.w400,
//                           fontFamily: 'Lato',
//                           color: Color.fromRGBO(36, 36, 36, 1)),
//                     ),
//                     buildLine(),
//                   ],
//                 ),
//                 verticalSpaceMedium,
//                 GestureDetector(
//                   onTap: model.goToPasswordRest,
//                   child: Container(
//                     height: 58.h,
//                     width: 440.w,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(3),
//                       border: Border.all(color: Colors.grey),
//                     ),
//                     child: Center(
//                       child: Text(
//                         model.resetBtnText,
//                         style: headline6.copyWith(
//                           color: Color.fromRGBO(0, 184, 124, 1),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 verticalSpaceSmall,
//                 GotoLoginButton(),
//               ],
//             ),
//             //AuthFooter()
//           ],
//         ),
//       ),
//       viewModelBuilder: () => ForgotPasswordViewModel(),
//     );
//   }

//   buildLine() {
//     return Container(
//       height: 1.h,
//       width: 187.w,
//       color: Color.fromRGBO(219, 219, 219, 1),
//     );
//   }
// }
