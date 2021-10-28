import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/views/main/organization/organization_viewmodel.dart';

class OrganizationListNavBar extends ViewModelWidget<OrganizationViewModel> {
  const OrganizationListNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, OrganizationViewModel model) {
    return Container(
      color: whiteColor,
      width: 50.w,
      height: double.infinity,
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: model.organization.length,
              itemBuilder: (context, index) {
                return Container(
                  child: GestureDetector(
                    onTap: () {
                      model.reloadWithSelectedOrganization(index);
                    },
                    child: OrganizationItem(
                      organization: model.organization[index],
                      selected: model.selectedOrg(index),
                    ),
                  ),
                );
              },
            ),
            verticalSpaceSmall,
            Padding(
              padding: EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  model.goToChooseWorkspace();
                },
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 30,
                ),
              ),
            ),
            verticalSpaceMedium,
          ],
        ),
      ),
    );
  }
}

class OrganizationItem extends StatelessWidget {
  final int? index;
  final bool? selected;
  final Organization? organization;
  final void Function()? onTap;
  final bool? hover;
  final void Function(PointerHoverEvent)? onHover;
  final void Function(PointerExitEvent)? onExit;

  OrganizationItem(
      {this.index,
      this.selected,
      this.organization,
      this.onTap,
      this.hover,
      this.onHover,
      this.onExit});

  /*void selected(bool value) => setState(() => _selected = value);*/

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: [
              MouseRegion(
                onHover: onHover,
                onExit: onExit,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: selected!
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.white,
                      width: 3,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.r),
                    child: Container(
                      width: 38.0,
                      height: 38.0,
                      child:
                          SvgPicture.asset('assets/icons/zuri_logo_only.svg'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
