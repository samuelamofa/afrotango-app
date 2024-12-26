import '/create_components/logo_header/logo_header_widget.dart';
import '/create_components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'allmessage_widget.dart' show AllmessageWidget;
import 'package:flutter/material.dart';

class AllmessageModel extends FlutterFlowModel<AllmessageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for LogoHeader component.
  late LogoHeaderModel logoHeaderModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    logoHeaderModel = createModel(context, () => LogoHeaderModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    logoHeaderModel.dispose();
    navBarModel.dispose();
  }
}
