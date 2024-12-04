import '/flutter_flow/flutter_flow_util.dart';
import 'logo_header_widget.dart' show LogoHeaderWidget;
import 'package:flutter/material.dart';

class LogoHeaderModel extends FlutterFlowModel<LogoHeaderWidget> {
  ///  State fields for stateful widgets in this component.

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
