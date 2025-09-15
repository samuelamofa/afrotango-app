import '/community/cardcomponent/card/card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'community_filter_widget.dart' show CommunityFilterWidget;
import 'package:flutter/material.dart';

class CommunityFilterModel extends FlutterFlowModel<CommunityFilterWidget> {
  ///  Local state fields for this component.

  String? catgegory;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for card dynamic component.
  late FlutterFlowDynamicModels<CardModel> cardModels;
  // State field(s) for countryDropDown widget.
  String? countryDropDownValue;
  FormFieldController<String>? countryDropDownValueController;

  @override
  void initState(BuildContext context) {
    cardModels = FlutterFlowDynamicModels(() => CardModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    cardModels.dispose();
  }
}
