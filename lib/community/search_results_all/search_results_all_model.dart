import '/backend/backend.dart';
import '/community/cardcomponent/cardmember2/cardmember2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_results_all_widget.dart' show SearchResultsAllWidget;
import 'package:flutter/material.dart';

class SearchResultsAllModel extends FlutterFlowModel<SearchResultsAllWidget> {
  ///  State fields for stateful widgets in this page.

  List<UsersRecord> simpleSearchResults = [];
  // Models for cardmember2 dynamic component.
  late FlutterFlowDynamicModels<Cardmember2Model> cardmember2Models1;
  // Models for cardmember2 dynamic component.
  late FlutterFlowDynamicModels<Cardmember2Model> cardmember2Models2;

  @override
  void initState(BuildContext context) {
    cardmember2Models1 = FlutterFlowDynamicModels(() => Cardmember2Model());
    cardmember2Models2 = FlutterFlowDynamicModels(() => Cardmember2Model());
  }

  @override
  void dispose() {
    cardmember2Models1.dispose();
    cardmember2Models2.dispose();
  }
}
