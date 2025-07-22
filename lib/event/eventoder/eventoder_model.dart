import '/event/cardevent/card1_c/card1_c_widget.dart';
import '/event/cardevent/card3/card3_widget.dart';
import '/event/cardevent/event_navebar/event_navebar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'eventoder_widget.dart' show EventoderWidget;
import 'package:flutter/material.dart';

class EventoderModel extends FlutterFlowModel<EventoderWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for card3 dynamic component.
  late FlutterFlowDynamicModels<Card3Model> card3Models;
  // Models for card1C dynamic component.
  late FlutterFlowDynamicModels<Card1CModel> card1CModels;
  // Model for eventNavebar component.
  late EventNavebarModel eventNavebarModel;

  @override
  void initState(BuildContext context) {
    card3Models = FlutterFlowDynamicModels(() => Card3Model());
    card1CModels = FlutterFlowDynamicModels(() => Card1CModel());
    eventNavebarModel = createModel(context, () => EventNavebarModel());
  }

  @override
  void dispose() {
    card3Models.dispose();
    card1CModels.dispose();
    eventNavebarModel.dispose();
  }
}
