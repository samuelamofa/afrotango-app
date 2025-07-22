import '/flutter_flow/flutter_flow_util.dart';
import '/resturant/card/cardfood1/cardfood1_widget.dart';
import 'resturantmenu_widget.dart' show ResturantmenuWidget;
import 'package:flutter/material.dart';

class ResturantmenuModel extends FlutterFlowModel<ResturantmenuWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for cardfood1 dynamic component.
  late FlutterFlowDynamicModels<Cardfood1Model> cardfood1Models;

  @override
  void initState(BuildContext context) {
    cardfood1Models = FlutterFlowDynamicModels(() => Cardfood1Model());
  }

  @override
  void dispose() {
    cardfood1Models.dispose();
  }
}
