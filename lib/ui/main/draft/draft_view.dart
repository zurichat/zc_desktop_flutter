import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'draft_viewmodel.dart';

class DraftView extends StatelessWidget {
  const DraftView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double iconSize = 12;
    const iconPadding = EdgeInsets.all(5);
    const iconConstraint = BoxConstraints();
    return ViewModelBuilder<DraftViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.title),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: model.drafts.length,
                  itemBuilder: (BuildContext context, int index) {
                    var draft = model.drafts[index];

                    return Card(
                      elevation: 2.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  draft.subject,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                flex: 3,
                              ),
                              Expanded(
                                child: Text(
                                  draft.getFormattedDate(),
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.normal),
                                ),
                                flex: 1,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  draft.content,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                width: 120,

                                // size: Size(120, 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconButton(
                                        iconSize: iconSize,
                                        icon: const Icon(Icons.delete_outline),
                                        tooltip: 'Delete Draft',
                                        padding: iconPadding,
                                        alignment: Alignment.center,
                                        constraints: iconConstraint,
                                        onPressed: () {}),
                                    IconButton(
                                      iconSize: iconSize,
                                      icon: const Icon(Icons.edit_outlined),
                                      tooltip: 'Edit Draft',
                                      padding: iconPadding,
                                      alignment: Alignment.center,
                                      constraints: iconConstraint,
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      constraints: iconConstraint,
                                      iconSize: iconSize,
                                      icon: const Icon(Icons.send_outlined),
                                      tooltip: 'Send Message',
                                      padding: iconPadding,
                                      alignment: Alignment.center,
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ]),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      viewModelBuilder: () => DraftViewModel(),
    );
  }
}
