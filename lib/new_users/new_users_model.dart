import '/community/cardcomponent/cardnew_copy/cardnew_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_users_widget.dart' show NewUsersWidget;
import 'package:flutter/material.dart';

class NewUsersModel extends FlutterFlowModel<NewUsersWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for cardnewCopy dynamic component.
  late FlutterFlowDynamicModels<CardnewCopyModel> cardnewCopyModels1;
  // Models for cardnewCopy dynamic component.
  late FlutterFlowDynamicModels<CardnewCopyModel> cardnewCopyModels2;

  @override
  void initState(BuildContext context) {
    cardnewCopyModels1 = FlutterFlowDynamicModels(() => CardnewCopyModel());
    cardnewCopyModels2 = FlutterFlowDynamicModels(() => CardnewCopyModel());
  }

  @override
  void dispose() {
    cardnewCopyModels1.dispose();
    cardnewCopyModels2.dispose();
  }
}
