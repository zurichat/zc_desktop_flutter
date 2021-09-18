// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child dumb_widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zc_desktop_flutter/ui/main/dm/dm_view.dart';

void main() {
  testWidgets('Dm tile displays user and message', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    String date = '23 June 9.10 pm';
      await tester.pumpWidget(testableWidget(
          child: DateWidget(
        date: date,
      )));

    expect(find.text(date), findsOneWidget);
  });
}

class _Wrapper extends StatelessWidget {
  final Widget child;
  _Wrapper(this.child);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(maxWidth: 1400), designSize: Size(1440, 940));
    return child;
  }
}

Widget testableWidget({required Widget child}) {
  return MediaQuery(
    data: MediaQueryData(),
    child: MaterialApp(
      home: Scaffold(body: _Wrapper(child)),
    ),
  );
}
