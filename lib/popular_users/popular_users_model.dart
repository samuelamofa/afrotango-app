import '/community/cardcomponent/cardnew_copy/cardnew_copy_widget.dart';
import '/components/emptylist_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'popular_users_widget.dart' show PopularUsersWidget;
import 'package:flutter/material.dart';

class PopularUsersModel extends FlutterFlowModel<PopularUsersWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for cardnewCopy dynamic component.
  late FlutterFlowDynamicModels<CardnewCopyModel> cardnewCopyModels;
  // Models for emptylist dynamic component.
  late FlutterFlowDynamicModels<EmptylistModel> emptylistModels;

  @override
  void initState(BuildContext context) {
    cardnewCopyModels = FlutterFlowDynamicModels(() => CardnewCopyModel());
    emptylistModels = FlutterFlowDynamicModels(() => EmptylistModel());
  }

  @override
  void dispose() {
    cardnewCopyModels.dispose();
    emptylistModels.dispose();
  }
}
