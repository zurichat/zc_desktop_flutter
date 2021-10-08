// import 'package:flutter/cupertino.dart';
// import 'package:html/parser.dart';
// import 'package:http/http.dart';

import 'package:stacked/stacked.dart';

class LinksPreviewViewModel extends BaseViewModel {
  String? _title;
  get title => _title;

  String? _url;
  get url => _url;

  set setTUrl(value) {
    _url = value;

    notifyListeners();
  }

  final String _url1 = 'https://github.com';
  get url1 => _url1;

  String? _errorImage = 'https://i.ytimg.com/vi/z8wrRRR7_qU/maxresdefault.jpg';
  get errorImage => _errorImage;

  // Future fetch(String url) async {
  //   final client = Client();
  //   final response = await client.get(_validateUrl(url));
  //   final document = parse(response.body);
  //   var elements = document.getElementsByTagName('meta');
  //   elements.forEach((tmp) {
  //     if (tmp.attributes['property'] == 'og:title') {
  //       _title = tmp.attributes['content'];
  //     }
  //   });

  //   print(title);
  //   // notifyListeners();
  // }

  String _validateUrl(String url) {
    if (url.startsWith('http://') == true ||
        url.startsWith('https://') == true) {
      return url;
    } else {
      return 'http://$url';
    }
  }

  get validateUrl => _validateUrl(url);
}
