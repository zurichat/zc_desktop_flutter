import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';

import 'startup_viewmodel.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.appName),
        ),
        body: Shell(),
      ),
      viewModelBuilder: () => StartUpViewModel(),
    );
  }
}

class Shell extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subTitle;
  const Shell({Key? key, this.image, this.title, this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return ViewModelBuilder<StartUpViewModel>.nonReactive(
      builder: (context, model, child) => Column(children: <Widget>[
        Expanded(
          flex: 3,
          child: Row(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: _size.width / 1.6,
                decoration: BoxDecoration(
                    color: kcPrimaryColor,
                    image: DecorationImage(
                        image: AssetImage(
                          model.circularImage,
                        ),
                        fit: BoxFit.contain)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: _size.height * 0.79,
                      right: _size.width * 0.12,
                      left: _size.width * 0.10,
                      child: Column(
                        children: [
                          Text(model.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700)),
                          // ZcdeskText.bodyText(
                          //   model.title,
                          // ),

                          verticalSpaceSmall,
                          Text(model.subTitle,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400)),

                          //  ZcdeskText.bodyText(
                          //     model.subTitle,
                          //   ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ]

          // the other part of the shell goes here
          // that is the sigup Form

          ),
      viewModelBuilder: () => StartUpViewModel(),
    );
  }
}
