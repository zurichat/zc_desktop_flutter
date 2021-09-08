import 'package:intl/intl.dart';

//The intl package needs to be added to use date formatter
class Draft {
  String subject = "";
  String content = "";
  DateTime date = DateTime.now();
  String getFormattedDate() =>
      '${DateFormat("MMM dd").format(this.date)} at ${DateFormat("h:mm a").format(this.date)}';
  Draft._();
  Draft(this.subject, this.content, this.date);
}
