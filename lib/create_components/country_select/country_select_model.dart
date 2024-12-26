import '/flutter_flow/flutter_flow_util.dart';
import 'country_select_widget.dart' show CountrySelectWidget;
import 'package:flutter/material.dart';

class CountrySelectModel extends FlutterFlowModel<CountrySelectWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
  }
}
