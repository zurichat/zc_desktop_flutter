import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/views/main/center_area/center_area.dart';
import 'package:zc_desktop_flutter/ui/views/main/left_side_bar/left_sidebar_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/organization_bar/organization_bar.dart';
import 'package:zc_desktop_flutter/ui/views/main/right_side_bar/right_sidebar_view.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      builder: (context, model, child) => Scaffold(
          body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                OrganizationBarView(),
                LeftSideBarView(),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: CenterArea(),
                      ),
                      if (_size.width > 1040)
                        Expanded(
                          flex: 3,
                          child: RightSideBarView(),
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      )
          //   ],
          // ),
          ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
