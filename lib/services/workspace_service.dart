import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/models/workspace.dart';

class WorkspaceService {
  final _log = getLogger("WorkspaceService");
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
              avatar: "",
              description: "",
              id: 0,
              online: false,
              status: "",
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
              avatar: "",
              description: "",
              id: 0,
              online: false,
              status: "",
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
              avatar: "",
              description: "",
              id: 0,
              online: false,
              status: "",
            ),
          ],
        ),
      ],
      dms: <DM>[
        DM(
          user: User(
            name: "John Doe",
            avatar: "",
            description: "",
            id: 0,
            online: false,
            status: "",
          ),
        )
          ..chats = [
            Chat(
              user: User(
                name: "John Doe",
                avatar: "",
                description: "",
                id: 0,
                online: false,
                status: "",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],
        DM(
          user: User(
            name: "John Snow",
            avatar: "",
            description: "",
            id: 1,
            online: false,
            status: "",
          ),
        )
          ..chats = [
            Chat(
              user: User(
                name: "John Snow",
                avatar: "",
                description: "",
                id: 1,
                online: false,
                status: "",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],
        DM(
          user: User(
            name: "John Wick",
            avatar: "",
            description: "",
            id: 2,
            online: true,
            status: "",
          ),
        )
          ..chats = [
            Chat(
              user: User(
                name: "John Wick",
                avatar: "",
                description: "",
                id: 2,
                online: true,
                status: "",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],
      ],
    )
      ..user = User(
        name: "Ademola Fadumo",
        avatar: "",
        description: "",
        id: 3,
        online: true,
        status: "",
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
              avatar: "",
              description: "",
              id: 0,
              online: false,
              status: "",
            ),
            User(
              name: "Ademola Fadumo",
              avatar: "",
              description: "",
              id: 3,
              online: true,
              status: "",
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
              avatar: "",
              description: "",
              id: 0,
              online: false,
              status: "",
            ),
          ],
        ),
      ],
      dms: <DM>[
        DM(
          user: User(
            name: "Marlon Humpreys",
            avatar: "",
            description: "",
            id: 0,
            online: false,
            status: "",
          ),
        )
          ..chats = [
            Chat(
              user: User(
                name: "Marlon Humpreys",
                avatar: "",
                description: "",
                id: 0,
                online: false,
                status: "",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],
        DM(
          user: User(
            name: "Tom Brady",
            avatar: "",
            description: "",
            id: 1,
            online: false,
            status: "",
          ),
        )
          ..chats = [
            Chat(
              user: User(
                name: "Tom Brady",
                avatar: "",
                description: "",
                id: 1,
                online: false,
                status: "",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],
        DM(
          user: User(
            name: "Travis Kelce",
            avatar: "",
            description: "",
            id: 2,
            online: true,
            status: "",
          ),
        )
          ..chats = [
            Chat(
              user: User(
                name: "Travis Kelce",
                avatar: "",
                description: "",
                id: 2,
                online: true,
                status: "",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],
      ],
    )
      ..user = User(
        name: "Ademola Fadumo",
        avatar: "",
        description: "",
        id: 3,
        online: true,
        status: "",
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
              avatar: "",
              description: "",
              id: 0,
              online: false,
              status: "",
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
              avatar: "",
              description: "",
              id: 0,
              online: false,
              status: "",
            ),
          ],
        ),
      ],
      dms: <DM>[
        DM(
          user: User(
            name: "Patrick Mahomes",
            avatar: "",
            description: "",
            id: 0,
            online: false,
            status: "",
          ),
        )
          ..chats = [
            Chat(
              user: User(
                name: "Patrick Mahomes",
                avatar: "",
                description: "",
                id: 0,
                online: false,
                status: "",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],
        DM(
          user: User(
            name: "Tyreek Hill",
            avatar: "",
            description: "",
            id: 1,
            online: false,
            status: "",
          ),
        )
          ..chats = [
            Chat(
              user: User(
                name: "Tyreek Hill",
                avatar: "",
                description: "",
                id: 1,
                online: false,
                status: "",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],
        DM(
          user: User(
            name: "Kawhi Leonard",
            avatar: "",
            description: "",
            id: 2,
            online: true,
            status: "",
          ),
        )
          ..chats = [
            Chat(
              user: User(
                name: "Kawhi Leonard",
                avatar: "",
                description: "",
                id: 2,
                online: true,
                status: "",
              ),
              text: "",
              timestamp: 1590379587572,
            ),
          ],
      ],
    )
      ..user = User(
        name: "Ademola Fadumo",
        avatar: "",
        description: "",
        id: 3,
        online: true,
        status: "",
      ),
  ];

  Future<List<Workspace>> getWorkspaces() async {
    await Future.delayed(Duration(seconds: 5));

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
