import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_filter_comunty_widget.dart' show SearchFilterComuntyWidget;
import 'package:flutter/material.dart';

class SearchFilterComuntyModel
    extends FlutterFlowModel<SearchFilterComuntyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<CatigoryCommunityRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
