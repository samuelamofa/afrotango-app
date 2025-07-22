import '/auth/my_wall_profile/my_wall_profile_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profiles_widget.dart' show ProfilesWidget;
import 'package:flutter/material.dart';

class ProfilesModel extends FlutterFlowModel<ProfilesWidget> {
  ///  Local state fields for this page.

  bool bio = false;

  ///  State fields for stateful widgets in this page.

  // Model for myWallProfile component.
  late MyWallProfileModel myWallProfileModel;

  @override
  void initState(BuildContext context) {
    myWallProfileModel = createModel(context, () => MyWallProfileModel());
  }

  @override
  void dispose() {
    myWallProfileModel.dispose();
  }
}
