import '/flutter_flow/flutter_flow_util.dart';
import 'buisness_profile_widget.dart' show BuisnessProfileWidget;
import 'package:flutter/material.dart';

class BuisnessProfileModel extends FlutterFlowModel<BuisnessProfileWidget> {
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