import '/backend/backend.dart';
import '/event/cardevent/card2/card2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'eventsearch_test_widget.dart' show EventsearchTestWidget;
import 'package:flutter/material.dart';

class EventsearchTestModel extends FlutterFlowModel<EventsearchTestWidget> {
  ///  Local state fields for this page.

  String? filterCategory;

  DateTime? filterDate;

  String? filterCountry;

  bool? isSearch = false;

  ///  State fields for stateful widgets in this page.

  // Models for card2 dynamic component.
  late FlutterFlowDynamicModels<Card2Model> card2Models1;
  // Models for card2 dynamic component.
  late FlutterFlowDynamicModels<Card2Model> card2Models2;
  // State field(s) for searchEventName widget.
  FocusNode? searchEventNameFocusNode;
  TextEditingController? searchEventNameTextController;
  String? Function(BuildContext, String?)?
      searchEventNameTextControllerValidator;
  List<EventRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {
    card2Models1 = FlutterFlowDynamicModels(() => Card2Model());
    card2Models2 = FlutterFlowDynamicModels(() => Card2Model());
  }

  @override
  void dispose() {
    card2Models1.dispose();
    card2Models2.dispose();
    searchEventNameFocusNode?.dispose();
    searchEventNameTextController?.dispose();
  }
}
