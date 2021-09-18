import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/main/dm/dm_view.dart';
import 'package:zc_desktop_flutter/ui/main/draft/draft_view.dart';
import 'package:zc_desktop_flutter/ui/main/home_page/home_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/main/message_page/message_view.dart';
import 'package:zc_desktop_flutter/ui/shared/const_list_what_to_display.dart';

class CenterArea extends ViewModelWidget<HomeViewModel> {
  const CenterArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Container(
      height: double.infinity,
      child: Center(
        child: data.values.toList()[model.indexToDisplay]
        
        //model.isDm ? DmView() : model.isDraft ? DraftView() : MessageView()
        
        // ElevatedButton(
        //   onPressed: () {
        //     model.showRightSide(model.sideBarItemName.toString());
        //   },
        //   child: 
        //   model.isChannel ?
        //   Text('${model.sideBarItemName} and ${model.updatePress}') : Text('DM Pressed and ${model.updatePress}'),
          
        ),
     
    );
  }
}
