import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/models/dummy_user_model/user_model.dart';
import 'package:zc_desktop_flutter/models/workspace_model/workspace.dart';

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
          topic: "For all important information",
          users: <User>[
            User(
              name: "John Doe",
            ),
          ],
        ),
        Channel(
          name: "Team-Desktop-Client",
          private: false,
          topic: "For all important information",
          users: <User>[
            User(
              name: "John Doe",
            ),
          ],
        ),
        Channel(
          name: "Games",
          private: false,
          topic: "For all important information",
          users: <User>[
            User(
              name: "John Doe",
            ),
          ],
        ),
      ],
      dms: <DM>[
        DM(
          user: User(
            name: "John Doe",
          ),
        )
          ..chats = [
            Chat(
              user: User(
                name: "John Doe",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],
        DM(
          user: User(
            name: "John Snow",
          ),
        )
          ..chats = [
            Chat(
              user: User(
                name: "John Snow",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],
        DM(
          user: User(
            name: "John Wick",
          ),
        )
          ..chats = [
            Chat(
              user: User(
                name: "John Wick",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],
      ],
    )
      ..user = User(
        name: "Ademola Fadumo",
      ),
    Workspace(
      id: 1,
      name: "Filledstacks",
      logo: "assets/images/facebook.svg",
      channels: <Channel>[
        Channel(
          name: "Announcements",
          private: false,
          topic: "For all important information",
          users: <User>[
            User(
              name: "John Doe",
            ),
            User(
              name: "Ademola Fadumo",
            )
          ],
        ),
        Channel(
          name: "Arsenal Fan Club",
          private: false,
          topic: "For all important information",
          users: <User>[
            User(
              name: "John Doe",
            ),
          ],
        ),
      ],
      dms: <DM>[
        DM(
          user: User(
            name: "Marlon Humpreys",
          ),
        )
          ..chats = [
            Chat(
              user: User(
                name: "Marlon Humpreys",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],
        DM(
          user: User(
            name: "Tom Brady",
          ),
        )
          ..chats = [
            Chat(
              user: User(
                name: "Tom Brady",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],
        DM(
          user: User(
            name: "Travis Kelce",
          ),
        )
          ..chats = [
            Chat(
              user: User(
                name: "Travis Kelce",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],
      ],
    )
      ..user = User(
        name: "Ademola Fadumo",
      ),
    Workspace(
      id: 2,
      name: "GADS 2020",
      logo: 'assets/images/twitter.svg',
      channels: <Channel>[
        Channel(
          name: "Announcements",
          private: false,
          topic: "For all important information",
          users: <User>[
            User(
              name: "John Doe",
            ),
          ],
        ),
        Channel(
          name: "Nigeria Premier Football",
          private: false,
          topic: "For all important information",
          users: <User>[
            User(
              name: "John Doe",
            ),
          ],
        ),
      ],
      dms: <DM>[
        DM(
          user: User(
            name: "Patrick Mahomes",
          ),
        )
          ..chats = [
            Chat(
              user: User(
                name: "Patrick Mahomes",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],
        DM(
          user: User(
            name: "Tyreek Hill",
          ),
        )
          ..chats = [
            Chat(
              user: User(
                name: "Tyreek Hill",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],
        DM(
          user: User(
            name: "Kawhi Leonard",
          ),
        )
          ..chats = [
            Chat(
              user: User(
                name: "Kawhi Leonard",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],
      ],
    )..user = User(
        name: "Ademola Fadumo",
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
