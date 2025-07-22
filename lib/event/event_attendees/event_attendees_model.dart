import '/community/cardcomponent/cardmember2/cardmember2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'event_attendees_widget.dart' show EventAttendeesWidget;
import 'package:flutter/material.dart';

class EventAttendeesModel extends FlutterFlowModel<EventAttendeesWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for cardmember2 dynamic component.
  late FlutterFlowDynamicModels<Cardmember2Model> cardmember2Models;

  @override
  void initState(BuildContext context) {
    cardmember2Models = FlutterFlowDynamicModels(() => Cardmember2Model());
  }

  @override
  void dispose() {
    cardmember2Models.dispose();
  }
}
