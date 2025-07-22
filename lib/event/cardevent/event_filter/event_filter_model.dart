import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'event_filter_widget.dart' show EventFilterWidget;
import 'package:flutter/material.dart';

class EventFilterModel extends FlutterFlowModel<EventFilterWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<EventRecord> simpleSearchResults = [];
  // State field(s) for countryDropDown widget.
  String? countryDropDownValue;
  FormFieldController<String>? countryDropDownValueController;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
