import '/backend/backend.dart';
import '/event/cardevent/card2/card2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'eventsearch_widget.dart' show EventsearchWidget;
import 'package:flutter/material.dart';

class EventsearchModel extends FlutterFlowModel<EventsearchWidget> {
  ///  Local state fields for this page.

  bool? isfilter = false;

  List<EventRecord> eventsPage = [];
  void addToEventsPage(EventRecord item) => eventsPage.add(item);
  void removeFromEventsPage(EventRecord item) => eventsPage.remove(item);
  void removeAtIndexFromEventsPage(int index) => eventsPage.removeAt(index);
  void insertAtIndexInEventsPage(int index, EventRecord item) =>
      eventsPage.insert(index, item);
  void updateEventsPageAtIndex(int index, Function(EventRecord) updateFn) =>
      eventsPage[index] = updateFn(eventsPage[index]);

  ///  State fields for stateful widgets in this page.

  // Models for card2 dynamic component.
  late FlutterFlowDynamicModels<Card2Model> card2Models;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    card2Models = FlutterFlowDynamicModels(() => Card2Model());
  }

  @override
  void dispose() {
    card2Models.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
