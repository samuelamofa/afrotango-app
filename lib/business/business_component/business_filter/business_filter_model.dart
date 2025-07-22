import '/community/cardcomponent/cardbusines/cardbusines_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'business_filter_widget.dart' show BusinessFilterWidget;
import 'package:flutter/material.dart';

class BusinessFilterModel extends FlutterFlowModel<BusinessFilterWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for cardbusines dynamic component.
  late FlutterFlowDynamicModels<CardbusinesModel> cardbusinesModels;
  // State field(s) for countryDropDown widget.
  String? countryDropDownValue;
  FormFieldController<String>? countryDropDownValueController;

  @override
  void initState(BuildContext context) {
    cardbusinesModels = FlutterFlowDynamicModels(() => CardbusinesModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    cardbusinesModels.dispose();
  }
}
