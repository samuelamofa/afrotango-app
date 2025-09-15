import '/auth/my_wall/my_wall_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profiles_comunity_widget.dart' show ProfilesComunityWidget;
import 'package:flutter/material.dart';

class ProfilesComunityModel extends FlutterFlowModel<ProfilesComunityWidget> {
  ///  Local state fields for this page.

  bool bio = false;

  bool posts = false;

  bool media = false;

  bool? isFollow = false;

  int? num = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  ChatRecord? chat;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatRecord? chatcreated;
  // Model for myWall component.
  late MyWallModel myWallModel;

  @override
  void initState(BuildContext context) {
    myWallModel = createModel(context, () => MyWallModel());
  }

  @override
  void dispose() {
    myWallModel.dispose();
  }
}
