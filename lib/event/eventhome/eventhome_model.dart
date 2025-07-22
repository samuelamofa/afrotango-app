import '/components/emptylist_widget.dart';
import '/event/cardevent/card1/card1_widget.dart';
import '/event/cardevent/card2/card2_widget.dart';
import '/event/cardevent/event_navebar/event_navebar_widget.dart';
import '/event/cardevent/eventcardcatigory/eventcardcatigory_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'eventhome_widget.dart' show EventhomeWidget;
import 'package:flutter/material.dart';

class EventhomeModel extends FlutterFlowModel<EventhomeWidget> {
  ///  Local state fields for this page.

  DocumentReference? catigory;

  ///  State fields for stateful widgets in this page.

  // Models for eventcardcatigory dynamic component.
  late FlutterFlowDynamicModels<EventcardcatigoryModel> eventcardcatigoryModels;
  // Models for emptylist dynamic component.
  late FlutterFlowDynamicModels<EmptylistModel> emptylistModels1;
  // Models for card1 dynamic component.
  late FlutterFlowDynamicModels<Card1Model> card1Models;
  // Models for emptylist dynamic component.
  late FlutterFlowDynamicModels<EmptylistModel> emptylistModels2;
  // Models for card2 dynamic component.
  late FlutterFlowDynamicModels<Card2Model> card2Models;
  // Models for emptylist dynamic component.
  late FlutterFlowDynamicModels<EmptylistModel> emptylistModels3;
  // Model for eventNavebar component.
  late EventNavebarModel eventNavebarModel;

  @override
  void initState(BuildContext context) {
    eventcardcatigoryModels =
        FlutterFlowDynamicModels(() => EventcardcatigoryModel());
    emptylistModels1 = FlutterFlowDynamicModels(() => EmptylistModel());
    card1Models = FlutterFlowDynamicModels(() => Card1Model());
    emptylistModels2 = FlutterFlowDynamicModels(() => EmptylistModel());
    card2Models = FlutterFlowDynamicModels(() => Card2Model());
    emptylistModels3 = FlutterFlowDynamicModels(() => EmptylistModel());
    eventNavebarModel = createModel(context, () => EventNavebarModel());
  }

  @override
  void dispose() {
    eventcardcatigoryModels.dispose();
    emptylistModels1.dispose();
    card1Models.dispose();
    emptylistModels2.dispose();
    card2Models.dispose();
    emptylistModels3.dispose();
    eventNavebarModel.dispose();
  }
}
