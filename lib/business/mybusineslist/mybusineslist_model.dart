import '/backend/backend.dart';
import '/components/emptylist_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mybusineslist_widget.dart' show MybusineslistWidget;
import 'package:flutter/material.dart';

class MybusineslistModel extends FlutterFlowModel<MybusineslistWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<BusinessRecord> simpleSearchResults = [];
  // Models for emptylist dynamic component.
  late FlutterFlowDynamicModels<EmptylistModel> emptylistModels;

  @override
  void initState(BuildContext context) {
    emptylistModels = FlutterFlowDynamicModels(() => EmptylistModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    emptylistModels.dispose();
  }
}
