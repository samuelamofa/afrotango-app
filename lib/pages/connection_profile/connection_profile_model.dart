import '/create_components/logo_header/logo_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'connection_profile_widget.dart' show ConnectionProfileWidget;
import 'package:flutter/material.dart';

class ConnectionProfileModel extends FlutterFlowModel<ConnectionProfileWidget> {
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
