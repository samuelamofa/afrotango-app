import '/create_components/logo_header/logo_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_feed_widget.dart' show HomeFeedWidget;
import 'package:flutter/material.dart';

class HomeFeedModel extends FlutterFlowModel<HomeFeedWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for LogoHeader component.
  late LogoHeaderModel logoHeaderModel;

  @override
  void initState(BuildContext context) {
    logoHeaderModel = createModel(context, () => LogoHeaderModel());
  }

  @override
  void dispose() {
    logoHeaderModel.dispose();
  }
}
