import '/flutter_flow/flutter_flow_util.dart';
import 'buisness_widget.dart' show BuisnessWidget;
import 'package:flutter/material.dart';

class BuisnessModel extends FlutterFlowModel<BuisnessWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();
  }
}
