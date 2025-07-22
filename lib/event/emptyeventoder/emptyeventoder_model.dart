import '/event/cardevent/emptyoderevent/emptyoderevent_widget.dart';
import '/event/cardevent/event_navebar/event_navebar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'emptyeventoder_widget.dart' show EmptyeventoderWidget;
import 'package:flutter/material.dart';

class EmptyeventoderModel extends FlutterFlowModel<EmptyeventoderWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for emptyoderevent component.
  late EmptyodereventModel emptyodereventModel;
  // Model for eventNavebar component.
  late EventNavebarModel eventNavebarModel;

  @override
  void initState(BuildContext context) {
    emptyodereventModel = createModel(context, () => EmptyodereventModel());
    eventNavebarModel = createModel(context, () => EventNavebarModel());
  }

  @override
  void dispose() {
    emptyodereventModel.dispose();
    eventNavebarModel.dispose();
  }
}
