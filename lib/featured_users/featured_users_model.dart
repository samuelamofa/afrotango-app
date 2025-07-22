import '/community/cardcomponent/cardnew_copy/cardnew_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'featured_users_widget.dart' show FeaturedUsersWidget;
import 'package:flutter/material.dart';

class FeaturedUsersModel extends FlutterFlowModel<FeaturedUsersWidget> {
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
