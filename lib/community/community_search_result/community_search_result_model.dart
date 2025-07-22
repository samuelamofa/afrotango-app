import '/backend/backend.dart';
import '/community/cardcomunity/cardcomunity_widget.dart';
import '/components/emptylist_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'community_search_result_widget.dart' show CommunitySearchResultWidget;
import 'package:flutter/material.dart';

class CommunitySearchResultModel
    extends FlutterFlowModel<CommunitySearchResultWidget> {
  ///  State fields for stateful widgets in this page.

  List<CommunityRecord> simpleSearchResults = [];
  // Models for cardcomunity dynamic component.
  late FlutterFlowDynamicModels<CardcomunityModel> cardcomunityModels;
  // Models for emptylist dynamic component.
  late FlutterFlowDynamicModels<EmptylistModel> emptylistModels;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {
    cardcomunityModels = FlutterFlowDynamicModels(() => CardcomunityModel());
    emptylistModels = FlutterFlowDynamicModels(() => EmptylistModel());
  }

  @override
  void dispose() {
    cardcomunityModels.dispose();
    emptylistModels.dispose();
  }
}
