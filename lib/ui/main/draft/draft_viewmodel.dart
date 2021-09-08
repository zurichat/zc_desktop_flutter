import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'draft_model.dart';

class DraftViewModel extends BaseViewModel {
  final log = getLogger("DraftViewwModel");
  final title = 'Drafts';
  List<Draft> drafts = <Draft>[
    Draft("Tobi", "Zay is due for a raise, he has earned it!", DateTime.now()),
    Draft("Tobi", "Koko is to make a push today", DateTime.now()),
    Draft("Ope", "I will work on the landing page design tomorrow", DateTime.now())
  ];
}
