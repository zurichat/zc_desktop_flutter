import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/base_connectivity_check/base_connectivity_check_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/views/main/error/error_view.dart';

class BaseConnectivityCheck extends StatelessWidget {
  final Widget child;

  BaseConnectivityCheck({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseConnectivityCheckViewModel>.reactive(
      onModelReady: (model) {
        model.setup();
      },
      builder: (context, model, child) {
        if (model.isConnected.value == false) {
          return ErrorView();
        }
        return this.child;
      },
      viewModelBuilder: () => BaseConnectivityCheckViewModel(),
    );
  }
}
