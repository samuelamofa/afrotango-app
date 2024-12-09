import '/flutter_flow/flutter_flow_util.dart';
import 'adview_page_widget.dart' show AdviewPageWidget;
import 'package:flutter/material.dart';

class AdviewPageModel extends FlutterFlowModel<AdviewPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
