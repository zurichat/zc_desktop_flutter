import 'package:flutter_test/flutter_test.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/ui/views/main/dm/dm_viewmodel.dart';
import '../helpers/test_helpers.dart';

void main() {
  var dmViewModel;
  setUp(() {
    registerServices();
    dmViewModel = DmViewModel();
    dmViewModel.runTask();
  });
  tearDown(() => unregisterServices());
  
  group('DmViewmodelTest -', () {
    
    test('Sending Message', () async {
      await dmViewModel
          .sendMessage('Hey. Good morning. Am here to check up on you.');
      expect(
          dmViewModel.messages.last.message
              .contains('Hey. Good morning. Am here to check up on you.'),
          true);
    });

    test('Test Time and Date Formatting', () {
      //we need more tests to check all possible expected return values for date.. ie today,yesterday
      expect(dmViewModel.formatDate('2021-10-26T16:30:19.122000Z'),
          'Tue October 26');
      expect(dmViewModel.formatTime('2021-10-26T16:30:19.122000Z'), '16:30 PM');
      //we need more tests to cover all scenarios for this function ie when there is a message
      expect(dmViewModel.isSameDate(1), true);
    });

    test('Test adding pinned message', () {
      final dmViewModel = DmViewModel();
      dmViewModel.pinnedMessages.add(PinnedMessageContent());
      expect(dmViewModel.pinnedMessages.length, 1);
    });
  });

  group('UI related functions', () {
    test('Message Hovering function test ', () {
      dmViewModel.onMessageHovered(true, 1);
      expect(dmViewModel.onMessageTileHover, true);
      expect(dmViewModel.onMessageHoveredIndex, 1);
    });

    test('onHoverActionsHovered funtion test', () {
      dmViewModel.onHoverActionsHovered(true, 'reation', 20.0);
      expect(dmViewModel.onHoverActionsHover, true);
      expect(dmViewModel.hoverAction, 'reation');
      expect(dmViewModel.hoverWidth, 20.0);
    });

    test('toggleShowingNewMessageIn', () {
      dmViewModel.toggleShowingNewMessageIn(true);
      expect(dmViewModel.showingNewMessageIn, true);
    });

    /* test('scrollToBottom function test', () {
      dmViewModel.scrollToBottom();
      expect(dmViewModel.rightSideBarController.offset,
          dmViewModel.rightSideBarController.position.maxScrollExtent);
    }); */
  });
}
