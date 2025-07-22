import '/flutter_flow/flutter_flow_util.dart';
import '/resturant/card/cardfoodmy/cardfoodmy_widget.dart';
import 'my_resturant_widget.dart' show MyResturantWidget;
import 'package:flutter/material.dart';

class MyResturantModel extends FlutterFlowModel<MyResturantWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for cardfoodmy dynamic component.
  late FlutterFlowDynamicModels<CardfoodmyModel> cardfoodmyModels;

  @override
  void initState(BuildContext context) {
    cardfoodmyModels = FlutterFlowDynamicModels(() => CardfoodmyModel());
  }

  @override
  void dispose() {
    cardfoodmyModels.dispose();
  }
}
