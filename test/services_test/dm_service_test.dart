import 'package:flutter_test/flutter_test.dart';



import '../helpers/test_helpers.dart';

void main() {
  setUp(() => registerServices());
  tearDown(() => unregisterServices());/* 
     group('runLogic -', () {
    test('set New Room Info test', () {
      final service = getAndRegisterDMService();
      final serv=DMService();
      
      serv.setNewRoomInfo(Users(firstName: 'Zuri User'));
      expect(
          serv.getExistingRoomInfo!.otherUserProfile.firstName, 'Zuri User');
    });
    test('get user', () {
      final service = getAndRegisterDMService();
      service.getUser();
    });
    test('get current logged in user', () {
      final service = getAndRegisterDMService();
      expect(
          service.getCurrentLoggedInUser(),
          User(
              id: '1',
              firstName: 'Dedan',
              lastName: 'Ndungu',
              displayName: 'dedankibere',
              email: 'dnkibere@gmail.com',
              phone: '254700314700',
              status: 0,
              timeZone: 'timeZone',
              createdAt: 'createdAt',
              updatedAt: 'updatedAt',
              token: 'token'));
    });
    test('get Existing Room Info', () {
      final service = getAndRegisterDMService();
          
      expect(
          service.getExistingRoomInfo,
          DM(
              roomInfo: DMRoomsResponse(),
              currentUserProfile: UserProfile(),
              otherUserProfile: UserProfile()));
    });

    test('send message function', () {
      final service = getAndRegisterDMService();
      service.sendMessage('12345', '98765', 'Hello, are u still working');
    });
  }); 
 */
}
