import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/base_connectivity_check/base_connectvity_check.dart';
import 'package:zc_desktop_flutter/ui/views/main/organization/organization_center/organization_center.dart';
import 'package:zc_desktop_flutter/ui/views/main/organization/organization_left_side_bar/organization_left_side_bar.dart';
import 'package:zc_desktop_flutter/ui/views/main/organization/organization_list_nav_bar/organization_list_nav_bar.dart';
import 'package:zc_desktop_flutter/ui/views/main/organization/organization_viewmodel.dart';

class OrganizationView extends StatelessWidget {
  const OrganizationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrganizationViewModel>.reactive(
      onModelReady: (model) {
        model.setup();
      },
      builder: (context, model, child) => BaseConnectivityCheck(
        child: Scaffold(
          body: Container(
            child: Column(
              children: [
                model.isBusy
                    ? Expanded(
                        child: Center(
                          child: Container(
                            width: 24.0,
                            height: 24.0,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0.r,
                              valueColor: AlwaysStoppedAnimation(Colors.grey),
                            ),
                          ),
                        ),
                      )
                    : Expanded(
                        child: Row(
                          children: [
                            //TODO: organization side bar
                            OrganizationListNavBar(),
                            //TODO: Left side bar
                            OrganizationLeftSideBar(),
                            //TODO: Center Area
                            OrganizationCenter(),
                            //TODO: Reusable view for channel and dms
                            // ChannelDmView(channel: true, dm: false),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => OrganizationViewModel(),
    );
  }
}
