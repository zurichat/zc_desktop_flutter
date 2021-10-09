import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';

class DraftViewModel extends BaseViewModel {
  final log = getLogger('DraftViewwModel');
  final title = 'Drafts';
  List<Draft> drafts = <Draft>[
    Draft('Tobi', 'Zay is due for a raise, he has earned it!', DateTime.now()),
    Draft('Tobi', 'Koko is to make a push today', DateTime.now()),
    Draft('Ope', 'I will work on the landing page design tomorrow', DateTime.now())
  ];
}

class Draft {
  String subject = '';
  String content = '';
  DateTime date = DateTime.now();
  String getFormattedDate() =>
      '${DateFormat('MMM dd').format(this.date)} at ${DateFormat('h:mm a').format(this.date)}';
  // ignore: unused_element
  Draft._();
  Draft(this.subject, this.content, this.date);
}
