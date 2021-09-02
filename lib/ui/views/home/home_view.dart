import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50.0,
                width: 150.0,
                child: Card(
                  child: ListTile(
                    leading: Image.asset(
                      model.logo2,
                    ),
                  ),
                ),
              ),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.white,
              //   ),
              //   onPressed: () {},
              //   child: Text("Sign Out"),
              // ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
