import '/backend/backend.dart';
import '/community/cardcomponent/cardmember/cardmember_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'community_profile_widget.dart' show CommunityProfileWidget;
import 'package:flutter/material.dart';

class CommunityProfileModel extends FlutterFlowModel<CommunityProfileWidget> {
  ///  Local state fields for this page.

  bool show = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  CommunitychatRecord? chat;
  // Stores action output result for [Backend Call - Create Document] action in Text widget.
  CommunityMemberRecord? membe;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Models for cardmember dynamic component.
  late FlutterFlowDynamicModels<CardmemberModel> cardmemberModels;

  @override
  void initState(BuildContext context) {
    cardmemberModels = FlutterFlowDynamicModels(() => CardmemberModel());
  }

  @override
  void dispose() {
    cardmemberModels.dispose();
  }
}
