import 'package:flutter/material.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';
import 'package:zcdesk_ui/src/shared/styles.dart';

class BuildStartUpImage extends StatelessWidget {
  const BuildStartUpImage({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
              flex: 3,
              child: Container(
                color: kcPrimaryColor,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/circularImage.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Unlimited Team Collaboration Platform',
                      textAlign: TextAlign.center,
                      style: headline6.copyWith(color: Colors.white),
                    ),
                    verticalSpaceSmall,
                    Text(
                      'Unlimited team collaboration platform with emphasis on team building,\n fun, team manageent and above all, project management.',
                      textAlign: TextAlign.center,
                      style: subtitle2.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    verticalSpaceLarge,
                  ],
                ),
              ),
            );
  }
}