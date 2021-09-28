import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';

class WorkspaceService {
  final _log = getLogger("WorkspaceService");

  late int _selectedWorkspaceIndex;

  List<Workspace> workspaces = <Workspace>[
    Workspace(
      id: 0,
      name: "HNGi8",
      logo: 'assets/icons/zuri_logo_only.svg',
      channels: <Channel>[
        Channel(
          name: "Announcements",
          private: false,
          description: "For all important information",
          
        ),
        Channel(
          name: "Team-Desktop-Client",
          private: false,
          description: "For all important information",
          
        ),
        Channel(
          name: "Games",
          private: false,
          description: "For all important information",
          
        ),
      ],
      dms: <DM>[
        DM(
          user: DummyUser(
            name: "John Doe",
          ),
          baseChat: BaseChat(chats: [
            Chat(
              user: DummyUser(
                name: "John Doe",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],)
        ),
        DM(
          baseChat: BaseChat(chats: [
            Chat(
              user: DummyUser(
                name: "John Snow",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],),
          user: DummyUser(
            name: "John Snow",
            
          ),
        ),
        DM(
          user: DummyUser(
            name: "John Wick",
          ),
          baseChat: BaseChat(chats: [
            Chat(
              user: DummyUser(
                name: "John Wick",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],)
        ),
        
          
      ],
      user: DummyUser(
        name: "Ademola Fadumo",
      ),
    ),
    Workspace(
      id: 1,
      name: "Filledstacks",
      logo: "assets/images/facebook.svg",
      channels: <Channel>[
        Channel(
          name: "Announcements",
          private: false,
          description: "For all important information",
          
        ),
        Channel(
          name: "Arsenal Fan Club",
          private: false,
          description: "For all important information",
          
        ),
      ],
      dms: <DM>[
        DM(
          baseChat: BaseChat(chats: [
            Chat(
              user: DummyUser(
                name: "Marlon Humpreys",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],),
          user: DummyUser(
            name: "Marlon Humpreys",
          ),
        ),
        DM(
          baseChat: BaseChat(chats: [
            Chat(
              user: DummyUser(
                name: "Tom Brady",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],),
          user: DummyUser(
            name: "Tom Brady",
          ),
        ),
        DM(
          baseChat: BaseChat(chats: [
            Chat(
              user: DummyUser(
                name: "Travis Kelce",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],),
          user: DummyUser(
            name: "Travis Kelce",
          ),
        ),
      ],
      user: DummyUser(
        name: "Ademola Fadumo",
      )
    ),
    Workspace(
      id: 2,
      name: "GADS 2020",
      logo: 'assets/images/twitter.svg',
      channels: <Channel>[
        Channel(
          name: "Announcements",
          private: false,
          description: "For all important information",
          
        ),
        Channel(
          name: "Nigeria Premier Football",
          private: false,
          description: "For all important information",
         
        ),
      ],
      dms: <DM>[
        DM(
          baseChat: BaseChat(
            chats: [
            Chat(
              user: DummyUser(
                name: "Patrick Mahomes",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],
          ),
          user: DummyUser(
            name: "Patrick Mahomes",
          ),
        ),
        DM(
          baseChat: BaseChat(
            chats: [
            Chat(
              user: DummyUser(
                name: "Tyreek Hill",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],
          ),
          user: DummyUser(
            name: "Tyreek Hill",
          ),
        ),
        DM(
          baseChat: BaseChat(
            chats: [
            Chat(
              user: DummyUser(
                name: "Kawhi Leonard",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],
          ),
          user: DummyUser(
            name: "Kawhi Leonard",
          ),
        )
          
      ],
      user:  DummyUser(
        name: "Ademola Fadumo",
      ),
    ),
  ];

  int getSelectedWorkspaceIndex() => _selectedWorkspaceIndex;

  void selectedWorkspaceIndex(int value) => _selectedWorkspaceIndex = value;

  Future<List<Workspace>> getWorkspaces() async {
    await Future.delayed(Duration(seconds: 2));

    _log.i("Workspaces retrieved successfully");

    //_log.i("$id from workspace service");
    //_log.i("length of workspace array ${workspaces.length} and id of workspace to be retrieved ${id + 1}");

    return workspaces;
  }

/*
  void setWorkspaceId(int index) {
    currentWorkspaceIndex = index;
  }

  int getWorkspaceId() {
    return currentWorkspaceIndex;
  }


*/


}
