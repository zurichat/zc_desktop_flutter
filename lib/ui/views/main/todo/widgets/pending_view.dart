import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stacked/stacked.dart';

import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';

import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/views/main/people_user_group/people_user_view_model.dart';
import 'package:zc_desktop_flutter/ui/views/main/todo/widgets/TodoListContainer.dart';

class PendingView extends StatelessWidget {
  PendingView({Key? key}) : super(key: key);
  final _controller = ScrollController();
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ViewModelBuilder<PeopleUserGroupViewModel>.reactive(
      viewModelBuilder: () => PeopleUserGroupViewModel(),
      builder: (
        BuildContext context,
        PeopleUserGroupViewModel model,
        Widget? child,
      ) {
        return model.isLoading
            ? SizedBox(
                height: 300.h,
                child: Center(
                  child: CircularProgressIndicator(
                    color: kcPrimaryColor,
                  ),
                ),
              )
            : Column(
                children: [
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //     left: 26,
                  //     right: 61,
                  //   ),
                  //   child: ZuriDeskInputField(
                  //     hintPlaceHolder: SearchPeopleTextFieldHintText,
                  //     controller: _searchController,
                  //     onChanged: (_) =>
                  //         model.buildSuggestion(_searchController.text),
                  //     prefix: Icon(Icons.search),
                  //   ),
                  // ),
                  verticalSpaceMediumTwo,
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Expanded(
                  //         child: Text(
                  //       RecommendedSearchText,
                  //       style: preferenceStyleNormal.copyWith(
                  //           color: kcDisplayChannelColor),
                  //     )),
                  //     Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 58),
                  //       child: Row(
                  //         children: [
                  //           SvgPicture.asset('assets/icons/group.svg'),
                  //           Text(
                  //             MostRecommendedSortText,
                  //             style: preferenceStyleNormal.copyWith(
                  //                 color: kcDisplayChannelColor),
                  //           ),
                  //           horizontalSpaceMedium,
                  //           SvgPicture.asset('assets/icons/filter_2.svg'),
                  //           Text(
                  //             FilterText,
                  //             style: preferenceStyleNormal.copyWith(
                  //                 color: kcDisplayChannelColor),
                  //           ),
                  //         ],
                  //       ),
                  //     )
                  //   ],
                  // ),
                  verticalSpaceSmallOne,
                  Scrollbar(
                    controller: _controller,
                    isAlwaysShown: true,
                    child: Container(
                      height: height < 1000 ? height * 0.6 : height * 0.7,
                      padding: EdgeInsets.only(
                        right: 20,
                      ),
                      child: GridView.builder(
                        addAutomaticKeepAlives: true,
                        controller: _controller,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 40,
                            childAspectRatio: 1.8,
                            mainAxisSpacing: 20),
                        itemCount: model.suggestionList.length,
                        itemBuilder: (context, index) => TodoContainer(
                          Members: '', TodoName: 'Create a Prototype',
                          TodoText1:
                              'Create a Prototype Mobile for \nGet Notification on Zuri',
                          // TodoName: model.suggestionList[index].displayName,
                          // TodoText1:
                          //     model.suggestionList[index].displayImage,
                          // bio: model.suggestionList[index].bio,
                          // isActive: model.suggestionList[index].isActive,
                        ),
                      ),
                    ),
                  )
                ],
              );
      },
      onDispose: (model) {
        _searchController.dispose();
        _controller.dispose();
        model.setDataListTONull();
      },
    );
  }
}
