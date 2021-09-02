import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
<<<<<<< HEAD
import 'package:zcdesk_ui/zcdesk_ui.dart';

=======
import 'package:zc_desktop_flutter/ui/appbar/app_bar.dart';
import 'package:zc_desktop_flutter/ui/views/widgets/center_list_tile/center_tile.dart';
>>>>>>> 41d6f533a007467fe1a6dd591d3ab55cb4fe22a7
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
<<<<<<< HEAD
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Image(
                  image: AssetImage(model.logoUrl),
                ),
              ),
              Expanded(
                flex: 1,
                child: ZcdeskText.headingOne(model.title),
              ),
              Expanded(
                flex: 1,
                child: Text(model.testString),
              )
            ],
=======
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(child: buildAppBar(context, true)),
            Expanded(
                child: Container(
                    alignment: Alignment.topCenter,
                    child: centertitlecard(context))),
                     ],
>>>>>>> 41d6f533a007467fe1a6dd591d3ab55cb4fe22a7
          ),
        ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
