import 'package:shared_preferences/shared_preferences.dart';

class RecentSearchService {
  static const RECENT_SEARCH_HISTORY = 'userRecentSearch';
  //Limit depends on how many recent search will be shown on the UI.
  static const _LIMIT = 6;

  Future<SharedPreferences> _preferences = SharedPreferences.getInstance();

//This is to be used in the view model to receive query(search) STRINGS from the..
//Text field and save them.
  Future<void> setRecentSearch(String query) async {
    final SharedPreferences preferences = await _preferences;
    List<String>? recentSearch =
        preferences.getStringList(RECENT_SEARCH_HISTORY);
    if (recentSearch == null) {
      recentSearch = [];
      recentSearch.insert(0, query);
    } else {
      final position = recentSearch.indexOf(query);
      if (position != 0) {
        if (position != -1) recentSearch.removeAt(position);
        recentSearch.insert(0, query);
        if (_LIMIT != -1 && recentSearch.length > _LIMIT)
          recentSearch.removeLast();
      }
    }
    preferences.setStringList(RECENT_SEARCH_HISTORY, recentSearch);
  }

//Returns what has been set :)
  Future<List<String>> getRecentSearch() async {
    final SharedPreferences preferences = await _preferences;
    final recentSearch = preferences.getStringList(RECENT_SEARCH_HISTORY);
    if (recentSearch == null) return [];
    return recentSearch;
  }

//NUKES THE LIST, this can later on be modified to remove targeted History.
  Future<void> destroyRecentSearch() async {
    final SharedPreferences preferences = await _preferences;
    preferences.setStringList(RECENT_SEARCH_HISTORY, []);
  }
}
//[x.o]
