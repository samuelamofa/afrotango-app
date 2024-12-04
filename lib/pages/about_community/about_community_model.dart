import '/components/logo_header_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'about_community_widget.dart' show AboutCommunityWidget;
import 'package:flutter/material.dart';

class AboutCommunityModel extends FlutterFlowModel<AboutCommunityWidget> {
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
