import '/backend/backend.dart';
import '/event/cardevent/eventcardcatigory/eventcardcatigory_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lis_eventcatigory_widget.dart' show LisEventcatigoryWidget;
import 'package:flutter/material.dart';

class LisEventcatigoryModel extends FlutterFlowModel<LisEventcatigoryWidget> {
  ///  Local state fields for this page.

  DocumentReference? catigory;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in LisEventcatigory widget.
  EventcatigoryRecord? catigoryevent;
  // Models for eventcardcatigory dynamic component.
  late FlutterFlowDynamicModels<EventcardcatigoryModel>
      eventcardcatigoryModels1;
  // Models for eventcardcatigory dynamic component.
  late FlutterFlowDynamicModels<EventcardcatigoryModel>
      eventcardcatigoryModels2;

  @override
  void initState(BuildContext context) {
    eventcardcatigoryModels1 =
        FlutterFlowDynamicModels(() => EventcardcatigoryModel());
    eventcardcatigoryModels2 =
        FlutterFlowDynamicModels(() => EventcardcatigoryModel());
  }

  @override
  void dispose() {
    eventcardcatigoryModels1.dispose();
    eventcardcatigoryModels2.dispose();
  }
}
