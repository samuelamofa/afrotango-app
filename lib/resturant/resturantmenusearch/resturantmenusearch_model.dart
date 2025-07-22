import '/backend/backend.dart';
import '/components/emptylist_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/resturant/card/cardfood1/cardfood1_widget.dart';
import 'resturantmenusearch_widget.dart' show ResturantmenusearchWidget;
import 'package:flutter/material.dart';

class ResturantmenusearchModel
    extends FlutterFlowModel<ResturantmenusearchWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<RecipeRecord> simpleSearchResults = [];
  // Models for cardfood1 dynamic component.
  late FlutterFlowDynamicModels<Cardfood1Model> cardfood1Models;
  // Models for emptylist dynamic component.
  late FlutterFlowDynamicModels<EmptylistModel> emptylistModels;

  @override
  void initState(BuildContext context) {
    cardfood1Models = FlutterFlowDynamicModels(() => Cardfood1Model());
    emptylistModels = FlutterFlowDynamicModels(() => EmptylistModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    cardfood1Models.dispose();
    emptylistModels.dispose();
  }
}
