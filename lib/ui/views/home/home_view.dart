import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart'

import 'package:zc_desktop_flutter/ui/appbar/app_bar.dart
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
 page_layout
        // TODO: Replace this with custom app bar
        body: Column( children: [
          Cont
              child: buildAppBar(context, true),
            ),
          Row(
          children: [

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(child: buildAppBar(context, true)),
            Expanded(
                child: Container(
                    alignment: Alignment.topCenter,
                    child: centertitlecard(context))),

            Expanded(
              child: Container(
                // width: 270.w,
                decoration: BoxDecoration(color: Colors.red),
                child: Center(
                    child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 80.h,
                      decoration: BoxDecoration(color: Colors.purple),
                      // TODO: This should hold the Zuri Main Title
                      // the one with the Zuri Chat Logo, Zuri text and sign out
                      // button
                      child: Text('Zuri Main Title'),
                    ),
                    // TODO: Here will be the drop down list of options that when
                    // clicked will show on the center section
                    Text('Left Side Bar'),
                  ],
                )),
              ),

            ),
            Expanded(
              flex: 4,
              child: Container(
                // width: 780.w,
                decoration: BoxDecoration(color: Colors.green),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 80.h,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.orange),
                        // TODO: The Title Card that shows the Channel name and
                        // number of people in the channel.
                        child: Text(
                          'Title Card',
                        ),
                      ),
                      // TODO: This will display messages in the channel or chat
                      // or plugins as webviews. More on this later.
                      Text('Center Area'),
                      Container(
                        // TODO: This will be the reusable message text field
                        // that will be used throughout the app.
                        height: 100.h,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.pink),
                        child: Text('Message field'),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                // width: 370.w,
                decoration: BoxDecoration(color: Colors.blue),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 80.h,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.orange),
                        child: Text(
                          'Thread',
                        ),
                      ),
                      Text('Right Side Bar'),
                      Container(
                        height: 100.h,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.pink),
                        child: Text('Message field'),
                      )
                    ],
                  ),
                ),
              ),
            )
          ], row here
              Expanded(
                flex: 1,
                child: Text(model.title),
              ),
              Expanded(
                flex: 1,
                child: Text(model.testString),
              ),

              //TODO: Remove after review
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: ()=> model.goToInputView(),
                  child: Text(
                    'input field'
                  ),
                ),
              )
            ],
          ),


        ),
          ],
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
