import '/flutter_flow/flutter_flow_util.dart';
import 'updateddress_widget.dart' show UpdateddressWidget;
import 'package:flutter/material.dart';

class UpdateddressModel extends FlutterFlowModel<UpdateddressWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldaddres widget.
  FocusNode? textFieldaddresFocusNode;
  TextEditingController? textFieldaddresTextController;
  String? Function(BuildContext, String?)?
      textFieldaddresTextControllerValidator;
  // State field(s) for TextFieldcity widget.
  FocusNode? textFieldcityFocusNode;
  TextEditingController? textFieldcityTextController;
  String? Function(BuildContext, String?)? textFieldcityTextControllerValidator;
  // State field(s) for TextFieldstate widget.
  FocusNode? textFieldstateFocusNode;
  TextEditingController? textFieldstateTextController;
  String? Function(BuildContext, String?)?
      textFieldstateTextControllerValidator;
  // State field(s) for TextFieldzip widget.
  FocusNode? textFieldzipFocusNode;
  TextEditingController? textFieldzipTextController;
  String? Function(BuildContext, String?)? textFieldzipTextControllerValidator;
  // State field(s) for TextFieldcount widget.
  FocusNode? textFieldcountFocusNode;
  TextEditingController? textFieldcountTextController;
  String? Function(BuildContext, String?)?
      textFieldcountTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldaddresFocusNode?.dispose();
    textFieldaddresTextController?.dispose();

    textFieldcityFocusNode?.dispose();
    textFieldcityTextController?.dispose();

    textFieldstateFocusNode?.dispose();
    textFieldstateTextController?.dispose();

    textFieldzipFocusNode?.dispose();
    textFieldzipTextController?.dispose();

    textFieldcountFocusNode?.dispose();
    textFieldcountTextController?.dispose();
  }
}
