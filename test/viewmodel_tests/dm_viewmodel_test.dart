import 'package:flutter_test/flutter_test.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/ui/views/main/dm/dm_viewmodel.dart';

import '../helpers/test_helpers.dart';
import '../widget_test.dart';

void main() {
  setUp(() => registerServices());
    tearDown(() => unregisterServices());
  group('DmViewmodelTest -', () {
    

    group('DM Logic tests -', () {
      test('Sending Message', () {
        final dmViewModel = DmViewModel();
        dmViewModel.runTask();
        dmViewModel
            .sendMessage('Hey. Good morning. Am here to check up on you.');
        //expect(dmViewModel.messages.length, 1);
      });

      test('Test Time and Date Formatting', () {
        final dmViewModel = DmViewModel();
        //we need more tests to check all possible expected return values for date.. ie today,yesterday
        expect(dmViewModel.formatDate('2021-10-26T16:30:19.122000Z'),
            'Tue October 26');
        expect(
            dmViewModel.formatTime('2021-10-26T16:30:19.122000Z'), '16:30 PM');
        //we need more tests to cover all scenarios for this function ie when there is a message
        expect(dmViewModel.isSameDate(1), true);
      });

      test('teee', () {
        final dmViewModel = DmViewModel();
        dmViewModel.pinnedMessages.add(PinnedMessageContent());
        expect(dmViewModel.pinnedMessages.length, 1);
      });
    });
  });
}
