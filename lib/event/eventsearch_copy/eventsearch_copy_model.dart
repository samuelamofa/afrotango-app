import '/backend/backend.dart';
import '/event/cardevent/card2/card2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'eventsearch_copy_widget.dart' show EventsearchCopyWidget;
import 'package:flutter/material.dart';

class EventsearchCopyModel extends FlutterFlowModel<EventsearchCopyWidget> {
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

  bool isSearch = false;

  String? category;

  String? countryFilter;

  DateTime? date;

  ///  State fields for stateful widgets in this page.

  // Models for card2 dynamic component.
  late FlutterFlowDynamicModels<Card2Model> card2Models1;
  // Models for card2 dynamic component.
  late FlutterFlowDynamicModels<Card2Model> card2Models2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
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
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
