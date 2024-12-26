import '/create_components/logo_header/logo_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'resource_center_widget.dart' show ResourceCenterWidget;
import 'package:flutter/material.dart';

class ResourceCenterModel extends FlutterFlowModel<ResourceCenterWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for LogoHeader component.
  late LogoHeaderModel logoHeaderModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    logoHeaderModel = createModel(context, () => LogoHeaderModel());
  }

  @override
  void dispose() {
    logoHeaderModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
