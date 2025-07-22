import '/backend/backend.dart';
import '/event/cardevent/card2/card2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'eventsearch_widget.dart' show EventsearchWidget;
import 'package:flutter/material.dart';

class EventsearchModel extends FlutterFlowModel<EventsearchWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for card2 dynamic component.
  late FlutterFlowDynamicModels<Card2Model> card2Models;
  List<EventRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {
    card2Models = FlutterFlowDynamicModels(() => Card2Model());
  }

  @override
  void dispose() {
    card2Models.dispose();
  }
}
