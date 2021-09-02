// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:stacked/stacked.dart';
// import 'components/signup_viewmodel.dart';

// class AuthenticationLayout extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String mainButton;
//   final Widget form;
//   final bool showTermText;
//   final String validationMessage;
//   final Function onMainButtonClick;
//   final Function onCreateButtonTapp;
//   final Function onForgotPassword;
//   final bool busy;

//   const AuthenticationLayout(
//       {Key? key,
//       required this.title,
//       required this.subtitle,
//       required this.mainButton,
//       required this.form,
//       required this.showTermText,
//       required this.validationMessage,
//       required this.onMainButtonClick,
//       required this.onCreateButtonTapp,
//       required this.onForgotPassword,
//       required this.busy})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool check = false;
//     Size _size = MediaQuery.of(context).size;

//     return Expanded(
//       child: Padding(
//         padding: EdgeInsets.only(
//             top: _size.height * 0.08,
//             left: _size.width * 0.07,
//             right: _size.width * 0.03),
//         child: ListView(
//           children: [
//             Row(
//               children: [
//                 SvgPicture.asset(model.logoUrl),
//                 SizedBox(
//                   width: _size.width * 0.005,
//                 ),
//                 Text(
//                   model.title,
//                   style: GoogleFonts.lato(
//                       fontSize: 24, fontWeight: FontWeight.w900),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: _size.height * 0.04,
//             ),
//             form,
//             SizedBox(
//               height: _size.height * 0.01,
//             ),
//             if (showTermText)
//               Text(
//                 model.policy,
//               )
//           ],
//         ),
//       ),
//     );
//   }
// }
