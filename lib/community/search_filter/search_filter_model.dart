import '/flutter_flow/flutter_flow_util.dart';
import 'search_filter_widget.dart' show SearchFilterWidget;
import 'package:flutter/material.dart';

class SearchFilterModel extends FlutterFlowModel<SearchFilterWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
