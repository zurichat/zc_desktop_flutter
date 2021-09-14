import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';
import 'advanced_viewmodel.dart';

class AdvancedView extends StatelessWidget {
  const AdvancedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _rightSideBarController = ScrollController();
    return  ViewModelBuilder<AdvancedViewModel>.reactive(
        viewModelBuilder: ()=>AdvancedViewModel(),
        builder: (context,model,_){
          return Scrollbar(
            controller: _rightSideBarController,
            isAlwaysShown: true,
            scrollbarOrientation: ScrollbarOrientation.right,
            thickness: 8,
            showTrackOnHover: true,
            child: SingleChildScrollView(
              controller: _rightSideBarController,
              child: Container(
                width: fullWidth(context),
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    inputOptionSection(model),

                    verticalSpaceMedium,
                    Divider(color: Colors.black54,),

                    verticalSpaceMedium,
                    searchOptionSection(model),
                    verticalSpaceMedium,

                    Divider(color: Colors.black54,),
                    verticalSpaceRegular,
                    otherOptionSection(model)

                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget inputOptionSection(AdvancedViewModel model){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Input options
          ZcdeskText.boldCaption('Input options'),
          ListTile(
              leading: ZcCheckBox(
                  value: model.onEnter,
                  fillColor: MaterialStateProperty.resolveWith(model.getColor),
                  onChanged: (v){
                    model.setOnEnter = v;
                  }
              ),
              title: Wrap(
                runSpacing: 10.0,
                spacing: 10.0,
                runAlignment: WrapAlignment.spaceEvenly,
                children: [
                  ZcdeskText.lightCaption('When typing code with ````, '),
                  ShortCuts().enter(),
                  ZcdeskText.lightCaption(' should send the message'),
                ],
              ),
              subtitle: Wrap(
                runSpacing: 10.0,
                spacing: 10.0,
                runAlignment: WrapAlignment.spaceEvenly,
                children: [
                ZcdeskText.lightCaption('With this ticked, use '),
                ShortCuts().shift(),
                ShortCuts().enter(),
                ZcdeskText.lightCaption(' to send'),
              ],
            ),
            ),
          ListTile(
              leading: ZcCheckBox(
                  value: model.allowMsgFormat,
                  fillColor: MaterialStateProperty.resolveWith(model.getColor),
                  onChanged: (v){
                    model.setAllowMsgFormat = v;
                  }
              ),
              title: ZcdeskText.lightCaption('Format messages with markup'),
              subtitle:  ZcdeskText.lightCaption('The text formatting toolbar won’t show in the composer'),
            ),

          verticalSpaceMedium,

          // When writing a message, press enter to :
          Wrap(
            runSpacing: 10.0,
            spacing: 10.0,
            runAlignment: WrapAlignment.spaceEvenly,
            children: [
              ZcdeskText.boldCaption('When writing a message, press'),
              ShortCuts().enter(),
              ZcdeskText.boldCaption('to:'),
              SizedBox(
                height: 25.0,
                child: ListTile(
                  title: ZcdeskText.lightCaption('Send the message'),
                  leading: Radio(
                    value: EnterButtonsChoice.sendMsg,
                    groupValue:model.enterButtonsChoice,
                    onChanged: (EnterButtonsChoice? val){
                      model.setCheckVal = val;
                    },
                    activeColor: kcPrimaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
                child: ListTile(
                  title: Wrap(
                    runSpacing: 10.0,
                    spacing: 10.0,
                    runAlignment: WrapAlignment.spaceEvenly,
                    children: [
                      ZcdeskText.lightCaption('Start a new line ( use'),
                      ShortCuts().ctrl(),
                      ShortCuts().enter(),
                      ZcdeskText.lightCaption('to send )'),
                    ],
                  ),
                  leading: Radio(
                    value: EnterButtonsChoice.newLine,
                    groupValue:model.enterButtonsChoice,
                    onChanged: (EnterButtonsChoice? val){
                      model.setCheckVal = val;
                    },
                    activeColor: kcPrimaryColor,
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }

  Widget searchOptionSection(AdvancedViewModel model){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Input options
          ZcdeskText.boldCaption('Search options'),
          ListTile(
            leading: ZcCheckBox(
                value: model.ctrlF,
                fillColor: MaterialStateProperty.resolveWith(model.getColor),
                onChanged: (v){
                  model.setCtrlF = v;
                }
            ),
            title:  Wrap(
              runSpacing: 10.0,
              spacing: 10.0,
              runAlignment: WrapAlignment.spaceEvenly,
              children: [
                ShortCuts().ctrl(),
                ShortCuts().fKey(),
                ZcdeskText.lightCaption('Starts a Zurichat search'),
              ],
            ),
            subtitle: ZcdeskText.lightCaption('Overrides normal behavaiour in search behaviour'),

          ),
          ListTile(
            leading: ZcCheckBox(
                value: model.ctrlK,
                fillColor: MaterialStateProperty.resolveWith(model.getColor),
                onChanged: (v){
                  model.setCtrlK = v;
                }
            ),
            title:  Wrap(
              runSpacing: 10.0,
              spacing: 10.0,
              runAlignment: WrapAlignment.spaceEvenly,
              children: [
                ShortCuts().ctrl(),
                ShortCuts().kKey(),
                ZcdeskText.lightCaption('Starts the quick switcher'),
              ],
            ),
            subtitle: ZcdeskText.lightCaption('Overrides normal behavaiour in some browsers'),

          ),

          ZcdeskText.boldCaption('Exclude these channels from search results:'),
          AuthInputField(
            hintPlaceHolder: 'Type a channel name...',
          )

        ],
      ),
    );
  }

  Widget otherOptionSection(AdvancedViewModel model){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ZcdeskText.boldCaption('Other Options'),
          verticalSpaceRegular,
          ListTile(
            leading: ZcCheckBox(
                value: model.option1,
                fillColor: MaterialStateProperty.resolveWith(model.getColor),
                onChanged: (v){
                  model.setOption1 = v;
                }
            ),
            title:  Wrap(
              runSpacing: 10.0,
              spacing: 10.0,
              runAlignment: WrapAlignment.spaceEvenly,
              children: [
                ShortCuts().pageUp(),
                ZcdeskText.lightCaption(','),
                ShortCuts().pageDown(),
                ZcdeskText.lightCaption(','),
                ShortCuts().home(),
                ZcdeskText.lightCaption('and'),
                ShortCuts().end(),
                ZcdeskText.lightCaption('Starts a Zurichat search'),
              ],
            ),

          ),

          // Ask if I want to toggle my away status when I log in after having set myself away
          ListTile(
            leading: ZcCheckBox(
                value: model.option2,
                fillColor: MaterialStateProperty.resolveWith(model.getColor),
                onChanged: (v){
                  model.setOption2 = v;
                }
            ),
            title: ZcdeskText.lightCaption('Ask if I want to toggle my away status when I log in after having set myself away ')

          ),

          // zuri bot setting
          ListTile(
              leading: ZcCheckBox(
                  value: model.option3,
                  fillColor: MaterialStateProperty.resolveWith(model.getColor),
                  onChanged: (v){
                    model.setOption3 = v;
                  }
              ),
              title: ZcdeskText.lightCaption('Send me occassional survey via Zurichat bot'),
              subtitle: ZcdeskText.lightCaption('We’re working to make Zurichat better. We’d always love to hear your thoughts'),
          ),

          ListTile(
              leading: ZcCheckBox(
                  value: model.option4,
                  fillColor: MaterialStateProperty.resolveWith(model.getColor),
                  onChanged: (v){
                    model.setOption4 = v;
                  }
              ),
              title: ZcdeskText.lightCaption('Warn me about potential malicious linksr')

          ),

        ],
      ),
    );
  }

}
