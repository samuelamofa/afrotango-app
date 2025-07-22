import '/event/cardevent/card2/card2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'eventodersucess_widget.dart' show EventodersucessWidget;
import 'package:flutter/material.dart';

class EventodersucessModel extends FlutterFlowModel<EventodersucessWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for card2 dynamic component.
  late FlutterFlowDynamicModels<Card2Model> card2Models;

  @override
  void initState(BuildContext context) {
    card2Models = FlutterFlowDynamicModels(() => Card2Model());
  }

  @override
  void dispose() {
    card2Models.dispose();
  }
}
