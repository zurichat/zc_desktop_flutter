import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/build_suggestion_container.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';
import 'package:zc_desktop_flutter/ui/views/main/people_user_group/people_user_view_model.dart';

class PeopleView extends StatelessWidget {
  PeopleView({Key? key}) : super(key: key);
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
                  Padding(
                    padding: EdgeInsets.only(
                      left: 26,
                      right: 61,
                    ),
                    child: ZuriDeskInputField(
                      hintPlaceHolder: SearchPeopleTextFieldHintText,
                      controller: _searchController,
                      onChanged: (_) =>
                          model.buildSuggestion(_searchController.text),
                      prefix: Icon(Icons.search),
                    ),
                  ),
                  verticalSpaceMediumTwo,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        RecommendedSearchText,
                        style: preferenceStyleNormal.copyWith(
                            color: kcDisplayChannelColor),
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 58),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/group.svg'),
                            Text(
                              MostRecommendedSortText,
                              style: preferenceStyleNormal.copyWith(
                                  color: kcDisplayChannelColor),
                            ),
                            horizontalSpaceMedium,
                            SvgPicture.asset('assets/icons/filter_2.svg'),
                            Text(
                              FilterText,
                              style: preferenceStyleNormal.copyWith(
                                  color: kcDisplayChannelColor),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  verticalSpaceSmallOne,
                  Scrollbar(
                    controller: _controller,
                    isAlwaysShown: true,
                    child: Container(
                      height: height < 1000 ? (height * 0.45) : height * 0.55,
                      padding: EdgeInsets.only(
                        right: 61,
                      ),
                      child: model.suggestionList.isNotEmpty
                          ? GridView.builder(
                              addAutomaticKeepAlives: true,
                              controller: _controller,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5,
                                      crossAxisSpacing: 40,
                                      childAspectRatio: 0.8,
                                      mainAxisSpacing: 50),
                              itemCount: model.suggestionList.length,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  model.goToDmView(index);
                                },
                                child: BuildSuggestionContainer(
                                  displayName:
                                      model.suggestionList[index].displayName,
                                  displayPicture:
                                      model.suggestionList[index].profileImage,
                                  bio: model.suggestionList[index].bio,
                                ),
                              ),
                            )
                          : Center(
                              child: RichText(
                                text: TextSpan(
                                    text: 'User ',
                                    style: headline6.copyWith(
                                        color: searchBarColor),
                                    children: [
                                      TextSpan(
                                          text: _searchController.text,
                                          style: headline6.copyWith(
                                              color: kcPrimaryColor),
                                          children: [
                                            TextSpan(
                                              text:
                                                  ' is not a member of this organization.',
                                              style: headline6.copyWith(
                                                  color: searchBarColor),
                                            )
                                          ])
                                    ]),
                              ),
                            ),
                    ),
                  )
                ],
              );
      },
      onModelReady: (model) => model.fetchAndSetOrgMembers(),
      onDispose: (model) {
        _searchController.dispose();
        _controller.dispose();
        model.setDataListTONull();
      },
    );
  }
}
