import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/link_preview/link_preview_viewmodel.dart';
import 'package:any_link_preview/any_link_preview.dart';

class LinksPreview extends StatelessWidget {
  const LinksPreview({
    Key? key,
    this.url,
    this.title,
    this.data,
  }) : super(key: key);

  final String? url;
  final String? title;
  final String? data;

  @override
  Widget build(BuildContext context) {
    // if (model.url == null) {
    //   return SizedBox();
    // } else
    return ViewModelBuilder<LinksPreviewViewModel>.reactive(
      builder: (context, model, child) {
        return Column(
          children: <Widget>[
            TextField(onChanged: (value) {
              model.setTUrl = value;
            }),
            ElevatedButton(
                onPressed: () {
                  model.validateUrl;
                },
                child: Text('Press')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
              child: Container(
                height: 300,
                width: 500,
                child: AnyLinkPreview(
                  link: model.url1,
                  // displayDirection: UIDirection.UIDirectionVertical,
                  bodyTextOverflow: TextOverflow.ellipsis,
                  cache: Duration(seconds: 1),
                  backgroundColor: Colors.white,
                  errorWidget: Container(
                    color: Colors.grey[300],
                    child: Text('Oops!'),
                  ),
                  errorImage: model.errorImage,
                  titleStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  bodyStyle: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ),
          ],
        );
      },
      viewModelBuilder: () => LinksPreviewViewModel(),
    );
  }
}

          
      

  // ViewModelBuilder<LinksPreviewViewModel>.reactive(
  //   builder: (context, model, child) => Column(
  //     children: <Widget>[
  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: TextField(
  //           controller: model.textController,
  //           onChanged: (value) {
  //             model.setLinkPreview = value;
  //           },
  //         ),
  //       ),
  //       ElevatedButton(
  //           onPressed: () {
  //             model.fetch(url);
  //           },
  //           child: Text('Fetch')),
  //       _buildPreviewWidget(),
  //     ],
  //   ),
  //   viewModelBuilder: () => LinksPreviewViewModel(),
  // ),

// Widget _buildPreviewWidget() {
//     if (data == null) {
//       // return Container(
//       //   child: Text('Text'),
//       //   color: Colors.red,
//       // );
//     }


//      return Container(
//     color: Colors.green[100],
//     child: Row(
//       children: <Widget>[
//         Image.network(
//           'https://github.com/account',
//           height: 100,
//           width: 100,
//         ),
//         Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text('title'),
//               Text('Description'),
//               Text('Link'),
//             ])
//       ],
//     ),
//   );
// }
