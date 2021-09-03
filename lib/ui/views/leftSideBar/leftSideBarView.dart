import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/views/leftSideBar/leftSideBarViewModel.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeftSideBarView extends StatelessWidget {
  const LeftSideBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    return ViewModelBuilder<LeftSideBarViewModel>.reactive(
        viewModelBuilder: () => LeftSideBarViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            body: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: whiteColor),
                    width: model.leftSideBarWidth,
                    height: model.leftSideBarHeight,
                    child: Padding(
                      padding: EdgeInsets.only(left:model.leftSideBarPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpaceMedium,
                          LeftSideBar(
                            iconText: model.insight,
                            icon: AssetImage(model.insightUrl),
                          ),
                          verticalSpaceMedium,
                          LeftSideBar(
                            iconText: model.threads,
                            icon: AssetImage(model.threadsUrl),
                          ),
                          verticalSpaceMedium,
                          LeftSideBar(
                            iconText: model.allDms,
                            icon: AssetImage(model.allDmsUrl),
                          ),
                          verticalSpaceMedium,
                          LeftSideBar(
                            iconText: model.draft,
                            icon: AssetImage(model.draftUrl),
                          ),
                          verticalSpaceMedium,
                          LeftSideBar(
                            iconText: model.files,
                            icon: AssetImage(model.filesUrl),
                          ),
                          verticalSpaceMedium,
                          LeftSideBar(
                            iconText: model.integrate,
                            icon: AssetImage(model.integrateUrl),
                          ),
                          verticalSpaceMedium,
                          LeftSideBar(
                            iconText: model.toDo,
                            icon: AssetImage(model.toDoUrl),
                          ),
                          verticalSpaceMedium,
                        ],
                      ),
                    ),
                  ),
                ),

            //The Expanded widgets below is to structure the desktop application
            //They are not necessarily useful.. It's the Expanded widget below that can be extracted 
            //and used in the main app    
            Expanded(
              flex: 3,
              child: Container(
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
              ),
            ),
              ],
            ),
          );
        });
  }
}