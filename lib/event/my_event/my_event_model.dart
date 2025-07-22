import '/event/cardevent/card21/card21_widget.dart';
import '/event/cardevent/event_navebar/event_navebar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_event_widget.dart' show MyEventWidget;
import 'package:flutter/material.dart';

class MyEventModel extends FlutterFlowModel<MyEventWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for card21 dynamic component.
  late FlutterFlowDynamicModels<Card21Model> card21Models;
  // Model for eventNavebar component.
  late EventNavebarModel eventNavebarModel;

  @override
  void initState(BuildContext context) {
    card21Models = FlutterFlowDynamicModels(() => Card21Model());
    eventNavebarModel = createModel(context, () => EventNavebarModel());
  }

  @override
  void dispose() {
    card21Models.dispose();
    eventNavebarModel.dispose();
  }
}
