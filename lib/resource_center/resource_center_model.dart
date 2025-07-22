import '/flutter_flow/flutter_flow_util.dart';
import 'resource_center_widget.dart' show ResourceCenterWidget;
import 'package:flutter/material.dart';

class ResourceCenterModel extends FlutterFlowModel<ResourceCenterWidget> {
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
